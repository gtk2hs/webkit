module Graphics.UI.Gtk.WebKit.DOM.Node
       (nodeInsertBefore, nodeReplaceChild, nodeRemoveChild,
        nodeAppendChild, nodeHasChildNodes, nodeCloneNode, nodeNormalize,
        nodeIsSupported, nodeIsSameNode, nodeIsEqualNode, nodeLookupPrefix,
        nodeIsDefaultNamespace, nodeLookupNamespaceURI,
        nodeCompareDocumentPosition, nodeContains, nodeDispatchEvent,
        cELEMENT_NODE, cATTRIBUTE_NODE, cTEXT_NODE, cCDATA_SECTION_NODE,
        cENTITY_REFERENCE_NODE, cENTITY_NODE, cPROCESSING_INSTRUCTION_NODE,
        cCOMMENT_NODE, cDOCUMENT_NODE, cDOCUMENT_TYPE_NODE,
        cDOCUMENT_FRAGMENT_NODE, cNOTATION_NODE,
        cDOCUMENT_POSITION_DISCONNECTED, cDOCUMENT_POSITION_PRECEDING,
        cDOCUMENT_POSITION_FOLLOWING, cDOCUMENT_POSITION_CONTAINS,
        cDOCUMENT_POSITION_CONTAINED_BY,
        cDOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC, nodeGetNodeName,
        nodeSetNodeValue, nodeGetNodeValue, nodeGetNodeType,
        nodeGetParentNode, nodeGetChildNodes, nodeGetFirstChild,
        nodeGetLastChild, nodeGetPreviousSibling, nodeGetNextSibling,
        nodeGetOwnerDocument, nodeGetNamespaceURI, nodeSetPrefix,
        nodeGetPrefix, nodeGetLocalName, nodeGetBaseURI,
        nodeSetTextContent, nodeGetTextContent, nodeGetParentElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
nodeInsertBefore ::
                 (NodeClass self, NodeClass newChild, NodeClass refChild) =>
                   self -> Maybe newChild -> Maybe refChild -> IO (Maybe Node)
nodeInsertBefore self newChild refChild
  = maybeNull (makeNewGObject mkNode)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_node_insert_before #} (toNode self)
             (maybe (Node nullForeignPtr) toNode newChild)
             (maybe (Node nullForeignPtr) toNode refChild)
             errorPtr_)
 
nodeReplaceChild ::
                 (NodeClass self, NodeClass newChild, NodeClass oldChild) =>
                   self -> Maybe newChild -> Maybe oldChild -> IO (Maybe Node)
nodeReplaceChild self newChild oldChild
  = maybeNull (makeNewGObject mkNode)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_node_replace_child #} (toNode self)
             (maybe (Node nullForeignPtr) toNode newChild)
             (maybe (Node nullForeignPtr) toNode oldChild)
             errorPtr_)
 
nodeRemoveChild ::
                (NodeClass self, NodeClass oldChild) =>
                  self -> Maybe oldChild -> IO (Maybe Node)
nodeRemoveChild self oldChild
  = maybeNull (makeNewGObject mkNode)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_node_remove_child #} (toNode self)
             (maybe (Node nullForeignPtr) toNode oldChild)
             errorPtr_)
 
nodeAppendChild ::
                (NodeClass self, NodeClass newChild) =>
                  self -> Maybe newChild -> IO (Maybe Node)
nodeAppendChild self newChild
  = maybeNull (makeNewGObject mkNode)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_node_append_child #} (toNode self)
             (maybe (Node nullForeignPtr) toNode newChild)
             errorPtr_)
 
