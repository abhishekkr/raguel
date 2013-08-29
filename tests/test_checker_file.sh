#!/usr/bin/env bash

. "$RAGUEL_DIR/checker.sh"

### setUp; tearDown ###

tearDown(){
  unset RAGUEL_IF_EQUAL_STATE
}

### checker test for equality ###

test_if_file(){
  if_file "$BASEDIR/run_tests.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  generated=`if_file "$BASEDIR/run_tests.sh" then_run "echo 'A'"`
  expected='A'
  assertEquals "${expected}" "${generated}"

  if_file "$BASEDIR/run_tests_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_then_if_file(){
  unset RAGUEL_IF_EQUAL_STATE
  then_if_file "$BASEDIR/run_tests.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  unset RAGUEL_IF_EQUAL_STATE
  then_if_file "$BASEDIR/run_tests_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_file "$BASEDIR/run_tests.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_file "$BASEDIR/run_tests_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_file "$BASEDIR/run_tests.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_file "$BASEDIR/run_tests_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_else_if_file(){
  unset RAGUEL_IF_EQUAL_STATE
  else_if_file "$BASEDIR/run_tests.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  unset RAGUEL_IF_EQUAL_STATE
  else_if_file "$BASEDIR/run_tests_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_file "$BASEDIR/run_tests.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_file "$BASEDIR/run_tests_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_file "$BASEDIR/run_tests.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_file "$BASEDIR/run_tests_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_if_not_file(){
  if_not_file "$BASEDIR/run_tests.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  generated=`if_not_file "$BASEDIR/run_tests_not_there.sh" then_run "echo 'A'"`
  expected='A'
  assertEquals "${expected}" "${generated}"

  if_not_file "$BASEDIR/run_tests_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"
}

test_then_if_not_file(){
  unset RAGUEL_IF_EQUAL_STATE
  then_if_not_file "$BASEDIR/run_tests.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  unset RAGUEL_IF_EQUAL_STATE
  then_if_not_file "$BASEDIR/run_tests_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_not_file "$BASEDIR/run_tests.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_not_file "$BASEDIR/run_tests_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_not_file "$BASEDIR/run_tests.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_not_file "$BASEDIR/run_tests_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_else_if_not_file(){
  unset RAGUEL_IF_EQUAL_STATE
  else_if_not_file "$BASEDIR/run_tests.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  unset RAGUEL_IF_EQUAL_STATE
  else_if_not_file "$BASEDIR/run_tests_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_not_file "$BASEDIR/run_tests.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_not_file "$BASEDIR/run_tests_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_not_file "$BASEDIR/run_tests.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_not_file "$BASEDIR/run_tests_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"
}
