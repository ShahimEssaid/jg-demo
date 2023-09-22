#!/usr/bin/env bash
#set -x
#set -u
set -e
set -o pipefail
set -o noclobber
shopt -s nullglob

# stack overflow #59895
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
    DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"

cd "$DIR"/..

../bin/setup.sh
. ../.venv/bin/activate

(pip list | grep -F 'poetry ') > /dev/null ||  { echo Running pip install poetry; pip install poetry; }
(pip list | grep -F 'tims-grpc ') > /dev/null ||  { echo Running pip install tims-grpc; pip install tims-grpc; }
