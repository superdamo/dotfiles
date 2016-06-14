import XMonad
import XMonad.Config.Gnome
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig(additionalKeys)


myLayout = tiled ||| Mirror tiled ||| Full
  where
	tiled = spacing 5 $ Tall nmaster delta ratio
	nmaster = 1
	ratio = 4/7
	delta = 3/100
	
myKeys = [((mod1Mask, xK_p)
	, spawn "dmenu_run -fn 'Pixel Operator 11' -l '3' -nb '#151b1a' -nf '#8fa388' -sb '#474159' -sf '#8fa388' -b")
	]

main = xmonad $ gnomeConfig
	{ borderWidth        = 3
	, normalBorderColor = "#6b6b6f"
	, focusedBorderColor = "#507a91"
	, terminal = "xterm"
	, layoutHook = avoidStruts $ smartBorders $ myLayout 
	, manageHook = manageHook defaultConfig <+> manageDocks
		} `additionalKeys` nyKeys


