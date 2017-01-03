import XMonad
import XMonad.Layout.EqualSpacing
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO(hputStrLn)

main = do
	xmproc <- spawnPipe "xmobar ~/.xmobarrc"
	xmonad $ myConfig
		{ logHook = dynamicLogWithPP $ xmobarPP
			{ ppOutput = hPutStrLn xmproc
			, ppTitle = (\str -> "")
			, ppLayout = (\str -> "")
			,ppCurrent = xmobarColor "#507a91" ""
			, ppVisible = xmobarColor "8fa388" ""
			}
		}
	
myConfig = defaultConfig	
	{ borderWidth        = 6
	, normalBorderColor = "#bdbda4"
	, focusedBorderColor = "#507a91"
	, terminal = "xterm"
	, layoutHook = avoidStruts $ myLayout 
	, manageHook = manageHook defaultConfig <+> manageDocks
	, startupHook = startup
	} `additionalKeys` myKeys


myLayout = tiled ||| Mirror tiled ||| Full
  where
	tiled = equalSpacing 16 0 0 10 $ Tall nmaster delta ratio
	nmaster = 1
	ratio = 5/9
	delta = 3/100
	
startup = do
	spawn "xterm"
	
myKeys = [((mod1Mask, xK_p)
	, spawn "dmenu_run -fn 'Pixel Operator 11' -l '3' -nb '#151b1a' -nf '#8fa388' -sb '#474159' -sf '#8fa388' -b")
	]
