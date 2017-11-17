import XMonad
import XMonad.Hooks.ManageDocks

main = xmonad def
    { terminal              = "xterm"
    , modMask               = mod4Mask
    , focusedBorderColor    = "#1793D1"
    , manageHook = manageHook defaultConfig <+> manageDocks
    }
