source ~/.profile
source ~/env/go/bash
source ~/env/scripts/z/z.sh
#if not running interactively, don't do anything
[[ $- != *i* ]] && return

export CLICOLOR=1

#add colors to commands
alias grep='grep --color'
alias tree='tree -C'

alias cp='cp -i'
alias l='ls -lGF'
alias c='clear'
alias cl='clear;l'

alias mouse='xset m 0/0 1'
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias tmuxtabs='tmux -CC attach'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function

#PS1='\w\$ '
PS1='\[\e[0;36m\]┌─\[\e[1;37m\][\u@\h]\[\e[0m\]\[\e[0;36m\]─\[\e[0;93m\](\w)\n\[\e[0;36m\]└─\[\e[1;32m\][\A]\[\e[0m\]\$ '

alias pcf19='cf login -a api.system.pcf19.starkandwayne.com --skip-ssl-validation -u admin -p iaMNH7WfeWpVuAvPobh-a_tD3jzJxGeQ'

#searches the current directory recursively for the string passed in as an arg
searchFor() { grep -R $1 .; }

#packages, makes and deploys a bosh dev release
alias boshdev='bosh create release --force && bosh upload release && templates/make_manifest warden && bosh -n deploy'
alias boshliteup='cd ~/workspace/bosh-lite/ && vagrant up && cd ~/workspace/'
alias openstack1ssh='ssh root@10.200.128.21'


export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/env/scripts/
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home/'

export GITHUB_KEY="7760ef75ba49c9699114"
export GITHUB_SECRET="272bf643a813760f1f0a79b9153fcef4ca629837"
export SESSION_SECRET="sekret"


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
