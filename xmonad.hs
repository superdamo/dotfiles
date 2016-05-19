import XMonad
import XMonad.Config.Gnome
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageDocks


myLayout = tiled ||| Mirror tiled ||| Full
  where
	tiled = spacing 5 $ Tall nmaster delta ratio
	nmaster = 1
	ratio = 4/7
	delta = 3/100

main = xmonad $ gnomeConfig
	{ borderWidth        = 2
	, normalBorderColor = "#6b6b6f"
	, focusedBorderColor = "#649fcf"
	, layoutHook = avoidStruts $ smartBorders $ myLayout 
	, manageHook = manageHook defaultConfig <+> manageDocks
		}


