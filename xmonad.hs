import XMonad
import XMonad.Config.Gnome
import XMonad.Layout.EqualSpacing
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig(additionalKeys)


myLayout = tiled ||| Mirror tiled ||| Full
  where
	tiled = equalSpacing 5 5 0 6 $ Tall nmaster delta ratio
	nmaster = 1
	ratio = 5/9
	delta = 3/100
	
myKeys = [((mod1Mask, xK_p)
	, spawn "dmenu_run -fn 'Pixel Operator 11' -l '3' -nb '#151b1a' -nf '#8fa388' -sb '#474159' -sf '#8fa388' -b")
	]

main = xmonad $ gnomeConfig
	{ borderWidth        = 6
	, normalBorderColor = "#bdbda4"
	, focusedBorderColor = "#507a91"
	, terminal = "xterm"
	, layoutHook = avoidStruts $ myLayout 
	, manageHook = manageHook defaultConfig <+> manageDocks
		} `additionalKeys` myKeys

