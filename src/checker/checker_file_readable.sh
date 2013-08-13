#!/usr/bin/env bash

## if_file_readable
if_file_readable(){
  RAGUEL_IF_EQUAL_STATE=
  if_cmd="${@:2}"

  if [[ -r "${1}" ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 1 ]]; then
    eval "${if_cmd}"
  fi
}

# then_if_file_readable
then_if_file_readable(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'true' ]]; then
    if_file_readable $1 ${@:2}
  fi
}

# else_if_file_readable
else_if_file_readable(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'false' ]]; then
    if_file_readable $1 ${@:2}
  fi
}

## if_not_file_readable
if_not_file_readable(){
  RAGUEL_IF_EQUAL_STATE=
  if_not_cmd="${@:2}"

  if [[ ! -r "${1}" ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 1 ]]; then
    eval "${if_not_cmd}"
  fi
}

# then_if_not_file_readable
then_if_not_file_readable(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'true' ]]; then
    if_not_file_readable $1 ${@:2}
  fi
}

# else_if_not_file_readable
else_if_not_file_readable(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'false' ]]; then
    if_not_file_readable $1 ${@:2}
  fi
}
