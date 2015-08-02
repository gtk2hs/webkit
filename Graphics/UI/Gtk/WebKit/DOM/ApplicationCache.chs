module Graphics.UI.Gtk.WebKit.DOM.ApplicationCache(
update,
swapCache,
abort,
pattern UNCACHED,
pattern IDLE,
pattern CHECKING,
pattern DOWNLOADING,
pattern UPDATEREADY,
pattern OBSOLETE,
getStatus,
checking,
error,
noUpdate,
downloading,
progress,
updateReady,
cached,
obsolete,
ApplicationCache,
castToApplicationCache,
gTypeApplicationCache,
ApplicationCacheClass,
toApplicationCache,
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
import Graphics.UI.Gtk.WebKit.DOM.EventM
{#import Graphics.UI.Gtk.WebKit.Types#}
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
update :: (MonadIO m, ApplicationCacheClass self) => self -> m ()
update self
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_application_cache_update #}
             (toApplicationCache self)
             errorPtr_)
 
swapCache ::
          (MonadIO m, ApplicationCacheClass self) => self -> m ()
swapCache self
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_application_cache_swap_cache #}
             (toApplicationCache self)
             errorPtr_)
 
abort :: (MonadIO m, ApplicationCacheClass self) => self -> m ()
abort self
  = liftIO
      ({# call webkit_dom_dom_application_cache_abort #}
         (toApplicationCache self))
pattern UNCACHED = 0
pattern IDLE = 1
pattern CHECKING = 2
pattern DOWNLOADING = 3
pattern UPDATEREADY = 4
pattern OBSOLETE = 5
 
getStatus ::
          (MonadIO m, ApplicationCacheClass self) => self -> m Word
getStatus self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_application_cache_get_status #}
            (toApplicationCache self)))
 
checking :: (ApplicationCacheClass self) => EventName self Event
checking = EventName "checking"
 
error :: (ApplicationCacheClass self) => EventName self UIEvent
error = EventName "error"
 
noUpdate :: (ApplicationCacheClass self) => EventName self Event
noUpdate = EventName "noupdate"
 
downloading :: (ApplicationCacheClass self) => EventName self Event
downloading = EventName "downloading"
 
progress :: (ApplicationCacheClass self) => EventName self Event
progress = EventName "progress"
 
updateReady :: (ApplicationCacheClass self) => EventName self Event
updateReady = EventName "updateready"
 
cached :: (ApplicationCacheClass self) => EventName self Event
cached = EventName "cached"
 
obsolete :: (ApplicationCacheClass self) => EventName self Event
obsolete = EventName "obsolete"
