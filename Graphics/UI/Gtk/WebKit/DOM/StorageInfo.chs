module Graphics.UI.Gtk.WebKit.DOM.StorageInfo
       (cTEMPORARY, cPERSISTENT) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
cTEMPORARY = 0
cPERSISTENT = 1
