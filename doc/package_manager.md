## Raguel Spell: Package Manager

##### just loading package_manager
```Shell
if [[ -z "$RAGUEL_DIR" ]]; then
  if [[ -z "$BASH_SOURCE" ]]; then
    RAGUEL_DIR=$(dirname $0)
  else
    RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
  fi
fi
export RAGUEL_DIR="$RAGUEL_DIR/../src"
. "${RAGUEL_DIR}/package_manager.sh"
```

***

#### auto_install

##### syntax

` # auto_install <package ...> `

##### usage

```Shell
auto_install htop
```

***

#### auto_uninstall

##### syntax

` # auto_uninstall <package ...> `

##### usage

```Shell
auto_uninstall htop
```

***
