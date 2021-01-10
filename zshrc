#!/usr/bin/zsh
# zshrc - Alan Morgan

# Emacs Mode & History Options
bindkey -e

# Able to edit the line with vim
autoload -z edit-command-line
zle -N edit-command-line
bindkey '^[v' edit-command-line

export PROMPT='%F{white}[%#%f %F{red}%M%f %F{white}%c]%f '
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
setopt EXTENDED_HISTORY     # Add additional data to history like timestamp
setopt INC_APPEND_HISTORY   # Add immediately
setopt SHARE_HISTORY        # Share history between session/terminals
setopt interactivecomments  # Allow comments in interactive mode.
setopt +o nomatch

# Source files.
source "$HOME/.local_aliases" 2> /dev/null
source "$HOME/.aliases" 2> /dev/null
source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null
source "$HOME/.fzf/shell/key-bindings.zsh" 2> /dev/null

# Functions
_fzf_compgen_path() {
   fd -t f -t d . "$1"
}

sbri() {
   echo $(expr $1 \* 192) > /sys/class/backlight/intel_backlight/brightness
}

liquibase() {
   mvn -Drelease.environment=local -Dserver=$1 -Ddatabase=$2 -Dusername=liquibase -Dpassword=l1qu1b\$e -Dcontexts=db,$3 clean install
}

# Keyboard Shortcuts
kb_ssh_hosts() {
   LBUFFER="${LBUFFER}$(kbf_ssh_hosts | fzf)"
   local ret=$?
   zle reset-prompt
   return $ret
}
zle     -N    kb_ssh_hosts
bindkey '\es' kb_ssh_hosts

kb_git_branches() {
   LBUFFER="${LBUFFER}$(kbf_git_branch | fzf)"
   local ret=$?
   zle reset-prompt
   return $ret
}
zle     -N    kb_git_branches
bindkey '\eg' kb_git_branches

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
