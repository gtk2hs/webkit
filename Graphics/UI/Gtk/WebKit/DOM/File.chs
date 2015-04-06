module Graphics.UI.Gtk.WebKit.DOM.File(
getName,
#if WEBKIT_CHECK_VERSION(99,0,0)
getLastModifiedDate,
#endif
File,
castToFile,
gTypeFile,
FileClass,
toFile,
) where
import Prelude hiding (drop, error, print)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
getName ::
        (MonadIO m, FileClass self, GlibString string) => self -> m string
getName self
  = liftIO
      (({# call webkit_dom_file_get_name #} (toFile self)) >>=
         readUTFString)

#if WEBKIT_CHECK_VERSION(99,0,0) 
getLastModifiedDate ::
                    (MonadIO m, FileClass self) => self -> m (Maybe Date)
getLastModifiedDate self
  = liftIO
      (maybeNull (makeNewGObject mkDate)
         ({# call webkit_dom_file_get_last_modified_date #} (toFile self)))
#endif
