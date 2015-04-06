module Graphics.UI.Gtk.WebKit.DOM.BarProp(
#if WEBKIT_CHECK_VERSION(2,2,2)
getVisible,
BarProp,
castToBarProp,
gTypeBarProp,
BarPropClass,
toBarProp,
#endif
) where
#if WEBKIT_CHECK_VERSION(2,2,2)
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

 
getVisible :: (MonadIO m, BarPropClass self) => self -> m Bool
getVisible self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_bar_prop_get_visible #} (toBarProp self)))
#endif
