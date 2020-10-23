export PATH=$PATH:/usr/local/go/bin

. $HOME/.env/z.sh
. $HOME/.env/git-config.sh


### COLORS ###
export CLICOLOR=1 # Mac OSX
alias ls='ls --color=auto'


export VISUAL=vim
export EDITOR="$VISUAL"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

export PS1="\[\e[0;36m\]┌─\[\e[1;34m\][\u@\h]\[\e[0m\]\[\e[0;36m\]─\[\e[0;93m\](\w)\[\e[0;36m\]─\[\e[35m\]\$(parse_git_branch)\n\[\e[0;36m\]└─\[\e[1;32m\][\A]\[\e[0m\]\$ "
PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
alias ll='ls -alF'
alias la='ls -A'
alias bat='batcat'

alias rundocker='docker run -it --rm'
alias pgdocker='docker exec -it database psql -h 127.0.0.1 -p 5432 -U admin -d Postgres'
alias newcompose='docker container kill $(docker container ls -q); docker container prune -f; docker volume rm $(docker volume ls -q); docker-compose up --detach; docker-compose logs -f'

# x server to windows
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
export LIBGL_ALWAYS_INDIRECT=1
# setxkbmap -layout us
alias guimacs='
setsid emacs
exit
'

alias firefox='
setsid firefox
exit
'

