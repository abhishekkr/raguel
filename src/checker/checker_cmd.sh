#!/usr/bin/env bash

## if_cmd
if_cmd(){
  RAGUEL_IF_EQUAL_STATE=
  _arg_cmd="${@:2}"

  which_status=`which $1 >/dev/null 2>&1 ; echo $?`
  if [[ $which_status -eq 0 ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 1 ]]; then
    eval "${_arg_cmd}"
  fi
}

# then_if_cmd
then_if_cmd(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'true' ]]; then
    if_cmd $1 ${@:2}
  fi
}

# else_if_cmd
else_if_cmd(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'false' ]]; then
    if_cmd $1 ${@:2}
  fi
}

## if_not_cmd
if_not_cmd(){
  RAGUEL_IF_EQUAL_STATE=
  _arg_not_cmd="${@:2}"

  which_status=`which $1 >/dev/null 2>&1 ; echo $?`
  if [[ $which_status -ne 0 ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 1 ]]; then
    eval "${_arg_not_cmd}"
  fi
}

# then_if_not_cmd
then_if_not_cmd(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'true' ]]; then
    if_not_cmd $1 ${@:2}
  fi
}

# else_if_not_cmd
else_if_not_cmd(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'false' ]]; then
    if_not_cmd $1 ${@:2}
  fi
}
