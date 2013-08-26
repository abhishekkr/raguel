#!/usr/bin/env bash

## if_equal
if_equal(){
  RAGUEL_IF_EQUAL_STATE=
  _arg_cmd="${@:3}"

  if [[ "${1}" == "${2}" ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 2 ]]; then
    eval "${_arg_cmd}"
  fi
}

# else_if_equal
then_if_equal(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'true' ]]; then
    if_equal $1 $2 ${@:3}
  fi
}

# else_if_equal
else_if_equal(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'false' ]]; then
    if_equal $1 $2 ${@:3}
  fi
}

# if_not_equal
if_not_equal(){
  RAGUEL_IF_EQUAL_STATE=
  _arg_not_cmd="${@:3}"

  if [[ "${1}" != "${2}" ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 2 ]]; then
    eval "${_arg_not_cmd}"
  fi
}

# else_if_not_equal
then_if_not_equal(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'true' ]]; then
    if_not_equal $1 $2 ${@:3}
  fi
}

# else_if_not_equal
else_if_not_equal(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'false' ]]; then
    if_not_equal $1 $2 ${@:3}
  fi
}
