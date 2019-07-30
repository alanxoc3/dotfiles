#!/bin/bash
# Author: Alan Morgan - ~/.bashrc

# If not running interactively, don't do anything
# Interactively means 
[[ $- != *i* ]] && return

set -o emacs
alias runi=startx
alias editi3='vim ~/sync/work/config/i3-config'

# For syncthing:
alias serve_syncthing='ssh -N -L 9090:***REMOVED***:8384 alanxoc3@alan'

alias int='sudo wifi-menu'
alias cdr='cd /'
# Clear Water stuff
alias svnignore='git svn show-ignore >> .git/info/exclude'
# alias renginx="sudo killall nginx; sudo nginx"
alias renginx="sudo nginx -s reload"
# run "mvn package" to update maven package.
alias mvnp="mvn package"
alias mvnj="mvn javadoc:javadoc"
alias irewar="rewar xforce/IndexLoader"

# Alan's goals are important :D.
alias plan="vim ~/sync/shuying/alan/plan.txt"
alias goals="vim ~/sync/shuying/alan/{achieve,plan,day}.txt ~/sync/shuying/alan/logs/*"

retom() {
	sudo systemctl restart tomcat
}

rewar() {
	sudo cp ~/$1/target/*.war /opt/tomcat/webapps/
	retom
}

# Usage: mnt sda1
mnt() { sudo mount -o gid=users,fmask=113,dmask=002 /dev/$1 /mnt; }
alias umnt='sudo umount /mnt'

alias screen_off="xset dpms force off"

alias lid="echo locked > '/tmp/.lid-lock-file'"

alias gpgpin="echo tmp > /tmp/gpg_tmp; gpg -r alanxoc3 -e /tmp/gpg_tmp; gpg -d /tmp/gpg_tmp.gpg"
alias fb="/home/alanxoc3/repos/fuzzybird/fuzzybird.py --hashtag"
alias dropfile="dropbox-cli sharelink"
alias pic_tur="pic_open ~/.lexaloffle/pico-8/carts/sims/turing-machine"
alias pic_mou="pic_open ~/.lexaloffle/pico-8/carts/work/pico-8-club/mouth-mouth"
alias pic_ray="pic_open ~/.lexaloffle/pico-8/carts/sims/raycasting"
alias pic_chn="pic_open ~/.lexaloffle/pico-8/carts/chrononaut"
alias pic_zel="pic_open ~/.lexaloffle/pico-8/carts/games/zeldo"

alias rndbkgd="feh --randomize --bg-fill ~/Pictures/photos/*"
alias difbkgd="rndbkgd"

# alias vim="kak"
alias vim="nvim"

alias mkflashdrive='sudo mkfs.vfat -n AMORG'

alias hy='hy --repl-output-fn=hy.contrib.hy-repr.hy-repr'

alias updateprofile='source ~/.profile'
alias editprofile='vim ~/.profile'

alias updatexterm='xrdb merge ~/.Xresources'
alias editxterm='vim ~/.Xresources'

alias editvim='vim ~/.nvimrc'
alias editnvim=editvim

# Navigate my dropbox folders!
alias repos='cd ~/repos; clear; ls'
alias books='cd ~/sync/books/; clear; ls'
alias byui='cd ~/sync/byui/; clear; ls'
alias cards='cd ~/sync/cards/; clear; ls'
alias config='cd ~/sync/config/; clear; ls'
alias journ='cd ~/sync/journ/; clear; ls'
alias notes='cd ~/sync/notes/; clear; ls'
alias pic='cd ~/sync/pic/; clear; ls'
alias ref='cd ~/sync/ref/; clear; ls'
alias sandbox='cd ~/sync/sandbox/; clear; ls'
alias sheets='cd ~/sync/sheets/; clear; ls'

# sync folder shortcuts.
alias byiu=byui
alias buyi=byui
alias repo=repos

# other folders
alias down='cd ~/Downloads; ls'
alias drop='cd ~/sync; ls'
alias cdpico="cd ~/.lexaloffle/pico-8/carts"
alias sdcard='cd /sdcard; ls;'


# -------------------------
# UN-ORGANIZED THINGS BELOW
# -------------------------

alias feh='feh --force-aliasing --scale-down'

alias today='vim ~/sync/shuying/alan/day.txt'
alias day=today
alias daily=today

# Gets a lower quality of a video.
alias getvid="youtube-dl -f 18"

# find all
alias fa="grep -r --exclude-dir='.*'"
alias fai="fa -i"

# pico lib utils.
alias p8tool='~/repos/picotool/p8tool'

# Poor Man's VPN
# https://github.com/apenwarr/sshuttle#start-of-content
alias vpn='sshuttle --dns -r sing 0/0 -x ***REMOVED***'

alias gitlog='git log --graph --oneline'
alias commit='git add --all; git commit;'
alias status='git status'
alias pull='git pull'
alias push='git push'

# If you ever want to get a pull request locally, here is an example :).
# git fetch origin pull/8864/head:develop

alias i3l='i3lock'
alias 3il=i3l

alias i3lock='i3lock -c 000000'

# sync
alias redrop='pkill dropbox; echo dropbox | bash - &'
alias dropstat='dropbox-cli status'
alias dropls='dropbox-cli ls'
alias rapiddrop="while [ true ]; do clear; dropstat; sleep 1; done"

alias mone="sudo mount /dev/sda1 /mnt"
alias mtwo="sudo mount /dev/sdb1 /mnt2"
alias umone="sudo umount /mnt"
alias umtwo="sudo umount /mnt2"

# Concards
alias flashcode='concards -rmn 20 /home/alanxoc3/sync/cards/code/*'
alias flashmand='concards -rmn 20 /home/alanxoc3/sync/cards/mandarin/*'
alias flashbook='concards -rmn 20 /home/alanxoc3/sync/cards/book/*'
alias flashr='concards -rn 20 /home/alanxoc3/sync/cards/*/*'
alias flashm='concards -mn 20 /home/alanxoc3/sync/cards/*/*'
alias flash='concards -mrn 20 /home/alanxoc3/sync/cards/*/*'

alias copycurrent='echo cd $(pwd) | xclip'
alias copypath=copycurrent

alias dd='dd status=progress'
alias ta='tmux attach'
alias todo="vim ~/sync/docs/todo.txt"
alias R="R --quiet"
alias nomouse='synclient TouchpadOff=1'
alias mouse='synclient TouchpadOff=0'
alias ruin=runi
alias rnui=runi
alias ls..="ls .."

alias powreoff=poweroff
alias poweraff=poweroff
alias pwoeroff=poweroff
alias pworeoff=poweroff

alias oweroff="poweroff"

# All possible acpi combinations, excluding acpi!
alias acip=acpi
alias aicp=acpi
alias aipc=acpi
alias apic=acpi
alias apci=acpi

alias ipac=acpi
alias ipca=acpi
alias iapc=acpi
alias iacp=acpi
alias icap=acpi
alias icpa=acpi

alias caip=acpi
alias capi=acpi
alias ciap=acpi
alias cipa=acpi
alias cpai=acpi
alias cpia=acpi

alias piac=acpi
alias pica=acpi
alias pcia=acpi
alias pcai=acpi
alias paci=acpi
alias paic=acpi

alias cpi=acpi
alias acp=acpi

# Cmus combos.
alias cmsu=cmus

# Read those scriptures!
alias zasa="zathura ~/sync/books/sankta_biblio.pdf &"

alias zath=zathura


alias slblk=lsblk
alias rmemacs='find * -name "*~" -delete'
alias noemacs=rmemacs
alias rmemac=rmemacs
alias noemac=rmemacs
alias bc='bc -q'
alias df='df -h'
alias rs="fc -s"

# This is adjusted to Los Angeles.
alias redshift='redshift -l 34.05:-118.24'
# Brightness - for setting the brightness 

alias invert="xcalib -i -a > /dev/null"


sbri() {
   echo $(expr $1 \* 192) > /sys/class/backlight/intel_backlight/brightness
}

alias bri="sbri 80"
alias dim="sbri 20"
alias mid="sbri 50"
alias morbri="sbri 90"
alias mordim="sbri 10"
alias supbri="sbri 100"
alias supdim="sbri 1"

# Dictionaries
alias 词典="vim ~/sync/alioj/chinese/cedict_ts.u8"
alias cidian="vim ~/sync/alioj/chinese/cedict_ts.u8"
alias ci2dian3="vim ~/sync/alioj/chinese/cedict_ts.u8"
alias vortaro="vim ~/sync/ref/esperanto_dictionary.txt"
alias vortar=vortaro

# Test Bash
alias testbash='source $(cat > /tmp/.testbash; echo /tmp/.testbash)';
alias updatebash='source ~/.bashrc'
alias ub='updatebash'

alias bright=bri

# Supposed to allow tab completion with sudo
alias sudo='sudo '

alias l.='ls -d .*'
alias la='ls -A'
alias lsa=la

alias updatebash=". ~/.bashrc"

alias files=nautilus
alias emacs='emacs -nw'
alias cd.='cd .'
alias cd..='cd ..'

# My class folder
alias schedule='clear;cat ~/sync/remember/schedule.org'
alias editschedule='vim ~/sync/remember/schedule.org'

# Connect to the Linux Lab!
alias ***REMOVED***='ssh -p 215 alanxoc3@***REMOVED***'
alias mount***REMOVED***='sshfs -p 215 -o allow_other alanxoc3@***REMOVED***:./ ~/alan/ -C'
alias mll='mount***REMOVED***'; alias mountll='mount***REMOVED***'

# I believe this allows auto-complete for these commands.
complete -cf man
complete -cf sudo

# A spiritual man.
alias scrip='vim -R ~/sync/ref/scrips.txt'
alias scrips=scrip

# dictionary
alias dictionary=sdcv
alias dict=sdcv
alias dic=sdcv
alias define=sdcv
alias def=sdcv
alias defin=sdcv
alias defi=sdcv

alias daet=date

# Connect to the internet
alias netman='systemctl start NetworkManager.service'
alias nonet='systemctl stop NetworkManager.service'
alias renet='systemctl restart NetworkManager.service'

# Enable printing.
alias printer='systemctl start org.cups.cupsd'
alias noprinter='systemctl stop org.cups.cupsd'

# See if the internet is working
alias pinger='ping www.google.com'

# Google it up!
alias googleit='w3m www.google.com'
alias w3m='w3m -no-mouse'

# Keyboard Layouts
alias cdv='localectl set-keymap --no-convert dvorak-programmer'
alias cqw='localectl set-keymap --no-convert us'

alias gdv='setxkbmap -layout "us" -variant "dvorak"'
alias gqw='setxkbmap -layout "us"'
alias gwm='setxkbmap -layout "us" -variant "workman"'

# Temporary commands...
alias mountsdcard=mountcard
alias mountmicrosd=mountcard
alias gnome-terminal="dbus-launch gnome-terminal"

alias rmr="rm -r"

# For my mistakes...
alias clera=clear
alias cls=clear
alias ll='ls -l'
alias lsl='ls -l'
alias ssl='ls -l'
alias sls='ls -l'
alias lsla='ls -la'
alias vp=cp
alias eixt=exit
alias quit=exit

alias eitx=exit
alias xti=exit
alias etix=exit
alias xeit=exit
alias etxi=exit
alias xit=exit
alias ext=exit
alias exti=exit
alias xite=exit
alias ake=make
alias kmake=make
alias maek=make
alias amke=make
alias mkae=make
alias mkea=make
alias maake=make

alias jake=make
alias jmake=make

# I like color.
alias ls='ls -v --color=auto'
alias sl=ls
alias lls=ls
alias lss=ls
alias mak=make

# Replace vi with vim.
alias vi='vim'
alias im='vim'

# Navigate to various folders easily.
alias rd='cat ~/sync/goals/rd.txt | less'
alias editrd='vim ~/sync/goals/rd.txt'

# Edit a journal.
alias editjourn1='vim ~/sync/journ/1journal.txt'
alias editjourn2='vim ~/sync/journ/2journal.txt'
alias editjourn3='vim ~/sync/journ/3journal.txt'
alias editjourn4='vim ~/sync/journ/4journal.txt'
alias editjourn5='vim ~/sync/journ/5journal.txt'
alias editjourn6='vim ~/sync/journ/6journal.txt'
alias editjourn7='vim ~/sync/journ/7journal.txt'
alias editjourn8='vim ~/sync/journ/8journal.txt'
alias editjourn9='vim ~/sync/journ/9journal.txt'
alias editjournA='vim ~/sync/journ/Ajournal.txt'
alias editjournB='vim ~/sync/journ/Bjournal.txt'
alias editjournC='vim ~/sync/journ/Cjournal.txt'
alias editjournD='vim ~/sync/journ/Djournal.txt'
alias editjournE='vim ~/sync/shuying/diary/alan_diary.txt'
alias editjourn='editjournE'
alias editjour='editjourn'
alias taglibro='editjourn'

# Display the contents of a special blessing given to me.
# Permissions require SUDO privileges.
alias patbless='sudo cat ~/patBless.txt | less; clear;'
alias patriarchal=patbless
alias blessing=patbless

# Display and edit my yearly goals with ease.
alias semajno='vim ~/sync/goals/semajno.txt'

alias week='cat ~/sync/goals/week.txt | less;'
alias editweek='vim ~/sync/goals/week.txt'

# Display and edit my future goals (more than yearly).
alias iomut=imout
alias meout=imout
alias future='cat ~/sync/goals/futureGoals.txt | less'
alias futuregoal=future
alias futuregoals=future
alias goalfuture=future
alias goalsfuture=future

alias editfuture='vim ~/sync/goals/futureGoals.txt'
alias editfuturegoal=editfuture
alias editfuturegoals=editfuture
alias editgoalfuture=editfuture
alias editgoalsfuture=editfuture

alias simplegame='~/.simplegame/simplegame'
alias skeet="~/sync/coding/completed/skeet/skeet"

# Edit this file easily, to add a command.
alias editbash='vim ~/.bashrc'
alias editbosh=editbash
alias editbsh=editbash

# Take notes from the quran with ease.
alias quran='vim ~/sync/remember/notes/quran.txt'
alias proclamation='less ~/sync/remember/proclamation.txt'

# Locks then loads the background process.
alias lock="physlock"

# Locks all the ttys
alias gf=fg

alias nin="sudo modprobe ns588 joydev analog;"
alias nincontroller=nin
alias 64controller=nin
alias 64control=nin
alias nin64control=nin
alias controller=nin
alias nincont=nin

# Clipboard stuff
alias cclip='xclip -selection clipboard'
alias clipp='xclip -selection clipboard -o'

alias iwpoweroff='sudo iw wlan0 set power_save off'
alias jp='jp2a --colors'
alias cret='echo $?'

# To mount my ***REMOVED*** server.

alias alan='sshfs -o allow_other alanxoc3@alan:/home/alanxoc3/ ~/alan/ -C'
alias mountalan=alan
alias noalan='fusermount -u ~/alan'
alias umountalan=noalan
alias unmountalan=noalan

alias vid2mp3='youtube-dl --extract-audio --audio-format mp3'
alias nops='PS1="$ "'
alias tops='PS1="[\u-\[\033[0;31m\]\#\[\033[0m\] \W]\$ "'

alias pico="pico8"


################################################
#                 FUNCTIONS                    #
################################################


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

# for a super fast fzf!
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude ".git" .'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

_fzf_compgen_path() {
 fd --hidden --follow --exclude ".git" . "$1"
}

[[ $- == *i* ]] && source "/usr/share/fzf/completion.bash" 2> /dev/null

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# My beautiful shell prompt! Idk why this must be in the bashrc too.
export PS1='[\[\033[0;31m\]\#\[\033[0m\] \W]\$ '
