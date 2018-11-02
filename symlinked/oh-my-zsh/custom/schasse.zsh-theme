server_name() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo '%m:'
  else
    echo ''
  fi
}

# Outputs current context info in prompt format
function k8s_prompt_info() {
  local ref
  local ref2
  local sym_link_path
  ref=$(kubectl config current-context 2>&1 > /dev/null | awk '{print $2}')
  sym_link_path=$(readlink -f $HOME/.deployer/deployer_env 2> /dev/null)
  ref2="${sym_link_path##*.}"
  if [ "$ref2" = "staging" ]; then
    ref2="%{$fg_bold[yellow]%}${ref2}%{$reset_color%}"
  fi
  if [ "$ref2" = "production" ]; then
    ref2="%{$fg_bold[red]%}${ref2}%{$reset_color%}"
  fi
  echo "k8s:${ref} depctl:${ref2}"
}

local ret_status="%(?::%{$fg_bold[red]%}† )"
PROMPT="
%{$fg[yellow]%}$(rvm-prompt v p g)%{$reset_color%} \$(k8s_prompt_info) [%D{%H:%M}]
%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}$(server_name)%c %{$fg_bold[blue]%}\$(git_prompt_info)%{$fg_bold[blue]%}${ret_status}% %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"
