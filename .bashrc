source ~/.profile
source ~/env/go/bash
source ~/env/scripts/z/z.sh
source ~/libraries/safe_complete/safe_completion.bash

#add colors to commands
alias grep='grep --color'
alias emacs="/usr/local/Cellar/emacs/*/Emacs.app/Contents/MacOS/Emacs -n"

alias cp='cp -i'
alias ls='ls -F --color=auto'
alias c='clear'
alias cl='clear;ls'
alias untar='tar -zxvf'

alias mouse='xset m 0/0 1' 
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias tmuxtabs='tmux -CC attach'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function

#PS1='\w\$ '
PS1='\[\e[0;36m\]┌─\[\e[1;37m\][\u@\h]\[\e[0m\]\[\e[0;36m\]─\[\e[0;93m\](\w)\n\[\e[0;36m\]└─>\[\e[0m\] '

alias boshcnu='bosh create-release --timestamp-version --force && bosh upload-release'
alias spin-vault='vault server -config=/Users/Alex/.store-vault/config.hcl > /dev/null 2>&1 &'
alias unseal-vault='vault unseal -address=http://127.0.0.1:8201 KiRNtbhi1YCOEfBg6IzeZMvTj5iO2R37KIDj7w18zpY='

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/Library/Python/3.6/bin
export PATH=$PATH:$HOME/workspace/scripts
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home/'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Alex/workspace/genesis/buffalo-lab1/cf/workspace/tools/google-cloud-sdk/path.bash.inc' ]; then source '/Users/Alex/workspace/genesis/buffalo-lab1/cf/workspace/tools/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/Alex/workspace/genesis/buffalo-lab1/cf/workspace/tools/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/Alex/workspace/genesis/buffalo-lab1/cf/workspace/tools/google-cloud-sdk/completion.bash.inc'; fi
