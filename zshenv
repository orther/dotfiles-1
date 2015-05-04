function zeus {
  command zeus $@
  ZE_EC=$?
  stty sane
  if [ $ZE_EC = 2 ]; then
    zeus $@
  fi
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
