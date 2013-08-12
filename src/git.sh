#!/usr/bin/env bash

# sets hash of latest commit as RAGUEL_GIT_LOCAL_SHA from Local Branch
local_sha(){
  export RAGUEL_GIT_LOCAL_SHA=`git log --pretty=%H | head -1`
}

# sets hash of latest commit as RAGUEL_GIT_REMOTE_SHA from Remote Branch
remote_sha(){
  if_not_var $RAGUEL_GIT_REMOTE_BRANCH
    then_run export RAGUEL_GIT_REMOTE_BRANCH='master'
  export RAGUEL_GIT_REMOTE_SHA=`git ls-remote origin -h refs/heads/${GIT_REMOTE_BRANCH} | cut -f1`
}
