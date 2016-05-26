Install instructions
===============
Minimal Debian with Xmonad
--------------------------------------------

### Operating System Install

1. Run the [Debian](https://www.debian.org/) installer.
2. Do not add a root password when prompted(_blank will install sudo_)
3. At the software select screen **uncheck all of the boxes**.
4. Finish the installation to preference

   ### Software Install
5. Run `sudo apt-get install aptitude`
6. From [Aptitude](https://wiki.debian.org/Aptitude) install the following packages **with their dependencies**
  * [Xmonad](http://xmonad.org/)
  * [xmobar](http://projects.haskell.org/xmobar/)
  * [Xorg](https://wiki.debian.org/Xorg)
  * [xterm](https://packages.debian.org/jessie/xterm)(_or whichever terminal emulator you prefer_)
  * [xdm](https://wiki.debian.org/XDM)
  * [dmenu](http://tools.suckless.org/dmenu/)
  * [feh](http://feh.finalrewind.org/)
  * [Git](https://packages.debian.org/jessie/git)

    _Optional Software_
  * [ranger](http://ranger.nongnu.org/)
  * [atom](https://atom.io/)
  * [midori](http://midori-browser.org/)
7. Run `git clone https://github.com/superdamo/dotfiles` and `mv` items to their respective locations.
8. Run `touch ~/.dmenu_cache` _*this file will be populated automatically_

### WIP VM Screenshots (_with dodgy resolution_)

#### Login Screen
![Alt text](https://tknk.io/Cnfb)

#### Clean
![Alt text](https://tknk.io/qAqj)

#### Dirty (atom, aptitude, [neofetch](https://github.com/dylanaraps/neofetch))
![Alt text](https://tknk.io/zF6X)
_*note: the  atom colour scheme is still on the very long to do list_
