#!/usr/bin/env bash

if [[ -z "$RAGUEL_DIR" ]]; then
  if [[ -z "$BASH_SOURCE" ]]; then
    RAGUEL_DIR=$(dirname $0)
  else
    RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
  fi
fi
. "${RAGUEL_DIR}/checker.sh"

_deployer_git_clone(){
    git clone $RAGUEL_DEPLOY_SOURCE_GIT $RAGUEL_DEPLOY_SOURCE_DIR
}

_deployer_git_latest(){
    rm -rf $RAGUEL_DEPLOY_BACKUP_DIR
    cp -ar $RAGUEL_DEPLOY_SOURCE_DIR $RAGUEL_DEPLOY_BACKUP_DIR
    cd $RAGUEL_DEPLOY_SOURCE_DIR
    git checkout .
    git pull
}

_deployer_git_rollback(){
    mv $RAGUEL_DEPLOY_SOURCE_DIR $RAGUEL_DEPLOY_BROKEN_DIR
    cp -ar $RAGUEL_DEPLOY_BACKUP_DIR $RAGUEL_DEPLOY_SOURCE_DIR
}

# deploy latest commit and backup current code
deployer_latest(){
    export RAGUEL_DEPLOY_SOURCE_GIT=$1
    export RAGUEL_DEPLOY_SOURCE_DIR=$2
    export RAGUEL_DEPLOY_BACKUP_DIR="\${RAGUEL_DEPLOY_SOURCE_DIR}.original"

    if_not_dir $RAGUEL_DEPLOY_SOURCE_DIR
        then_run "_deployer_git_clone"
    else_if_not_git_latest $RAGUEL_DEPLOY_SOURCE_DIR
        then_run "_deployer_git_latest"
}

# rollback to previous code
deployer_rollback(){
    export RAGUEL_DEPLOY_SOURCE_DIR=$1
    export RAGUEL_DEPLOY_BACKUP_DIR="\${RAGUEL_DEPLOY_SOURCE_DIR}.original"
    export RAGUEL_DEPLOY_BROKEN_DIR="\${RAGUEL_DEPLOY_SOURCE_DIR}.broken"

    if_dir $RAGUEL_DEPLOY_BACKUP_DIR
        then_run "_deployer_git_rollback"
}
