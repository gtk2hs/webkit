module Graphics.UI.Gtk.WebKit.DOM.DOMNamedFlowCollection
       (
#if WEBKIT_CHECK_VERSION(2,2,2)
        domNamedFlowCollectionItem, domNamedFlowCollectionNamedItem,
        domNamedFlowCollectionGetLength, DOMNamedFlowCollection,
        DOMNamedFlowCollectionClass, castToDOMNamedFlowCollection,
        gTypeDOMNamedFlowCollection, toDOMNamedFlowCollection
#endif
       )
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
#if WEBKIT_CHECK_VERSION(2,2,2)
domNamedFlowCollectionItem ::
                           (DOMNamedFlowCollectionClass self) =>
                             self -> Word -> IO (Maybe WebKitNamedFlow)
domNamedFlowCollectionItem self index
  = maybeNull (makeNewGObject mkWebKitNamedFlow)
      ({# call webkit_dom_dom_named_flow_collection_item #}
         (toDOMNamedFlowCollection self)
         (fromIntegral index))
 
domNamedFlowCollectionNamedItem ::
                                (DOMNamedFlowCollectionClass self) =>
                                  self -> String -> IO (Maybe WebKitNamedFlow)
domNamedFlowCollectionNamedItem self name
  = maybeNull (makeNewGObject mkWebKitNamedFlow)
      (withUTFString name $
         \ namePtr ->
           {# call webkit_dom_dom_named_flow_collection_named_item #}
             (toDOMNamedFlowCollection self)
             namePtr)
 
domNamedFlowCollectionGetLength ::
                                (DOMNamedFlowCollectionClass self) => self -> IO Word
domNamedFlowCollectionGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_dom_named_flow_collection_get_length #}
         (toDOMNamedFlowCollection self))
#endif
