## Raguel Spell: Display

##### just loading display

```Shell
if [[ -z "$RAGUEL_DIR" ]]; then
  if [[ -z "$BASH_SOURCE" ]]; then
    RAGUEL_DIR=$(dirname $0)
  else
    RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
  fi
fi
export RAGUEL_DIR="$RAGUEL_DIR/../src"
. "${RAGUEL_DIR}/display.sh"
```

###+++++

#### shout

##### syntax

` # shout <message> `

##### usage

```Shell
shout "Shouting inside banner."
```

###+++++
