module Graphics.UI.Gtk.WebKit.DOM.WebKitNamedFlow(
#if WEBKIT_CHECK_VERSION(2,2,2)
getRegionsByContent,
getRegions,
getContent,
getName,
getOverset,
getFirstEmptyRegionIndex,
#endif
WebKitNamedFlow,
castToWebKitNamedFlow,
gTypeWebKitNamedFlow,
WebKitNamedFlowClass,
toWebKitNamedFlow,
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


#if WEBKIT_CHECK_VERSION(2,2,2) 
getRegionsByContent ::
                    (MonadIO m, WebKitNamedFlowClass self, NodeClass contentNode) =>
                      self -> Maybe contentNode -> m (Maybe NodeList)
getRegionsByContent self contentNode
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         ({# call webkit_dom_webkit_named_flow_get_regions_by_content #}
            (toWebKitNamedFlow self)
            (maybe (Node nullForeignPtr) toNode contentNode)))
 
getRegions ::
           (MonadIO m, WebKitNamedFlowClass self) =>
             self -> m (Maybe NodeList)
getRegions self
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         ({# call webkit_dom_webkit_named_flow_get_regions #}
            (toWebKitNamedFlow self)))
 
getContent ::
           (MonadIO m, WebKitNamedFlowClass self) =>
             self -> m (Maybe NodeList)
getContent self
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         ({# call webkit_dom_webkit_named_flow_get_content #}
            (toWebKitNamedFlow self)))
 
getName ::
        (MonadIO m, WebKitNamedFlowClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_webkit_named_flow_get_name #}
          (toWebKitNamedFlow self))
         >>=
         readUTFString)
 
getOverset ::
           (MonadIO m, WebKitNamedFlowClass self) => self -> m Bool
getOverset self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_webkit_named_flow_get_overset #}
            (toWebKitNamedFlow self)))
 
getFirstEmptyRegionIndex ::
                         (MonadIO m, WebKitNamedFlowClass self) => self -> m Int
getFirstEmptyRegionIndex self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_webkit_named_flow_get_first_empty_region_index
            #}
            (toWebKitNamedFlow self)))
#endif
