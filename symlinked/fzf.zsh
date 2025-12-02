# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/schasse/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/schasse/.fzf/bin"
fi

source <(fzf --zsh)
