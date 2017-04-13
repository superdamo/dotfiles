import XMonad
import XMonad.Layout.EqualSpacing
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO(hPutStrLn)

main = do
	xmproc <- spawnPipe "xmobar ~/.xmobarrc"
	xmonad $ myConfig
		{ logHook = dynamicLogWithPP $ xmobarPP
			{ ppOutput = hPutStrLn xmproc
			, ppTitle = (\str -> "")
			, ppLayout = (\str -> "")
			, ppCurrent = xmobarColor "#5a5a5a" ""
			, ppVisible = xmobarColor "bfb4a7" ""
			}
		}
	
myConfig = defaultConfig	
	{ borderWidth = 4
	, normalBorderColor = "#364544"
	, focusedBorderColor = "#5a5a5a"
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
	, spawn "dmenu_run -fn 'Pixel Operator 11' -l '3' -nb '#1a1a12' -nf '#bfb4a7' -sb '#2d2c21' -sf '#bfb4a7' -b")
	,((0, 0x1008ff11), spawn "amixer -D pulse sset Master 2%-")
	,((0, 0x1008ff13), spawn "amixer -D pulse sset Master 2%+")
	,((0, 0x1008ff12), spawn "amixer -D pulse sset Master toggle")
	,((0, 0x1008ff03), spawn "xbacklight -dec 5")
	,((0, 0x1008ff02), spawn "xbacklight -inc 5")
	]
