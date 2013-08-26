#!/usr/bin/env bash

## if_file_writable
if_file_writable(){
  RAGUEL_IF_EQUAL_STATE=
  _arg_cmd="${@:2}"

  if [[ -w "${1}" ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 1 ]]; then
    eval "${_arg_cmd}"
  fi
}

# then_if_file_writable
then_if_file_writable(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'true' ]]; then
    if_file_writable $1 ${@:2}
  fi
}

# else_if_file_writable
else_if_file_writable(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'false' ]]; then
    if_file_writable $1 ${@:2}
  fi
}

## if_not_file_writable
if_not_file_writable(){
  RAGUEL_IF_EQUAL_STATE=
  _arg_not_cmd="${@:2}"

  if [[ ! -w "${1}" ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 1 ]]; then
    eval "${_arg_not_cmd}"
  fi
}

# then_if_not_file_writable
then_if_not_file_writable(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'true' ]]; then
    if_not_file_writable $1 ${@:2}
  fi
}

# else_if_not_file_writable
else_if_not_file_writable(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'false' ]]; then
    if_not_file_writable $1 ${@:2}
  fi
}
