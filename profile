#!/bin/bash
# ~/.profile

export PICOPATH="$HOME/.lexaloffle/pico-8/carts"

# Really just optional.
ALANPICOPATH="$PICOPATH/alan-pico-lib"
PICOBINPATH="$ALANPICOPATH/bin"

# I <3 PICO-8!
export PICOLIBPATH="$ALANPICOPATH/lib"

# Environment variables go here!
export HISTCONTROL=ignoredups
export HISTSIZE=1000

# CTRL D must be pressed 3 times in order to do an EOF
export IGNOREEOF=2
export XENVIRONMENT="${HOME}/.Xresources"

# Editor and path
export VISUAL=nvim
export EDITOR=$VISUAL
export ANDROID_HOME=/opt/android-sdk

# Update the path for many many things.
export PATH="$PICOBINPATH:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin/arduino:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"

# For npm.
export npm_config_prefix=~/.node_modules

# For automatic colorization.
export PYTHONPATH="/home/alanxoc3/Projects/caffe/python"
export ANACONDA_HOME="/home/alanxoc3/anaconda3"

# For i3 to get my terminal right.
export TERMINAL="termite"

# For mandarin support.
export GTK_IM_MODULE=fcitx # or xim
export QT_IM_MODULE=fcitx # or xim
export XMODIFIERS=@im=fcitx

# Golang :D.
export GOPATH=~/go

# Fix locale temporarily.
export LC_ALL=en_US.UTF-8

# For sway
export XKB_DEFAULT_LAYOUT=us;
export XKB_DEFAULT_VARIANT=dvorak;

# xdg
export XDG_CONFIG_HOME=$HOME/.config;
export XDG_CACHE_HOME=$HOME/.cache;
