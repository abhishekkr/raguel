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
box_latest(){
  if_not_dir \$SOURCE_DIR
    then_run "git clone \$SOURCE_GIT \$SOURCE_DIR ;
              cd \$SOURCE_GIT ; bundle install ;
              ./service.sh start"
    else_if_not_git_latest \$SOURCE_DIR
      then_run "rm -rf \$BACKUP_DIR ; 
                cp -ar \${SOURCE_DIR} \${BACKUP_DIR} ;
                cd \${SOURCE_DIR} ; git checkout . ; git pull ;
                bundle install ;
                ./service.sh restart"
}
box_rollback(){
  if_dir \$BACKUP_DIR
    then_run "mv \$SOURCE_DIR \$BROKEN_DIR ; cp -ar \$BACKUP_DIR \$SOURCE_DIR ;
              cd \$SOURCE_DIR ; bundle install ; ./service.sh restart"
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
