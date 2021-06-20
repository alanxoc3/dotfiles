#!/usr/bin/zsh
# zshrc - Alan Morgan

# Emacs Mode & History Options
bindkey -e

# Able to edit the line with vim
autoload -z edit-command-line
zle -N edit-command-line
bindkey '^[v' edit-command-line
umask 077 # No permission to group or others.

export PROMPT='%F{yellow}>%f '
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
   mvn -DskipTests=true -Drelease.environment=local -Dserver=$1 -Ddatabase=$2 -Dusername=liquibase -Dpassword=l1qu1b\$e -Dcontexts=$3 clean install
}

did() { # Docker container id
    docker ps | grep "$1" | cut -d ' ' -f1
}

dl() { # Docker container id
    docker logs $(did $1)
}

# Keyboard Shortcuts
kb_pass_files() {
   LBUFFER="${LBUFFER}pass show -c $(fd --base-directory ~/.password-store -t f | sed -En 's/^(.*)\.gpg$/\1/p' | fzf) 2> /dev/null"

   local ret=$?
   zle reset-prompt
   return $ret
}
zle     -N    kb_pass_files
bindkey '\es' kb_pass_files

kb_git_branches() {
   LBUFFER="${LBUFFER}$(kbf_git_branch | fzf)"
   local ret=$?
   zle reset-prompt
   return $ret
}
zle     -N    kb_git_branches
bindkey '\eg' kb_git_branches

kb_apropos() {
   LBUFFER="${LBUFFER}man $(fzf_apropos)"
   local ret=$?
   zle accept-line
   return $ret
}
zle     -N    kb_apropos
bindkey '\em' kb_apropos

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Do custom things for work or home with a local zshrc!
if [ -f "$HOME/.dotfiles/local_zshrc" ]; then . "$HOME/.dotfiles/local_zshrc"; fi
