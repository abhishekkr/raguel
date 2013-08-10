#!/usr/bin/env bash

if [[ -z "$RAGUEL_DIR" ]]; then
  if [[ -z "$BASH_SOURCE" ]]; then
    export RAGUEL_DIR=$(dirname $0)
  else
    export RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
  fi
fi

for raguel_spell in `ls $RAGUEL_DIR/*.sh`
do
  if [ $raguel_spell != "$RAGUEL_DIR/raguel.sh" ]; then
    . $raguel_spell
  fi
done
