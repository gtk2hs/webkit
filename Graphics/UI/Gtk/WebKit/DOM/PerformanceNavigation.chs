module Graphics.UI.Gtk.WebKit.DOM.PerformanceNavigation(
pattern TYPE_NAVIGATE,
pattern TYPE_RELOAD,
pattern TYPE_BACK_FORWARD,
pattern TYPE_RESERVED,
getRedirectCount,
PerformanceNavigation,
castToPerformanceNavigation,
gTypePerformanceNavigation,
PerformanceNavigationClass,
toPerformanceNavigation,
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

pattern TYPE_NAVIGATE = 0
pattern TYPE_RELOAD = 1
pattern TYPE_BACK_FORWARD = 2
pattern TYPE_RESERVED = 255
 
getRedirectCount ::
                 (MonadIO m, PerformanceNavigationClass self) => self -> m Word
getRedirectCount self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_navigation_get_redirect_count #}
            (toPerformanceNavigation self)))
