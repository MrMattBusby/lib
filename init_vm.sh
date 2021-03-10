#!/bin/bash

pushd ~

git clone https://github.com/MrMattBusby/bin-tools.git

git clone https://github.com/MrMattBusby/runcoms.git
ln -s runcoms/.bash_aliases
ln -s runcoms/.bash_custom
ln -s runcoms/.gitconfig
ln -s runcoms/.vimrm
ln -s runcoms/.pythonrc.py

git clone https://github.com/MrMattBusby/vim-config.git
ln -s vim-config .vim

git clone https://github.com/MrMattBusby/lib.git
ln -s lib/git.sh

git clone https://github.com/MrMattBusby/helpfiles.git

popd
