# Setup fzf
# ---------
if [[ ! "$PATH" == */home/sebastian/.fzf/bin* ]]; then
  export PATH="$PATH:/home/sebastian/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */home/sebastian/.fzf/man* && -d "/home/sebastian/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/sebastian/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/sebastian/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
# source "/home/sebastian/.fzf/shell/key-bindings.zsh"
