#!/usr/bin/env bash

# then_run
then_run(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'true' ]]; then
    export RAGUEL_IF_EQUAL_STATE=''
    eval "$@"
  fi
}

# else_run
else_run(){
  if [[ $RAGUEL_IF_EQUAL_STATE == 'false' ]]; then
    export RAGUEL_IF_EQUAL_STATE=''
    eval "$@"
  fi
}

# end_if
end_if(){
  export RAGUEL_IF_EQUAL_STATE=''
}

## Loading all checkers
if [[ -z "$RAGUEL_DIR" ]]; then
  if [[ -z "$BASH_SOURCE" ]]; then
    export RAGUEL_DIR=$(dirname $0)
  else
    export RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
  fi
fi
for check_plugins in `ls $RAGUEL_DIR/checker/*.sh`
do
  . $check_plugins
done
