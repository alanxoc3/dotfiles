#!/bin/bash
# Author: Alan Morgan - ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.local_bashrc ]] && . ~/.local_bashrc
export BASH_ENV='~/.bash_aliases'

################################################
#                 FUNCTIONS                    #
################################################

# I believe this allows auto-complete for these commands.
complete -cf man
complete -cf sudo

sbri() {
   echo $(expr $1 \* 192) > /sys/class/backlight/intel_backlight/brightness
}

# Swaps two files.
swap() {
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE "$2"
}

# Usage: mnt sda1
mnt() { sudo mount -o gid=users,fmask=113,dmask=002 /dev/$1 /mnt; }

set -o emacs

# pinyin define
# https://unix.stackexchange.com/questions/197792/joining-bash-arguments-into-single-string-with-spaces
# https://stackoverflow.com/questions/7131670/make-a-bash-alias-that-takes-a-parameter
# https://stackoverflow.com/questions/3811345/how-to-pass-all-arguments-passed-to-my-bash-script-to-a-function-of-mine
pdef() { rg -i "$*" ~/sync/ref/chinese_dictionary.txt; }

killport() { sudo fuser -k "$*/tcp"; }

pdefc() { pdef " $* "; }

# wubi define
wdef() { grep -i "$*" /home/alanxoc3/sync/ref/wubi/wb.txt; }

wdefc() { pdef "$* "; }

# For my pico-8 package management system.
repicolib() {
	if [ -d "./lib" ]; then
		echo "Removing './lib'";
		rm -r ./lib;
	fi

	echo "Creating './lib'";
	mkdir lib;

	echo "Running: 'picolib update src/* lib/'"
	picolib update src/* lib/ > /dev/null;

	while : ; do
		local fc=$(ls ./lib | wc -l);

		echo "$fc files -- Running: 'picolib update lib/* lib/'"
		picolib update lib/* lib/ > /dev/null;

		local new_fc=$(ls ./lib | wc -l);
		[[ $new_fc -gt $fc ]] || break
	done
}

# pinyin find
pfind() { grep -i "$*" /home/alanxoc3/sync/ref/wubi/wbpy.txt; }

bind -x '"\C-o": vim_fzf;'

# https://www.vim.org/scripts/script.php?script_id=3645
export GPG_TTY=`tty`

# A Quadalan function!
vim_fzf() {
	file=$(fzf --height=40%)
	[[ $file != "" ]] && vim $file
}
vim_fzf() {
	file=$(fzf --height=40%)
	[[ $file != "" ]] && vim $file
}

# for a super fast fzf!
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!.git/" -g "!.vim_srcs/" -g "!node_modules/" -g "!target/" -g "!tags" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude ".git" .'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

_fzf_compgen_path() {
 fd --hidden --follow --exclude ".git" . "$1"
}

[[ $- == *i* ]] && source "/usr/share/fzf/completion.bash" 2> /dev/null

# My beautiful shell prompt! Idk why this must be in the bashrc too.
export PS1='[\[\033[0;31m\]\#\[\033[0m\] \W]\$ '

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/ARBFUND/alanmorgan/.sdkman"
[[ -s "/home/ARBFUND/alanmorgan/.sdkman/bin/sdkman-init.sh" ]] && source "/home/ARBFUND/alanmorgan/.sdkman/bin/sdkman-init.sh"
