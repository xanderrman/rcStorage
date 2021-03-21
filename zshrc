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

alias loadtimezsh='/usr/bin/time zsh -i -c exit'

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

##### dynamic iterm profiles based on kubeconfig context #####
# use by referencing $(parse_kube_context) in prompt
# function to echo the escape code that sets the profile in iTerm2
iterm2_profile() { echo -ne "\033]50;SetProfile=$1\a" }
# key-value array of clusters and profile assignments
declare -A cluster_profiles
cluster_profiles=(
    [none]='Molokai'
    [production]='Red Alert'
)
# actual meat and potatoes of the operation
parse_kube_context() {
    # pull context from kube config
    CONTEXT=$(cat ~/.kube/config | grep "current-context:" | sed "s/current-context: //")
    if [ -n "$CONTEXT" ]; then
        # pull namespace from config
        NAMESPACE="$(kubectl config view -o "jsonpath={.contexts[?(@.name==\"$CONTEXT\")].context.namespace}")"
        # remove the arn (everything before `/`)
        BASED="$(basename $CONTEXT)"
        # if the based context is not assigned a profile (ie a new a cluster), use extra obnoxious profile and tag an warning to
        if [[ -z $cluster_profiles[$BASED] ]]; then
            echo "$fg_bold[blue]%}☸%  $BASED$reset_color%}:$fg[blue]%}$NAMESPACE$reset_color%} $fg_bold[red]%}NEW CLUSTER PLEASE ASSIGN PROFILE$reset_color%}"
        else
            # else switch on the based context
            case "$BASED" in
                none)
                    iterm2_profile 'Molokai'
                    echo ""
                    ;;
                *)
                    iterm2_profile "$cluster_profiles[$BASED]"
                    echo "$fg_bold[blue]%}☸%  $BASED$reset_color%}:$fg[blue]%}$NAMESPACE$reset_color%}"
                    ;;
            esac
        fi
    fi
}
##### End dynamic iterm profiles #####

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


#####     FUNCTIONS     #####
encrypt() {
  # Usage: $ encrypt <filename>
  docker run -e SECRET="$(cat $1)" -it elis/alpine-openssl:3.4 /bin/sh -c "echo \$SECRET | openssl enc -e -aes-256-cbc -a -salt && echo"
}

decrypt() {
  # Usage: $ decrypt '<encrpyted hash>'
  docker run -it elis/alpine-openssl:3.4 /bin/sh -c "echo '$1' | openssl enc -d -aes-256-cbc -a -salt && echo"
}

roll_pods() {
  # Usage: $ roll_pods <context> <namespace> <pod>
  kubectl --context $1 -n $2 get pods | awk '{print $1}' | grep ^$3 | xargs -P6 -n1 kubectl --context $1 -n $2 delete pod
}
get_pods() {
  # Usage: $ get_pods <context> <namespace> <pod>
  kubectl --context $1 -n $2 get pods | grep ^$3
}
pod_logs() {
  # Usage: $ get_pods <context> <namespace> <pod>
  kubectl --context $1 -n $2 get pods | awk '{print $1}' |  grep ^$3 | head -n 1 | xargs -n 1 -I {} kubectl --context $1 -n $2 logs -f {}
}

clustoscaler_logs () {
        kubectl get pods -n kube-system | grep cluster-autoscaler | awk '{print $1}' | xargs kubectl logs -n kube-system -f
}
suspend_cron() {
  # Usage: suspend_cron <cronjob name> <namespace>
  kubectl patch -n $2 cronjob/$1 -p '{"spec": {"suspend": true}}'
}
enable_cron() {
  # Usage: enable_cron <cronjob name> <namespace>
  kubectl patch -n $2 cronjob/$1 -p '{"spec": {"suspend": false}}'
}
trigger_cron() {
  # Usage: trigger_cron <cronjob name> <namespace>
  kubectl create job --from=cronjob/$1 -n $2 $1-manual-$(date +"%s")
}

#####     ENV LOADING TIMER     #####
# usage:
#     timedebug $LINENO
#     sleep 1
#     timedebug $LINENO "sleeping zzz"
# ... random env stuff whatever ...
#     command that takes a while
#     timedebug $LINENO "long env thing"
# ... etc

TIMEBUG=true # false to turn off
TIMEBUGMS=50 # milliseconds before considered slow, anything less won't be reported
L=$(gdate +%s%N)
timedebug() {
  if [ "$TIMEBUG" = true ]; then
    DIFF=$(expr $(gdate +%s%N) - $L)
    ((DIFFCHECK = $TIMEBUGMS * 1000000 ))
    if [ "$DIFF" -gt  "$DIFFCHECK" ]; then
      echo -n $(expr $DIFF / 1000000)
      echo "ms | slowload on line:$@"
    fi
    # update the timer
    L=$(gdate +%s%N)
  fi
}

