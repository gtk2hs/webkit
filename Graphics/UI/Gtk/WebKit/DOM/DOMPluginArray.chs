module Graphics.UI.Gtk.WebKit.DOM.DOMPluginArray(
item,
namedItem,
refresh,
getLength,
DOMPluginArray,
castToDOMPluginArray,
gTypeDOMPluginArray,
DOMPluginArrayClass,
toDOMPluginArray,
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

 
item ::
     (MonadIO m, DOMPluginArrayClass self) =>
       self -> Word -> m (Maybe DOMPlugin)
item self index
  = liftIO
      (maybeNull (makeNewGObject mkDOMPlugin)
         ({# call webkit_dom_dom_plugin_array_item #}
            (toDOMPluginArray self)
            (fromIntegral index)))
 
namedItem ::
          (MonadIO m, DOMPluginArrayClass self, GlibString string) =>
            self -> string -> m (Maybe DOMPlugin)
namedItem self name
  = liftIO
      (maybeNull (makeNewGObject mkDOMPlugin)
         (withUTFString name $
            \ namePtr ->
              {# call webkit_dom_dom_plugin_array_named_item #}
                (toDOMPluginArray self)
                namePtr))
 
refresh ::
        (MonadIO m, DOMPluginArrayClass self) => self -> Bool -> m ()
refresh self reload
  = liftIO
      ({# call webkit_dom_dom_plugin_array_refresh #}
         (toDOMPluginArray self)
         (fromBool reload))
 
getLength ::
          (MonadIO m, DOMPluginArrayClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_plugin_array_get_length #}
            (toDOMPluginArray self)))
