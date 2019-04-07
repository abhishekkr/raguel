#!/usr/bin/env bash

# pause_timer to run a pause for given seconds
pause_timer(){
  local RESET_X=${-//[^x]/} ## to avoid 'set -x' messing overwriting
  [[ "${RESET_X}" == "x" ]] && set +x
  local SLEEP_FOR="$1"
  echo "" ## for first override to happen on a new empty line
  for i in `seq $SLEEP_FOR -1 1`; do
    sleep 1
    echo -e -n "\e[1A"; echo -e "\e[0K\r[yawn] lets's wait for $i seconds, for things to be ready"
  done
  [[ "${RESET_X}" == "x" ]] && set -x
}
