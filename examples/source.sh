
RAGUEL_SRC="./src/raguel.sh"

. $RAGUEL_SRC --source-only

echo $ABC

export_default ABC some
echo $ABC

export_default ABC thing
echo $ABC

unset ABC

env_set ABC wing
echo $ABC

env_get ABC
