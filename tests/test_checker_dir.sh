#!/usr/bin/env bash

. "$RAGUEL_DIR/checker.sh"

### setUp; tearDown ###

tearDown(){
  unset RAGUEL_IF_EQUAL_STATE
}

### checker test for equality ###

test_if_dir(){
  if_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  generated=`if_dir "$BASEDIR/" then_run "echo 'A'"`
  expected='A'
  assertEquals "${expected}" "${generated}"

  generated=`if_dir "${BASEDIR}_tmp/" then_run "echo 'A'"`
  expected=''
  assertEquals "${expected}" "${generated}"

  if_dir "${BASEDIR}_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_then_if_dir(){
  unset RAGUEL_IF_EQUAL_STATE
  then_if_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  unset RAGUEL_IF_EQUAL_STATE
  then_if_dir "${BASEDIR}_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_dir "${BASEDIR}_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_dir "${BASEDIR}_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_else_if_dir(){
  unset RAGUEL_IF_EQUAL_STATE
  else_if_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  unset RAGUEL_IF_EQUAL_STATE
  else_if_dir "${BASEDIR}_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_dir "${BASEDIR}_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_dir "${BASEDIR}_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_if_not_dir(){
  if_not_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  generated=`if_not_dir "${BASEDIR}_not_there/" then_run "echo 'A'"`
  expected='A'
  assertEquals "${expected}" "${generated}"

  generated=`if_not_dir "${BASEDIR}/" then_run "echo 'A'"`
  expected=''
  assertEquals "${expected}" "${generated}"

  if_not_dir "${BASEDIR}_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"
}

test_then_if_not_dir(){
  unset RAGUEL_IF_EQUAL_STATE
  then_if_not_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  unset RAGUEL_IF_EQUAL_STATE
  then_if_not_dir "${BASEDIR}_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_not_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  then_if_not_dir "${BASEDIR}_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_not_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  then_if_not_dir "${BASEDIR}_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"
}

test_else_if_not_dir(){
  unset RAGUEL_IF_EQUAL_STATE
  else_if_not_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  unset RAGUEL_IF_EQUAL_STATE
  else_if_not_dir "${BASEDIR}_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_not_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='true'
  else_if_not_dir "${BASEDIR}_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_not_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='false'
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE='false'
  else_if_not_dir "${BASEDIR}_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"
}
