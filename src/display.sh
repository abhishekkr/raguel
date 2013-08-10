#!/usr/bin/env bash

if [[ -z "$RAGUEL_DIR" ]]; then
  if [[ -z "$BASH_SOURCE" ]]; then
    export RAGUEL_DIR=$(dirname $0)
  else
    export RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
  fi
fi
. "${RAGUEL_DIR}/looper.sh"

shout(){
  [[ -z "$RAGUEL_SHOUT_CHAR" ]] && RAGUEL_SHOUT_CHAR="#"
  [[ -z "$RAGUEL_SHOUT_CHAR_COUNT" ]] && RAGUEL_SHOUT_CHAR_COUNT=70
  HORIZONTAL_BAR="echo -n \"${RAGUEL_SHOUT_CHAR}\""

  repeat_run "${RAGUEL_SHOUT_CHAR_COUNT}" "${HORIZONTAL_BAR}"
  echo "" ; echo $@
  repeat_run "${RAGUEL_SHOUT_CHAR_COUNT}" "${HORIZONTAL_BAR}"
  echo ""
}
