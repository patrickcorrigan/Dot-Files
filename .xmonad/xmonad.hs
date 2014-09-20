import XMonad
import XMonad.Util.Dzen
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Actions.WindowGo
import System.IO
import System.Process


main = do
 statusBarPipe <- spawnPipe myStatusBar 
 h <- spawnPipe myWorkspaceBar

 xmonad $ defaultConfig

  { manageHook = manageDocks<+> manageHook defaultConfig
  ,layoutHook = avoidStruts $ smartBorders $ layoutHook defaultConfig
  ,logHook = dynamicLogWithPP $ defaultPP { ppOutput = hPutStrLn h 
      , ppCurrent           =   dzenColor "#ebac54" "#1B1D1E" . pad
      , ppVisible           =   dzenColor "white" "#1B1D1E" . pad
      , ppHidden            =   dzenColor "white" "#1B1D1E" . pad
      , ppHiddenNoWindows   =   dzenColor "#7b7b7b" "#1B1D1E" . pad
      , ppLayout   = dzenColor "lightblue" "#222222" . pad
      , ppTitle    = ("^fg(grey) " ++) . dzenEscape
  }
  ,terminal = myTerminal
  ,modMask = myModMask
  ,borderWidth = myBorderWidth
  ,workspaces = myWorkspaces
  ,focusedBorderColor = myFocusedBorderColor
  }
  `additionalKeys`
  [((myModMask, xK_p), spawn myDmenu) 
  ,((myModMask .|. shiftMask, xK_l), spawn myLocker) 
  ,((myModMask .|. shiftMask, xK_o), spawn myBrowser) 
  ,((myModMask , xK_o), runOrRaise myBrowser (className =? "Firefox"))
  ,((myModMask , xK_c), runOrRaise chromium (className =? "Chromium"))
  ,((myModMask , xK_C), runOrRaise tsocks_chromium (className =? "Chromium"))
  ,((myModMask , xK_v), runOrRaise "gvim" (className =? "Gvim"))
  ,((myModMask , xK_e), runOrRaise "emacs" (className =? "Emacs"))
  ,((myModMask , xK_s), raise (className =? "URxvt"))
  ,((myModMask , xK_b), sendMessage ToggleStruts)
  ,((0, 0x1008FF11), spawn myVolumeDown >>= alert)
  ,((0, 0x1008FF12), spawn myToggleMute >>= alert)
  ,((0, 0x1008FF13), spawn myVolumeUp >>= alert)
  ,((0, 0x1008FF02), spawn myDisplayBrightnessUp)
  ,((0, 0x1008FF03), spawn myDisplayBrightnessDown)
  ,((0, 0x1008FF06), spawn myKeyboardBrightnessDown)
  ,((0, 0x1008FF05), spawn myKeyboardBrightnessUp)
  ]

myTerminal 
    = "urxvt -e zsh -c 'tmux -q has-session && exec tmux attach || exec tmux'"
myBrowser = "firefox"
chromium = "chromium"
tsocks_chromium = "tsocks chromium"
myBorderWidth = 1
myModMask = mod4Mask
myWorkspaces = ["1","2","3","4",
    "5", "6", "7", "8", "9"]
-- myWorkspaces = ["Ⅰ","Ⅱ","Ⅲ","Ⅳ ",
    -- "5", "6", "7", "8", "9"]
myStatusBar = "conky -c .conkyrc | dzen2 -x 400 -w 880"
myWorkspaceBar = "dzen2 -x 0 -y 0 -w 400 -ta 'l'"
myDmenu = "dmenu_run -b"
myLocker = "slock"
myFocusedBorderColor = "#ebac54"
myVolumeUp = "amixer set Master 10+"
myVolumeDown = "amixer set Master 10-"
myToggleMute = "amixer set Master toggle"
myDisplayBrightnessUp = "xbacklight -inc 10"
myDisplayBrightnessDown = "xbacklight -dec 10"
myKeyboardBrightnessUp = "kbdlight up"
myKeyboardBrightnessDown = "kbdlight down"

volumeLevel = do
    readProcess "echo" ["hello"] []
    return ()


alert a = dzenConfig centered (show a)
centered =
        onCurr (center 50 50)
    >=> font "-*-helvetica-*-r-*-*-64-*-*-*-*-*-*-*"
    >=> addArgs ["-fg", "#80c0ff"]
    >=> addArgs ["-bg", "#000040"]
