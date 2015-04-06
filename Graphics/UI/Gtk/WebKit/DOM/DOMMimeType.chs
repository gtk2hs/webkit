module Graphics.UI.Gtk.WebKit.DOM.DOMMimeType(
getSuffixes,
getDescription,
getEnabledPlugin,
DOMMimeType,
castToDOMMimeType,
gTypeDOMMimeType,
DOMMimeTypeClass,
toDOMMimeType,
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

 
getSuffixes ::
            (MonadIO m, DOMMimeTypeClass self, GlibString string) =>
              self -> m string
getSuffixes self
  = liftIO
      (({# call webkit_dom_dom_mime_type_get_suffixes #}
          (toDOMMimeType self))
         >>=
         readUTFString)
 
getDescription ::
               (MonadIO m, DOMMimeTypeClass self, GlibString string) =>
                 self -> m string
getDescription self
  = liftIO
      (({# call webkit_dom_dom_mime_type_get_description #}
          (toDOMMimeType self))
         >>=
         readUTFString)
 
getEnabledPlugin ::
                 (MonadIO m, DOMMimeTypeClass self) => self -> m (Maybe DOMPlugin)
getEnabledPlugin self
  = liftIO
      (maybeNull (makeNewGObject mkDOMPlugin)
         ({# call webkit_dom_dom_mime_type_get_enabled_plugin #}
            (toDOMMimeType self)))
