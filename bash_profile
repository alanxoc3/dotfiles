#!/bin/bash
# ~/.bash_profile

[[ -f ~/.profile ]] && . ~/.profile
[[ -f ~/.bashrc  ]] && . ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
