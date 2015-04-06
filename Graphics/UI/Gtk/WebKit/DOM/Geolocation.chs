module Graphics.UI.Gtk.WebKit.DOM.Geolocation(
clearWatch,
Geolocation,
castToGeolocation,
gTypeGeolocation,
GeolocationClass,
toGeolocation,
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

 
clearWatch ::
           (MonadIO m, GeolocationClass self) => self -> Int -> m ()
clearWatch self watchID
  = liftIO
      ({# call webkit_dom_geolocation_clear_watch #} (toGeolocation self)
         (fromIntegral watchID))
