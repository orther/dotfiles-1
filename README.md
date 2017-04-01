## Installation

### Basic Installation

```bash
$ git clone git://github.com/aaronjensen/dotfiles.git ~/.dotfiles && ~/.dotfiles/setup.sh
```

Or if you're me and/or you want all my default apps installed (see
`setup/brew.sh`):

### Git config

You can add your name/email to `~/.gitconfig_private`. Here's an example:

```
[user]
  name = Your name
  email = yourname@example.com
```

### Installation + all my homebrew apps

```bash
$ git clone git://github.com/aaronjensen/dotfiles.git ~/.dotfiles && ~/.dotfiles/setup-all.sh
```

### zsh instead of bash

```bash
$ ./setup-zsh.sh
```

### Other setup scripts

Look in the setup folder for other scripts to run to setup various things.

### iTerm setup

Point your preferences to ~/.dotfiles/iterm in iterm2

### [cVim](https://github.com/1995eaton/chromium-vim) setup

Update the `configpath` in `cvimrc` to your home dir.

In Chrome, do `:source /your/home/.cvimrc`. 

### Kinesis Keyboard stuff

Karabiner does not work on Sierra, so instead we use a combination of
[hammerspoon][] for the symbol layer/esc on capslock and karabiner-elements for
the hyper key.

Install
[wwwjfy's fork of Karabiner-Elements](https://github.com/wwwjfy/Karabiner-Elements/releases) unless
his [pull request](https://github.com/tekezo/Karabiner-Elements/pull/247) is merged.

Use f_qwerty.txt for kinesis.

![Symbol
overlay](http://screenshots-dx37.s3.amazonaws.com/monosnap/kinesis-layout-empty.jpg.png)
[hamerspoon]: http://www.hammerspoon.org/
