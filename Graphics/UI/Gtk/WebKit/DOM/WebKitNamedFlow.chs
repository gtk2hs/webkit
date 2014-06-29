module Graphics.UI.Gtk.WebKit.DOM.WebKitNamedFlow
       (
#if WEBKIT_CHECK_VERSION(1,10,0)
        webKitNamedFlowGetRegionsByContent, webKitNamedFlowGetRegions,
        webKitNamedFlowGetContent, webKitNamedFlowDispatchEvent,
        webKitNamedFlowGetName, webKitNamedFlowGetOverset,
        webKitNamedFlowGetFirstEmptyRegionIndex, WebKitNamedFlow,
        WebKitNamedFlowClass, castToWebKitNamedFlow, gTypeWebKitNamedFlow,
        toWebKitNamedFlow
#endif
        )
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
#if WEBKIT_CHECK_VERSION(1,10,0)
webKitNamedFlowGetRegionsByContent ::
                                   (WebKitNamedFlowClass self, NodeClass contentNode) =>
                                     self -> Maybe contentNode -> IO (Maybe NodeList)
webKitNamedFlowGetRegionsByContent self contentNode
  = maybeNull (makeNewGObject mkNodeList)
      ({# call webkit_dom_webkit_named_flow_get_regions_by_content #}
         (toWebKitNamedFlow self)
         (maybe (Node nullForeignPtr) toNode contentNode))
 
webKitNamedFlowGetRegions ::
                          (WebKitNamedFlowClass self) => self -> IO (Maybe NodeList)
webKitNamedFlowGetRegions self
  = maybeNull (makeNewGObject mkNodeList)
      ({# call webkit_dom_webkit_named_flow_get_regions #}
         (toWebKitNamedFlow self))
 
webKitNamedFlowGetContent ::
                          (WebKitNamedFlowClass self) => self -> IO (Maybe NodeList)
webKitNamedFlowGetContent self
  = maybeNull (makeNewGObject mkNodeList)
      ({# call webkit_dom_webkit_named_flow_get_content #}
         (toWebKitNamedFlow self))
 
webKitNamedFlowDispatchEvent ::
                             (WebKitNamedFlowClass self, EventClass event) =>
                               self -> Maybe event -> IO Bool
webKitNamedFlowDispatchEvent self event
  = toBool <$>
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_webkit_named_flow_dispatch_event #}
             (toWebKitNamedFlow self)
             (maybe (Event nullForeignPtr) toEvent event)
             errorPtr_)
 
webKitNamedFlowGetName ::
                       (WebKitNamedFlowClass self, GlibString string) => self -> IO string
webKitNamedFlowGetName self
  = ({# call webkit_dom_webkit_named_flow_get_name #}
       (toWebKitNamedFlow self))
      >>=
      readUTFString
 
webKitNamedFlowGetOverset ::
                          (WebKitNamedFlowClass self) => self -> IO Bool
webKitNamedFlowGetOverset self
  = toBool <$>
      ({# call webkit_dom_webkit_named_flow_get_overset #}
         (toWebKitNamedFlow self))
 
webKitNamedFlowGetFirstEmptyRegionIndex ::
                                        (WebKitNamedFlowClass self) => self -> IO Int
webKitNamedFlowGetFirstEmptyRegionIndex self
  = fromIntegral <$>
      ({# call webkit_dom_webkit_named_flow_get_first_empty_region_index
         #}
         (toWebKitNamedFlow self))
#endif
