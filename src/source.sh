# func to ensure sourcing all files required and fail if not found any
try_source(){
    if [ $# -lt 1 ] ; then
        echo "ERROR:SC: No filepaths passed to try_source." && exit 1
    fi

    for _FILE_TO_SOURCE in ${@:1}; do
        echo "trying to source: $_FILE_TO_SOURCE"
        if [ -f "$_FILE_TO_SOURCE" ]; then
            . "$_FILE_TO_SOURCE" --source-only
        else
            echo "ERROR:SC: File not found ${_FILE_TO_SOURCE}" && exit 2;
        fi
    done
    unset _FILE_TO_SOURCE
}

export_default(){
  if [ $# -lt 2 ] ; then
    echo "ERROR:SC: usage: export_default <var-name> <default-value>" && exit 1
  fi

  local VAR_NAME="$1"
  local DEFAULT_VALUE="$2"

  [[ -z $(env | grep ${VAR_NAME}) ]] && \
    export ${VAR_NAME}="${DEFAULT_VALUE}"
}

env_get(){
  if [ $# -lt 1 ] ; then
    echo "ERROR:SC: usage: env_get <var-name>" && exit 1
  fi

  echo $(env | grep "^${1}=" 2>/dev/null | cut -d"=" -f 2- 2>/dev/null)
}

env_set(){
  if [ $# -lt 2 ] ; then
    echo "ERROR:SC: usage: env_set <var-name> <default-value>" && exit 1
  fi

  export_default "$1" "$2"
}
