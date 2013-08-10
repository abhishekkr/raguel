#!/usr/bin/env bash

. "$RAGUEL_DIR/checker.sh"

### setUp; tearDown ###

tearDown(){
  export RAGUEL_IF_EQUAL_STATE=''
}

### checker test ###

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

test_end_if(){
  export RAGUEL_IF_EQUAL_STATE=''
  end_if
  assertEquals "$RAGUEL_IF_EQUAL_STATE" ''

  export RAGUEL_IF_EQUAL_STATE='true'
  end_if
  assertEquals "$RAGUEL_IF_EQUAL_STATE" ''

  export RAGUEL_IF_EQUAL_STATE='false'
  end_if
  assertEquals "$RAGUEL_IF_EQUAL_STATE" ''
}
