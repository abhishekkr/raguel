## Raguel Spell: Looper

##### just loading looper

```Shell
if [[ -z "$RAGUEL_DIR" ]]; then
  if [[ -z "$BASH_SOURCE" ]]; then
    RAGUEL_DIR=$(dirname $0)
  else
    RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
  fi
fi
export RAGUEL_DIR="$RAGUEL_DIR/../src"
. "${RAGUEL_DIR}/looper.sh"
```

***

#### repeat_run

##### syntax

` # repeat_run <number_of_times> <command_to_repeat> `

##### usage

```Shell
repeat_run 5 "echo 'Running repeat_run with counter 5.'"
```

***
