#!/usr/bin/env bash

. "$RAGUEL_DIR/checker.sh"

### setUp; tearDown ###

setUp(){
  touch ./DELETE_THIS_FILE_WHEN_SEEN
  chmod 0222 ./DELETE_THIS_FILE_WHEN_SEEN
  touch ./DELETE_THIS_FILE_WHEN_SEEN_READ
  chmod 0644 ./DELETE_THIS_FILE_WHEN_SEEN_READ
}

tearDown(){
  unset RAGUEL_IF_EQUAL_STATE
  rm -f ./DELETE_THIS_FILE_WHEN_SEEN
  rm -f ./DELETE_THIS_FILE_WHEN_SEEN_READ
}

### checker test for equality ###

test_if_file_readable(){
  if_file_readable ./DELETE_THIS_FILE_WHEN_SEEN_READ
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  generated=`if_file_readable ./DELETE_THIS_FILE_WHEN_SEEN then_run "echo 'A'"`
  expected=''
  assertEquals "${expected}" "${generated}"

  if_file_readable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_then_if_file_readable(){
  unset RAGUEL_IF_EQUAL_STATE
  then_if_file_readable ./DELETE_THIS_FILE_WHEN_SEEN_READ
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  unset RAGUEL_IF_EQUAL_STATE
  then_if_file_readable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_file_readable ./DELETE_THIS_FILE_WHEN_SEEN_READ
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_file_readable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_file_readable ./DELETE_THIS_FILE_WHEN_SEEN_READ
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_file_readable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_else_if_file_readable(){
  unset RAGUEL_IF_EQUAL_STATE
  else_if_file_readable ./DELETE_THIS_FILE_WHEN_SEEN_READ
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  unset RAGUEL_IF_EQUAL_STATE
  else_if_file_readable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_file_readable ./DELETE_THIS_FILE_WHEN_SEEN_READ
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_file_readable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_file_readable ./DELETE_THIS_FILE_WHEN_SEEN_READ
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_file_readable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_if_not_file_readable(){
  if_not_file_readable ./DELETE_THIS_FILE_WHEN_SEEN_READ
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  generated=`if_not_file_readable ./DELETE_THIS_FILE_WHEN_SEEN then_run "echo 'A'"`
  expected='A'
  assertEquals "${expected}" "${generated}"

  if_not_file_readable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"
}

test_then_if_not_file_readable(){
  unset RAGUEL_IF_EQUAL_STATE
  then_if_not_file_readable ./DELETE_THIS_FILE_WHEN_SEEN_READ
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  unset RAGUEL_IF_EQUAL_STATE
  then_if_not_file_readable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_not_file_readable ./DELETE_THIS_FILE_WHEN_SEEN_READ
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_not_file_readable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_not_file_readable ./DELETE_THIS_FILE_WHEN_SEEN_READ
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_not_file_readable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_else_if_not_file_readable(){
  unset RAGUEL_IF_EQUAL_STATE
  else_if_not_file_readable ./DELETE_THIS_FILE_WHEN_SEEN_READ
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  unset RAGUEL_IF_EQUAL_STATE
  else_if_not_file_readable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_not_file_readable ./DELETE_THIS_FILE_WHEN_SEEN_READ
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_not_file_readable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_not_file_readable ./DELETE_THIS_FILE_WHEN_SEEN_READ
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_not_file_readable ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"
}
