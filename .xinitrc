#set wallpaper
sh /home/damien/.fehbg &

#run .Xresources
/usr/bin/xrdb -merge /home/damien/.Xresources

#set window manager
exec xmonad

#start wired network connection
sh /home/damien/.network_startip.sh
