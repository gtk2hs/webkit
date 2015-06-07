module Graphics.UI.Gtk.WebKit.DOM.MimeTypeArray(
item,
namedItem,
getLength,
MimeTypeArray,
castToMimeTypeArray,
gTypeMimeTypeArray,
MimeTypeArrayClass,
toMimeTypeArray,
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

 
item ::
     (MonadIO m, MimeTypeArrayClass self) =>
       self -> Word -> m (Maybe MimeType)
item self index
  = liftIO
      (maybeNull (makeNewGObject mkMimeType)
         ({# call webkit_dom_dom_mime_type_array_item #}
            (toMimeTypeArray self)
            (fromIntegral index)))
 
namedItem ::
          (MonadIO m, MimeTypeArrayClass self, GlibString string) =>
            self -> string -> m (Maybe MimeType)
namedItem self name
  = liftIO
      (maybeNull (makeNewGObject mkMimeType)
         (withUTFString name $
            \ namePtr ->
              {# call webkit_dom_dom_mime_type_array_named_item #}
                (toMimeTypeArray self)
                namePtr))
 
getLength :: (MonadIO m, MimeTypeArrayClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_mime_type_array_get_length #}
            (toMimeTypeArray self)))
