module Graphics.UI.Gtk.WebKit.DOM.UIEvent(
initUIEvent,
getView,
getDetail,
getKeyCode,
getCharCode,
getLayerX,
getLayerY,
getPageX,
getPageY,
getWhich,
UIEvent,
castToUIEvent,
gTypeUIEvent,
UIEventClass,
toUIEvent,
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
{#import Graphics.UI.Gtk.WebKit.Types#}
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
initUIEvent ::
            (MonadIO m, UIEventClass self, WindowClass view,
             GlibString string) =>
              self -> string -> Bool -> Bool -> Maybe view -> Int -> m ()
initUIEvent self type' canBubble cancelable view detail
  = liftIO
      (withUTFString type' $
         \ typePtr ->
           {# call webkit_dom_ui_event_init_ui_event #} (toUIEvent self)
             typePtr
         (fromBool canBubble)
         (fromBool cancelable)
         (maybe (Window nullForeignPtr) toWindow view)
         (fromIntegral detail))
 
getView ::
        (MonadIO m, UIEventClass self) => self -> m (Maybe Window)
getView self
  = liftIO
      (maybeNull (makeNewGObject mkWindow)
         ({# call webkit_dom_ui_event_get_view #} (toUIEvent self)))
 
getDetail :: (MonadIO m, UIEventClass self) => self -> m Int
getDetail self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_ui_event_get_detail #} (toUIEvent self)))
 
getKeyCode :: (MonadIO m, UIEventClass self) => self -> m Int
getKeyCode self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_ui_event_get_key_code #} (toUIEvent self)))
 
getCharCode :: (MonadIO m, UIEventClass self) => self -> m Int
getCharCode self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_ui_event_get_char_code #} (toUIEvent self)))
 
getLayerX :: (MonadIO m, UIEventClass self) => self -> m Int
getLayerX self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_ui_event_get_layer_x #} (toUIEvent self)))
 
getLayerY :: (MonadIO m, UIEventClass self) => self -> m Int
getLayerY self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_ui_event_get_layer_y #} (toUIEvent self)))
 
getPageX :: (MonadIO m, UIEventClass self) => self -> m Int
getPageX self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_ui_event_get_page_x #} (toUIEvent self)))
 
getPageY :: (MonadIO m, UIEventClass self) => self -> m Int
getPageY self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_ui_event_get_page_y #} (toUIEvent self)))
 
getWhich :: (MonadIO m, UIEventClass self) => self -> m Int
getWhich self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_ui_event_get_which #} (toUIEvent self)))
