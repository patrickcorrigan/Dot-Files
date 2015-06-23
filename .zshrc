autoload -U compinit promptinit zsh-mime-setup zcalc
compinit
zsh-mime-setup

promptinit
# prompt adam1


setopt RM_STAR_WAIT
# setopt correctall
setopt autocd
setopt extendedglob
setopt AUTO_PUSHD
setopt PUSHD_SILENT
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt NO_CLOBBER
SAVEHIST=1000
HISTSIZE=1000
HISTFILE=~/.history


alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias m='gvim_open.sh'
alias cl='clear'
alias torrents='/mnt/data/torrents'
alias fy='/home/patrick/code/final_year'
alias deploy='git push heroku master'
alias code='/home/patrick/code'
alias fm='/home/patrick/code/farmasala'


alias vless='/usr/share/vim/vim74/macros/less.sh'
alias sz='source ~/.zshrc'
alias p='popd'
alias open='xdg-open'
alias update='sudo pacman -Syu'

bindkey -M viins 'jk' vi-cmd-mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
bindkey -M vicmd v edit-command-line

export EDITOR="$(which vim)"

export PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
export PATH="/home/patrick/code/scripts:$PATH"
export PATH="/home/patrick/code/bin:$PATH"
export PATH="/home/patrick/.cabal/bin:$PATH"


zle-keymap-select () {
    if [ $TERM = "rxvt-unicode-256color" ]; then
        if [ $KEYMAP = vicmd ]; then
            echo -ne "\0033]12;Black\007"
        else
            echo -ne "\033]12;White\007"
        fi
    fi
}

    zle -N zle-keymap-select
    zle-line-init () {
        zle -K viins
        if [ $TERM = "rxvt-unicode-256color" ]; then
            echo -ne "\033]12;Red\007"
        fi
    }
    zle -N zle-line-init
    bindkey -v

function cs () {
    cd "$@" && ls
    }
PROMPT="%K{yellow}%n@%m%k %B%F{cyan}%(4~|...|)%3~%F{white} %# %b%f%k"
# PROMPT="%K{yellow}%n%k %B%F{cyan}%(4~|...|)%3~%F{white} %# %b%f%k"
