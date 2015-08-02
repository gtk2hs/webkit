module Graphics.UI.Gtk.WebKit.DOM.Touch(
#if WEBKIT_CHECK_VERSION(2,4,0)
getClientX,
getClientY,
getScreenX,
getScreenY,
getPageX,
getPageY,
getTarget,
getIdentifier,
getWebkitRadiusX,
getWebkitRadiusY,
getWebkitRotationAngle,
getWebkitForce,
Touch,
castToTouch,
gTypeTouch,
TouchClass,
toTouch,
#endif
) where
#if WEBKIT_CHECK_VERSION(2,4,0)
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

 
getClientX :: (MonadIO m, TouchClass self) => self -> m Int
getClientX self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_touch_get_client_x #} (toTouch self)))
 
getClientY :: (MonadIO m, TouchClass self) => self -> m Int
getClientY self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_touch_get_client_y #} (toTouch self)))
 
getScreenX :: (MonadIO m, TouchClass self) => self -> m Int
getScreenX self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_touch_get_screen_x #} (toTouch self)))
 
getScreenY :: (MonadIO m, TouchClass self) => self -> m Int
getScreenY self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_touch_get_screen_y #} (toTouch self)))
 
getPageX :: (MonadIO m, TouchClass self) => self -> m Int
getPageX self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_touch_get_page_x #} (toTouch self)))
 
getPageY :: (MonadIO m, TouchClass self) => self -> m Int
getPageY self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_touch_get_page_y #} (toTouch self)))
 
getTarget ::
          (MonadIO m, TouchClass self) => self -> m (Maybe EventTarget)
getTarget self
  = liftIO
      (maybeNull (makeNewGObject mkEventTarget)
         ({# call webkit_dom_touch_get_target #} (toTouch self)))
 
getIdentifier :: (MonadIO m, TouchClass self) => self -> m Word
getIdentifier self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_touch_get_identifier #} (toTouch self)))
 
getWebkitRadiusX :: (MonadIO m, TouchClass self) => self -> m Int
getWebkitRadiusX self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_touch_get_webkit_radius_x #} (toTouch self)))
 
getWebkitRadiusY :: (MonadIO m, TouchClass self) => self -> m Int
getWebkitRadiusY self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_touch_get_webkit_radius_y #} (toTouch self)))
 
getWebkitRotationAngle ::
                       (MonadIO m, TouchClass self) => self -> m Float
getWebkitRotationAngle self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_touch_get_webkit_rotation_angle #}
            (toTouch self)))
 
getWebkitForce :: (MonadIO m, TouchClass self) => self -> m Float
getWebkitForce self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_touch_get_webkit_force #} (toTouch self)))
#endif
