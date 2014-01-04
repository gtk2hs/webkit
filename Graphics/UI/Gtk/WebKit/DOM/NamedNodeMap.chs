module Graphics.UI.Gtk.WebKit.DOM.NamedNodeMap
       (namedNodeMapGetNamedItem, namedNodeMapSetNamedItem,
        namedNodeMapRemoveNamedItem, namedNodeMapItem,
        namedNodeMapGetNamedItemNS, namedNodeMapSetNamedItemNS,
        namedNodeMapRemoveNamedItemNS, namedNodeMapGetLength, NamedNodeMap,
        NamedNodeMapClass, castToNamedNodeMap, gTypeNamedNodeMap,
        toNamedNodeMap)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
namedNodeMapGetNamedItem ::
                         (NamedNodeMapClass self) => self -> String -> IO (Maybe Node)
namedNodeMapGetNamedItem self name
  = maybeNull (makeNewGObject mkNode)
      (withUTFString name $
         \ namePtr ->
           {# call webkit_dom_named_node_map_get_named_item #}
             (toNamedNodeMap self)
             namePtr)
 
namedNodeMapSetNamedItem ::
                         (NamedNodeMapClass self, NodeClass node) =>
                           self -> Maybe node -> IO (Maybe Node)
namedNodeMapSetNamedItem self node
  = maybeNull (makeNewGObject mkNode)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_named_node_map_set_named_item #}
             (toNamedNodeMap self)
             (maybe (Node nullForeignPtr) toNode node)
             errorPtr_)
 
namedNodeMapRemoveNamedItem ::
                            (NamedNodeMapClass self) => self -> String -> IO (Maybe Node)
namedNodeMapRemoveNamedItem self name
  = maybeNull (makeNewGObject mkNode)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString name $
             \ namePtr ->
               {# call webkit_dom_named_node_map_remove_named_item #}
                 (toNamedNodeMap self)
                 namePtr
             errorPtr_)
 
namedNodeMapItem ::
                 (NamedNodeMapClass self) => self -> Word -> IO (Maybe Node)
namedNodeMapItem self index
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_named_node_map_item #} (toNamedNodeMap self)
         (fromIntegral index))
 
namedNodeMapGetNamedItemNS ::
                           (NamedNodeMapClass self) =>
                             self -> String -> String -> IO (Maybe Node)
namedNodeMapGetNamedItemNS self namespaceURI localName
  = maybeNull (makeNewGObject mkNode)
      (withUTFString localName $
         \ localNamePtr ->
           withUTFString namespaceURI $
             \ namespaceURIPtr ->
               {# call webkit_dom_named_node_map_get_named_item_ns #}
                 (toNamedNodeMap self)
                 namespaceURIPtr
             localNamePtr)
 
namedNodeMapSetNamedItemNS ::
                           (NamedNodeMapClass self, NodeClass node) =>
                             self -> Maybe node -> IO (Maybe Node)
namedNodeMapSetNamedItemNS self node
  = maybeNull (makeNewGObject mkNode)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_named_node_map_set_named_item_ns #}
             (toNamedNodeMap self)
             (maybe (Node nullForeignPtr) toNode node)
             errorPtr_)
 
namedNodeMapRemoveNamedItemNS ::
                              (NamedNodeMapClass self) =>
                                self -> String -> String -> IO (Maybe Node)
namedNodeMapRemoveNamedItemNS self namespaceURI localName
  = maybeNull (makeNewGObject mkNode)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString localName $
             \ localNamePtr ->
               withUTFString namespaceURI $
                 \ namespaceURIPtr ->
                   {# call webkit_dom_named_node_map_remove_named_item_ns #}
                     (toNamedNodeMap self)
                     namespaceURIPtr
                 localNamePtr
             errorPtr_)
 
namedNodeMapGetLength ::
                      (NamedNodeMapClass self) => self -> IO Word
namedNodeMapGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_named_node_map_get_length #}
         (toNamedNodeMap self))
