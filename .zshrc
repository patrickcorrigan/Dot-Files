# Lines configured by zsh-newuser-install
source .antigen/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/patrick/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
. /usr/share/autojump/autojump.sh
autoload -U promptinit && promptinit
prompt adam2 grey grey grey grey
alias MT=/home/patrick/Documents/Programming/Oracle/Repositories/MT 
alias MT=/home/patrick/Documents/Programming 
alias ssh='TERM=xterm ssh'
export EDITOR="vim"
./.remapcaps.sh
setxkbmap gb
eval "$(fasd --init auto)"
fortune
export TERM=xterm-256color
bindkey '^R' history-incremental-pattern-search-backward
