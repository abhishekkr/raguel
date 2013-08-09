#!/usr/bin/env bash

export RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")

for raguel_spell in `ls $RAGUEL_DIR/*.sh`
do
  if [ $raguel_spell != "$RAGUEL_DIR/raguel.sh" ]; then
    . $raguel_spell
  fi
done