nodeHasChildNodes :: (NodeClass self) => self -> IO Bool
nodeHasChildNodes self
  = toBool <$>
      ({# call webkit_dom_node_has_child_nodes #} (toNode self))
 
nodeCloneNode ::
              (NodeClass self) => self -> Bool -> IO (Maybe Node)
nodeCloneNode self deep
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_node_clone_node #} (toNode self)
         (fromBool deep))
 
nodeNormalize :: (NodeClass self) => self -> IO ()
nodeNormalize self
  = {# call webkit_dom_node_normalize #} (toNode self)
 
nodeIsSupported ::
                (NodeClass self) => self -> String -> String -> IO Bool
nodeIsSupported self feature version
  = toBool <$>
      (withUTFString version $
         \ versionPtr ->
           withUTFString feature $
             \ featurePtr ->
               {# call webkit_dom_node_is_supported #} (toNode self) featurePtr
             versionPtr)
 
nodeIsSameNode ::
               (NodeClass self, NodeClass other) => self -> Maybe other -> IO Bool
nodeIsSameNode self other
  = toBool <$>
      ({# call webkit_dom_node_is_same_node #} (toNode self)
         (maybe (Node nullForeignPtr) toNode other))
 
nodeIsEqualNode ::
                (NodeClass self, NodeClass other) => self -> Maybe other -> IO Bool
nodeIsEqualNode self other
  = toBool <$>
      ({# call webkit_dom_node_is_equal_node #} (toNode self)
         (maybe (Node nullForeignPtr) toNode other))
 
nodeLookupPrefix :: (NodeClass self) => self -> String -> IO String
nodeLookupPrefix self namespaceURI
  = (withUTFString namespaceURI $
       \ namespaceURIPtr ->
         {# call webkit_dom_node_lookup_prefix #} (toNode self)
           namespaceURIPtr)
      >>=
      readUTFString
 
nodeIsDefaultNamespace ::
                       (NodeClass self) => self -> String -> IO Bool
nodeIsDefaultNamespace self namespaceURI
  = toBool <$>
      (withUTFString namespaceURI $
         \ namespaceURIPtr ->
           {# call webkit_dom_node_is_default_namespace #} (toNode self)
             namespaceURIPtr)
 
nodeLookupNamespaceURI ::
                       (NodeClass self) => self -> String -> IO String
nodeLookupNamespaceURI self prefix
  = (withUTFString prefix $
       \ prefixPtr ->
         {# call webkit_dom_node_lookup_namespace_uri #} (toNode self)
           prefixPtr)
      >>=
      readUTFString
 
nodeCompareDocumentPosition ::
                            (NodeClass self, NodeClass other) => self -> Maybe other -> IO Word
nodeCompareDocumentPosition self other
  = fromIntegral <$>
      ({# call webkit_dom_node_compare_document_position #} (toNode self)
         (maybe (Node nullForeignPtr) toNode other))
 
nodeContains ::
             (NodeClass self, NodeClass other) => self -> Maybe other -> IO Bool
nodeContains self other
  = toBool <$>
      ({# call webkit_dom_node_contains #} (toNode self)
         (maybe (Node nullForeignPtr) toNode other))
 
nodeDispatchEvent ::
                  (NodeClass self, EventClass event) =>
                    self -> Maybe event -> IO Bool
nodeDispatchEvent self event
  = toBool <$>
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_node_dispatch_event #} (toNode self)
             (maybe (Event nullForeignPtr) toEvent event)
             errorPtr_)
cELEMENT_NODE = 1
cATTRIBUTE_NODE = 2
cTEXT_NODE = 3
cCDATA_SECTION_NODE = 4
cENTITY_REFERENCE_NODE = 5
cENTITY_NODE = 6
cPROCESSING_INSTRUCTION_NODE = 7
cCOMMENT_NODE = 8
cDOCUMENT_NODE = 9
cDOCUMENT_TYPE_NODE = 10
cDOCUMENT_FRAGMENT_NODE = 11
cNOTATION_NODE = 12
cDOCUMENT_POSITION_DISCONNECTED = 1
cDOCUMENT_POSITION_PRECEDING = 2
cDOCUMENT_POSITION_FOLLOWING = 4
cDOCUMENT_POSITION_CONTAINS = 8
cDOCUMENT_POSITION_CONTAINED_BY = 16
cDOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC = 32
 
nodeGetNodeName :: (NodeClass self) => self -> IO String
nodeGetNodeName self
  = ({# call webkit_dom_node_get_node_name #} (toNode self)) >>=
      readUTFString
 
nodeSetNodeValue :: (NodeClass self) => self -> String -> IO ()
nodeSetNodeValue self val
  = propagateGError $
      \ errorPtr_ ->
        withUTFString val $
          \ valPtr ->
            {# call webkit_dom_node_set_node_value #} (toNode self) valPtr
          errorPtr_
 
nodeGetNodeValue :: (NodeClass self) => self -> IO String
nodeGetNodeValue self
  = ({# call webkit_dom_node_get_node_value #} (toNode self)) >>=
      readUTFString
 
nodeGetNodeType :: (NodeClass self) => self -> IO Word
nodeGetNodeType self
  = fromIntegral <$>
      ({# call webkit_dom_node_get_node_type #} (toNode self))
 
nodeGetParentNode :: (NodeClass self) => self -> IO (Maybe Node)
nodeGetParentNode self
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_node_get_parent_node #} (toNode self))
 
nodeGetChildNodes ::
                  (NodeClass self) => self -> IO (Maybe NodeList)
nodeGetChildNodes self
  = maybeNull (makeNewGObject mkNodeList)
      ({# call webkit_dom_node_get_child_nodes #} (toNode self))
 
nodeGetFirstChild :: (NodeClass self) => self -> IO (Maybe Node)
nodeGetFirstChild self
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_node_get_first_child #} (toNode self))
 
nodeGetLastChild :: (NodeClass self) => self -> IO (Maybe Node)
nodeGetLastChild self
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_node_get_last_child #} (toNode self))
 
nodeGetPreviousSibling ::
                       (NodeClass self) => self -> IO (Maybe Node)
nodeGetPreviousSibling self
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_node_get_previous_sibling #} (toNode self))
 
nodeGetNextSibling :: (NodeClass self) => self -> IO (Maybe Node)
nodeGetNextSibling self
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_node_get_next_sibling #} (toNode self))
 
nodeGetOwnerDocument ::
                     (NodeClass self) => self -> IO (Maybe Document)
nodeGetOwnerDocument self
  = maybeNull (makeNewGObject mkDocument)
      ({# call webkit_dom_node_get_owner_document #} (toNode self))
 
nodeGetNamespaceURI :: (NodeClass self) => self -> IO String
nodeGetNamespaceURI self
  = ({# call webkit_dom_node_get_namespace_uri #} (toNode self)) >>=
      readUTFString
 
nodeSetPrefix :: (NodeClass self) => self -> String -> IO ()
nodeSetPrefix self val
  = propagateGError $
      \ errorPtr_ ->
        withUTFString val $
          \ valPtr ->
            {# call webkit_dom_node_set_prefix #} (toNode self) valPtr
          errorPtr_
 
nodeGetPrefix :: (NodeClass self) => self -> IO String
nodeGetPrefix self
  = ({# call webkit_dom_node_get_prefix #} (toNode self)) >>=
      readUTFString
 
nodeGetLocalName :: (NodeClass self) => self -> IO String
nodeGetLocalName self
  = ({# call webkit_dom_node_get_local_name #} (toNode self)) >>=
      readUTFString
 
nodeGetBaseURI :: (NodeClass self) => self -> IO String
nodeGetBaseURI self
  = ({# call webkit_dom_node_get_base_uri #} (toNode self)) >>=
      readUTFString
 
nodeSetTextContent :: (NodeClass self) => self -> String -> IO ()
nodeSetTextContent self val
  = propagateGError $
      \ errorPtr_ ->
        withUTFString val $
          \ valPtr ->
            {# call webkit_dom_node_set_text_content #} (toNode self) valPtr
          errorPtr_
 
nodeGetTextContent :: (NodeClass self) => self -> IO String
nodeGetTextContent self
  = ({# call webkit_dom_node_get_text_content #} (toNode self)) >>=
      readUTFString
 
nodeGetParentElement ::
                     (NodeClass self) => self -> IO (Maybe Element)
nodeGetParentElement self
  = maybeNull (makeNewGObject mkElement)
      ({# call webkit_dom_node_get_parent_element #} (toNode self))
