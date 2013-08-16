#!/usr/bin/env bash

. "$RAGUEL_DIR/checker.sh"

### setUp; tearDown ###

setUp(){
  touch ./DELETE_THIS_FILE_WHEN_SEEN
  chmod 0444 ./DELETE_THIS_FILE_WHEN_SEEN
  touch ./DELETE_THIS_FILE_WHEN_SEEN_WRITE
  chmod 0222 ./DELETE_THIS_FILE_WHEN_SEEN_WRITE
}

tearDown(){
  export RAGUEL_IF_EQUAL_STATE=''
  rm -f ./DELETE_THIS_FILE_WHEN_SEEN
  rm -f ./DELETE_THIS_FILE_WHEN_SEEN_WRITE
}

### checker test for equality ###

test_if_file_writable(){
  if_file_writable ./DELETE_THIS_FILE_WHEN_SEEN_WRITE
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  generated=`if_file_writable ./DELETE_THIS_FILE_WHEN_SEEN then_run "echo 'A'"`
  expected=''
  assertEquals "${expected}" "${generated}"

  if_file_writable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_then_if_file_writable(){
  export RAGUEL_IF_EQUAL_STATE=''
  then_if_file_writable ./DELETE_THIS_FILE_WHEN_SEEN_WRITE
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE=''
  then_if_file_writable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_file_writable ./DELETE_THIS_FILE_WHEN_SEEN_WRITE
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_file_writable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_file_writable ./DELETE_THIS_FILE_WHEN_SEEN_WRITE
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_file_writable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_else_if_file_writable(){
  export RAGUEL_IF_EQUAL_STATE=''
  else_if_file_writable ./DELETE_THIS_FILE_WHEN_SEEN_WRITE
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE=''
  else_if_file_writable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_file_writable ./DELETE_THIS_FILE_WHEN_SEEN_WRITE
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_file_writable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_file_writable ./DELETE_THIS_FILE_WHEN_SEEN_WRITE
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_file_writable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_if_not_file_writable(){
  if_not_file_writable ./DELETE_THIS_FILE_WHEN_SEEN_WRITE
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  generated=`if_not_file_writable ./DELETE_THIS_FILE_WHEN_SEEN then_run "echo 'A'"`
  expected='A'
  assertEquals "${expected}" "${generated}"

  if_not_file_writable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"
}

test_then_if_not_file_writable(){
  export RAGUEL_IF_EQUAL_STATE=''
  then_if_not_file_writable ./DELETE_THIS_FILE_WHEN_SEEN_WRITE
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE=''
  then_if_not_file_writable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_not_file_writable ./DELETE_THIS_FILE_WHEN_SEEN_WRITE
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_not_file_writable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_not_file_writable ./DELETE_THIS_FILE_WHEN_SEEN_WRITE
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_not_file_writable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_else_if_not_file_writable(){
  export RAGUEL_IF_EQUAL_STATE=''
  else_if_not_file_writable ./DELETE_THIS_FILE_WHEN_SEEN_WRITE
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE=''
  else_if_not_file_writable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_not_file_writable ./DELETE_THIS_FILE_WHEN_SEEN_WRITE
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_not_file_writable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_not_file_writable ./DELETE_THIS_FILE_WHEN_SEEN_WRITE
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_not_file_writable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"
}
