# Setup fzf
# ---------
if [[ ! "$PATH" == */home/schasse/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/schasse/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/schasse/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/schasse/.fzf/shell/key-bindings.zsh"
