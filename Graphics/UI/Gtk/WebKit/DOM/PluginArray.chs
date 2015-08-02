module Graphics.UI.Gtk.WebKit.DOM.PluginArray(
item,
namedItem,
refresh,
getLength,
PluginArray,
castToPluginArray,
gTypePluginArray,
PluginArrayClass,
toPluginArray,
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
     (MonadIO m, PluginArrayClass self) =>
       self -> Word -> m (Maybe Plugin)
item self index
  = liftIO
      (maybeNull (makeNewGObject mkPlugin)
         ({# call webkit_dom_dom_plugin_array_item #} (toPluginArray self)
            (fromIntegral index)))
 
namedItem ::
          (MonadIO m, PluginArrayClass self, GlibString string) =>
            self -> string -> m (Maybe Plugin)
namedItem self name
  = liftIO
      (maybeNull (makeNewGObject mkPlugin)
         (withUTFString name $
            \ namePtr ->
              {# call webkit_dom_dom_plugin_array_named_item #}
                (toPluginArray self)
                namePtr))
 
refresh ::
        (MonadIO m, PluginArrayClass self) => self -> Bool -> m ()
refresh self reload
  = liftIO
      ({# call webkit_dom_dom_plugin_array_refresh #}
         (toPluginArray self)
         (fromBool reload))
 
getLength :: (MonadIO m, PluginArrayClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_plugin_array_get_length #}
            (toPluginArray self)))
