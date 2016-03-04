source "${HOME}/.dotfiles/zgen/zgen.zsh"

# After making a change here, do a zgen update and restart zsh
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh

  # plugins
  zgen oh-my-zsh plugins/autojump
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/lein
  zgen oh-my-zsh plugins/mix-fast
  zgen oh-my-zsh plugins/ruby
  zgen oh-my-zsh plugins/rvm
  zgen oh-my-zsh plugins/nvm
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-history-substring-search
  zgen load rimraf/k

  # completions
  zgen load zsh-users/zsh-completions src

  zgen save
fi

# zsh-history-substring-search
# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

compdef g='git'
source ~/.bash/aliases

source "${HOME}/.zsh/aaronjensen.zsh-theme"

ZSH_HIGHLIGHT_STYLES[precommand]='none'
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=yellow'

DISABLE_AUTO_TITLE="true"

# Disable alternate screen in less
LESS="-XR"

eval "$(direnv hook zsh)"

fpath=("$HOME/.zsh" $fpath)

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

if [ $ITERM_PROFILE ]; then
  echo -ne "\033]6;1;bg;red;brightness;28\a"
  echo -ne "\033]6;1;bg;blue;brightness;28\a"
  echo -ne "\033]6;1;bg;green;brightness;28\a"
fi
