#!/usr/bin/env bash

## if_var
if_var(){
  RAGUEL_IF_EQUAL_STATE=
  if_cmd="${@:2}"

  if [[ -n "${1}" ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 1 ]]; then
    eval "${if_cmd}"
  fi
}

# then_if_var
then_if_var(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'true' ]]; then
    if_var $1 ${@:2}
  fi
}

# else_if_var
else_if_var(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'false' ]]; then
    if_var $1 ${@:2}
  fi
}

## if_not_var
if_not_var(){
  RAGUEL_IF_EQUAL_STATE=
  if_not_cmd="${@:2}"

  if [[ -z "${1}" ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 1 ]]; then
    eval "${if_not_cmd}"
  fi
}

# then_if_not_var
then_if_not_var(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'true' ]]; then
    if_not_var $1 ${@:2}
  fi
}

# else_if_var
else_if_not_var(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'false' ]]; then
    if_not_var $1 ${@:2}
  fi
}
