### raguel

Mythological Context: http://en.wikipedia.org/wiki/Raguel_(archangel)
Reference: ArchAngel, Name means The friend of God.

It's here to be the friend of Shell Gods to create minion scripts to serve
the SYSTEMS.

```ASCII
                     \\                        //\\   _______________________
 || /===  |====||   |====}}  \\  \\    //===     ||   |                     |
 ||//          ||   \\__//   ||  ||    \\__      ||   | Shell Script Friend |
 ||       ||===||   //  \\   ||  ||    //        ||   | Yes It's Old School |
 ||       ||___||   \\___}}   \\_||//  \\__//   _||   |_____________________|

```

For ways it can improve Shell Scripting, refer Wiki.

It's best suited to Bourne Shell,
though it's made compatible to others as much possible.

***
***

### Spells available:

#### [Display](https://github.com/abhishekkr/raguel/blob/master/doc/display.md)

* Shout out a message as a Banner
```Shell
  shout $MESSAGE
  RAGUEL_SHOUT_CHAR='~' RAGUEL_SHOUT_CHAR_COUNT=50 shout $MESSAGE
```


#### [Looper](https://github.com/abhishekkr/raguel/blob/master/doc/looper.md)

* Loop a given command run for given count
```Shell
  repeat_run $TIMES_TO_REPEAT "$COMMAND_TO_RUN"
```


#### [Git](https://github.com/abhishekkr/raguel/blob/master/doc/git.md)

* Set Env Var RAGUEL_GIT_LOCAL_SHA to latest Local SHA in Current DIR
```Shell
  local_sha
```

* Set Env Var RAGUEL_GIT_REMOTE_SHA to latest Remote SHA in Current DIR
```Shell
  remote_sha
```


#### [Configurator](https://github.com/abhishekkr/raguel/blob/master/doc/configurator.md)

* Non-Interactive Package Manager
```Shell
  auto_install $PackageName

  > auto_install, auto_uninstall
```

* Info ENV Var for Distro
```Shell
  $RAGUEL_DISTRO_TYPE : telling what distro family is RHEL, Debian, etc.
 
  $RAGUEL_PACKAGE_INSTALL : setting the auto-install command here

  $RAGUEL_PACKAGE_UNINSTALL : setting the auto-uninstall command here

  $RAGUEL_NODENAME : the nodename grabbed from uname goes here

  $RAGUEL_ARCH : architecture information grabbed from uname goes here
```


#### [Checker](https://github.com/abhishekkr/raguel/blob/master/doc/checker.md)

```Shell
  All the checkers have if_{check}, then_if_{check}, else_if_{check}, if_not_{check}, then_if_not_{check}, else_if_not_{check}
```

```Shell
  So every check has a negation check version. And they both have then_, else_ checks for enabling chaining of checks as in get &&, || boolean functionality among checks.
```

* then_run , else_run , end_if
```Shell
  Every check can have following command on same line to run if check passes. Otherwise use then_run, else_run in combination with any check. It also provides 'end_if' to explicitly close Check block and make look good.
```

##### The example shown for if_equal can be used in permutation/combination with any other checks.

* Check for equality of 2 arguments
```Shell
  if_equal $ARG1 $ARG2 "$CMD_IF_PASSED"

  if_equal $ARG1 $ARG2
  then_run "$CMD_IF_PASSED"

  if_equal $ARG1 $ARG2
  else_run "$CMD_IF_FAILED"

  if_equal $ARG1 $ARG2
  then_run "$CMD_IF_PASSED"
  else_run "$CMD_IF_FAILED"

  if_equal $ARG1 $ARG2
  then_run "$CMD_IF_PASSED"
  else_run "$CMD_IF_FAILED"
  end_if

  if_equal $ARG1 $ARG2
  then_if_equal $ARG3 $ARG4
  then_if_equal $ARG5 $ARG6
  then_run "$CMD_IF_PASSED_1"
  else_if_equal $ARG7 $ARG8
  then_run "$CMD_IF_PASSED_2"
  else_run "$CMD_IF_FAILED"
  end_if

  > spells: if_equal, then_if_equal, else_if_equal, if_not_equal, then_if_not_equal, else_if_not_equal
```


