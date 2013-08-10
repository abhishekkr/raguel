#!/usr/bin/env bash

BASEDIR=$(dirname "${BASH_SOURCE[0]}") ; . "$BASEDIR/../src/checker.sh"

### setUp; tearDown ###

tearDown(){
  export RAGUEL_IF_EQUAL_STATE=''
}

### checker test for equality ###

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

test_then_if_dir(){
  export RAGUEL_IF_EQUAL_STATE=''
  then_if_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE=''
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
  export RAGUEL_IF_EQUAL_STATE=''
  else_if_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE=''
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

  if_not_dir "${BASEDIR}_which_are_not_there.sh"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected='true'
  assertEquals "${expected}" "${generated}"
}

test_then_if_not_dir(){
  export RAGUEL_IF_EQUAL_STATE=''
  then_if_not_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE=''
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
  export RAGUEL_IF_EQUAL_STATE=''
  else_if_not_dir "${BASEDIR}/"
  generated=$RAGUEL_IF_EQUAL_STATE
  expected=''
  assertEquals "${expected}" "${generated}"

  export RAGUEL_IF_EQUAL_STATE=''
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
