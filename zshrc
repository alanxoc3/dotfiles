#!/usr/bin/zsh
# zshrc - Alan Morgan

# Emacs Mode & History Options
bindkey -e
export PROMPT='[%F{red}%T%f %c] '
export CLICOLOR=1

# History & prompt
export HISTFILE=~/.zhistory
export SAVEHIST=100000
export HISTSIZE=100000

# Set some history options
setopt APPEND_HISTORY       # Addition of the history file
setopt HIST_IGNORE_ALL_DUPS # Ignore all repetitions of commands
setopt HIST_FIND_NO_DUPS    # Do not display the string found earlier
setopt HIST_IGNORE_DUPS     # Ignore rows if they are duplicates
setopt HIST_REDUCE_BLANKS   # Delete empty lines from history file
setopt HIST_IGNORE_SPACE    # Ignore a record starting with a space

# Functions
_fzf_compgen_path() {
 fd --hidden --follow --exclude ".git" . "$1"
}

sbri() {
   echo $(expr $1 \* 192) > /sys/class/backlight/intel_backlight/brightness
}

liquibase() {
   mvn -Drelease.environment=local -Dserver=$1 -Ddatabase=$2 -Dusername=liquibase -Dpassword=l1qu1b\$e -Dcontexts=db,$3 clean install
}


# Source files.
source "$HOME/.local_aliases" 2> /dev/null
source "$HOME/.aliases" 2> /dev/null
source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null
source "$HOME/.fzf/shell/key-bindings.zsh" 2> /dev/null