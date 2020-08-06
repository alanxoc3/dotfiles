#!/usr/bin/zsh
# zshrc - Alan Morgan

# Emacs Mode & History Options
bindkey -e

# Set some history options
setopt APPEND_HISTORY       # Addition of the history file
setopt HIST_IGNORE_ALL_DUPS # Ignore all repetitions of commands
setopt HIST_FIND_NO_DUPS    # Do not display the string found earlier
setopt HIST_IGNORE_DUPS     # Ignore rows if they are duplicates
setopt HIST_REDUCE_BLANKS   # Delete empty lines from history file
setopt HIST_IGNORE_SPACE    # Ignore a record starting with a space

# Fzf Function
_fzf_compgen_path() {
 fd --hidden --follow --exclude ".git" . "$1"
}

# Source files.
source ~/.local_aliases 2> /dev/null
source ~/.aliases 2> /dev/null
source "/home/alanxoc3/.fzf/shell/completion.zsh" 2> /dev/null
source "/home/alanxoc3/.fzf/shell/key-bindings.zsh" 2> /dev/null
