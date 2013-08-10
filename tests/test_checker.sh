#!/usr/bin/env bash

BASEDIR=$(dirname "${BASH_SOURCE[0]}") ; . "$BASEDIR/../src/checker.sh"

### setUp; tearDown ###

tearDown(){
  export RAGUEL_IF_EQUAL_STATE=''
}

### checker test ###

test_if_equal(){
  if_equal 'abc' 'abc'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  if_equal 'abc' 'abcde'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_if_equal_run(){
  generated=`if_equal 'abc' 'abc' then_run 'echo "abc is the value."'`
  expected='abc is the value.'
  assertEquals "${expected}" "${generated}"

  generated=`if_equal 'abc' 'abcde' else_run 'echo "abc is not the value."'`
  expected='abc is not the value.'
  assertEquals "${expected}" "${generated}"

  generated=`if_equal 'abc' 'abcde' then_run 'echo "abc is the value."'`
  expected=
  assertEquals "${expected}" "${generated}"

  generated=`if_equal 'abc' 'abc' else_run 'echo "abc is not the value."'`
  expected=
  assertEquals "${expected}" "${generated}"
}

test_if_not_equal(){
  if_not_equal 'abc' 'abc'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  if_not_equal 'abc' 'abcde'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"
}

test_if_not_equal_run(){
  generated=`if_not_equal 'abc' 'abc' then_run 'echo "abc is the value."'`
  expected=
  assertEquals "${expected}" "${generated}"

  generated=`if_not_equal 'abc' 'abcde' else_run 'echo "abc is not the value."'`
  expected=
  assertEquals "${expected}" "${generated}"

  generated=`if_not_equal 'abc' 'abcde' then_run 'echo "abc is the value."'`
  expected='abc is the value.'
  assertEquals "${expected}" "${generated}"

  generated=`if_not_equal 'abc' 'abc' else_run 'echo "abc is not the value."'`
  expected='abc is not the value.'
  assertEquals "${expected}" "${generated}"
}

test_then_run(){
  export RAGUEL_IF_EQUAL_STATE='true'
  generated=$(then_run "echo $USER")
  expected=$USER
  assertEquals "${expected}" "${generated}"
  then_run "echo $USER" > /dev/null
  assertEquals "${RAGUEL_IF_EQUAL_STATE}" ''

  export RAGUEL_IF_EQUAL_STATE='false'
  generated=`then_run "echo $USER"`
  expected=''
  assertEquals "${expected}" "${generated}"
  then_run "echo $USER" > /dev/null
  assertEquals "${RAGUEL_IF_EQUAL_STATE}" 'false'
}

test_else_run(){
  export RAGUEL_IF_EQUAL_STATE='true'
  generated=$(else_run "echo $USER")
  expected=''
  assertEquals "${expected}" "${generated}"
  else_run "echo $USER" > /dev/null
  assertEquals "${RAGUEL_IF_EQUAL_STATE}" 'true'

  export RAGUEL_IF_EQUAL_STATE='false'
  generated=`else_run "echo $USER"`
  expected=$USER
  assertEquals "${expected}" "${generated}"
  else_run "echo $USER" > /dev/null
  assertEquals "${RAGUEL_IF_EQUAL_STATE}" ''
}

test_if_file(){
  if_file "$BASEDIR/run_tests.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  if_file "$BASEDIR/run_tests_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_if_not_file(){
  if_not_file "$BASEDIR/run_tests.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  if_not_file "$BASEDIR/run_tests_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"
}

test_if_dir(){
  if_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  if_dir "${BASEDIR}_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_if_not_dir(){
  if_not_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  if_not_dir "${BASEDIR}_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"
}
