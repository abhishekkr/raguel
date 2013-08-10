## Raguel Spell: Looper
##### these markdown docs, run as shell script to see effect of usage commands

###+++++

#### repeat_run

##### syntax

` # repeat_run <number_of_times> <command_to_repeat> `

##### usage

if [[ -z "$RAGUEL_DIR" ]]; then
  if [[ -z "$BASH_SOURCE" ]]; then
    RAGUEL_DIR=$(dirname $0)
  else
    RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
  fi
fi
export RAGUEL_DIR="$RAGUEL_DIR/../src"
. "${RAGUEL_DIR}/looper.sh"

repeat_run 5 "echo 'Running repeat_run with counter 5.'"

###+++++
