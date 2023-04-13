#!/bin/bash

# copy the module file to user's $HOME/.lmod.d/
cp ./assets/metsim-mods $HOME/.lmod.d/

# restore modules
module restore metsim-mods

# create a Python environment
## some variables
virtualenvDir="$HOME/virtual-envs/"
metsimvenv="metsim-env"
## making a directory to install virtualenvs
mkdir -p "$virtualenvDir"
## creating a virtualenv for metsim
virtualenv --download "$virtualenvDir/$metsimvenv"

# build virtualenv
source "$virtualenvDir/$metsimvenv/bin/activate"
echo "$(basename $0): $(which pip)"
pip install --upgrade pip
pip install metsim

# add metsim virtualenv to Jupyter's
ipython kernel install --name "metsim-env" --user

# finish script
echo "$(basename $0): Done!"
