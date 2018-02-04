#!/usr/bin/env zsh

setup_git_cfg()
{
    git config --global core.excludesfile ~/$DOTFILES/global_gitignore
    # git lg
    git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
    # git ll
    git config --global alias.ll "log --pretty=format:'%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate --numstat"

    # use diff-so-fancy for git diffs
    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
    
    # diff-so-fancy suggested colors
    # https://github.com/so-fancy/diff-so-fancy/tree/ed8cf1763d38bdd79ceb55a73b9ce7e30f1e184d#improved-colors-for-the-highlighted-bits
    git config --global color.ui true
    
    git config --global color.diff-highlight.oldNormal "red bold"
    git config --global color.diff-highlight.oldHighlight "red bold 52"
    git config --global color.diff-highlight.newNormal "green bold"
    git config --global color.diff-highlight.newHighlight "green bold 22"
    
    git config --global color.diff.meta "227"
    git config --global color.diff.frag "magenta bold"
    git config --global color.diff.commit "227 bold"
    git config --global color.diff.old "red bold"
    git config --global color.diff.new "green bold"
    git config --global color.diff.whitespace "red reverse"
}
