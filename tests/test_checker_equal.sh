#!/usr/bin/env bash

. "$RAGUEL_DIR/checker.sh"

### setUp; tearDown ###

tearDown(){
  export RAGUEL_IF_EQUAL_STATE=''
}

### checker test for equality ###

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

test_then_if_equal(){
  export RAGUEL_IF_EQUAL_STATE=''
  then_if_equal 'abc' 'abc'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE=''
  then_if_equal 'abc' 'abcde'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_equal 'abc' 'abc'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_equal 'abc' 'abcde'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_equal 'abc' 'abc'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_equal 'abc' 'abcde'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_else_if_equal(){
  export RAGUEL_IF_EQUAL_STATE=''
  else_if_equal 'abc' 'abc'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE=''
  else_if_equal 'abc' 'abcde'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_equal 'abc' 'abc'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_equal 'abc' 'abcde'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_equal 'abc' 'abc'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_equal 'abc' 'abcde'
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

test_then_if_not_equal(){
  export RAGUEL_IF_EQUAL_STATE=''
  then_if_not_equal 'abc' 'abc'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE=''
  then_if_not_equal 'abc' 'abcde'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_not_equal 'abc' 'abc'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_not_equal 'abc' 'abcde'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_not_equal 'abc' 'abc'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_not_equal 'abc' 'abcde'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_else_if_not_equal(){
  export RAGUEL_IF_EQUAL_STATE=''
  else_if_not_equal 'abc' 'abc'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE=''
  else_if_not_equal 'abc' 'abcde'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_not_equal 'abc' 'abc'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_not_equal 'abc' 'abcde'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_not_equal 'abc' 'abc'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_not_equal 'abc' 'abcde'
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"
}
