#-- Environment
export CURR_WM=bspwm
export DESKTOP_SESSION=bspwm

#-- Keyboard
sxhkd &

#-- Tools
keynav
xss-lock -- i3lock -nc 000000 &

#-- Screen
redshift -x
redshift -O 3500K

#-- Background Color
hsetroot -solid '#000000'

#-- Compositor
picom -b

#-- Window Manager
exec bspwm
