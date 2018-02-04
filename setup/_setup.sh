#!/usr/bin/env zsh

DOTFILES=~/github/christopherbiscardi/dotfiles
mkdir ~/bin

source $DOTFILES/setup/homebrewize.sh
source $DOTFILES/setup/setup_git_cfg.sh
source $DOTFILES/setup/setup_zsh_cfg.sh
source $DOTFILES/setup/setup_emacs.sh

# "install all the things"
homebrewize
# js-yaml is for emacs
yarn global add spaceship-zsh-theme diff-so-fancy js-yaml

setup_git_cfg
setup_zsh_cfg
setup_emacs

