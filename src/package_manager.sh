#!/usr/bin/env bash

if [[ -z "$RAGUEL_DIR" ]]; then
  if [[ -z "$BASH_SOURCE" ]]; then
    export RAGUEL_DIR=$(dirname $0)
  else
    export RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
  fi
fi
. "${RAGUEL_DIR}/distro_manager.sh"
. "${RAGUEL_DIR}/display.sh"
. "${RAGUEL_DIR}/checker/checker_var.sh"

# to auto install all provided packages as arguments
auto_install(){
  if_not_var $RAGUEL_PACKAGE_INSTALL then_run load_distro_specifics
  shout "$RAGUEL_PACKAGE_INSTALL ${@:1}"
  eval "$RAGUEL_PACKAGE_INSTALL ${@:1}"
}

# to auto uninstall all provided packages as arguments
auto_uninstall(){
  if_not_var $RAGUEL_PACKAGE_UNINSTALL then_run load_distro_specifics
  shout "$RAGUEL_PACKAGE_UNINSTALL ${@:1}"
  eval "$RAGUEL_PACKAGE_UNINSTALL ${@:1}"
}
