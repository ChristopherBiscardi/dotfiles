#!/usr/bin/env zsh

# requires git and to be running in zsh
setup_zsh_cfg()
{
    ln -sf $DOTFILES/bak.zshrc ~/.zshrc
    touch ~/.zshrc-priv
    source ~/.zshrc
    # zsh plugins
    git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
    git clone https://github.com/djui/alias-tips.git $ZSH_CUSTOM/plugins/alias-tips
    git clone git@github.com:Dbz/zsh-kubernetes.git $ZSH_CUSTOM/plugins/zsh-kubernetes
    git clone https://github.com/jimeh/zsh-peco-history.git $ZSH_CUSTOM/plugins/zsh-peco-history
}
