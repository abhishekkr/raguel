#!/usr/bin/env bash

BASEDIR=$(dirname "${BASH_SOURCE[0]}") ; . "$BASEDIR/../src/display.sh"

### display test ###
 
test_shout(){
  generated=`RAGUEL_SHOUT_CHAR_COUNT=5 shout "AAA"`
  expected="#####
AAA
#####"
  assertEquals "${generated}" "${expected}"
}
