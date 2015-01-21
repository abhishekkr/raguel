#!/usr/bin/env bash

# to exit with passed message
panic(){
  echo "$@"
  exit 1
}

# log for failure, don't exit
log_for_failure(){
  echo "$@" >> $PWD/raguel.failures
}
