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

(pip list | grep -F 'nodeenv ') > /dev/null || pip install nodeenv

node_path=$(which node || true)
root_path=$(dirname "$(pwd)")

if [[ "$node_path" == "$root_path"* ]]; then
  echo "node $(node --version) already installed at $(which node)"
else
  nodeenv -p -n lts
fi