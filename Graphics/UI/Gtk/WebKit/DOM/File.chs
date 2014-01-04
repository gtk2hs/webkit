module Graphics.UI.Gtk.WebKit.DOM.File
       (fileGetName,
#if WEBKIT_CHECK_VERSION(2,2,2)
        fileGetWebkitRelativePath,
#endif
        File, FileClass, castToFile, gTypeFile, toFile) where
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
 
#if WEBKIT_CHECK_VERSION(2,2,2)
fileGetWebkitRelativePath :: (FileClass self) => self -> IO String
fileGetWebkitRelativePath self
  = ({# call webkit_dom_file_get_webkit_relative_path #}
       (toFile self))
      >>=
      readUTFString
#endif