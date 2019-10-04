export GOPATH=$HOME/go
. $HOME/.env/z.sh
. $HOME/.env/bosh.sh
PS1='\[\e[0;36m\]┌─\[\e[1;37m\][\u@\h]\[\e[0m\]\[\e[0;36m\]─\[\e[0;93m\](\w)\n\[\e[0;36m\]└─\[\e[1;32m\][\A]\[\e[0m\]\$ '
alias ls='ls -G'
alias ll='ls -l'
source <(kubectl completion bash)

alias boshcnu='bosh create-release --timestamp-version --force && bosh upload-release'
alias kubecontainers="kubectl get pods --all-namespaces -o=jsonpath='{range .items[*]}{\"\n\"}{.metadata.name}{\":\t\"}{range .spec.containers[*]}{.image}{\", \"}{end}{end}' | sort"
. $HOME/.env/git-config
complete -o default -F __start_kubectl kubectl


export KUBECONFIG=$HOME/workspace/kubernetes/kubes/boomi-lab.yml
export BASH_COMPLETION_COMPAT_DIR=/usr/local/etc/bash_completion.d
[[ -r /usr/local/etc/profile.d/bash_completion.sh ]] && . /usr/local/etc/profile.d/bash_completion.sh
source <(helm completion bash)
alias k='kubectl'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alex/google-cloud-sdk/path.bash.inc' ]; then . '/Users/alex/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alex/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/alex/google-cloud-sdk/completion.bash.inc'; fi
