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
  local VAR_NAME="$1"
  local DEFAULT_VALUE="$2"

  [[ -z $(env | grep ${VAR_NAME}) ]] && \
    export ${VAR_NAME}="${DEFAULT_VALUE}"
}
