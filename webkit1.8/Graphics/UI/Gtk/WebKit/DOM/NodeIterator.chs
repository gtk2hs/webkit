module Graphics.UI.Gtk.WebKit.DOM.NodeIterator
       (nodeIteratorDetach, nodeIteratorGetRoot,
        nodeIteratorGetWhatToShow, nodeIteratorGetFilter,
        nodeIteratorGetExpandEntityReferences,
        nodeIteratorGetReferenceNode,
        nodeIteratorGetPointerBeforeReferenceNode)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
nodeIteratorDetach :: (NodeIteratorClass self) => self -> IO ()
nodeIteratorDetach self
  = {# call webkit_dom_node_iterator_detach #} (toNodeIterator self)
 
nodeIteratorGetRoot ::
                    (NodeIteratorClass self) => self -> IO (Maybe Node)
nodeIteratorGetRoot self
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_node_iterator_get_root #}
         (toNodeIterator self))
 
nodeIteratorGetWhatToShow ::
                          (NodeIteratorClass self) => self -> IO Word
nodeIteratorGetWhatToShow self
  = fromIntegral <$>
      ({# call webkit_dom_node_iterator_get_what_to_show #}
         (toNodeIterator self))
 
nodeIteratorGetFilter ::
                      (NodeIteratorClass self) => self -> IO (Maybe NodeFilter)
nodeIteratorGetFilter self
  = maybeNull (makeNewGObject mkNodeFilter)
      ({# call webkit_dom_node_iterator_get_filter #}
         (toNodeIterator self))
 
nodeIteratorGetExpandEntityReferences ::
                                      (NodeIteratorClass self) => self -> IO Bool
nodeIteratorGetExpandEntityReferences self
  = toBool <$>
      ({# call webkit_dom_node_iterator_get_expand_entity_references #}
         (toNodeIterator self))
 
nodeIteratorGetReferenceNode ::
                             (NodeIteratorClass self) => self -> IO (Maybe Node)
nodeIteratorGetReferenceNode self
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_node_iterator_get_reference_node #}
         (toNodeIterator self))
 
nodeIteratorGetPointerBeforeReferenceNode ::
                                          (NodeIteratorClass self) => self -> IO Bool
nodeIteratorGetPointerBeforeReferenceNode self
  = toBool <$>
      ({# call webkit_dom_node_iterator_get_pointer_before_reference_node
         #}
         (toNodeIterator self))
