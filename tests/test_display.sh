#!/usr/bin/env bash

. "$RAGUEL_DIR/display.sh"

### display test ###
 
test_shout(){
  generated=`RAGUEL_SHOUT_CHAR_COUNT=5 shout "AAA"`
  expected="#####
AAA
#####"
  assertEquals "${expected}" "${generated}"
}
