ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"

# Source private aliases, etc
source ~/.zshrc-priv

# Vars
export ALTERNATE_EDITOR=""
export EDITOR=emacsclient
export PROJ="$DROPBOX/projects"
export PUBLISH=$DROPBOX/publishing
export ORG=$DROPBOX/__notes/_org

DOTFILES=$DROPBOX/dotfiles

plugins=(git brew cabal docker encode64 npm osx pod)
source $ZSH/oh-my-zsh.sh

# Aliases
alias v="/usr/local/Cellar/vim/*/bin/vim"
alias weechat="/usr/local/Cellar/weechat/*/bin/weechat-curses"
alias gups="git pull --rebase upstream master"
alias curl="/usr/local/Cellar/curl/*/bin/curl"
e() {
    # spawn emacs in the background and disown the process
    # useful for launching GUI emacs and not having it crash
    # after closing an iTerm2 window
    emacs $@ &
    # disown will reference the last PID by default
    disown
}

# Docker
alias d="docker"
alias dm="docker-machine"
alias dc="docker-compose"
alias dps='docker ps --format "table {{.Command}}\\t{{.Names}}\\t{{.Image}}\\t{{.Status}}"'
alias dk="docker kill"
## "ssh" into docker4mac
alias d4m="docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh"
di() {
    docker images | peco | awk '{print $3}'
}

## Git
alias git="hub"
alias s="git status -sb"

## Projects
alias proj="$PROJ"
alias haxl="$PROJ/snaplet-haxl"
alias oli="$PROJ/_oli"
alias sal="$PROJ/_superawesomelabs"
alias blog="$DROPBOX/blog/______leo-blog/"

## Publishing
alias publish="cd $PUBLISH"
alias snap-for-beginners="cd $PUBLISH/snap-for-beginners"

# PATH adjustments
export PATH="$PATH:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:$HOME/.local/bin"
# yarn (npm replacement)
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/bin:$PATH"
## homebrew
export PATH="/usr/local/sbin:$PATH"
## Rust
export PATH="$HOME/.cargo/bin:$PATH"
## Android Studio's android sdk
export PATH="$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools:$PATH"
export ANDROID_HOME=/Users/chris/Library/Android/sdk/

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

### GO
export GOPATH=$HOME/go

### Prompt:

prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$user@%m"
  else
    prompt_segment black default "λ"
  fi
}
prompt_dir() {
  if [[ "$user" != "$DEFAULT_USER" || -z "$SSH_CLIENT" ]]; then
    prompt_segment blue black '%c'
  else
    prompt_segment green black '%c'
  fi
}

### unmanaged executables:
export PATH="$HOME/Documents/bin:$PATH"

docker-clean(){
    # containers
    docker rm $(docker ps -a -q)
    # images
    docker rmi $(docker images -q --filter "dangling=true")
}

lastlogs(){
    docker logs -f $(docker ps | head -2 | tail -1 | awk '{print $1}')
}

lynx(){
    docker run -it --rm jess/lynx
}

# Optimzation of `eval $(dm env dev)`
# export DOCKER_TLS_VERIFY="1"
# export DOCKER_HOST="tcp://192.168.99.100:2376"
# export DOCKER_CERT_PATH="/Users/chris/.docker/machine/machines/dev"
# export DOCKER_MACHINE_NAME="dev"

# docker for mac
unset DOCKER_TLS_VERIFY
unset DOCKER_HOST
unset DOCKER_CERT_PATH
unset DOCKER_MACHINE_NAME

ulimit -n 4096
#source ~/.bin/tmuxinator.zsh

# OPAM configuration
. /Users/chris/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# DCOS
export DCOS_CONFIG_PATH=etc/config-1.6.yaml

## Chrome Killer (>17GB)
alias chrome-killer="vagrant up m1 m2 m3 a1 a2 a3 a4 a5 a6 p1 p2 p3 boot"

## GPG Agent
if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

## Graveyard

# m() {
#   VERSION=${1-latest}
#   docker run -it --rm \
#   -v `pwd`:/opt/code \
#   -e CABAL_SANDBOX_CONFIG=/opt/sandbox/docker-sandbox \
#   -v `pwd`/.musl-sandboxes/$VERSION/:/opt/sandbox/ \
#   --workdir /opt/code \
#   nilcons/ghc-musl:$VERSION bash
# }


export PATH="~/.yarn/bin:$PATH"
