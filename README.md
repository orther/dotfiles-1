## Installation

```bash
$ git clone git://github.com/aaronjensen/dotfiles.git ~/.dotfiles && ~/.dotfiles/setup.sh
```

After that look in the setup folder for other scripts to run to setup various
things.

### iTerm setup

Do this from Terminal (make sure iTerm is not running so it doesn't overwrite it)

```bash
$ cp iterm/com.googlecode.iterm2.plist ~/Library/Preferences/
```

### Notes

1. I use an iTerm2 beta: [iTerm2-1_0_0_20130210.zip](http://code.google.com/p/iterm2/downloads/detail?name=iTerm2-1_0_0_20130210.zip&can=2&q=) 
   or [more recent](http://code.google.com/p/iterm2/downloads/list) to support tmux copy to clipboard. You have to enable
   "Allow clipboard access to terminal apps" in iTerm2.
