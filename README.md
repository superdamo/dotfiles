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
  1. [Xmonad](http://xmonad.org/)
  2. [xmobar](http://projects.haskell.org/xmobar/)
  3. [Xorg](https://wiki.debian.org/Xorg)
  4. [xterm](https://packages.debian.org/jessie/xterm)(_or whichever terminal emulator you prefer_)
  5. [xdm](https://wiki.debian.org/XDM)
  6. [dmenu](http://tools.suckless.org/dmenu/)
  7. [Git](https://packages.debian.org/jessie/git)

    _Optional Software_
  8. [ranger](http://ranger.nongnu.org/)
  9. [atom](https://atom.io/)
  10. [midori](http://midori-browser.org/)
7. Run `git clone https://github.com/superdamo/`the repostories above and `mv` to their respective locations.
8. Run `touch ~/.dmenu_cache` _*this file will be populated automatically_

### WIP VM Screenshots (_with dodgy resolution_)

#### Login Screen
![Alt text](https://tknk.io/Cnfb)

#### Clean
![Alt text](https://tknk.io/qAqj)

#### Dirty (atom, aptitude, [neofetch](https://github.com/dylanaraps/neofetch))
![Alt text](https://tknk.io/zF6X)
_*note: the  atom colour scheme is still on the very long to do list_
