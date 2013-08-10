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


#### if_file

##### Usable in all similar patterns with 'if_equal'

##### syntax

` # if_file <path_to_file> `

##### usage

BASEDIR=$(dirname "${BASH_SOURCE[0]}") ; . "$BASEDIR/../src/checker.sh"

if_file "$HOME/.bashrc"
then_run "echo 'You have BASH RC file in your HOME dir.'"
else_run "echo 'No BASH RC file found in HOME dir.'"
echo ''

###+++++


#### if_not_file

##### syntax

` # if_not_file <path_to_file> `

##### usage

BASEDIR=$(dirname "${BASH_SOURCE[0]}") ; . "$BASEDIR/../src/checker.sh"

if_not_file "$HOME/.bash_profile"
then_run "echo 'No BASH Profile file found in HOME dir.'"
else_run "echo 'You have BASH Profile file in your HOME dir.'"
echo ''

###+++++


#### if_dir

##### Usable in all similar patterns with 'if_equal'

##### syntax

` # if_dir <path_to_dir> `

##### usage

BASEDIR=$(dirname "${BASH_SOURCE[0]}") ; . "$BASEDIR/../src/checker.sh"

if_dir $HOME
then_run "echo 'Your Home dir is already present.'"
else_run "echo 'Home dir need to be created.'"
echo ''

###+++++


#### if_not_dir

##### syntax

` # if_not_dir <path_to_file> `

##### usage

BASEDIR=$(dirname "${BASH_SOURCE[0]}") ; . "$BASEDIR/../src/checker.sh"

if_not_dir "$HOME/.vim"
then_run "echo 'No VIM config present in Home dir.'"
else_run "echo 'Your VIM config dir is present in Home dir'"
echo ''

###+++++
