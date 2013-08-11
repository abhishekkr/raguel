#!/usr/bin/env bash

## if_dir
if_dir(){
  RAGUEL_IF_EQUAL_STATE=
  if_cmd="${@:2}"

  if [[ -d "${1}" ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 1 ]]; then
    eval "${if_cmd}"
  fi
}

# then_if_dir
then_if_dir(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'true' ]]; then
    if_dir $1 ${@:2}
  fi
}

# else_if_dir
else_if_dir(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'false' ]]; then
    if_dir $1 ${@:2}
  fi
}

## if_not_dir
if_not_dir(){
  RAGUEL_IF_EQUAL_STATE=
  if_cmd="${@:2}"

  if [[ ! -d "${1}" ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 1 ]]; then
    eval "${if_cmd}"
  fi
}

# then_if_not_dir
then_if_not_dir(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'true' ]]; then
    if_not_dir $1 ${@:2}
  fi
}

# else_if_not_dir
else_if_not_dir(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'false' ]]; then
    if_not_dir $1 ${@:2}
  fi
}
