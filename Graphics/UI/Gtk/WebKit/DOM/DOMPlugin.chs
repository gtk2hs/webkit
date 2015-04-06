module Graphics.UI.Gtk.WebKit.DOM.DOMPlugin(
item,
namedItem,
getName,
getFilename,
getDescription,
getLength,
DOMPlugin,
castToDOMPlugin,
gTypeDOMPlugin,
DOMPluginClass,
toDOMPlugin,
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
     (MonadIO m, DOMPluginClass self) =>
       self -> Word -> m (Maybe DOMMimeType)
item self index
  = liftIO
      (maybeNull (makeNewGObject mkDOMMimeType)
         ({# call webkit_dom_dom_plugin_item #} (toDOMPlugin self)
            (fromIntegral index)))
 
namedItem ::
          (MonadIO m, DOMPluginClass self, GlibString string) =>
            self -> string -> m (Maybe DOMMimeType)
namedItem self name
  = liftIO
      (maybeNull (makeNewGObject mkDOMMimeType)
         (withUTFString name $
            \ namePtr ->
              {# call webkit_dom_dom_plugin_named_item #} (toDOMPlugin self)
                namePtr))
 
getName ::
        (MonadIO m, DOMPluginClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_dom_plugin_get_name #} (toDOMPlugin self)) >>=
         readUTFString)
 
getFilename ::
            (MonadIO m, DOMPluginClass self, GlibString string) =>
              self -> m string
getFilename self
  = liftIO
      (({# call webkit_dom_dom_plugin_get_filename #} (toDOMPlugin self))
         >>=
         readUTFString)
 
getDescription ::
               (MonadIO m, DOMPluginClass self, GlibString string) =>
                 self -> m string
getDescription self
  = liftIO
      (({# call webkit_dom_dom_plugin_get_description #}
          (toDOMPlugin self))
         >>=
         readUTFString)
 
getLength :: (MonadIO m, DOMPluginClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_plugin_get_length #} (toDOMPlugin self)))
