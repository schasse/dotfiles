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
  ref=$(cat ~/.kube/config | grep current-context | cut -f 2,2 -d ' ')
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

autoload -Uz add-zsh-hook

_schasse_right_prompt() {
  # local right="$fg[yellow]$(rvm-prompt v p g)$reset_color $(k8s_prompt_info) [$(date '+%H:%M')]"
  local rbenv_version=""
  if command -v rbenv &>/dev/null; then
    rbenv_version=$(rbenv version-name 2>/dev/null) || rbenv_version=""
  fi
  local right="$fg[yellow]${rbenv_version}$reset_color [$(date '+%H:%M')]"
  local nocolor=$(echo "$right" | sed -E "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" 2>/dev/null) || local nocolor="$right"
  local width=$(($#right - $#nocolor + $COLUMNS)) 2>/dev/null || local width=$COLUMNS
  print "${(l:$width:: :)right}" 2>/dev/null
}

add-zsh-hook precmd _schasse_right_prompt

local ret_status="%(?::%{$fg_bold[red]%}† )"
PROMPT="%{$fg_bold[red]%}➜ %p %{$fg[cyan]%}$(server_name)%c \$(git_prompt_info)${ret_status}% %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ✗"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"
