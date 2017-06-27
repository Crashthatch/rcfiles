#!/bin/bash
#UNTESTED!
#More a list of instructions than a shell script really.

#Manual Install of Solarized for vim (as described in Readme: https://github.com/altercation/vim-colors-solarized)
mkdir ~/.vim/colors
cd ~/.vim/colors
git clone https://github.com/altercation/vim-colors-solarized
mv vim-colors-solarized/colors/solarized.vim .
rm -rf vim-colors-solarized

#Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Install Vundle plugins
vim +PluginInstall +qall

#YouCompleteMe requires special running of the install.py script. You can specify --tern-completer for JS support, --gocode-completer for Go support, etc. See https://github.com/Valloric/YouCompleteMe
~/.vim/bundle/YouCompleteMe/install.py

echo 'Now set your terminal to use solarized colours.
For Mac Terminal, open a terminal, choose "Preferences", and import the profile from here: https://github.com/altercation/solarized/blob/master/osx-terminal.app-colors-solarized/Solarized%20Dark%20ansi.terminal'

