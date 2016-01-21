server_name() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo '%m:'
  else
    echo ''
  fi
}

local ret_status="%(?::%{$fg_bold[red]%}† )"
PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}$(server_name)%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}${ret_status}% %{$reset_color%}'

if [[ -x $HOME/.rvm/bin/rvm-prompt ]]; then
  RPROMPT='%{$fg[yellow]%}$(rvm-prompt v p g)%{$reset_color%} [%D{%H:%M}]'
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"
