## Raguel Spell: Display
##### these markdown docs, run as shell script to see effect of usage commands

###+++++

#### shout

##### syntax

` # shout <message> `

##### usage

if [[ -z "$RAGUEL_DIR" ]]; then
  if [[ -z "$BASH_SOURCE" ]]; then
    RAGUEL_DIR=$(dirname $0)
  else
    RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
  fi
fi
export RAGUEL_DIR="$RAGUEL_DIR/../src"
. "${RAGUEL_DIR}/display.sh"

shout "Shouting inside banner."

###+++++
