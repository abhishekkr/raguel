RAGUEL_SRC="./src/raguel.sh"

. $RAGUEL_SRC --source-only

if_var $1
then_run HOME=$1

if_var $HOME
then_if_dir $HOME
then_run "shout '$HOME already exists.' && ls -la $HOME"
else_run "mkdir -p $HOME ; echo 'Created $HOME.'"
end_if
