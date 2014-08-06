## Raguel Spell: Params

##### just loading params

```Shell
if [[ -z "$RAGUEL_DIR" ]]; then
  if [[ -z "$BASH_SOURCE" ]]; then
    RAGUEL_DIR=$(dirname $0)
  else
    RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
  fi
fi
export RAGUEL_DIR="$RAGUEL_DIR/../src"
. "${RAGUEL_DIR}/params.sh"
```

***

#### wrong_params

* helps check if required count of params provided and error exit with (given) message if not

##### syntax

` # wrong_params "$#" "<desired-param-count>" [Optional Error message] `

##### usage

```Shell
wrong_params "$#" "2" "SYNTAX: Extract_Data_Body <SOURCE> <DESTINATION>"
```

***
