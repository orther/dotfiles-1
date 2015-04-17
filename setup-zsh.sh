#!/usr/bin/env zsh

./setup.sh
git submodule init
git submodule update

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

cd zprezto
git submodule init
git submodule update

echo Changing your shell to zsh...
chsh -s /usr/local/bin/zsh

echo Done! Logout and log back in for it to take full effect
