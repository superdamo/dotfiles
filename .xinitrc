#set wallpaper
bash /home/damien/.fehbg &

#run .Xresources
xrdb -load ~/.Xresources

#set cursor look
xsetroot -cursor_name left_ptr &

#night time colour temperature
redshift &

#compositor
compton --config ~/.config/compton.conf -b &

#set window manager
exec xmonad

#start wired network connection
#sh /home/damien/.network_startip.sh
