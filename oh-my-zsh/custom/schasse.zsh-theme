server_name() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo '%m '
  else
    echo ''
  fi
}

local ret_status="%(?:%{$fg_bold[red]%}➜ :%{$fg_bold[red]%}❊ ➜ %s)"
PROMPT='%{$fg_no_bold[red]%}$(server_name)${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

RPROMPT='%{$fg[yellow]%}$(rvm-prompt v p g)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
