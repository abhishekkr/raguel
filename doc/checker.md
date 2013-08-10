## Raguel Spell: Checker
##### these markdown docs, run as shell script to see effect of usage commands

###+++++

#### then_run

##### syntax

` # then_run "<command(s)>" `

##### usage

BASEDIR=$(dirname "${BASH_SOURCE[0]}") ; . "$BASEDIR/../src/checker.sh"
RAGUEL_IF_EQUAL_STATE='true'
then_run "echo \"if RAGUEL_IF_EQUAL_STATE is 'true', then_run evals\" ;
          echo \"it also evals when 'if_equal' or similar if_ succeeds\""
echo "and after its run RAGUEL_IF_EQUAL_STATE gets set to \
'$RAGUEL_IF_EQUAL_STATE' if it was 'true' before."
echo ''

###+++++


#### else_run

##### syntax

` # else_run "<command(s)>" `

##### usage

BASEDIR=$(dirname "${BASH_SOURCE[0]}") ; . "$BASEDIR/../src/checker.sh"
RAGUEL_IF_EQUAL_STATE='false'
else_run "echo \"if RAGUEL_IF_EQUAL_STATE is 'false', then_run evals\" ;
          echo \"it also evals when 'if_equal' or similar if_ succeeds\""
echo "and after its run RAGUEL_IF_EQUAL_STATE gets set to \
'$RAGUEL_IF_EQUAL_STATE' if it was 'false' before."
echo ''

###+++++


#### if_equal

##### syntax

` # if_equal <arg1> <arg2> `

##### usage

BASEDIR=$(dirname "${BASH_SOURCE[0]}") ; . "$BASEDIR/../src/checker.sh"

if_equal $USER "abhishekkr" "echo 'any command run on pass & fail'"

if_equal $USER "abhishekkr" then_run "echo 'then runs on pass'"
if_equal $USER "abhishekkr" else_run "echo 'else runs if fails'"

if_equal $USER "abhishekkr"
then_run "echo 'abhishekkr is user'"
else_run "echo '$USER is user'"
echo ''

###+++++


#### if_not_equal

##### syntax

` # if_not_equal <arg1> <arg2> `

##### usage

BASEDIR=$(dirname "${BASH_SOURCE[0]}") ; . "$BASEDIR/../src/checker.sh"

if_not_equal $USER "abhishekkr" "echo 'any command run on pass & fail'"

if_not_equal $USER "abhishekkr" then_run "echo 'then runs on pass'"
if_not_equal $USER "abhishekkr" else_run "echo 'else runs if fails'"

if_not_equal $USER "abhishekkr"
then_run "echo 'abhishekkr is user'"
else_run "echo '$USER is user'"
echo ''

###+++++
