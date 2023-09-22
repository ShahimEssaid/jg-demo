#!/usr/bin/env bash
#set -x
set -e
#set -u
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

if [[ ! -d .venv ]]; then
  python3 -m venv .venv
  . .venv/bin/activate
  pip install -U pip
fi

#. .venv/bin/activate
#(pip list | grep -F 'grpcio ') > /dev/null ||  { echo Running pip install grpcio; pip install grpcio; }
#(pip list | grep -F 'grpcio-tools ') > /dev/null || { echo Running pip install grpcio-tools;  pip install grpcio-tools; }
