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

  # theme
  zgen oh-my-zsh themes/re5et

  zgen save
fi

ZSH_HIGHLIGHT_STYLES[precommand]='none'
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=yellow'

DISABLE_AUTO_TITLE="true"

source "${HOME}/.shellrc"
eval "$(direnv hook zsh)"

fpath=("$HOME/.zsh" $fpath)

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
