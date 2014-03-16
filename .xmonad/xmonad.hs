import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.NoBorders
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
 statusBarPipe <- spawnPipe myStatusBar 
 defaultConfig <- dzen defaultConfig {PP = dzenPP{ ppHidden = const "" }}
 xmonad $ defaultConfig

  { manageHook = manageDocks<+> manageHook defaultConfig 	
  ,layoutHook = avoidStruts $ smartBorders $ layoutHook defaultConfig
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
  ,((0, 0x1008FF11), spawn myVolumeDown)
  ,((0, 0x1008FF12), spawn myToggleMute)
  ,((0, 0x1008FF13), spawn myVolumeUp)
  ,((0, 0x1008FF02), spawn myDisplayBrightnessUp)
  ,((0, 0x1008FF03), spawn myDisplayBrightnessDown)
  ]

myTerminal 
    = "urxvt -e zsh -c 'tmux -q has-session && exec tmux attach || exec tmux'"
myBrowser = "firefox"
myBorderWidth = 1
myModMask = mod4Mask
myWorkspaces = ["Ø","Ⅰ","Ⅱ","Ⅲ","Ⅳ ",
    "5", "6", "7", "8", "9"]
myStatusBar = "conky -c .conkyrc | dzen2 -x 400"
myDmenu = "dmenu_run -b"
myLocker = "slock"
myFocusedBorderColor = "#FF8bd2"
myVolumeUp = "amixer set Master 10+"
myVolumeDown = "amixer set Master 10-"
myToggleMute = "amixer set Master toggle"
myDisplayBrightnessUp = "xbacklight -inc 10"
myDisplayBrightnessDown = "xbacklight -dec 10"
