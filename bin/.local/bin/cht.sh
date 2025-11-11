#!/usr/bin/env bash

#https://github.com/GeekMasher/.dotfiles/blob/main/bin/.local/cheat 

selected=`cat ~/.cht-languages ~/.cht-commands | fzf`

if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter query: " query

if grep -qs "$selected" ~/.cht-languages; then
    query=`echo $query | tr ' ' '+'`
    tmux split-window -h -p 40 \
        "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    curl -s cht.sh/$selected~$query | less
fi
