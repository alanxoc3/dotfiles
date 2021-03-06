#!/usr/bin/zsh
# zshenv - Alan Morgan

# Set the path.

export PATH="$PATH:$HOME/.fzf/bin"
export PATH="$PATH:$HOME/.dotfiles/bin"
export PATH="$PATH:$HOME/.local_bin"
export PATH="$PATH:$HOME/.go/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"

# A bunch more environment variables
export ANACONDA_HOME="$HOME/anaconda3"
export ANDROID_HOME=/opt/android-sdk
export BROWSER=qutebrowser
export GOPATH=~/.go
export GPG_TTY=`tty`
export GTK_IM_MODULE=fcitx
export IGNOREEOF=2
export JAVA_HOME=$(/usr/libexec/java_home 2> /dev/null)
export LC_ALL=en_US.UTF-8
export npm_config_prefix=~/.node_modules
export PYTHONPATH="/home/alanxoc3/Projects/caffe/python"
export QEMU_AUDIO_DRV='pa'
export QT_IM_MODULE=fcitx
export TERMINAL="termite"
export VISUAL=kak
export EDITOR=$VISUAL
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XENVIRONMENT="${HOME}/.Xresources"
export XKB_DEFAULT_LAYOUT=us
export XKB_DEFAULT_VARIANT=dvorak
export XMODIFIERS=@im=fcitx
export PAGER=kak
export MANPAGER=kak_man
export RIPGREP_CONFIG_PATH="$HOME/.rgconfig"
export TTRACK_DATA_DIR="$HOME/new-ttrack-data-dir" # Temporary for ttrack dev.
export TTRACK_CACHE_DIR="$HOME/new-ttrack-cache-dir" # Temporary for ttrack dev.

# FZF environment variables
BFT="fd -t f --hidden --color=always --ignore-file ~/.dotfiles/search-ignore ."
BFC="fd -t d --hidden --color=always --ignore-file ~/.dotfiles/search-ignore ."
export FZF_DEFAULT_COMMAND="$BFT"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="($BFT --exact-depth 1; $BFT --exact-depth 2; $BFT --exact-depth 3; $BFT --min-depth 4;) | cat"
export FZF_ALT_C_COMMAND="($BFC --exact-depth 1; $BFC --exact-depth 2; $BFC --exact-depth 3; $BFC --min-depth 4;) | cat"
export TERM='xterm-256color'
