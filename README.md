## Installation

```bash
$ git clone git://github.com/aaronjensen/dotfiles.git ~/.dotfiles && ~/.dotfiles/setup.sh
```

After that look in the setup folder for other scripts to run to setup various
things.

### Notes

1. I use an iTerm2 beta: [iTerm2-1_0_0_20130210.zip](http://code.google.com/p/iterm2/downloads/detail?name=iTerm2-1_0_0_20130210.zip&can=2&q=) 
   or more recent to support tmux copy to clipboard. You have to enable
   "Allow clipboard access to terminal apps" in iTerm2.
1. I use a fork of tmux until the focus filter feature is in tmux proper. This
   lets me use FocusGained/FocusLost in vim which I primarily use to make 
   `cmd+v` work like it should in terminal vim. You can find the fork in my
   [taps](https://github.com/aaronjensen/homebrew-tap).
