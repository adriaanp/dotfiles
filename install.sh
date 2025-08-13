#!/usr/bin/env zsh

set -e

STOW_FOLDERS="bin,git,nvim,skhd,tmux,yabai,sketchybar,zsh"

DOT_FILES=$HOME/dotfiles

pushd $DOT_FILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
  echo "[+] Folder :: $folder"

  stow -D -v $folder
  stow $folder
done
popd

echo "[+] Reloading shell..."
exec $SHELL -l
