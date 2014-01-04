module Graphics.UI.Gtk.WebKit.DOM.StorageInfo
       (
#if WEBKIT_CHECK_VERSION(1,10,0)
        cTEMPORARY, cPERSISTENT, StorageInfo, StorageInfoClass,
        castToStorageInfo, gTypeStorageInfo, toStorageInfo
#endif
       ) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
cTEMPORARY = 0
cPERSISTENT = 1
