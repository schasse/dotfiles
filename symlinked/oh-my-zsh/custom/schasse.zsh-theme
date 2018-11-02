server_name() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo '%m:'
  else
    echo ''
  fi
}

# Outputs current context info in prompt format
k8s_prompt_info() {
  local ref
  local ref2
  local sym_link_path
  ref=$(kubectl config current-context 2>&1 > /dev/null | awk '{print $2}')
  sym_link_path=$(readlink -f $HOME/.deployer/deployer_env 2> /dev/null)
  ref2="${sym_link_path##*.}"
  if [ "$ref2" = "staging" ]; then
    ref2="$fg_bold[yellow]${ref2}"
  fi
  if [ "$ref2" = "production" ]; then
    ref2="$fg_bold[red]${ref2}$reset_color"
  fi
  echo "k8s:${ref} depctl:${ref2}$reset_color"
}

precmd() {
  local right="$fg[yellow]$(rvm-prompt v p g)$reset_color $(k8s_prompt_info) [$(date '+%H:%M')]"
  local nocolor=$(echo $right | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g")
  local width=$(($#right - $#nocolor + $COLUMNS))
  print "${(l:$width:: :)right}"
}

local ret_status="%(?::%{$fg_bold[red]%}† )"
PROMPT="%{$fg_bold[red]%}➜ %p %{$fg[cyan]%}$(server_name)%c \$(git_prompt_info)${ret_status}% %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ✗"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"
