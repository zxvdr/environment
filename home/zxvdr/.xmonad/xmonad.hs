import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.NoBorders
import System.IO

myTerminal      = "gnome-terminal"

myManageHook = composeAll
    [ className =? "Gimp"        --> doFloat
    , className =? "Vncviewer"   --> doFloat
    , className =? "stalonetray" --> doIgnore
    , className =? "empathy"     --> doFloat
    ]

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/zxvdr/.xmobarrc"
    xmonad $ defaultConfig
        { terminal   = myTerminal
        , manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
        --, layoutHook = avoidStruts  $  layoutHook defaultConfig
        , layoutHook = avoidStruts $ smartBorders $ layoutHook defaultConfig
        , logHook    = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask    = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "gnome-screensaver-command --lock")
        ]
