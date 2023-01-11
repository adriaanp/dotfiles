
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"

# PowerLevel9k
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator history time)

COMPLETION_WAITING_DOTS="true"

plugins=(
    git
    colored-man-pages
    colorize
    autojump
)

source $ZSH/oh-my-zsh.sh
[ -f /usr/local/opt/nvm/nvm.sh ] && source /usr/local/opt/nvm/nvm.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# somewhere this gets overwritten by oh-my-sh, so repeat it here
alias ls='command ls --color=auto'

