source ~/.profile
#if not running interactively, don't do anything
[[ $- != *i* ]] && return

# mac os
export CLICOLOR=1

alias grep='grep --color'

alias l='ls -lGF'
alias c='clear'
alias cl='clear;l'

#disable mouse acceleration on arch linux
alias mouse='xset m 0/0 1'

#show and hide hidden files in finder on mac os
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function

#PS1='\w\$ '
PS1='\[\e[0;36m\]┌─\[\e[1;37m\][\u@\h]\[\e[0m\]\[\e[0;36m\]─\[\e[0;93m\](\w)\n\[\e[0;36m\]└─\[\e[1;32m\][\A]\[\e[0m\]\$ '

#searches the current directory recursively for the string passed in as an arg
searchFor() { grep -R $1 .; }
