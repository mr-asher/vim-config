#!/bin/bash

# Symlink the nvim and coc directory to this repo
ln -s `pwd`/nvim/ ~/.config/nvim
ln -s `pwd`/coc/ ~/.config/coc

# Install all plugins so we can use coc.nvim in the next step
echo "Installing initial plugins, this may report errors, it is safe to ignore them"
nvim --headless +PlugInstall +qa

# Change to the coc extensions directory and install the coc extensions
cd ~/.config/coc/extensions
npm install
