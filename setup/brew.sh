#!/usr/bin/env bash
brew tap homebrew/dupes
brew tap caskroom/cask
brew update

brew install \
ack \
autoconf \
autojump \
automake \
bash \
bash-completion \
boot2docker \
brew-cask \
ctags \
direnv \
docker \
gist \
git \
git-flow \
graphviz \
hub \
imagemagick \
jpeg \
libevent \
libtiff \
macvim \
memcached \
mongodb \
mysql \
pcre \
phantomjs \
postgresql \
qt \
readline \
reattach-to-user-namespace \
ssh-copy-id \
the_silver_searcher \
tig \
tmux \
urlview \
wemux \
wget \
zsh

export HOMEBREW_CASK_OPTS='--appdir=/Applications'
brew cask install alfred
brew cask install android-file-transfer
brew cask install caffeine
brew cask install copy
# Use app store
# brew cask install divvy
brew cask install dropbox
brew cask install firefox
brew cask install flowdock
brew cask install flux
brew cask install gitx-rowanj
brew cask install google-chrome
brew cask install google-drive
brew cask install harvest
brew cask install iterm2
brew cask install karabiner
brew cask install lastpass-universal
brew cask install nvalt
brew cask install p4merge
brew cask install screenhero
brew cask install silverlight
brew cask install skype
brew cask install steermouse
brew cask install vlc

brew cask alfred link
