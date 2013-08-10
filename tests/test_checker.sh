#!/usr/bin/env bash

BASEDIR=$(dirname "${BASH_SOURCE[0]}") ; . "$BASEDIR/../src/checker.sh"

### checker test ###

test_if_equal(){
  if_equal 'abc' 'abc'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${generated}" "${expected}"

  if_equal 'abc' 'abcde'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${generated}" "${expected}"
}

test_if_equal_run(){
  generated=`if_equal 'abc' 'abc' then_run 'echo "abc is the value."'`
  expected='abc is the value.'
  assertEquals "${generated}" "${expected}"

  generated=`if_equal 'abc' 'abcde' else_run 'echo "abc is not the value."'`
  expected='abc is not the value.'
  assertEquals "${generated}" "${expected}"

  generated=`if_equal 'abc' 'abcde' then_run 'echo "abc is the value."'`
  expected=
  assertEquals "${generated}" "${expected}"

  generated=`if_equal 'abc' 'abc' else_run 'echo "abc is not the value."'`
  expected=
  assertEquals "${generated}" "${expected}"
}

test_if_not_equal(){
  if_not_equal 'abc' 'abc'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${generated}" "${expected}"

  if_not_equal 'abc' 'abcde'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${generated}" "${expected}"
}

test_if_not_equal_run(){
  generated=`if_not_equal 'abc' 'abc' then_run 'echo "abc is the value."'`
  expected=
  assertEquals "${generated}" "${expected}"

  generated=`if_not_equal 'abc' 'abcde' else_run 'echo "abc is not the value."'`
  expected=
  assertEquals "${generated}" "${expected}"

  generated=`if_not_equal 'abc' 'abcde' then_run 'echo "abc is the value."'`
  expected='abc is the value.'
  assertEquals "${generated}" "${expected}"

  generated=`if_not_equal 'abc' 'abc' else_run 'echo "abc is not the value."'`
  expected='abc is not the value.'
  assertEquals "${generated}" "${expected}"
}

test_then_run(){
  export RAGUEL_IF_EQUAL_STATE='true'
  generated=$(then_run "echo $USER")
  expected=$USER
  assertEquals "${generated}" "${expected}"
  then_run "echo $USER" > /dev/null
  assertEquals "${RAGUEL_IF_EQUAL_STATE}" ''

  export RAGUEL_IF_EQUAL_STATE='false'
  generated=`then_run "echo $USER"`
  expected=''
  assertEquals "${generated}" "${expected}"
  then_run "echo $USER" > /dev/null
  assertEquals "${RAGUEL_IF_EQUAL_STATE}" 'false'
}

test_else_run(){
  export RAGUEL_IF_EQUAL_STATE='true'
  generated=$(else_run "echo $USER")
  expected=''
  assertEquals "${generated}" "${expected}"
  else_run "echo $USER" > /dev/null
  assertEquals "${RAGUEL_IF_EQUAL_STATE}" 'true'

  export RAGUEL_IF_EQUAL_STATE='false'
  generated=`else_run "echo $USER"`
  expected=$USER
  assertEquals "${generated}" "${expected}"
  else_run "echo $USER" > /dev/null
  assertEquals "${RAGUEL_IF_EQUAL_STATE}" ''
}
