#!/usr/bin/env bash

## if_link
if_link(){
  RAGUEL_IF_EQUAL_STATE=
  if_cmd="${@:2}"

  if [[ -L "${1}" ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 1 ]]; then
    eval "${if_cmd}"
  fi
}

# then_if_link
then_if_link(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'true' ]]; then
    if_link $1 ${@:2}
  fi
}

# else_if_link
else_if_link(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'false' ]]; then
    if_link $1 ${@:2}
  fi
}

## if_not_link
if_not_link(){
  RAGUEL_IF_EQUAL_STATE=
  if_not_cmd="${@:2}"

  if [[ ! -L "${1}" ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 1 ]]; then
    eval "${if_not_cmd}"
  fi
}

# then_if_not_link
then_if_not_link(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'true' ]]; then
    if_not_link $1 ${@:2}
  fi
}

# else_if_not_link
else_if_not_link(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'false' ]]; then
    if_not_link $1 ${@:2}
  fi
}
