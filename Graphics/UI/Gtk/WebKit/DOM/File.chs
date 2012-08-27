module Graphics.UI.Gtk.WebKit.DOM.File
       (fileGetName, fileGetFileName, fileGetFileSize) where
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
 
fileGetFileName :: (FileClass self) => self -> IO String
fileGetFileName self
  = ({# call webkit_dom_file_get_file_name #} (toFile self)) >>=
      readUTFString
 
fileGetFileSize :: (FileClass self) => self -> IO Word64
fileGetFileSize self
  = fromIntegral <$>
      ({# call webkit_dom_file_get_file_size #} (toFile self))
