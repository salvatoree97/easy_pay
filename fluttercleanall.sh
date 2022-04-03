echo "Looking for projects... (may take a while)"
find . -name "pubspec.yaml" -exec $SHELL -c '
    echo "Done. Cleaning all projects."
    for i in "$@" ; do
        DIR=$(dirname "${i}")
        echo "Cleaning ${DIR}..."
        (cd "$DIR" && fvm flutter clean >/dev/null 2>&1)
    done
    echo "DONE!"
' {} +