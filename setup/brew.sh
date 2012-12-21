#!/usr/bin/env bash
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
brew tap homebrew/dupes

brew install git qt ack git-flow macvim readline apple-gcc42 graphviz memcached reattach-to-user-namespace autoconf hub mongodb ssh-copy-id autojump imagemagick mysql the_silver_searcher automake tig bash-completion tmux jpeg pcre wemux ctags libevent phantomjs wget libtiff zsh postgresql
