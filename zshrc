#Alex's zoomer shell config
#Alex's zoomer shell config
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/alexanelli/.oh-my-zsh"

ZSH_THEME="alex"

plugins=(
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'


# NORMAL BASH SHIT
# rupa z jump script not a zsh thing
source $HOME/.env/z.sh
source $HOME/.env/git-config.sh

export PATH=$HOME/.env/bin:$PATH

export VISUAL=vim
export EDITOR="$VISUAL"

export DOCKER_BUILDKIT=1

### COLORS ###
export CLICOLOR=1 # Mac OS
# linux alias ls='ls --color=auto'
# mac alias ls='ls -G'
alias ls='ls -G'

alias ll='ls -alF'
alias la='ls -A'

alias emacs='emacs -nw'
alias vi='vim'
alias vim='nvim'
alias untar='tar xf'
alias k='kubectl'
alias tf='terraform'

alias pgdocker='docker exec -it database psql -h 127.0.0.1 -p 5432 -U admin -d Database'
alias drun='docker run --interactive --tty --rm --entrypoint /bin/bash'
alias kubecontainers="kubectl get pods -o=jsonpath='{range .items[*]}{\"\n\"}{.metadata.name}{\":\t\"}{range .spec.containers[*]}{.image}{\", \"}{end}{end}' | sort"

alias modrc='vim ~/.zshrc && source ~/.zshrc'
alias modtheme='vim ~/.oh-my-zsh/themes/alex.zsh-theme && source ~/.zshrc'
alias modvim='vim ~/.SpaceVim.d/init.toml'

source <(kubectl completion zsh)
source <(helm completion zsh)

parse_kube_context() {
    CONTEXT=$(cat ~/.kube/config | grep "current-context:" | sed "s/current-context: //")

    if [ -n "$CONTEXT" ]; then
        echo "${CONTEXT}"
    fi
}

parse_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

source $HOME/.env/kube-ps1.sh
function get_cluster_short() {
  echo "$1" | cut -d / -f2
}
KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short
KUBE_PS1_CTX_COLOR='magenta'
PROMPT='┌─$(kube_ps1)'$PROMPT

alias kp-uat='kubectl config use-context arn:aws:eks:us-east-1:<account_num>:<cluster_name>; kubectl -n kube-system describe secrets dashboard-admin | grep token: | tr -s " " | cut -d " " -f2; kubectl -n kube-system describe secrets dashboard-admin | grep token: | tr -s " " | cut -d " " -f2 | pbcopy; open '\''http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:https/proxy/#!/login'\''; kubectl proxy'

alias kp-staging='kubectl --context staging -n kube-system describe secrets dashboard-admin | grep token: | tr -s " " | cut -d " " -f2; kubectl --context staging -n kube-system describe secrets dashboard-admin | grep token: | tr -s " " | cut -d " " -f2 | pbcopy; open '\''http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:https/proxy/#!/login'\''; kubectl --context staging proxy'

#this only works with awscli v1
alias ecr-login='aws ecr get-login --no-include-email --region us-east-1'

source "$HOME/.cargo/env"

export PATH="/usr/local/opt/awscli@1/bin:$PATH"

#stuff for spacevim
#For compilers to find luajit-openresty you may need to set:
export LDFLAGS="-L/usr/local/opt/luajit-openresty/lib"
export CPPFLAGS="-I/usr/local/opt/luajit-openresty/include"
#For pkg-config to find luajit-openresty you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/luajit-openresty/lib/pkgconfig"
export PATH="/usr/local/opt/luajit-openresty/bin:$PATH"

