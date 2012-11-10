module Graphics.UI.Gtk.WebKit.DOM.File (fileGetName) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
fileGetName :: (FileClass self) => self -> IO String
fileGetName self
  = ({# call webkit_dom_file_get_name #} (toFile self)) >>=
      readUTFString
