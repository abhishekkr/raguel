#!/usr/bin/env bash

## Data
export BASEDIR=$(dirname $0)
export SCRIPTDIR=$(dirname $0)

if [[ -z "$RAGUEL_DIR" ]]; then
  if [[ -z "$BASH_SOURCE" ]]; then
    RAGUEL_DIR=$(dirname $0)
  else
    RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
  fi
fi
export RAGUEL_DIR="$RAGUEL_DIR/../src"

TEMPDIR="$BASEDIR/../temp"
SHUNIT2_VER="2.1.6"
SHUNIT2_URL="https://shunit2.googlecode.com/files/shunit2-${SHUNIT2_VER}.tgz"
SHUNIT2_TGZ="${TEMPDIR}/shunit2-${SHUNIT2_VER}.tgz"
SHUNIT_DIR="${TEMPDIR}/shunit2"
SHUNIT_BIN="${SHUNIT_DIR}/src/shunit2"

## ensure for presence of SHUNIT2
if [ ! -f $SHUNIT_BIN ]; then
  mkdir -p $TEMPDIR
  curl -L -o $SHUNIT2_TGZ $SHUNIT2_URL
  tar zxvf $SHUNIT2_TGZ
  rm -f $SHUNIT2_TGZ
  mv "shunit2-${SHUNIT2_VER}" $SHUNIT_DIR
fi

## Loading all test cases
for test_case in `ls $BASEDIR/test_*${1}*.sh`
do
  if [ $test_case != "${BASEDIR}/test_example.sh" ]; then
    echo "Running $test_case ..."
    $SHUNIT_BIN $test_case
    echo "~~~~~~~~~~~~~~~~~~~~~~"
  fi
done
