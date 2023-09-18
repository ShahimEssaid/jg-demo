#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
set -o noclobber

# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s nullglob

[[ -n "${DEBUG-}" ]] && set -x

# stack overflow #59895
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
    DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"

cd "$DIR"/..

if [[  ! -d .venv ]]; then
  python3 -m venv .venv
  . .venv/bin/activate
  pip install -U pip
fi

. .venv/bin/activate

(pip list | grep -F 'jupyterlab ') > /dev/null ||  { echo Running pip install jupyterlab; pip install "jupyterlab>=3,<4"; }
(pip list | grep -F 'graph-notebook ') > /dev/null ||  { echo Running pip install "graph-notebook"; pip install "graph-notebook"; }

