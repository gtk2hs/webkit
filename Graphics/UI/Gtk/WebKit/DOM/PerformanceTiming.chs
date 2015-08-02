module Graphics.UI.Gtk.WebKit.DOM.PerformanceTiming(
#if WEBKIT_CHECK_VERSION(2,2,2)
getNavigationStart,
getUnloadEventStart,
getUnloadEventEnd,
getRedirectStart,
getRedirectEnd,
getFetchStart,
getDomainLookupStart,
getDomainLookupEnd,
getConnectStart,
getConnectEnd,
getSecureConnectionStart,
getRequestStart,
getResponseStart,
getResponseEnd,
getDomLoading,
getDomInteractive,
getDomContentLoadedEventStart,
getDomContentLoadedEventEnd,
getDomComplete,
getLoadEventStart,
getLoadEventEnd,
PerformanceTiming,
castToPerformanceTiming,
gTypePerformanceTiming,
PerformanceTimingClass,
toPerformanceTiming,
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

 
getNavigationStart ::
                   (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getNavigationStart self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_navigation_start #}
            (toPerformanceTiming self)))
 
getUnloadEventStart ::
                    (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getUnloadEventStart self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_unload_event_start #}
            (toPerformanceTiming self)))
 
getUnloadEventEnd ::
                  (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getUnloadEventEnd self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_unload_event_end #}
            (toPerformanceTiming self)))
 
getRedirectStart ::
                 (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getRedirectStart self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_redirect_start #}
            (toPerformanceTiming self)))
 
getRedirectEnd ::
               (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getRedirectEnd self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_redirect_end #}
            (toPerformanceTiming self)))
 
getFetchStart ::
              (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getFetchStart self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_fetch_start #}
            (toPerformanceTiming self)))
 
getDomainLookupStart ::
                     (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getDomainLookupStart self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_domain_lookup_start #}
            (toPerformanceTiming self)))
 
getDomainLookupEnd ::
                   (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getDomainLookupEnd self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_domain_lookup_end #}
            (toPerformanceTiming self)))
 
getConnectStart ::
                (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getConnectStart self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_connect_start #}
            (toPerformanceTiming self)))
 
getConnectEnd ::
              (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getConnectEnd self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_connect_end #}
            (toPerformanceTiming self)))
 
getSecureConnectionStart ::
                         (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getSecureConnectionStart self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_secure_connection_start
            #}
            (toPerformanceTiming self)))
 
getRequestStart ::
                (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getRequestStart self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_request_start #}
            (toPerformanceTiming self)))
 
getResponseStart ::
                 (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getResponseStart self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_response_start #}
            (toPerformanceTiming self)))
 
getResponseEnd ::
               (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getResponseEnd self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_response_end #}
            (toPerformanceTiming self)))
 
getDomLoading ::
              (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getDomLoading self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_dom_loading #}
            (toPerformanceTiming self)))
 
getDomInteractive ::
                  (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getDomInteractive self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_dom_interactive #}
            (toPerformanceTiming self)))
 
getDomContentLoadedEventStart ::
                              (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getDomContentLoadedEventStart self
  = liftIO
      (fromIntegral <$>
         ({# call
            webkit_dom_performance_timing_get_dom_content_loaded_event_start
            #}
            (toPerformanceTiming self)))
 
getDomContentLoadedEventEnd ::
                            (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getDomContentLoadedEventEnd self
  = liftIO
      (fromIntegral <$>
         ({# call
            webkit_dom_performance_timing_get_dom_content_loaded_event_end
            #}
            (toPerformanceTiming self)))
 
getDomComplete ::
               (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getDomComplete self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_dom_complete #}
            (toPerformanceTiming self)))
 
getLoadEventStart ::
                  (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getLoadEventStart self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_load_event_start #}
            (toPerformanceTiming self)))
 
getLoadEventEnd ::
                (MonadIO m, PerformanceTimingClass self) => self -> m Word64
getLoadEventEnd self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_performance_timing_get_load_event_end #}
            (toPerformanceTiming self)))
#endif
