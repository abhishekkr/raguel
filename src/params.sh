# check if wrong number of params ($# as $1)!=($COUNT as $2) then exit
wrong_params(){
  if [[ $# -lt 2 ]]; then
    echo "Wrong number of arguments for 'wrong_params'."
    echo "Syntax: \$ wrong_params <given-param-count> <required-param-count>"
    exit 1
  fi
  if [[ $1 -ne $2 ]]; then
    echo "Error: Wrong Params.\n${@:3}"
    exit 1
  fi
}