* Check for Regular File existence
```Shell
  if_file $FILEPATH

  > spells: if_file, then_if_file, else_if_file, if_not_file, then_if_not_file, else_if_not_file
```


* Check for Directory existence
```Shell
  if_dir $DIRNAME

  > spells: if_dir, then_if_dir, else_if_dir, if_not_dir, then_if_not_dir, else_if_not_dir
```

* Check for File being empty in size
```Shell
  if_file_empty $FILEPATH

  > spells: if_file_empty, then_if_file_empty, else_if_file_empty, if_not_file_empty, then_if_not_file_empty, else_if_not_file_empty
```

* Check for File being Executable
```Shell
  if_file_executable $FILENAME

  > spells: if_file_executable, then_if_file_executable, else_if_file_executable, if_not_file_executable, then_if_not_file_executable, else_if_not_file_executable
```

* Check for File being Writable
```Shell
  if_file_writable $FILENAME

  > spells: if_file_writable, then_if_file_writable, else_if_file_writable, if_not_file_writable, then_if_not_file_writable, else_if_not_file_writable
```

* Check for File being SymLink
```Shell
  if_link $FILENAME

  > spells: if_link, then_if_link, else_if_link, if_not_link, then_if_not_link, else_if_not_link
```

* Check for Env Variable being defined
```Shell
  if_var $VARNAME

  > spells: if_var, then_if_var, else_if_var, if_not_var, then_if_not_var, else_if_not_var
```

* Check if given Git Repo dir has latest RAGUEL_GIT_REMOTE_BRANCH changes
```Shell
  if_git_latest $VARNAME

  > spells: if_git_latest, then_if_git_latest, else_if_git_latest, if_not_git_latest, then_if_not_git_latest, else_if_not_git_latest
```

* Check if a particular System Command is accessible or not
```Shell
  if_cmd $CMDNAME

  > spells: if_cmd, then_if_cmd, else_if_cmd, if_not_cmd, then_if_not_cmd, else_if_not_cmd
```



#### [Deployer](https://github.com/abhishekkr/raguel/blob/master/doc/deployer.md)

* Get the latest Code at DeployDir from the Remote Repo and backup current Repo, need to run service reset explicitly
```Shell
  deploy_latest $GIT_URL $DEPLOY_DIR
```

* Rollback the DeployDir to BackUp, need to run service reset explicitly
```Shell
  deploy_rollback $DEPLOY_DIR
```

Refer [this EXAMPLE](https://github.com/abhishekkr/raguel/blob/master/examples/deploy.dead.drop_with_deployer.sh) on how to get rolling with it.

***
***

#### Quick Examples:

```Shell
#!bash

RAGUEL_URL="https://github.com/abhishekkr/raguel/archive/master.tar.gz"
RAGUEL_TGZ="raguel.tgz"
RAGUEL_SRC="./raguel-master/src/raguel.sh"

curl -kL -o $RAGUEL_TGZ $RAGUEL_URL
tar -zxf raguel.tgz

cat > ./setup_my_box << EOF
#!bash

. $RAGUEL_SRC --source-only
GEMRC_URL="https://raw.github.com/abhishekkr/tux-svc-mux/master/rc/gemrc"


if_not_file "\$HOME/.gemrc"
  then_run "curl -kL -o \$HOME/.gemrc \$GEMRC_URL"

if_not_cmd "ruby" then_run "auto_install ruby"
if_not_cmd "gem" then_run "auto_install rubygems"
if_not_cmd "bundle" then_run "gem install bundler"
EOF

bash ./setup_my_box
```
