import XMonad
import XMonad.Config.Desktop

main = xmonad desktopConfig
    { terminal              = "xterm"
    , modMask               = mod4Mask
    , focusedBorderColor    = "#1793D1"
    }
