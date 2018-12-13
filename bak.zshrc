ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="spaceship"

#echo $ZSH_CUSTOM
#source "~/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

# Source private aliases, etc that don't get checked in
source ~/.zshrc-priv

# Vars
export ALTERNATE_EDITOR=""
export EDITOR=emacsclient
export PUBLISH=$DROPBOX/publishing
export ORG=$DROPBOX/__notes/_org
export GITHUB=$HOME/github

DOTFILES=$GITHUB/christopherbiscardi/dotfiles

plugins=(git docker z fzf-z encode64 npm osx alias-tips zsh-kubernetes yarn-autocompletions)
source $ZSH/oh-my-zsh.sh

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Aliases
alias weechat="/usr/local/Cellar/weechat/*/bin/weechat-curses"
#alias curl="/usr/local/Cellar/curl/*/bin/curl"
alias emacsdaemon="Emacs --daemon"
e() {
    # spawn emacs in the background and disown the process
    # useful for launching GUI emacs and not having it crash
    # after closing an iTerm2 window
    emacsclient -c $@ &
    # disown will reference the last PID by default
    disown
}

# Docker
alias d="docker"
alias dm="docker-machine"
alias dc="docker-compose"
alias dps='docker ps --format "table {{.Command}}\\t{{.Names}}\\t{{.Image}}\\t{{.Status}}"'
alias dk="docker ps | fzf | xargs docker kill"
## "ssh" into docker4mac
alias d4m="docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh"
di() {
    docker images | fzf | awk '{print $3}'
}
## mount a d4m host fs file to an arbitrary container
alias d4merrlog="docker run -ti --mount type=bind,source=/var/log/docker-ce.err.log,target=/log,readonly alpine tail /log"
## Git
alias git="hub"
alias s="git status -sb"

alias cat="bat"


# random fns
create-presentation() {
    echo $1
#    create-react-app "$1" --scripts-version spectacle-scripts
    git clone git@github.com:FormidableLabs/spectacle-boilerplate-mdx.git "$1"
}
# get latest version number of package
yarn-latest() {
    yarn info $1 --json | jq --compact-output '.data."dist-tags" | to_entries [] | {(.key): .value}' | fzf | jq -r 'to_entries [] | .value'
}
yarn-jiq() {
    yarn info $1 --json | jiq -r
}
# Get dependecies from package.json on a single line
yarn-get-deps() {
    if [[ -a $1 ]];
    then
        jq --raw-output '.dependencies | keys  | reduce .[] as $item (""; . + " " + $item)' $1
    else
        echo "file $0 doesn't exist" 1&2
    fi
}

# PATH adjustments
export PATH="$PATH:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:$HOME/.local/bin"
# manual bin
export PATH="$HOME/bin:$PATH"
## homebrew
export PATH="/usr/local/sbin:$PATH"
## Arcanist
export PATH="$HOME/github/phacility/arcanist/bin:$PATH"
## Rust
export PATH="$HOME/.cargo/bin:$PATH"
## Android Studio's android sdk
export PATH="$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools:$PATH"
export PATH="$HOME/google-cloud-sdk/bin:$PATH"

export ANDROID_HOME=/Users/chris/Library/Android/sdk/

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### GO
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"
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

# docker for mac
unset DOCKER_TLS_VERIFY
unset DOCKER_HOST
unset DOCKER_CERT_PATH
unset DOCKER_MACHINE_NAME

ulimit -n 4096
#source ~/.bin/tmuxinator.zsh

# OPAM configuration
. /Users/chris/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

## GPG Agent
if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon ~/.gnupg/.gpg-agent-info)
fi

## pyenv `brew install pyenv`
#eval "$(pyenv init -)"

# fzf completions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# direnv
eval "$(direnv hook zsh)"

# randomize colors of iterm titlebars
RAND1=$[${RANDOM}%256]
RAND2=$[${RANDOM}%256]
RAND3=$[${RANDOM}%256]
printf -- $"\033]6;1;bg;red;brightness;$RAND1\a\033]6;1;bg;green;brightness;$RAND2\a\033]6;1;bg;blue;brightness;$RAND3\a"

# fzf-z
export FZFZ_EXTRA_DIRS="~/github/"
export FZFZ_EXCLUDE_PATTERN="node_modules"
