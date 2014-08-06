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
