#!/usr/bin/env bash

## if_equal
if_equal(){
  RAGUEL_IF_EQUAL_STATE=
  if_cmd="${@:3}"

  if [[ "${1}" == "${2}" ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 2 ]]; then
    eval "${if_cmd}"
  fi
}

# if_not_equal
if_not_equal(){
  RAGUEL_IF_EQUAL_STATE=
  if_not_cmd="${@:3}"

  if [[ "${1}" != "${2}" ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 2 ]]; then
    eval "${if_not_cmd}"
  fi
}

# then_run
then_run(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'true' ]]; then
    export RAGUEL_IF_EQUAL_STATE=''
    eval $@
  fi
}

# else_run
else_run(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'false' ]]; then
    export RAGUEL_IF_EQUAL_STATE=''
    eval $@
  fi
}

## if_file
if_file(){
  RAGUEL_IF_EQUAL_STATE=
  if_cmd="${@:2}"

  if [[ -f "${1}" ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 2 ]]; then
    eval "${if_cmd}"
  fi
}

## if_not_file
if_not_file(){
  RAGUEL_IF_EQUAL_STATE=
  if_not_cmd="${@:2}"

  if [[ ! -f "${1}" ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 2 ]]; then
    eval "${if_not_cmd}"
  fi
}

## if_dir
if_dir(){
  RAGUEL_IF_EQUAL_STATE=
  if_cmd="${@:2}"

  if [[ -d "${1}" ]]; then
    export RAGUEL_IF_EQUAL_STATE='true'
  else
    export RAGUEL_IF_EQUAL_STATE='false'
  fi
  if [[ $# -ne 2 ]]; then
    eval "${if_cmd}"
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
  if [[ $# -ne 2 ]]; then
    eval "${if_cmd}"
  fi
}
