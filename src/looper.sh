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
    echo "SYNTAX: dir_list_run <times> <command>"
    return
  fi

  __dir__=$1
  __cmd__="${@:2}"
  for __file__ in `ls ${__dir__}`; do
    eval "${__cmd__} '${__dir__}/${__file__}'"
  done
}
