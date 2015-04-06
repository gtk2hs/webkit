module Graphics.UI.Gtk.WebKit.DOM.Node(
insertBefore,
replaceChild,
removeChild,
appendChild,
hasChildNodes,
cloneNode,
normalize,
isSupported,
isSameNode,
isEqualNode,
lookupPrefix,
isDefaultNamespace,
lookupNamespaceURI,
compareDocumentPosition,
contains,
pattern ELEMENT_NODE,
pattern ATTRIBUTE_NODE,
pattern TEXT_NODE,
pattern CDATA_SECTION_NODE,
pattern ENTITY_REFERENCE_NODE,
pattern ENTITY_NODE,
pattern PROCESSING_INSTRUCTION_NODE,
pattern COMMENT_NODE,
pattern DOCUMENT_NODE,
pattern DOCUMENT_TYPE_NODE,
pattern DOCUMENT_FRAGMENT_NODE,
pattern NOTATION_NODE,
pattern DOCUMENT_POSITION_DISCONNECTED,
pattern DOCUMENT_POSITION_PRECEDING,
pattern DOCUMENT_POSITION_FOLLOWING,
pattern DOCUMENT_POSITION_CONTAINS,
pattern DOCUMENT_POSITION_CONTAINED_BY,
pattern DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC,
getNodeName,
setNodeValue,
getNodeValue,
getNodeType,
getParentNode,
getChildNodes,
getFirstChild,
getLastChild,
getPreviousSibling,
getNextSibling,
getOwnerDocument,
getNamespaceURI,
setPrefix,
getPrefix,
getLocalName,
getBaseURI,
setTextContent,
getTextContent,
getParentElement,
Node,
castToNode,
gTypeNode,
NodeClass,
toNode,
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

 
insertBefore ::
             (MonadIO m, NodeClass self, NodeClass newChild,
              NodeClass refChild) =>
               self -> Maybe newChild -> Maybe refChild -> m (Maybe Node)
insertBefore self newChild refChild
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_node_insert_before #} (toNode self)
                (maybe (Node nullForeignPtr) toNode newChild)
                (maybe (Node nullForeignPtr) toNode refChild)
                errorPtr_))
 
replaceChild ::
             (MonadIO m, NodeClass self, NodeClass newChild,
              NodeClass oldChild) =>
               self -> Maybe newChild -> Maybe oldChild -> m (Maybe Node)
replaceChild self newChild oldChild
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_node_replace_child #} (toNode self)
                (maybe (Node nullForeignPtr) toNode newChild)
                (maybe (Node nullForeignPtr) toNode oldChild)
                errorPtr_))
 
removeChild ::
            (MonadIO m, NodeClass self, NodeClass oldChild) =>
              self -> Maybe oldChild -> m (Maybe Node)
removeChild self oldChild
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_node_remove_child #} (toNode self)
                (maybe (Node nullForeignPtr) toNode oldChild)
                errorPtr_))
 
appendChild ::
            (MonadIO m, NodeClass self, NodeClass newChild) =>
              self -> Maybe newChild -> m (Maybe Node)
appendChild self newChild
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_node_append_child #} (toNode self)
                (maybe (Node nullForeignPtr) toNode newChild)
                errorPtr_))
 
hasChildNodes :: (MonadIO m, NodeClass self) => self -> m Bool
hasChildNodes self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_node_has_child_nodes #} (toNode self)))
 
cloneNode ::
          (MonadIO m, NodeClass self) => self -> Bool -> m (Maybe Node)
cloneNode self deep
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_node_clone_node #} (toNode self)
            (fromBool deep)))
 
