#
# ~/.bashrc
#
source ~/.profile

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

export CLICOLOR=1

alias l='ls -lGF'
alias c='clear'
alias cl='clear;l'

# Linux aliases
alias mouse='xset m 0/0 1' # turn off mouse acceleration

# Mac Aliases
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES' # show hidden files in finder
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO'  # hide hidden files in finder

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function

# shell prompt
PS1='\[\e[0;36m\]┌─\[\e[1;37m\][\u@\h]\[\e[0m\]\[\e[0;36m\]─\[\e[0;93m\](\w)\n\[\e[0;36m\]└─\[\e[1;32m\][\A]\[\e[0m\]\$ '

