#!/bin/bash
WORKDIR=$HOME/src
ENVDIR=".venv"

cd $WORKDIR

if [ -d "$ENVDIR" ]; then rm -rf $ENVDIR; fi
python -m venv ./.venv
. .venv/bin/activate

pip install -r requirements.txt


jupyter lab --ip=0.0.0.0