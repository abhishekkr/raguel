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
[[ -z "$RAGUEL_DIR" ]] && RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
for check_plugins in `ls $RAGUEL_DIR/checker/*.sh`
do
  . $check_plugins
done
. "${RAGUEL_DIR}/looper.sh"
