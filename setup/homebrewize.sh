#!/usr/bin/env zsh

homebrewize()
{
    # Homebrew packages
    brew tap theory/sqitch
    brew cask install \
         1password 1password-cli \
         ableton-live \
         aerial \
         alfred \
         discord \
         docker \
         dropbox \
         emacs \
         grammarly \
         graphiql \
         hex-fiend \
         iterm2 \
         kap \
         karabiner karabiner-elements \
         keybase \
         ngrok \
         obs \
         quip \
         signal \
         sketch \
         slack \
         splice \
         spotify \
         sublime-text \
         tweeten \
         twitch \
         vlc
    brew install \
         ack \ # file searching
         bat \ # cat replacement
         cloc \ # count lines of code in files
         curl \
         dep \
         direnv \
         exercism \
         ffmpeg \
         fontconfig \
         fzf \ # fuzzy search and matching for anything
         ghi \ # github issues
         git \
         gnupg \
         go \
         gpg-agent \
         graphviz \
         hub \ # git for github (adds commands to git)
         hugo \
         ispell \ # spellcheck (for emacs mostly)
         jq \ # CLI JSON manipulator
         kubernetes-cli \
         leiningen \
         mtr \
         pandoc \
         redis \
         sbcl \ # Steel Bank Common Lisp
         sqitch \ # SQL migration tool
         sqitch_pg \
         tree \
         tsung \
         watchman \
         weechat \ # irc client
         wget \
         yarn # nodejs package manager
    
    # fzf completino
    $(brew --prefix)/opt/fzf/install
}
