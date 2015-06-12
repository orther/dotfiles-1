source "${HOME}/.dotfiles/zgen/zgen.zsh"

if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh

  # plugins
  zgen oh-my-zsh plugins/autojump
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/lein
  zgen oh-my-zsh plugins/ruby
  zgen oh-my-zsh plugins/rvm
  zgen load zsh-users/zsh-syntax-highlighting

  # completions
  zgen load zsh-users/zsh-completions src

  zgen save
fi

source "${HOME}/.zsh/aaronjensen.zsh-theme"

ZSH_HIGHLIGHT_STYLES[precommand]='none'
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=yellow'

DISABLE_AUTO_TITLE="true"

# Disable alternate screen in less
LESS="-XR"

source "${HOME}/.shellrc"
eval "$(direnv hook zsh)"

fpath=("$HOME/.zsh" $fpath)

export NVM_DIR="/Users/aaronjensen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
