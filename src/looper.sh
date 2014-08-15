#!/usr/bin/env bash

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
}

dir_list_run(){
  if [[ $# -lt 2 ]]; then
    echo "SYNTAX: dir_list_run <dir-path> <command>"
    return
  fi

  __dir__=$1
  __cmd__="${@:2}"
  if [[ ! -d $__dir__ ]]; then
    echo "ERROR: Dir to loop (${__dir__}) doesn't exist." && exit 2
  fi
  for __file__ in `ls ${__dir__}`; do
      if [[ "$RAGUEL_PARALLEL" == "true" ]]; then
          eval "${__cmd__} '${__dir__}/${__file__}' &"
      else
          eval "${__cmd__} '${__dir__}/${__file__}'"
      fi
  done
  unset __file__
  unset __dir__
  unset __cmd__
}

