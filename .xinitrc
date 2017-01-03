#set wallpaper
sh /home/damien/.fehbg &

#run .Xresources
/usr/bin/xrdb -merge /home/damien/.Xresources

#set window manager
exec xmonad &

#start a terminal
/usr/bin/X11/xterm

#start wired network connection
sh /home/damien/.network_startip.sh
