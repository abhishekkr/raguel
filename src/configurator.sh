#!/usr/bin/env bash

##### it gotta get the sheesh of configuration

for config_plugins in $RAGUEL_DIR/configurator/*.sh ; do
  . $config_plugins
done
