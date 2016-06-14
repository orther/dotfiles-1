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

# This is supposed to speed up pasting but doesn't appear to help much
# https://github.com/zsh-users/zsh-autosuggestions/issues/141#issuecomment-210615799
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# zsh-history-substring-search
# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# Use C-z to switch back to fg
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
      BUFFER="fg"
      zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.asdf/asdf.sh ] && source ~/.asdf/asdf.sh
