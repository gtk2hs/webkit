module Graphics.UI.Gtk.WebKit.DOM.DOMMimeTypeArray(
item,
namedItem,
getLength,
DOMMimeTypeArray,
castToDOMMimeTypeArray,
gTypeDOMMimeTypeArray,
DOMMimeTypeArrayClass,
toDOMMimeTypeArray,
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
     (MonadIO m, DOMMimeTypeArrayClass self) =>
       self -> Word -> m (Maybe DOMMimeType)
item self index
  = liftIO
      (maybeNull (makeNewGObject mkDOMMimeType)
         ({# call webkit_dom_dom_mime_type_array_item #}
            (toDOMMimeTypeArray self)
            (fromIntegral index)))
 
namedItem ::
          (MonadIO m, DOMMimeTypeArrayClass self, GlibString string) =>
            self -> string -> m (Maybe DOMMimeType)
namedItem self name
  = liftIO
      (maybeNull (makeNewGObject mkDOMMimeType)
         (withUTFString name $
            \ namePtr ->
              {# call webkit_dom_dom_mime_type_array_named_item #}
                (toDOMMimeTypeArray self)
                namePtr))
 
getLength ::
          (MonadIO m, DOMMimeTypeArrayClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_mime_type_array_get_length #}
            (toDOMMimeTypeArray self)))
