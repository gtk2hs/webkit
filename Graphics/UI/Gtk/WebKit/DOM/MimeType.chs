module Graphics.UI.Gtk.WebKit.DOM.MimeType(
getSuffixes,
getDescription,
getEnabledPlugin,
MimeType,
castToMimeType,
gTypeMimeType,
MimeTypeClass,
toMimeType,
) where
import Prelude hiding (drop, error, print)
import Data.Typeable (Typeable)
import Foreign.Marshal (maybePeek, maybeWith)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CLLong(..), CULLong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
{#import Graphics.UI.Gtk.WebKit.Types#}
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
getSuffixes ::
            (MonadIO m, MimeTypeClass self, GlibString string) =>
              self -> m string
getSuffixes self
  = liftIO
      (({# call webkit_dom_dom_mime_type_get_suffixes #}
          (toMimeType self))
         >>=
         readUTFString)
 
getDescription ::
               (MonadIO m, MimeTypeClass self, GlibString string) =>
                 self -> m string
getDescription self
  = liftIO
      (({# call webkit_dom_dom_mime_type_get_description #}
          (toMimeType self))
         >>=
         readUTFString)
 
getEnabledPlugin ::
                 (MonadIO m, MimeTypeClass self) => self -> m (Maybe Plugin)
getEnabledPlugin self
  = liftIO
      (maybeNull (makeNewGObject mkPlugin)
         ({# call webkit_dom_dom_mime_type_get_enabled_plugin #}
            (toMimeType self)))
