module Graphics.UI.Gtk.WebKit.DOM.Screen(
getHeight,
getWidth,
getColorDepth,
getPixelDepth,
getAvailLeft,
getAvailTop,
getAvailHeight,
getAvailWidth,
Screen,
castToScreen,
gTypeScreen,
ScreenClass,
toScreen,
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

 
getHeight :: (MonadIO m, ScreenClass self) => self -> m Word
getHeight self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_screen_get_height #} (toScreen self)))
 
getWidth :: (MonadIO m, ScreenClass self) => self -> m Word
getWidth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_screen_get_width #} (toScreen self)))
 
getColorDepth :: (MonadIO m, ScreenClass self) => self -> m Word
getColorDepth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_screen_get_color_depth #} (toScreen self)))
 
getPixelDepth :: (MonadIO m, ScreenClass self) => self -> m Word
getPixelDepth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_screen_get_pixel_depth #} (toScreen self)))
 
getAvailLeft :: (MonadIO m, ScreenClass self) => self -> m Int
getAvailLeft self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_screen_get_avail_left #} (toScreen self)))
 
getAvailTop :: (MonadIO m, ScreenClass self) => self -> m Int
getAvailTop self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_screen_get_avail_top #} (toScreen self)))
 
getAvailHeight :: (MonadIO m, ScreenClass self) => self -> m Word
getAvailHeight self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_screen_get_avail_height #} (toScreen self)))
 
getAvailWidth :: (MonadIO m, ScreenClass self) => self -> m Word
getAvailWidth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_screen_get_avail_width #} (toScreen self)))
