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
RAGUEL_URL="https://github.com/abhishekkr/raguel/archive/master.tar.gz"
RAGUEL_TGZ="raguel.tgz"
RAGUEL_SRC="./raguel-master/src/raguel.sh"

curl -kL -o $RAGUEL_TGZ $RAGUEL_URL
tar -zxf raguel.tgz

cat > ./install_htop << EOF
#!bash

. $RAGUEL_SRC --source-only
GEMRC_URL="https://raw.github.com/abhishekkr/tux-svc-mux/master/rc/gemrc"


auto_install htop

if_not_file "\$HOME/.gemrc"
then_run "curl -kL -o \$HOME/.gemrc \$GEMRC_URL"

EOF

bash ./install_htop
```
