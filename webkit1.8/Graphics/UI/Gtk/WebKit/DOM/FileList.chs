module Graphics.UI.Gtk.WebKit.DOM.FileList
       (fileListItem, fileListGetLength) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
fileListItem ::
             (FileListClass self) => self -> Word -> IO (Maybe File)
fileListItem self index
  = maybeNull (makeNewGObject mkFile)
      ({# call webkit_dom_file_list_item #} (toFileList self)
         (fromIntegral index))
 
fileListGetLength :: (FileListClass self) => self -> IO Word
fileListGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_file_list_get_length #} (toFileList self))
