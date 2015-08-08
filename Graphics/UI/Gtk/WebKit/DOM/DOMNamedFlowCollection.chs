module Graphics.UI.Gtk.WebKit.DOM.DOMNamedFlowCollection(
#if WEBKIT_CHECK_VERSION(2,2,2)
item,
namedItem,
getLength,
DOMNamedFlowCollection,
castToDOMNamedFlowCollection,
gTypeDOMNamedFlowCollection,
DOMNamedFlowCollectionClass,
toDOMNamedFlowCollection,
#endif
) where
#if WEBKIT_CHECK_VERSION(2,2,2)
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

 
item ::
     (MonadIO m, DOMNamedFlowCollectionClass self) =>
       self -> Word -> m (Maybe WebKitNamedFlow)
item self index
  = liftIO
      (maybeNull (makeNewGObject mkWebKitNamedFlow)
         ({# call webkit_dom_dom_named_flow_collection_item #}
            (toDOMNamedFlowCollection self)
            (fromIntegral index)))
 
namedItem ::
          (MonadIO m, DOMNamedFlowCollectionClass self, GlibString string) =>
            self -> string -> m (Maybe WebKitNamedFlow)
namedItem self name
  = liftIO
      (maybeNull (makeNewGObject mkWebKitNamedFlow)
         (withUTFString name $
            \ namePtr ->
              {# call webkit_dom_dom_named_flow_collection_named_item #}
                (toDOMNamedFlowCollection self)
                namePtr))
 
getLength ::
          (MonadIO m, DOMNamedFlowCollectionClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_named_flow_collection_get_length #}
            (toDOMNamedFlowCollection self)))
#endif
