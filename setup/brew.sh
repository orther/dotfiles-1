#!/usr/bin/env bash
brew tap homebrew/dupes
brew install caskroom/cask/brew-cask
brew tap thoughtbot/formulae
brew update

brew install ack
brew install autoconf
brew install autojump
brew install automake
brew install bash
brew install bash-completion
brew install brew-cask
brew install ctags
brew install direnv
brew install gist
brew install git
brew install git-flow
brew install gnu-sed
brew install graphviz
brew install htop
brew install hub
brew install imagemagick
brew install jpeg
brew install libdvdcss
brew install libevent
brew install libtiff
brew install memcached
brew install most
brew install moreutils
brew install mysql
brew install pcre
brew install phantomjs
brew install pick
brew install postgresql
brew install readline
brew install reattach-to-user-namespace
brew install ssh-copy-id
brew install terminal-notifier
brew install the_silver_searcher
brew install tig
brew install tmux
brew install trash
brew install tree
brew install urlview
brew install wemux
brew install wget
brew install zsh

# brew tap railwaycat/emacsmacport
brew install emacs --with-cocoa --with-librsvg --with-gnutls --with-imagemagick@6 --with-modules
tic -o ~/.terminfo /usr/local/Cellar/emacs/25.1/share/emacs/25.1/etc/e/eterm-color.ti

# brew install emacs-mac --with-spacemacs-icon
brew install macvim --with-cscope --with-luajit
brew install michaeldfallen/formula/git-radar

brew linkapps

export HOMEBREW_CASK_OPTS='--appdir=/Applications'
brew cask install alfred
brew cask install android-file-transfer
brew cask install caffeine
brew cask install dropbox
brew cask install firefox
brew cask install flux
brew cask install gitx-rowanj
brew cask install google-chrome
brew cask install google-drive
brew cask install harvest
brew cask install iterm2
brew cask install karabiner
brew cask install lastpass-universal
brew cask install hammerspoon
brew cask install p4merge
brew cask install screenhero
brew cask install silverlight
brew cask install skype
brew cask install vlc

brew cask alfred link
