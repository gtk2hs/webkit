module Graphics.UI.Gtk.WebKit.DOM.MediaError(
pattern MEDIA_ERR_ABORTED,
pattern MEDIA_ERR_NETWORK,
pattern MEDIA_ERR_DECODE,
pattern MEDIA_ERR_SRC_NOT_SUPPORTED,
pattern MEDIA_ERR_ENCRYPTED,
getCode,
MediaError,
castToMediaError,
gTypeMediaError,
MediaErrorClass,
toMediaError,
) where
import Prelude hiding (drop, error, print)
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

pattern MEDIA_ERR_ABORTED = 1
pattern MEDIA_ERR_NETWORK = 2
pattern MEDIA_ERR_DECODE = 3
pattern MEDIA_ERR_SRC_NOT_SUPPORTED = 4
pattern MEDIA_ERR_ENCRYPTED = 5
 
getCode :: (MonadIO m, MediaErrorClass self) => self -> m Word
getCode self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_media_error_get_code #} (toMediaError self)))
