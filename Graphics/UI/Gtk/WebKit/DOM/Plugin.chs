module Graphics.UI.Gtk.WebKit.DOM.Plugin(
item,
namedItem,
getName,
getFilename,
getDescription,
getLength,
Plugin,
castToPlugin,
gTypePlugin,
PluginClass,
toPlugin,
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
     (MonadIO m, PluginClass self) => self -> Word -> m (Maybe MimeType)
item self index
  = liftIO
      (maybeNull (makeNewGObject mkMimeType)
         ({# call webkit_dom_dom_plugin_item #} (toPlugin self)
            (fromIntegral index)))
 
namedItem ::
          (MonadIO m, PluginClass self, GlibString string) =>
            self -> string -> m (Maybe MimeType)
namedItem self name
  = liftIO
      (maybeNull (makeNewGObject mkMimeType)
         (withUTFString name $
            \ namePtr ->
              {# call webkit_dom_dom_plugin_named_item #} (toPlugin self)
                namePtr))
 
getName ::
        (MonadIO m, PluginClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_dom_plugin_get_name #} (toPlugin self)) >>=
         readUTFString)
 
getFilename ::
            (MonadIO m, PluginClass self, GlibString string) =>
              self -> m string
getFilename self
  = liftIO
      (({# call webkit_dom_dom_plugin_get_filename #} (toPlugin self))
         >>=
         readUTFString)
 
getDescription ::
               (MonadIO m, PluginClass self, GlibString string) =>
                 self -> m string
getDescription self
  = liftIO
      (({# call webkit_dom_dom_plugin_get_description #} (toPlugin self))
         >>=
         readUTFString)
 
getLength :: (MonadIO m, PluginClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_plugin_get_length #} (toPlugin self)))
