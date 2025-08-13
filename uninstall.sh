#!/usr/bin/env zsh

STOW_FOLDERS="bin,git,nvim,skhd,tmux,vscode,yabai,sketchybar,zsh"

DOT_FILES=$HOME/dotfiles

pushd $DOT_FILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
  echo "Removing $folder"
  stow -D $folder
done
popd
