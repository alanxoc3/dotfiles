#-- Environment
export CURR_WM=bspwm
export DESKTOP_SESSION=bspwm

#-- Keyboard
setxkbmap us -variant dvorak
setxkbmap -option caps:escape &
sxhkd &

#-- Tools
keynav
xss-lock -- i3lock -nc 000000 &

#-- Screen
redshift -x
redshift -O 3500K

#-- Window Manager
exec bspwm
