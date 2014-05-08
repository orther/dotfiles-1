#!/usr/bin/env bash
cd "$(dirname "$0")"

./setup.sh

# Install my vim files
[[ -d ~/.vim ]] || ( ( \
  git clone git@github.com:aaronjensen/vimfiles.git ~/.vim || \
  git clone git://github.com/aaronjensen/vimfiles.git ~/.vim \
) && ~/.vim/setup.sh )

# Install Homebrew
command -v brew > /dev/null || ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

./setup/brew.sh
./setup/mac-defaults.sh
./setup/divvy-defaults.sh
./setup/import-defaults.sh

# Install RVM
command -v rvm > /dev/null || \curl -sSL https://get.rvm.io | bash

# Start mysql at boot
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

# Setup bash 4
if [[ ! $BASH_VERSION == 4* ]]; then
  echo Need Sudo to install bash 4
  sudo bash -c "echo /usr/local/bin/bash >> /private/etc/shells"
  chsh -s /usr/local/bin/bash
fi

# Compile quick switching applescripts
osacompile -o bin/chrome.app bin/chrome.scpt
osacompile -o bin/gmail-personal.app bin/gmail-personal.scpt
osacompile -o bin/gmail-substantial.app bin/gmail-substantial.scpt
