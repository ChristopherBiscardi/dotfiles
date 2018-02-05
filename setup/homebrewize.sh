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
         ack \
         cloc \
         curl \
         dep \
         direnv \
         exercism \
         ffmpeg \
         fontconfig \
         fzf \
         ghi \
         git \
         gnupg \
         go \
         gpg-agent \
         graphviz \
         hub \
         hugo \
         ispell \
         jq \
         kubernetes-cli \
         leiningen \
         mtr \
         ngrok \
         pandoc \
         redis \
         sbcl \
         sqitch \
         sqitch_pg \
         tree \
         tsung \
         watchman \
         weechat \
         wget \
         yarn
    
    # fzf completino
    $(brew --prefix)/opt/fzf/install
}
