module Graphics.UI.Gtk.WebKit.DOM.Blob(
slice,
getSize,
Blob,
castToBlob,
gTypeBlob,
BlobClass,
toBlob,
) where
import Prelude hiding (drop, error, print)
import Data.Typeable (Typeable)
import Foreign.Marshal (maybePeek, maybeWith)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
{#import Graphics.UI.Gtk.WebKit.Types#}
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
slice ::
      (MonadIO m, BlobClass self, GlibString string) =>
        self -> Int64 -> Int64 -> (Maybe string) -> m (Maybe Blob)
slice self start end contentType
  = liftIO
      (maybeNull (makeNewGObject mkBlob)
         (maybeWith withUTFString contentType $
            \ contentTypePtr ->
              {# call webkit_dom_blob_slice #} (toBlob self) (fromIntegral start)
                (fromIntegral end)
                contentTypePtr))
 
getSize :: (MonadIO m, BlobClass self) => self -> m Word64
getSize self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_blob_get_size #} (toBlob self)))
