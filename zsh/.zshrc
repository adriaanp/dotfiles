# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/.local/scripts:$PATH
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim

ZSH_THEME="powerlevel10k/powerlevel10k"

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator history time)

COMPLETION_WAITING_DOTS="true"

plugins=(
    git
    colored-man-pages
    colorize
    autojump
    zsh-syntax-highlighting
    vi-mode
)

source $ZSH/oh-my-zsh.sh

# Load any environment vars for this particular machine
if [ -f ~/.env ]; then
    # export the .env file
    # https://gist.github.com/mihow/9c7f559807069a03e302605691f85572#gistcomment-2706921
    export $(cat ~/.env | sed 's/#.*//g' | xargs)
fi

if [ -d ~/.config/personal ]; then
    for filename in ~/.config/personal/*; do
        source $filename
    done
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
