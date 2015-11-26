#!/bin/bash
#UNTESTED!
#More a list of instructions than a shell script really.

#Manual Install of Solarized for vim (as described in Readme: https://github.com/altercation/vim-colors-solarized)
mkdir ~/.vim/colors
cd ~/.vim/colors
git clone https://github.com/altercation/vim-colors-solarized
mv vim-colors-solarized/colors/solarized.vim .
rm -rf vim-colors-solarized

#Install Vundle plugins
vim +PluginInstall +qall

echo 'Now your terminal to use solarized colours.
For Mac Terminal, open a terminal, choose "Preferences", and import the profile from here: https://github.com/altercation/solarized/blob/master/osx-terminal.app-colors-solarized/Solarized%20Dark%20ansi.terminal'

