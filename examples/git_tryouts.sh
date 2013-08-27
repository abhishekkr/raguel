RAGUEL_SRC="./src/raguel.sh"

. $RAGUEL_SRC --source-only

local_sha
shout "local sha: "$RAGUEL_GIT_LOCAL_SHA

remote_sha
shout "remote sha: "$RAGUEL_GIT_REMOTE_SHA
