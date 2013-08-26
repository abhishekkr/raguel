#!/usr/bin/env bash

if [[ -z "$RAGUEL_DIR" ]]; then
  if [[ -z "$BASH_SOURCE" ]]; then
    RAGUEL_DIR=$(dirname $0)
  else
    RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
  fi
  export RAGUEL_DIR="${RAGUEL_DIR}/../"
fi
. "${RAGUEL_DIR}/git.sh"

## if_git_latest
if_git_latest(){
  RAGUEL_IF_EQUAL_STATE=
  _arg_cmd="${@:2}"

  cd $1 ; local_sha ; remote_sha
  if [[ $RAGUEL_GIT_REMOTE_SHA == $RAGUEL_GIT_LOCAL_SHA ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 1 ]]; then
    eval "${_arg_cmd}"
  fi
}

# then_if_git_latest
then_if_git_latest(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'true' ]]; then
    if_git_latest $1 ${@:2}
  fi
}

# else_if_git_latest
else_if_git_latest(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'false' ]]; then
    if_git_latest $1 ${@:2}
  fi
}

## if_git_latest
if_not_git_latest(){
  RAGUEL_IF_EQUAL_STATE=
  _arg_cmd="${@:2}"

  cd $1 ; local_sha ; remote_sha
  if [[ $RAGUEL_GIT_REMOTE_SHA != $RAGUEL_GIT_LOCAL_SHA ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 1 ]]; then
    eval "${_arg_cmd}"
  fi
}

# then_if_git_latest
then_if_not_git_latest(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'true' ]]; then
    if_not_git_latest $1 ${@:2}
  fi
}

# else_if_git_latest
else_if_not_git_latest(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'false' ]]; then
    if_not_git_latest $1 ${@:2}
  fi
}
