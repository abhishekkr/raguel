#!/usr/bin/env bash

### sample test ###
 
test_sample(){
  assertEquals "it works" "it works"
  ls > /dev/null
  assertTrue "list works" $?
}
