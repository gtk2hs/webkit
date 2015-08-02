module Graphics.UI.Gtk.WebKit.DOM.NamedNodeMap(
getNamedItem,
setNamedItem,
removeNamedItem,
item,
getNamedItemNS,
setNamedItemNS,
removeNamedItemNS,
getLength,
NamedNodeMap,
castToNamedNodeMap,
gTypeNamedNodeMap,
NamedNodeMapClass,
toNamedNodeMap,
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

 
getNamedItem ::
             (MonadIO m, NamedNodeMapClass self, GlibString string) =>
               self -> string -> m (Maybe Node)
getNamedItem self name
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (withUTFString name $
            \ namePtr ->
              {# call webkit_dom_named_node_map_get_named_item #}
                (toNamedNodeMap self)
                namePtr))
 
setNamedItem ::
             (MonadIO m, NamedNodeMapClass self, NodeClass node) =>
               self -> Maybe node -> m (Maybe Node)
setNamedItem self node
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_named_node_map_set_named_item #}
                (toNamedNodeMap self)
                (maybe (Node nullForeignPtr) toNode node)
                errorPtr_))
 
removeNamedItem ::
                (MonadIO m, NamedNodeMapClass self, GlibString string) =>
                  self -> string -> m (Maybe Node)
removeNamedItem self name
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString name $
                \ namePtr ->
                  {# call webkit_dom_named_node_map_remove_named_item #}
                    (toNamedNodeMap self)
                    namePtr
                errorPtr_))
 
item ::
     (MonadIO m, NamedNodeMapClass self) =>
       self -> Word -> m (Maybe Node)
item self index
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_named_node_map_item #} (toNamedNodeMap self)
            (fromIntegral index)))
 
getNamedItemNS ::
               (MonadIO m, NamedNodeMapClass self, GlibString string) =>
                 self -> (Maybe string) -> string -> m (Maybe Node)
getNamedItemNS self namespaceURI localName
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (withUTFString localName $
            \ localNamePtr ->
              maybeWith withUTFString namespaceURI $
                \ namespaceURIPtr ->
                  {# call webkit_dom_named_node_map_get_named_item_ns #}
                    (toNamedNodeMap self)
                    namespaceURIPtr
                localNamePtr))
 
setNamedItemNS ::
               (MonadIO m, NamedNodeMapClass self, NodeClass node) =>
                 self -> Maybe node -> m (Maybe Node)
setNamedItemNS self node
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_named_node_map_set_named_item_ns #}
                (toNamedNodeMap self)
                (maybe (Node nullForeignPtr) toNode node)
                errorPtr_))
 
removeNamedItemNS ::
                  (MonadIO m, NamedNodeMapClass self, GlibString string) =>
                    self -> (Maybe string) -> string -> m (Maybe Node)
removeNamedItemNS self namespaceURI localName
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString localName $
                \ localNamePtr ->
                  maybeWith withUTFString namespaceURI $
                    \ namespaceURIPtr ->
                      {# call webkit_dom_named_node_map_remove_named_item_ns #}
                        (toNamedNodeMap self)
                        namespaceURIPtr
                    localNamePtr
                errorPtr_))
 
getLength :: (MonadIO m, NamedNodeMapClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_named_node_map_get_length #}
            (toNamedNodeMap self)))
