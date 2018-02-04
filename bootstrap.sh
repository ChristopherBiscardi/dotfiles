#!/usr/bin/env sh

# Run This Script First to set everything up

PROGNAME=$(basename $0)
CB_REPOS=~/github/christopherbiscardi

# If homebrew exists on the system, good, otherwise install it
if [ -z $(which brew) ];
then
    echo "Installing homebrew";
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

# If zsh exists on the system, good, otherwise install oh-my-zsh
if [ -z $(which zsh) ];
then
    echo "Installing oh-my-zsh";
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi;

# osx comes with git; use it to pull dotfiles down
if [ -n $(which git) ];
then
    mkdir -p $CB_REPOS
    # TODO: set up ssh with keybase so ssh clone works?
    # TODO: At least swap the https to ssh later
    git clone https://github.com/ChristopherBiscardi/dotfiles.git $CB_REPOS/dotfiles || error_exit "unable to clone"
else
    error_exit "something's wrong. osx comes with git but we can't find it"
    exit 1
fi;

$CB_REPOS/dotfiles/setup || error_exit "setup failed?"

# send strings to stderr
error_exit()
{
# copypasta -- http://linuxcommand.org/lc3_wss0140.php
#	----------------------------------------------------------------
#	Function for exit due to fatal program error
#		Accepts 1 argument:
#			string containing descriptive error message
#	----------------------------------------------------------------
	echo "${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
	exit 1
}
