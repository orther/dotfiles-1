# aaronjensen.zsh-theme

git_remote_status_count() {
    remote=${$(command git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
    if [[ -n ${remote} ]] ; then
        ahead=$(command git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        behind=$(command git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)

        if [ $ahead -gt 0 ]
        then
            echo -n "$ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX${ahead// /}$ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX"
        fi

        if [ $behind -gt 0 ]
        then
            echo -n "$ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX${behind// /}$ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX"
        fi
    fi
}

ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX="+"
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX=""
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX="-"
ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX=""

PROMPT='%{$fg[blue]%}[%{$reset_color%}'
PROMPT+='%~'
PROMPT+='$(git_prompt_info)$(git_prompt_status)$(git_remote_status_count)'
PROMPT+='%{$fg[blue]%}]%{$reset_color%}
%# '

# display exitcode on the right when >0
return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

RPROMPT='${return_code}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_ADDED="A"
ZSH_THEME_GIT_PROMPT_MODIFIED="M"
ZSH_THEME_GIT_PROMPT_DELETED="D"
ZSH_THEME_GIT_PROMPT_RENAMED="R"
ZSH_THEME_GIT_PROMPT_UNMERGED="UM"
ZSH_THEME_GIT_PROMPT_UNTRACKED="UN"
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}| %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE=""
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=""
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE=""
