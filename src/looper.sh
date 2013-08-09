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
