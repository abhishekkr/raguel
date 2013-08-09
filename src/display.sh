#!/usr/bin/env bash

[[ -z "$RAGUEL_DIR" ]] && RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
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
