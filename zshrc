source "${HOME}/.dotfiles/zgen/zgen.zsh"

# After making a change here, do a zgen update and restart zsh
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh

  # plugins
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/lein
  zgen oh-my-zsh plugins/mix-fast
  zgen oh-my-zsh plugins/ruby
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/docker-compose
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-history-substring-search
  zgen load rimraf/k
  # Like autojump, but with manual marks.
  # Run `mark <name>` to mark, and C-g to jump to a mark.
  # `dmark` to remove a mark.
  zgen load uvaes/fzf-marks

  # completions
  zgen load zsh-users/zsh-completions src

  zgen save
fi

# This speeds up pasting w/ autosuggest
# ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=15
function pasteinit {
  zle autosuggest-disable
}

function pastefinish {
  zle autosuggest-enable
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# zsh-history-substring-search
# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# Use C-z to switch back to fg
# It also will clear the screen if there is anything typed already
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

if command -v most > /dev/null 2>&1; then
  export PAGER="most"
fi

if [ $ITERM_PROFILE ]; then
  test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
  echo -ne "\033]6;1;bg;red;brightness;28\a"
  echo -ne "\033]6;1;bg;blue;brightness;28\a"
  echo -ne "\033]6;1;bg;green;brightness;28\a"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Emacs shells are loaded as interactive, but not login, so asdf must be sourced here
[ -z $ASDF_SOURCED ] && [ -f ~/.asdf/asdf.sh ] && source ~/.asdf/asdf.sh
