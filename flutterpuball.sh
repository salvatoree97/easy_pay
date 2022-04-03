echo "Looking for projects... (may take a while)"

find . -name "pubspec.yaml" -exec $SHELL -c '
    echo "Done. Pub gets in all projects."
    for i in "$@" ; do
        DIR=$(dirname "${i}")
        echo "Running Pub get in ${DIR}..."
        (cd "$DIR" && fvm flutter pub get >/dev/null 2>&1)
    done
    echo "DONE!"
' {} +