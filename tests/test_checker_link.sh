#!/usr/bin/env bash

. "$RAGUEL_DIR/checker.sh"

### setUp; tearDown ###

setUp(){
  touch ./DELETE_THIS_FILE_WHEN_SEEN
  ln -s ./DELETE_THIS_FILE_WHEN_SEEN ./DELETE_THIS_FILE_WHEN_SEEN_LINK
}

tearDown(){
  export RAGUEL_IF_EQUAL_STATE=''
  rm -f ./DELETE_THIS_FILE_WHEN_SEEN
  rm -f ./DELETE_THIS_FILE_WHEN_SEEN_LINK
}

### checker test for equality ###

test_if_link(){
  if_link ./DELETE_THIS_FILE_WHEN_SEEN_LINK
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  generated=`if_link ./DELETE_THIS_FILE_WHEN_SEEN then_run "echo 'A'"`
  expected=''
  assertEquals "${expected}" "${generated}"

  if_link ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_then_if_link(){
  export RAGUEL_IF_EQUAL_STATE=''
  then_if_link ./DELETE_THIS_FILE_WHEN_SEEN_LINK
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE=''
  then_if_link ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_link ./DELETE_THIS_FILE_WHEN_SEEN_LINK
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_link ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_link ./DELETE_THIS_FILE_WHEN_SEEN_LINK
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_link ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_else_if_link(){
  export RAGUEL_IF_EQUAL_STATE=''
  else_if_link ./DELETE_THIS_FILE_WHEN_SEEN_LINK
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE=''
  else_if_link ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_link ./DELETE_THIS_FILE_WHEN_SEEN_LINK
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_link ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_link ./DELETE_THIS_FILE_WHEN_SEEN_LINK
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_link ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_if_not_link(){
  if_not_link ./DELETE_THIS_FILE_WHEN_SEEN_LINK
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  generated=`if_not_link ./DELETE_THIS_FILE_WHEN_SEEN then_run "echo 'A'"`
  expected='A'
  assertEquals "${expected}" "${generated}"

  if_not_link ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"
}

test_then_if_not_link(){
  export RAGUEL_IF_EQUAL_STATE=''
  then_if_not_link ./DELETE_THIS_FILE_WHEN_SEEN_LINK
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE=''
  then_if_not_link ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_not_link ./DELETE_THIS_FILE_WHEN_SEEN_LINK
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_not_link ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_not_link ./DELETE_THIS_FILE_WHEN_SEEN_LINK
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_not_link ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_else_if_not_link(){
  export RAGUEL_IF_EQUAL_STATE=''
  else_if_not_link ./DELETE_THIS_FILE_WHEN_SEEN_LINK
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE=''
  else_if_not_link ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_not_link ./DELETE_THIS_FILE_WHEN_SEEN_LINK
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_not_link ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_not_link ./DELETE_THIS_FILE_WHEN_SEEN_LINK
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_not_link ./DELETE_THIS_FILE_WHEN_SEEN
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"
}
