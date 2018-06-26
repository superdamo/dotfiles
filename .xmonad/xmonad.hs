import XMonad
import XMonad.Layout.Renamed
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Layout.NoBorders
import XMonad.Layout.Grid
import XMonad.Layout.Spiral
import XMonad.Layout.AutoMaster
import XMonad.Layout.EqualSpacing
import XMonad.Layout.ResizableTile
--import XMonad.Layout.IndependentScreens
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog
import XMonad.Actions.WindowGo
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.WorkspaceCompare
import XMonad.Util.EZConfig(additionalKeys)
import System.IO(hPutStrLn)
import Data.List
--import qualified XMonad.StackSet as W
--import qualified Data.Map as M

main = do
    xmproc <- spawnPipe "xmobar ~/.xmobarrc"
    xmonad $ myConfig xmproc

myConfig xmproc = defaultConfig
    { borderWidth = 0
    , normalBorderColor = "#bfb4a7"--"#1a1a12"--"#364544"
    , focusedBorderColor = "#bfb4a7"--"#5a5a5a"
    , terminal = "xterm"
    , layoutHook = myLayout--avoidStruts $ myLayout
    , workspaces = myWorkspaces --withScreens 2 myWorkspaces
    , manageHook = myManageHook <+> manageHook defaultConfig --defaultConfig <+> manageDocks
    , logHook = myLogHook xmproc
    } `additionalKeys` myKeys

myLayout = avoidStruts (renamed [Replace "<icon=tall.xbm/>"] $ tiled)
    ||| avoidStruts (renamed [Replace "<icon=mirror.xbm/>"] $ Mirror tiled)
    ||| noBorders Full
    ||| avoidStruts (renamed [Replace "<icon=spiral.xbm/>"] $ Mirror gSpiral)
    ||| avoidStruts (renamed [Replace "<icon=grid.xbm/>"] $ gGrid)
    ||| avoidStruts (renamed [Replace "<icon=gaps.xbm/>"] $ gGaps)
    where
        tiled = equalSpacing 24 0 0 10 $ ResizableTall nmaster delta ratio []
        gSpiral = spacing 24 $ autoMaster 1 (3/100) spiralling
        spiralling = spiral (6/7)
        gGrid = equalSpacing 24 0 0 10 $ Grid
        gGaps = gaps [(R,36), (L,36)] $ space
        space = spacing 24 $ Tall nmaster delta ratio
        nmaster = 1
        ratio = 7/13
        delta = 3/100
        mGrid = Mirror Grid

xmobarEscape = concatMap doubleLts
    where
        doubleLts '<' = "<<"
        doubleLts x   = [x]

myWorkspaces = clickable . (map xmobarEscape) $ ["1","2","3","4","5"]
    where 
        clickable l =
            [ "<action=xdotool key alt+" ++ show (n) ++ ">" ++ ws ++ "</action>" |
            (i,ws) <- zip [1..5] l,                                        
            let n = i
            ]

myManageHook = composeAll . concat $
    [ [ className =? "feh" --> doFloat ]
    , [ className =? "pluginloader.exe" --> doFullFloat ]
    , [ className =? "chromium-browser" --> doShift (myWorkspaces !! 2) ]
    , [ manageDocks ]
    ]

myLogHook = dynamicLogWithPP . myPP

myPP xmproc = defaultPP
    { ppOutput = hPutStrLn xmproc
    , ppTitle = (\str -> "")
    , ppCurrent = xmobarColor "#bfb4a7" "#394b49"-- . wrap " " " "
    , ppHidden = xmobarColor "#bfb4a7" "#1a1a12"-- . wrap " " " "
    , ppOrder = reverse
    --, ppSort = getSortByXineramaRule
    , ppVisible = wrap "[" "]"
    , ppUrgent = xmobarColor "#573e4c" "#1a1a12"
    , ppSep = " | "
    }

--startup = do
--	spawn "xterm"

myKeys = [ ((mod1Mask, xK_p), spawn "rofi -show run")
    , ((0, 0x1008ff11), spawn "amixer -D pulse sset Master 2%-")
    , ((0, 0x1008ff13), spawn "amixer -D pulse sset Master 2%+")
    , ((0, 0x1008ff12), spawn "amixer -D pulse sset Master toggle")
    , ((0, 0x1008ff03), spawn "xbacklight -dec 5")
    , ((0, 0x1008ff02), spawn "xbacklight -inc 5")
    , ((mod1Mask, xK_a), sendMessage MirrorShrink)
    , ((mod1Mask, xK_z), sendMessage MirrorExpand)
    --, ((mod1Mask, xK_s), sendMessage LessSpacing)
    --, ((mod1Mask, xK_x), sendMessage MoreSpacing)
    ]

--keyBindings conf = let m = modMask conf in M.fromList $
--    [((m .|. mod1Mask, k), windows $ onCurrentScreen f i)
--        | (i, k) <- zip (workspaces' conf) [xK_1 .. xK_5]
--        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
--    ]
