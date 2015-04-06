module Graphics.UI.Gtk.WebKit.DOM.WheelEvent(
initWheelEvent,
pattern DOM_DELTA_PIXEL,
pattern DOM_DELTA_LINE,
pattern DOM_DELTA_PAGE,
getDeltaX,
getDeltaY,
getDeltaZ,
getDeltaMode,
getWheelDeltaX,
getWheelDeltaY,
getWheelDelta,
getWebkitDirectionInvertedFromDevice,
WheelEvent,
castToWheelEvent,
gTypeWheelEvent,
WheelEventClass,
toWheelEvent,
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

 
initWheelEvent ::
               (MonadIO m, WheelEventClass self, DOMWindowClass view) =>
                 self ->
                   Int ->
                     Int ->
                       Maybe view ->
                         Int -> Int -> Int -> Int -> Bool -> Bool -> Bool -> Bool -> m ()
initWheelEvent self wheelDeltaX wheelDeltaY view screenX screenY
  clientX clientY ctrlKey altKey shiftKey metaKey
  = liftIO
      ({# call webkit_dom_wheel_event_init_wheel_event #}
         (toWheelEvent self)
         (fromIntegral wheelDeltaX)
         (fromIntegral wheelDeltaY)
         (maybe (DOMWindow nullForeignPtr) toDOMWindow view)
         (fromIntegral screenX)
         (fromIntegral screenY)
         (fromIntegral clientX)
         (fromIntegral clientY)
         (fromBool ctrlKey)
         (fromBool altKey)
         (fromBool shiftKey)
         (fromBool metaKey))
pattern DOM_DELTA_PIXEL = 0
pattern DOM_DELTA_LINE = 1
pattern DOM_DELTA_PAGE = 2
 
getDeltaX :: (MonadIO m, WheelEventClass self) => self -> m Double
getDeltaX self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_wheel_event_get_delta_x #}
            (toWheelEvent self)))
 
getDeltaY :: (MonadIO m, WheelEventClass self) => self -> m Double
getDeltaY self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_wheel_event_get_delta_y #}
            (toWheelEvent self)))
 
getDeltaZ :: (MonadIO m, WheelEventClass self) => self -> m Double
getDeltaZ self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_wheel_event_get_delta_z #}
            (toWheelEvent self)))
 
getDeltaMode :: (MonadIO m, WheelEventClass self) => self -> m Word
getDeltaMode self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_wheel_event_get_delta_mode #}
            (toWheelEvent self)))
 
getWheelDeltaX ::
               (MonadIO m, WheelEventClass self) => self -> m Int
getWheelDeltaX self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_wheel_event_get_wheel_delta_x #}
            (toWheelEvent self)))
 
getWheelDeltaY ::
               (MonadIO m, WheelEventClass self) => self -> m Int
getWheelDeltaY self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_wheel_event_get_wheel_delta_y #}
            (toWheelEvent self)))
 
getWheelDelta :: (MonadIO m, WheelEventClass self) => self -> m Int
getWheelDelta self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_wheel_event_get_wheel_delta #}
            (toWheelEvent self)))
 
getWebkitDirectionInvertedFromDevice ::
                                     (MonadIO m, WheelEventClass self) => self -> m Bool
getWebkitDirectionInvertedFromDevice self
  = liftIO
      (toBool <$>
         ({# call
            webkit_dom_wheel_event_get_webkit_direction_inverted_from_device
            #}
            (toWheelEvent self)))
