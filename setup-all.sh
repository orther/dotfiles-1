#!/usr/bin/env bash
cd "$(dirname "$0")"

./setup.sh

# Install my vim files
[[ -d ~/.vim ]] || ( ( \
  git clone git@github.com:aaronjensen/vimfiles.git ~/.vim || \
  git clone git://github.com/aaronjensen/vimfiles.git ~/.vim \
) && ~/.vim/setup.sh )

[[ -d ~/.emacs.d ]] || ( \
  echo Installing spacemacs && \
  git clone --recursive https://github.com/syl20bnr/spacemacs ~/.emacs.d && \
  cd ~/.emacs.d && \
  git checkout --track -B develop origin/develop)

# Install Homebrew
command -v brew > /dev/null || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

./setup/brew.sh
./setup/mac-defaults.sh
./setup/import-defaults.sh
./setup/upgrade-bash.sh

# Install RVM
command -v rvm > /dev/null || \curl -sSL https://get.rvm.io | bash

# Start mysql at boot
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

# Start postgresql at boot
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# Install pow
curl get.pow.cx | sh

# Install hcl for harvest
echo Installing hcl for harvest, will need sudo...
rvmsudo rvm system do gem install hcl
