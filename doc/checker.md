## Raguel Spell: Checker

##### just loading checker
```Shell
if [[ -z "$RAGUEL_DIR" ]]; then
  if [[ -z "$BASH_SOURCE" ]]; then
    RAGUEL_DIR=$(dirname $0)
  else
    RAGUEL_DIR=$(dirname "${BASH_SOURCE[0]}")
  fi
fi
export RAGUEL_DIR="$RAGUEL_DIR/../src"
. "${RAGUEL_DIR}/checker.sh"
```

***

#### then_run

##### syntax

` # then_run "<command(s)>" `

##### usage

```Shell
RAGUEL_IF_EQUAL_STATE='true'
then_run "echo \"if RAGUEL_IF_EQUAL_STATE is 'true', then_run evals\" ;
          echo \"it also evals when 'if_equal' or similar if_ succeeds\""
echo "and after its run RAGUEL_IF_EQUAL_STATE gets set to \
'$RAGUEL_IF_EQUAL_STATE' if it was 'true' before."
echo ''
```

***


#### else_run

##### syntax

` # else_run "<command(s)>" `

##### usage

```Shell
RAGUEL_IF_EQUAL_STATE='false'
else_run "echo \"if RAGUEL_IF_EQUAL_STATE is 'false', then_run evals\" ;
          echo \"it also evals when 'if_equal' or similar if_ succeeds\""
echo "and after its run RAGUEL_IF_EQUAL_STATE gets set to \
'$RAGUEL_IF_EQUAL_STATE' if it was 'false' before."
echo ''
```

***


#### if_equal

` # it also has 'then_if_equal' & 'else_if_equal' for chaining if `

##### syntax

` # if_equal <arg1> <arg2> `

##### usage

```Shell
if_equal $USER "abhishekkr" "echo 'any command run on pass & fail'"

if_equal $USER "abhishekkr" then_run "echo 'then runs on pass'"
if_equal $USER "abhishekkr" else_run "echo 'else runs if fails'"

if_equal $USER "abhishekkr"
then_run "echo 'abhishekkr is user'"
else_run "echo '$USER is user'"
echo ''
```

***


#### if_not_equal

` # it also has 'then_if_not_equal' & 'else_if_not_equal' for chaining if `

##### syntax

` # if_not_equal <arg1> <arg2> `

##### usage

```Shell
if_not_equal $USER "abhishekkr" "echo 'any command run on pass & fail'"

if_not_equal $USER "abhishekkr" then_run "echo 'then runs on pass'"
if_not_equal $USER "abhishekkr" else_run "echo 'else runs if fails'"

if_not_equal $USER "abhishekkr"
then_run "echo 'abhishekkr is user'"
else_run "echo '$USER is user'"
echo ''
```

***


#### if else if [or] chaining if

` # all 'if_<check>' & 'if_not_<check>' have their 'then_' & 'else_' versions `

##### syntax

` # if_<check> <args, > ; then_run <task> ; if_<check> ; then_run <task> `

` # if_<check> <args, > ; then_run <task> ; if_<check> <...> ; end_if `

` #can use any of if_ if_not_ checks present in checker in pre-fixed by else_ `

##### usage

```Shell
if_not_file "$HOME/.vimrc"
then_if_not_dir "$HOME/.vim"
then_run "echo \"You don't have any VIM config in your HOME dir.\""

if_file "$HOME/.vimrc"
THE_CONFIG="$HOME/.vimrc"
else_if_dir "$HOME/.vim"
THE_CONFIG="$THE_CONFIG and $HOME/.vim"
then_run "echo 'You have VIM $THE_CONFIG config in your HOME dir.'"

if_file "$HOME/.vimrc"
then_if_dir "$HOME/.vim"
then_run "echo 'You have VIM .vimrc and .vim config in your HOME dir.'"
```

***


#### end_if

` # it's there to close of any if_<check> chaining and make you feel better. `

##### syntax

` # end_if `

##### usage

```Shell
if_not_dir "$HOME/.vim"
then_run "echo 'No VIM config present in Home dir.'"
else_if_dir "$HOME/.miv"
then_run "echo 'Your MIV config dir is present in Home dir'"
else_if_file "$HOME/.mivrc"
then_run "echo 'Your MIV RC is present in Home dir'"
else_if_equal 10 100
then_run "echo '10 is not 100, so what... didn't you knew.'"
else_run "echo 'nothing passed...'"
end_if
echo ''
```

***


#### if_file

` # it also has 'then_if_not_file' & 'else_if_not_file' for chaining if `

##### Usable in all similar patterns with 'if_equal'

##### syntax

` # if_file <path_to_file> `

##### usage

```Shell
if_file "$HOME/.bashrc"
then_run "echo 'You have BASH RC file in your HOME dir.'"
else_run "echo 'No BASH RC file found in HOME dir.'"
echo ''
```

***


#### if_not_file

` # it also has 'then_if_not_file' & 'else_if_not_file' for chaining if `

##### syntax

` # if_not_file <path_to_file> `

##### usage

```Shell
if_not_file "$HOME/.bash_profile"
then_run "echo 'No BASH Profile file found in HOME dir.'"
else_run "echo 'You have BASH Profile file in your HOME dir.'"
echo ''
```

***


#### if_dir

` # it also has 'then_if_not_dir' & 'else_if_not_dir' for chaining if `

##### Usable in all similar patterns with 'if_equal'

##### syntax

` # if_dir <path_to_dir> `

##### usage

```Shell
if_dir $HOME
then_run "echo 'Your Home dir is already present.'"
else_run "echo 'Home dir need to be created.'"
echo ''
```

***


#### if_not_dir

` # it also has 'then_if_not_dir' & 'else_if_not_dir' for chaining if `

##### syntax

` # if_not_dir <path_to_file> `

##### usage

```Shell
if_not_dir "$HOME/.vim"
then_run "echo 'No VIM config present in Home dir.'"
else_run "echo 'Your VIM config dir is present in Home dir'"
echo ''
```

***


#### if_var

` # it also has 'then_if_var' & 'else_if_var' for chaining if `

##### Usable in all similar patterns with 'if_equal'

##### syntax

` # if_var $VAR `

##### usage

```Shell
if_var $HOME
then_run "echo 'Var HOME present.'"
else_run "echo 'Var HOME not present.'"
echo ''
```

***


#### if_not_var

` # it also has 'then_if_not_var' & 'else_if_not_var' for chaining if `

##### syntax

` # if_not_var $VAR `

##### usage

```Shell
if_not_var "$HOMESS"
then_run "echo 'Var HOMESS present.'"
else_run "echo 'Var HOMESS not present.'"
echo ''
```

***


#### if_git_latest

` # it also has 'then_if_git_latest' & 'else_if_git_latest' for chaining if `

##### Usable in all similar patterns with 'if_equal'

##### syntax

` # if_git_latest $REPO_DIR `

##### usage

```Shell
if_git_latest $REPO_DIR
then_run "echo 'Latest changes are in.'"
else_run "git pull"
echo ''
```

***


#### if_not_git_latest

` # it also has 'then_if_not_git_latest' & 'else_if_not_git_latest' for chaining if `

##### syntax

` # if_not_git_latest $REPO_DIR `

##### usage

```Shell
if_not_git_latest $REPO_DIR
then_run "git pull"
else_run "echo 'Latest changes are in.'"
echo ''
```

***
