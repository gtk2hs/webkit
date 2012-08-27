module Graphics.UI.Gtk.WebKit.DOM.Blob (blobGetSize) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
blobGetSize :: (BlobClass self) => self -> IO Word64
blobGetSize self
  = fromIntegral <$>
      ({# call webkit_dom_blob_get_size #} (toBlob self))
