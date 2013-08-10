#!/usr/bin/env bash

. "$RAGUEL_DIR/looper.sh"

### looper test ###

test_repeat_run(){
  repeat_run 5 'TEMP_VAR="1${TEMP_VAR}"'
  expected="11111"
  generated=$TEMP_VAR
  assertEquals "${expected}" "${generated}"
}
 
test_repeat_run_error(){
  expected="SYNTAX: repeat_run <times> <command>"
  generated=`repeat_run`
  assertEquals "${expected}" "${generated}"
  generated=`repeat_run arg1`
  assertEquals "${expected}" "${generated}"
  generated=`repeat_run arg1 arg2 arg3`
  assertEquals "${expected}" "${generated}"
}
