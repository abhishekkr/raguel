#!/usr/bin/env bash

if [[ -z "$RAGUEL_DIR" ]]; then
  if [[ -z "$BASH_SOURCE" ]]; then
    RAGUEL_DIR=$(dirname $0)
  else
    RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
  fi
fi
. "${RAGUEL_DIR}/checker.sh"

## spec: repeat_run <times> <command>...
## runs provided command for desired times count, any argument after first is evaluated
repeat_run(){
  if [[ $# -ne 2 ]]; then
    echo "SYNTAX: repeat_run <times> <command>"
    return
  fi

  repeat_times=$1
  repeat_command="${@:2}"
  for ((idx=0;idx<$repeat_times;++idx)); do
    eval "$repeat_command"
  done
  unset repeat_times repeat_command
}

## spec: dir_list_run <dir-path> <command>...
## global-env supported: RAGUEL_PARALLEL, RAGUEL_HIDDEN_FILE
### runs provided command for all items (file/dir/others) in a dir-path
### item name gets appended as last argument to provided command from 2nd param onwards
dir_list_run(){
  if [[ $# -lt 2 ]]; then
    echo "SYNTAX: dir_list_run <dir-path> <command>"
    return
  fi

  __dir__=$1
  __cmd__="${@:2}"

  __ls_args__="-1"
  [[ "${RAGUEL_HIDDEN_FILE}" == "true" ]] && __ls_args__="${__ls_args__} -a"

  if [[ ! -d $__dir__ ]]; then
    echo "ERROR: Dir to loop (${__dir__}) doesn't exist." && exit 2
  fi
  for __file__ in `ls ${__ls_args__} ${__dir__} | grep -v '^\.\.$' | grep -v '^\.$'`; do
      if [[ "$RAGUEL_PARALLEL" == "true" ]]; then
          eval "${__cmd__} '${__dir__}/${__file__}'" &
      else
          eval "${__cmd__} '${__dir__}/${__file__}'"
      fi
  done
  [[ "$RAGUEL_PARALLEL" == "true" ]] && wait
  unset __file__ __dir__ __cmd__ __ls_args__
}

## spec: dir_file_run <dir-path> <command>...
## global-env supported: RAGUEL_PARALLEL, RAGUEL_HIDDEN_FILE
### runs provided command for all files in a dir-path, works like dir_list_run
dir_file_run(){
  if [[ $# -lt 2 ]]; then
    echo "SYNTAX: dir_file_run <dir-path> <command>"
    return
  fi

  __dir__=$1
  __cmd__="${@:2}"

  __ls_args__="-1"
  [[ "${RAGUEL_HIDDEN_FILE}" == "true" ]] && __ls_args__="${__ls_args__} -a"

  if [[ ! -d $__dir__ ]]; then
    echo "ERROR: Dir to loop (${__dir__}) doesn't exist." && exit 2
  fi
  for __file__ in `ls ${__ls_args__} ${__dir__} | grep -v '^\.\.$' | grep -v '^\.$'`; do
      [[ ! -f "${__file__}" ]] && continue
      if [[ "$RAGUEL_PARALLEL" == "true" ]]; then
          eval "${__cmd__} '${__dir__}/${__file__}'" &
      else
          eval "${__cmd__} '${__dir__}/${__file__}'"
      fi
  done
  [[ "$RAGUEL_PARALLEL" == "true" ]] && wait
  unset __file__ __dir__ __cmd__ __ls_args__
}
