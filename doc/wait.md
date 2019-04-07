## Raguel Spell: Wait

##### just loading wait
```Shell
if [[ -z "$RAGUEL_DIR" ]]; then
  if [[ -z "$BASH_SOURCE" ]]; then
    RAGUEL_DIR=$(dirname $0)
  else
    RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
  fi
fi
export RAGUEL_DIR="$RAGUEL_DIR/../src"
. "${RAGUEL_DIR}/checker.sh"
```

***

#### `pause_timer`

* pauses flow of execution with a timer in seconds, with per second update of time left

##### syntax

` # pause_timer "<time-in-seconds>" `

---
