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

#### Quick Examples:

```Shell
#!bash

RAGUEL_URL="https://github.com/abhishekkr/raguel/archive/master.tar.gz"
RAGUEL_TGZ="raguel.tgz"
RAGUEL_SRC="./raguel-master/src/raguel.sh"

curl -kL -o $RAGUEL_TGZ $RAGUEL_URL
tar -zxf raguel.tgz

export BOX_ACTION='latest'
cat > ./setup_my_box << EOF
#!bash

. $RAGUEL_SRC --source-only
GEMRC_URL="https://raw.github.com/abhishekkr/tux-svc-mux/master/rc/gemrc"

auto_install htop git ruby

if_not_file "\$HOME/.gemrc"
  then_run "curl -kL -o \$HOME/.gemrc \$GEMRC_URL"

gem install bundler

SOURCE_GIT='git://github.com/abhishekkr/dead.drop.git'
SOURCE_DIR="\$HOME/dead.drop"
BACKUP_DIR="\${SOURCE_DIR}.original"
BROKEN_DIR="\${SOURCE_DIR}.broken"

service_up(){
  cd \$SOURCE_DIR ; bundle install ; ./service.sh restart
}

box_latest(){
  deployer_latest "\$SOURCE_GIT" "\$SOURCE_DIR"
  service_up
}

box_rollback(){
  deployer_rollback "\$SOURCE_DIR"
  service_up
}

box_check(){
  if_dir \$SOURCE_DIR
    then_run "cd \$SOURCE_DIR ; ./service.sh status"
}

if_equal $BOX_ACTION "latest"
else_if_equal $BOX_ACTION "rollback"
else_if_equal $BOX_ACTION "check"
  then_run "box_${BOX_ACTION}"

EOF

bash ./setup_my_box
```
