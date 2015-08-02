module Graphics.UI.Gtk.WebKit.DOM.DOMStringList(
item,
contains,
getLength,
DOMStringList,
castToDOMStringList,
gTypeDOMStringList,
DOMStringListClass,
toDOMStringList,
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

 
item ::
     (MonadIO m, DOMStringListClass self, GlibString string) =>
       self -> Word -> m (Maybe string)
item self index
  = liftIO
      (({# call webkit_dom_dom_string_list_item #} (toDOMStringList self)
          (fromIntegral index))
         >>=
         maybePeek readUTFString)
 
contains ::
         (MonadIO m, DOMStringListClass self, GlibString string) =>
           self -> string -> m Bool
contains self string
  = liftIO
      (toBool <$>
         (withUTFString string $
            \ stringPtr ->
              {# call webkit_dom_dom_string_list_contains #}
                (toDOMStringList self)
                stringPtr))
 
getLength :: (MonadIO m, DOMStringListClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_string_list_get_length #}
            (toDOMStringList self)))
