module Graphics.UI.Gtk.WebKit.DOM.Performance(
#if WEBKIT_CHECK_VERSION(2,2,2)
now,
getNavigation,
getTiming,
Performance,
castToPerformance,
gTypePerformance,
PerformanceClass,
toPerformance,
#endif
) where
#if WEBKIT_CHECK_VERSION(2,2,2)
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

 
now :: (MonadIO m, PerformanceClass self) => self -> m Double
now self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_performance_now #} (toPerformance self)))
 
getNavigation ::
              (MonadIO m, PerformanceClass self) =>
                self -> m (Maybe PerformanceNavigation)
getNavigation self
  = liftIO
      (maybeNull (makeNewGObject mkPerformanceNavigation)
         ({# call webkit_dom_performance_get_navigation #}
            (toPerformance self)))
 
getTiming ::
          (MonadIO m, PerformanceClass self) =>
            self -> m (Maybe PerformanceTiming)
getTiming self
  = liftIO
      (maybeNull (makeNewGObject mkPerformanceTiming)
         ({# call webkit_dom_performance_get_timing #}
            (toPerformance self)))
#endif
