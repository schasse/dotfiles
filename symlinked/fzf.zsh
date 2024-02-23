# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/schasse/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/schasse/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/Users/schasse/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/Users/schasse/.fzf/shell/key-bindings.zsh"
