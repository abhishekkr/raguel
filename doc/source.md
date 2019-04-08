## Raguel Spell: Source

##### just loading source

```Shell
if [[ -z "$RAGUEL_DIR" ]]; then
  if [[ -z "$BASH_SOURCE" ]]; then
    RAGUEL_DIR=$(dirname $0)
  else
    RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
  fi
fi
export RAGUEL_DIR="$RAGUEL_DIR/../src"
. "${RAGUEL_DIR}/source.sh"
```

***

#### `try_source`

* this will check if the file to source exists or not, and try to source correctly; exit on any error

##### syntax

` # try_source <files-to-source...> `

##### usage

```Shell
try_source $ANYPATH/helper.sh"
```

---

#### `export_default`, alias `env_set`

* this will check if passed env-var name has a value, if not assigns provided default valur

##### syntax

` # export_default <env-var-name> <default-value-if-env-var-got-none>`

##### usage

```Shell
export_default ABC some
```

---

#### `env_get`

* can pass a composed Var name to it for its env value

##### syntax

` # env_get <env-var-name>

##### usage

```Shell
env_get HOME
```

---