normalize :: (MonadIO m, NodeClass self) => self -> m ()
normalize self
  = liftIO ({# call webkit_dom_node_normalize #} (toNode self))
 
isSupported ::
            (MonadIO m, NodeClass self, GlibString string) =>
              self -> string -> string -> m Bool
isSupported self feature version
  = liftIO
      (toBool <$>
         (withUTFString version $
            \ versionPtr ->
              withUTFString feature $
                \ featurePtr ->
                  {# call webkit_dom_node_is_supported #} (toNode self) featurePtr
                versionPtr))
 
isSameNode ::
           (MonadIO m, NodeClass self, NodeClass other) =>
             self -> Maybe other -> m Bool
isSameNode self other
  = liftIO
      (toBool <$>
         ({# call webkit_dom_node_is_same_node #} (toNode self)
            (maybe (Node nullForeignPtr) toNode other)))
 
isEqualNode ::
            (MonadIO m, NodeClass self, NodeClass other) =>
              self -> Maybe other -> m Bool
isEqualNode self other
  = liftIO
      (toBool <$>
         ({# call webkit_dom_node_is_equal_node #} (toNode self)
            (maybe (Node nullForeignPtr) toNode other)))
 
lookupPrefix ::
             (MonadIO m, NodeClass self, GlibString string) =>
               self -> string -> m string
lookupPrefix self namespaceURI
  = liftIO
      ((withUTFString namespaceURI $
          \ namespaceURIPtr ->
            {# call webkit_dom_node_lookup_prefix #} (toNode self)
              namespaceURIPtr)
         >>=
         readUTFString)
 
isDefaultNamespace ::
                   (MonadIO m, NodeClass self, GlibString string) =>
                     self -> string -> m Bool
isDefaultNamespace self namespaceURI
  = liftIO
      (toBool <$>
         (withUTFString namespaceURI $
            \ namespaceURIPtr ->
              {# call webkit_dom_node_is_default_namespace #} (toNode self)
                namespaceURIPtr))
 
lookupNamespaceURI ::
                   (MonadIO m, NodeClass self, GlibString string) =>
                     self -> string -> m string
lookupNamespaceURI self prefix
  = liftIO
      ((withUTFString prefix $
          \ prefixPtr ->
            {# call webkit_dom_node_lookup_namespace_uri #} (toNode self)
              prefixPtr)
         >>=
         readUTFString)
 
compareDocumentPosition ::
                        (MonadIO m, NodeClass self, NodeClass other) =>
                          self -> Maybe other -> m Word
compareDocumentPosition self other
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_node_compare_document_position #} (toNode self)
            (maybe (Node nullForeignPtr) toNode other)))
 
contains ::
         (MonadIO m, NodeClass self, NodeClass other) =>
           self -> Maybe other -> m Bool
contains self other
  = liftIO
      (toBool <$>
         ({# call webkit_dom_node_contains #} (toNode self)
            (maybe (Node nullForeignPtr) toNode other)))
pattern ELEMENT_NODE = 1
pattern ATTRIBUTE_NODE = 2
pattern TEXT_NODE = 3
pattern CDATA_SECTION_NODE = 4
pattern ENTITY_REFERENCE_NODE = 5
pattern ENTITY_NODE = 6
pattern PROCESSING_INSTRUCTION_NODE = 7
pattern COMMENT_NODE = 8
pattern DOCUMENT_NODE = 9
pattern DOCUMENT_TYPE_NODE = 10
pattern DOCUMENT_FRAGMENT_NODE = 11
pattern NOTATION_NODE = 12
pattern DOCUMENT_POSITION_DISCONNECTED = 1
pattern DOCUMENT_POSITION_PRECEDING = 2
pattern DOCUMENT_POSITION_FOLLOWING = 4
pattern DOCUMENT_POSITION_CONTAINS = 8
pattern DOCUMENT_POSITION_CONTAINED_BY = 16
pattern DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC = 32
 
getNodeName ::
            (MonadIO m, NodeClass self, GlibString string) => self -> m string
getNodeName self
  = liftIO
      (({# call webkit_dom_node_get_node_name #} (toNode self)) >>=
         readUTFString)
 
setNodeValue ::
             (MonadIO m, NodeClass self, GlibString string) =>
               self -> string -> m ()
setNodeValue self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString val $
             \ valPtr ->
               {# call webkit_dom_node_set_node_value #} (toNode self) valPtr
             errorPtr_)
 
getNodeValue ::
             (MonadIO m, NodeClass self, GlibString string) => self -> m string
getNodeValue self
  = liftIO
      (({# call webkit_dom_node_get_node_value #} (toNode self)) >>=
         readUTFString)
 
getNodeType :: (MonadIO m, NodeClass self) => self -> m Word
getNodeType self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_node_get_node_type #} (toNode self)))
 
getParentNode ::
              (MonadIO m, NodeClass self) => self -> m (Maybe Node)
getParentNode self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_node_get_parent_node #} (toNode self)))
 
getChildNodes ::
              (MonadIO m, NodeClass self) => self -> m (Maybe NodeList)
getChildNodes self
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         ({# call webkit_dom_node_get_child_nodes #} (toNode self)))
 
getFirstChild ::
              (MonadIO m, NodeClass self) => self -> m (Maybe Node)
getFirstChild self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_node_get_first_child #} (toNode self)))
 
getLastChild ::
             (MonadIO m, NodeClass self) => self -> m (Maybe Node)
getLastChild self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_node_get_last_child #} (toNode self)))
 
getPreviousSibling ::
                   (MonadIO m, NodeClass self) => self -> m (Maybe Node)
getPreviousSibling self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_node_get_previous_sibling #} (toNode self)))
 
getNextSibling ::
               (MonadIO m, NodeClass self) => self -> m (Maybe Node)
getNextSibling self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_node_get_next_sibling #} (toNode self)))
 
getOwnerDocument ::
                 (MonadIO m, NodeClass self) => self -> m (Maybe Document)
getOwnerDocument self
  = liftIO
      (maybeNull (makeNewGObject mkDocument)
         ({# call webkit_dom_node_get_owner_document #} (toNode self)))
 
getNamespaceURI ::
                (MonadIO m, NodeClass self, GlibString string) => self -> m string
getNamespaceURI self
  = liftIO
      (({# call webkit_dom_node_get_namespace_uri #} (toNode self)) >>=
         readUTFString)
 
setPrefix ::
          (MonadIO m, NodeClass self, GlibString string) =>
            self -> string -> m ()
setPrefix self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString val $
             \ valPtr ->
               {# call webkit_dom_node_set_prefix #} (toNode self) valPtr
             errorPtr_)
 
getPrefix ::
          (MonadIO m, NodeClass self, GlibString string) => self -> m string
getPrefix self
  = liftIO
      (({# call webkit_dom_node_get_prefix #} (toNode self)) >>=
         readUTFString)
 
getLocalName ::
             (MonadIO m, NodeClass self, GlibString string) => self -> m string
getLocalName self
  = liftIO
      (({# call webkit_dom_node_get_local_name #} (toNode self)) >>=
         readUTFString)
 
getBaseURI ::
           (MonadIO m, NodeClass self, GlibString string) => self -> m string
getBaseURI self
  = liftIO
      (({# call webkit_dom_node_get_base_uri #} (toNode self)) >>=
         readUTFString)
 
setTextContent ::
               (MonadIO m, NodeClass self, GlibString string) =>
                 self -> string -> m ()
setTextContent self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString val $
             \ valPtr ->
               {# call webkit_dom_node_set_text_content #} (toNode self) valPtr
             errorPtr_)
 
getTextContent ::
               (MonadIO m, NodeClass self, GlibString string) => self -> m string
getTextContent self
  = liftIO
      (({# call webkit_dom_node_get_text_content #} (toNode self)) >>=
         readUTFString)
 
getParentElement ::
                 (MonadIO m, NodeClass self) => self -> m (Maybe Element)
getParentElement self
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         ({# call webkit_dom_node_get_parent_element #} (toNode self)))
