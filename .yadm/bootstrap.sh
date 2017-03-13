#!/bin/bash

# initialize submodules
cd $HOME

echo init submodules
yadm submodule update --recursive --init

echo Update the yadm repo origin URL
yadm remote set-url origin "git@github.com:MyUser/dotfiles.git"

if command -v nvim >/dev/null 2>&1; then
  echo bootstrap neovim
  nvim '+PlugUpdate' '+PlugClean!' '+PlugUpdate' '+qall'
fi

echo initialize fisherman
fish -c fisher
