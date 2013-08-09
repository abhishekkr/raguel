## Raguel Spell: Looper
##### these markdown docs, run as shell script to see effect of usage commands

###+++++

#### repeat_run

##### syntax

` # repeat_run <number_of_times> <command_to_repeat> `

##### usage

BASEDIR=$(dirname "${BASH_SOURCE[0]}") ; . "$BASEDIR/../src/looper.sh"
repeat_run 5 "echo 'Running repeat_run with counter 5.'"

###+++++
