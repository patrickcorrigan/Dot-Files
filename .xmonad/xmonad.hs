import XMonad
import qualified XMonad.StackSet as W
import XMonad.Util.Dzen
import XMonad.Util.Themes
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Layout.Minimize
import XMonad.Layout.Accordion
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.Tabbed
import XMonad.Layout.Spacing
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Grid
import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Actions.WindowGo
import XMonad.Actions.CopyWindow
import System.IO
import System.Process
import XMonad.Hooks.ICCCMFocus

main = do
 statusBarPipe <- spawnPipe myStatusBar
 h <- spawnPipe myWorkspaceBar

 xmonad $ defaultConfig

  { manageHook = manageDocks<+> manageHook defaultConfig
  ,logHook = do
      takeTopFocus
      dynamicLogWithPP $ defaultPP { ppOutput = hPutStrLn h
      , ppCurrent           =   dzenColor "#00cdff" "#2b2b2b" . pad
      , ppVisible           =   dzenColor "white" "#2b2b2b" . pad
      , ppHidden            =   dzenColor "#ebac54" "#2b2b2b" . pad
      , ppHiddenNoWindows   =   dzenColor "#FFFFFF" "#2b2b2b" . pad
      , ppLayout   = dzenColor "lightblue" "#2b2b2b" . pad . drop 9
      , ppTitle    = const ""
      }
  ,layoutHook = minimize $ avoidStruts $ smartBorders (Full |||  Tall 1 (3/100) (1/2) ||| Mirror (Tall 1 (3/100) (1/2)) ||| tabbedBottom shrinkText (theme smallClean))
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
  ,((myModMask , xK_f), runOrRaise myBrowser (className =? "Firefox"))
  ,((myModMask , xK_d), runOrRaise myMediaPlayer (className =? "Vlc"))
  ,((myModMask , xK_c), runOrRaiseNext chromium (className =? "Chromium"))
  ,((myModMask , xK_v), runOrRaise "gvim" (className =? "Gvim"))
  ,((myModMask , xK_e), runOrRaise "emacs" (className =? "Emacs"))
  ,((myModMask , xK_r), runOrRaiseNext "evince" (className =? "Evince"))
  ,((myModMask , xK_s), raise (className =? "URxvt"))
  ,((myModMask , xK_i), raise (className =? "Eclipse"))
  ,((myModMask , xK_b), sendMessage ToggleStruts)
  ,((myModMask , xK_y), spawn myClipboardManager)
  ,((myModMask , xK_q), alert 100)
  ,((myModMask , xK_z), withFocused minimizeWindow)
  ,((myModMask , xK_a), sendMessage RestoreNextMinimizedWin)
  , ((myModMask, xK_u), sendMessage (Toggle "(spacing 5)Grid"))
  ,((0, 0x1008FF11), spawn myVolumeDown)
  ,((0, 0x1008FF12), spawn myToggleMute)
  ,((0, 0x1008FF13), spawn myVolumeUp)
  ,((0, 0x1008FF02), spawn myDisplayBrightnessUp)
  ,((0, 0x1008FF03), spawn myDisplayBrightnessDown)
  ,((0, 0x1008FF06), spawn myKeyboardBrightnessDown)
  ,((0, 0x1008FF05), spawn myKeyboardBrightnessUp)
  ,((myModMask, xK_a ), windows copyToAll)
  ,((myModMask .|. shiftMask, xK_a), killAllOtherCopies)
  ]

myTerminal
    = "urxvt -e zsh -c 'tmux -q has-session && exec tmux attach || exec tmux'"
myBrowser = "firefox"
myMediaPlayer = "vlc"
chromium = "chromium"
myBorderWidth = 1
myModMask = mod4Mask
myWorkspaces = ["One","Two","Three","Four", "Five"]
    --"5", "6", "7", "8", "9"]
-- myWorkspaces = ["Ⅰ","Ⅱ","Ⅲ","Ⅳ ",
    -- "5", "6", "7", "8", "9"]
myStatusBar = "conky -c .conkyrc | dzen2 -e '' -fn 'Source Code Pro For Powerline:size=8' -x 400 -w 880"
myWorkspaceBar = "dzen2 -e '' -fn 'Source Code Pro For Powerline:size=8' -x 0 -y 0 -w 400 -ta 'l'"
-- myWorkspaceBar = "dzen2 -e '' -fn 'Uushi:size=9' -x 0 -y 0 -w 400 -ta 'l'"
-- myWorkspaceBar = "dzen2 -fn 'Sans:size=10' -x 0 -y 0 -w 400 -ta 'l'"
myDmenu = "dmenu_run -b -fn 'Source Code Pro For Powerline-9'"
myLocker = "slock"
myFocusedBorderColor = "#ebac54"
myVolumeUp = "amixer set Master 10+ && volume_popup.sh"
myVolumeDown = "amixer set Master 10- && volume_popup.sh"
myToggleMute = "amixer set Master toggle && volume_popup.sh"
myDisplayBrightnessUp = "xbacklight -inc 10 && backlight_popup.sh"
myDisplayBrightnessDown = "xbacklight -dec 10 && backlight_popup.sh"
myKeyboardBrightnessUp = "kbdlight up"
myKeyboardBrightnessDown = "kbdlight down"
myClipboardManager = "copyq toggle"

volumeLevel = do
    x <- readProcess "volume_popup.sh" [] []
    return 9

showVolumeLevel x = do
    y <- volumeLevel
    print y

alert a = dzenConfig centered (show a)
centered =
        onCurr (center 200 50)
    >=> font "-*-helvetica-*-r-*-*-64-*-*-*-*-*-*-*"
    >=> addArgs ["-fg", "#80c0ff"]
    >=> addArgs ["-bg", "#000040"]
