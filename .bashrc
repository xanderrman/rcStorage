. $HOME/.env/z.sh
. $HOME/.env/git-config


### COLORS ###
export CLICOLOR=1 # Mac OSX
alias ls='ls --color=auto'


export VISUAL=vim
export EDITOR="$VISUAL"

PS1='\[\e[0;36m\]┌─\[\e[1;34m\][\u@\h]\[\e[0m\]\[\e[0;36m\]─\[\e[0;93m\](\w)\n\[\e[0;36m\]└─\[\e[1;32m\][\A]\[\e[0m\]\$ '
alias ll='ls -alF'
alias la='ls -A'

alias dockrun='docker run -it --rm'
