module Graphics.UI.Gtk.WebKit.DOM.WebKitPoint(
setX,
getX,
setY,
getY,
WebKitPoint,
castToWebKitPoint,
gTypeWebKitPoint,
WebKitPointClass,
toWebKitPoint,
) where
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

 
setX :: (MonadIO m, WebKitPointClass self) => self -> Float -> m ()
setX self val
  = liftIO
      ({# call webkit_dom_webkit_point_set_x #} (toWebKitPoint self)
         (realToFrac val))
 
getX :: (MonadIO m, WebKitPointClass self) => self -> m Float
getX self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_webkit_point_get_x #} (toWebKitPoint self)))
 
setY :: (MonadIO m, WebKitPointClass self) => self -> Float -> m ()
setY self val
  = liftIO
      ({# call webkit_dom_webkit_point_set_y #} (toWebKitPoint self)
         (realToFrac val))
 
getY :: (MonadIO m, WebKitPointClass self) => self -> m Float
getY self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_webkit_point_get_y #} (toWebKitPoint self)))
