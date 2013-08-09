#!/usr/bin/env bash

BASEDIR=$(dirname "${BASH_SOURCE[0]}") ; . "$BASEDIR/../src/looper.sh"

### looper test ###

test_repeat_run(){
  repeat_run 5 'TEMP_VAR="1${TEMP_VAR}"'
  expected="11111"
  generated=$TEMP_VAR
  assertEquals "${generated}" "${expected}"
}
 
test_repeat_run_error(){
  expected="SYNTAX: repeat_run <times> <command>"
  generated=`repeat_run`
  assertEquals "${generated}" "${expected}"
  generated=`repeat_run arg1`
  assertEquals "${generated}" "${expected}"
  generated=`repeat_run arg1 arg2 arg3`
  assertEquals "${generated}" "${expected}"
}
