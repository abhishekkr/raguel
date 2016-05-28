#!/usr/bin/env bash

# banner [BANNER_CHARACTER]
banner(){
  local _BANNER_CHAR="$1"
  local _COLUMNS=$(tput cols)

  [[ -z "$BANNER_CHAR" ]] && BANNER_CHAR="*"
  [[ -z "$_BANNER_CHAR" ]] && _BANNER_CHAR=${BANNER_CHAR}

  for ((i=0; i < $_COLUMNS ; i++)); do
    echo -n "${_BANNER_CHAR}"
  done
  echo ""
}
