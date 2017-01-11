autoload -U compinit promptinit zsh-mime-setup zcalc
compinit
zsh-mime-setup

promptinit
# prompt adam1

source /etc/profile.d/autojump.zsh


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

alias automocha="supervisor -q -n exit -x mocha -- -b"
alias ls='ls --color=auto'
alias ll='ls -lh'
alias grep='grep --color=auto'
alias m='gvim_open.sh'
alias cl='clear'
alias torrents='/mnt/data/torrents'
alias deploy='git push heroku master'
alias code='/home/patrick/code'
alias mm='/home/patrick/code/musica'
alias mw='/home/patrick/code/musica/phonegap/www'
alias ms='/home/patrick/code/musica/phonegap/platforms/browser/www/'
alias ma='/home/patrick/code/musica/phonegap/platforms/android/build/outputs/apk/'
alias pems='/home/patrick/code/pems'


alias vless='/usr/share/vim/vim74/macros/less.sh'
alias sz='source ~/.zshrc'
alias p='popd'
alias open='xdg-open'
alias update='sudo pacman -Syu'
alias wr='wifi-restart.sh'
alias hs='sudo netctl-auto switch-to wlp3s0-AndroidAP'
alias se='python -m http.server'
alias bb='cd .. && phonegap build browser && cd www && python -m http.server'
alias ba='phonegap build android'

bindkey -M viins 'jk' vi-cmd-mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
bindkey -M vicmd v edit-command-line

export CLUSTER_NAME="cluster-1"
export ZONE="europe-west1-c"

export EDITOR="$(which vim)"

export PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
export PATH="/home/patrick/code/scripts:$PATH"
export PATH="/home/patrick/code/bin:$PATH"
export PATH="/home/patrick/.cabal/bin:$PATH"

function cs () {
    cd "$@" && ls
    }
PROMPT="%K{yellow}%n@%m-%*%k %B%F{cyan}%(4~|...|)%3~%F{white} %# %b%f%k"
#
# PROMPT="%K{yellow}%n@%m%k %B%F{cyan}%(4~|...|)%3~%F{white} %# %b%f%k"
# PROMPT="%K{yellow}%n%k %B%F{cyan}%(4~|...|)%3~%F{white} %# %b%f%k"



# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel, -Dswing.aatext=true'
# export _JAVA_AWT_WM_NONREPARENTING=1
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"
