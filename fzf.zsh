# Setup fzf
# ---------
if [[ ! "$PATH" == */home/alanxoc3/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/alanxoc3/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/alanxoc3/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/alanxoc3/.fzf/shell/key-bindings.zsh"
