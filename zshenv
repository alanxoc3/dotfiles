#!/bin/zsh
# .zshenv - Alan Morgan

# History & prompt
export PROMPT='[%F{red}%T%f %c] '
export HISTFILE=~/.zhistory
export SAVEHIST=100000
export HISTSIZE=100000

# Set the path.
export PATH="$PATH:$HOME/.fzf/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$PICOBINPATH"
export PATH="$PATH:$HOME/.dotfiles/bin"
export PATH="$PATH:$HOME/.dotfiles/local_bin"
export PATH="$PATH:$HOME/bin/arduino"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.emacs.d/bin"
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# A bunch more environment variables
export ANACONDA_HOME="/home/alanxoc3/anaconda3"
export ANDROID_HOME=/opt/android-sdk
export BROWSER=qutebrowser
export EDITOR=$VISUAL
export GOPATH=~/go
export GPG_TTY=`tty`
export GTK_IM_MODULE=fcitx
export IGNOREEOF=2
export JAVA_HOME="/usr/lib/jvm/default-java/"
export LC_ALL=en_US.UTF-8
export npm_config_prefix=~/.node_modules
export PYTHONPATH="/home/alanxoc3/Projects/caffe/python"
export QEMU_AUDIO_DRV='pa'
export QT_IM_MODULE=fcitx
export TERMINAL="termite"
export TERM='xterm-256color'
export VISUAL=nvim
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XENVIRONMENT="${HOME}/.Xresources"
export XKB_DEFAULT_LAYOUT=us
export XKB_DEFAULT_VARIANT=dvorak
export XMODIFIERS=@im=fcitx

# FZF environment variables
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!.git/" -g "!.vim_srcs/" -g "!node_modules/" -g "!target/" -g "!tags" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude ".git" .'
