#
# ~/.bashrc
#
source ~/.profile

export CLICOLOR=1

alias l='ls -lGF'
alias c='clear'
alias cl='clear;l'
alias ll='ls -l'
alias mouse='xset m 0/0 1'
PS1='\[\e[0;36m\]┌─\[\e[1;37m\][\u@\h]\[\e[0m\]\[\e[0;36m\]─\[\e[0;93m\](\w)\n\[\e[0;36m\]└─\[\e[1;32m\][\A]\[\e[0m\]\$ '
