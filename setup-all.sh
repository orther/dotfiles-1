#!/usr/bin/env bash
cd "$(dirname "$0")"
F=`pwd |sed -e "s#$HOME/\?##"`

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

# Install my spacemacs files
[[ -d ~/.spacemacs.d ]] || ( \
  git clone git@github.com:aaronjensen/spacemacs.d.git ~/.spacemacs.d \
      && ~/.spacemacs.d/setup.sh \
)

[[ -d ~/.asdf ]] || ( \
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf \
)

[[ -d ~/.asdf/plugins/elixir ]] || ( \
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git \
)

[[ -d ~/.asdf/plugins/erlang ]] || ( \
  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git \
)

# Install Homebrew
command -v brew > /dev/null || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

./setup/brew.sh
./setup/mac-defaults.sh
./setup/import-defaults.sh
./setup/upgrade-bash.sh

# Start mysql at boot
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

# Start postgresql at boot
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# Add DefaultKeyBindings
ln -sfv $F/extra/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict

# Install pow
curl get.pow.cx | sh

# Install hcl for harvest
# echo Installing hcl for harvest, will need sudo...
# rvmsudo rvm system do gem install hcl
