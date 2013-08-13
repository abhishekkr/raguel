## Raguel Spell: Deployer

##### just loading deployer

```Shell
if [[ -z "$RAGUEL_DIR" ]]; then
  if [[ -z "$BASH_SOURCE" ]]; then
    RAGUEL_DIR=$(dirname $0)
  else
    RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
  fi
fi
export RAGUEL_DIR="$RAGUEL_DIR/../src"
. "${RAGUEL_DIR}/deployer.sh"
```

***

#### deploy_latest

##### syntax

` # deploy_latest <git-url> <deploy-dir> `

##### usage

```Shell
deploy_latest "git://github.com/abhishekkr/dead.drop.git" "$HOME/webapp/deaddrop"
```

This checks if "deploy-dir" doesn't exist and clones a fresh one.
Else checks of there are new changes, back-up the current dir...
pull in new code.

***

#### deploy_rollback

##### syntax

` # deploy_rollback <deploy-dir> `

##### usage

```Shell
deploy_rollback "$HOME/webapp/deaddrop"
```

This checks if "deploy-dir" backup exists, places that as current.
And moves current as broken dir.

***
