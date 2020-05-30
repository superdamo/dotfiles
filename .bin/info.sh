#!/bin/sh
IFS='%' #preserves whitespaces

# ascii tree
tree_1="     \033[0;32m#\033[m\033[0;31mo\033[m\033[0;32m#\033[m         "
tree_2="   \033[0;32m####\033[m\033[0;31mo\033[m\033[0;32m#\033[m        "
tree_3="  \033[0;32m#\033[m\033[0;31mo\033[m\033[0;32m#\033[m \033[0;33m\\033[m\033[0;32m#\033[m\033[0;33m|_\033[m\033[0;32m#\033[m\033[0;33m,\033[m\033[0;32#\033[m      "
tree_4=" \033[0;32m###\033[m\033[0;33m\ |/\033[m   \033[0;32m#\033[m\033[0;31mo\033[m\033[0;32m#\033[m   "
tree_5="   \033[0;32m#\033[m \033[0;33m{}{\033[m     \033[0;32m#\033[m   "
tree_6="      \033[0;33m}{{\033[m        "
tree_7="     \033[0;33m,'  '\033[m      "

# display info
# distro
dist=$(cat /etc/*release | grep PRETTY_NAME | grep -o '".*"' | sed 's/"//g')
# kernel
kern=$(uname -r)
# shell
shell=$(echo $BASH_VERSION | sed 's/-[^-]*$//')
# wm
# wm=$(xmonad --version)     ----no longer ussing xmonad
# de
de=$(xbps-query -l | grep mate-desktop | awk '{print substr($2,1,100)}')
# packages
# pack=$(dpkg --list | wc --lines)    ---debian/ubuntu only
pack=$(xbps-query -l | wc -l)     #void linux

# printing
echo
echo -e $tree_1
echo -e $tree_2 "\033[0;31mDistro   \033[m:" $dist"-linux"
echo -e $tree_3 "\033[0;31mKernel   \033[m:" $kern
echo -e $tree_4 "\033[0;31mShell    \033[m:" "Bash" $shell 
echo -e $tree_5 "\033[0;31mDE       \033[m:" $de
echo -e $tree_6 "\033[0;31mPackages \033[m:" $pack
echo -e $tree_7
echo

# colour blocks
pcs() { for i in {0..7}; do echo -en "\e[${1}$((30+$i))m \u2588\u2588 \e[0m"; done; }
printf "\n%s\n%s\n\n" "$(pcs)" "$(pcs '1;')"
