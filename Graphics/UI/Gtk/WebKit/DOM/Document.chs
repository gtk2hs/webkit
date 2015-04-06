module Graphics.UI.Gtk.WebKit.DOM.Document(
createElement,
createDocumentFragment,
createTextNode,
createComment,
createCDATASection,
createProcessingInstruction,
createAttribute,
createEntityReference,
getElementsByTagName,
importNode,
createElementNS,
createAttributeNS,
getElementsByTagNameNS,
getElementById,
adoptNode,
createEvent,
createRange,
createNodeIterator,
createTreeWalker,
getOverrideStyle,
createExpression,
createNSResolver,
evaluate,
execCommand,
queryCommandEnabled,
queryCommandIndeterm,
queryCommandState,
queryCommandSupported,
queryCommandValue,
getElementsByName,
elementFromPoint,
caretRangeFromPoint,
createCSSStyleDeclaration,
getElementsByClassName,
#if WEBKIT_CHECK_VERSION(2,5,1)
hasFocus,
#endif
querySelector,
querySelectorAll,
webkitCancelFullScreen,
webkitExitFullscreen,
#if WEBKIT_CHECK_VERSION(2,2,2)
webkitGetNamedFlows,
#endif
createTouch,
getDoctype,
getImplementation,
getDocumentElement,
getInputEncoding,
getXmlEncoding,
setXmlVersion,
getXmlVersion,
setXmlStandalone,
getXmlStandalone,
getDocumentURI,
getDefaultView,
getStyleSheets,
setTitle,
getTitle,
getReferrer,
getDomain,
setCookie,
getCookie,
setBody,
getBody,
getHead,
getImages,
getApplets,
getLinks,
getForms,
getAnchors,
getLastModified,
setCharset,
getCharset,
getDefaultCharset,
getReadyState,
getCharacterSet,
getPreferredStylesheetSet,
setSelectedStylesheetSet,
getSelectedStylesheetSet,
getCompatMode,
getWebkitIsFullScreen,
getWebkitFullScreenKeyboardInputAllowed,
getWebkitCurrentFullScreenElement,
getWebkitFullscreenEnabled,
getWebkitFullscreenElement,
abort,
blur,
change,
click,
contextMenu,
dblClick,
drag,
dragEnd,
dragEnter,
dragLeave,
dragOver,
dragStart,
drop,
error,
focus,
input,
invalid,
keyDown,
keyPress,
keyUp,
load,
mouseDown,
mouseEnter,
mouseLeave,
mouseMove,
mouseOut,
mouseOver,
mouseUp,
mouseWheel,
readyStateChange,
scroll,
select,
submit,
wheel,
beforeCut,
cut,
beforeCopy,
copy,
beforePaste,
paste,
reset,
search,
selectStart,
selectionchange,
touchStart,
touchMove,
touchEnd,
touchCancel,
webKitFullscreenChange,
webKitFullscreenError,
pointerlockchange,
pointerlockerror,
securitypolicyviolation,
webKitWillRevealBottom,
webKitWillRevealLeft,
webKitWillRevealRight,
webKitWillRevealTop,
getVisibilityState,
getHidden,
#if WEBKIT_CHECK_VERSION(1,10,0)
getSecurityPolicy,
#endif
#if WEBKIT_CHECK_VERSION(2,2,2)
getCurrentScript,
#endif
Document,
castToDocument,
gTypeDocument,
DocumentClass,
toDocument,
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

 
createElement ::
              (MonadIO m, DocumentClass self, GlibString string) =>
                self -> string -> m (Maybe Element)
createElement self tagName
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString tagName $
                \ tagNamePtr ->
                  {# call webkit_dom_document_create_element #} (toDocument self)
                    tagNamePtr
                errorPtr_))
 
createDocumentFragment ::
                       (MonadIO m, DocumentClass self) =>
                         self -> m (Maybe DocumentFragment)
createDocumentFragment self
  = liftIO
      (maybeNull (makeNewGObject mkDocumentFragment)
         ({# call webkit_dom_document_create_document_fragment #}
            (toDocument self)))
 
createTextNode ::
               (MonadIO m, DocumentClass self, GlibString string) =>
                 self -> string -> m (Maybe Text)
createTextNode self data'
  = liftIO
      (maybeNull (makeNewGObject mkText)
         (withUTFString data' $
            \ dataPtr ->
              {# call webkit_dom_document_create_text_node #} (toDocument self)
                dataPtr))
 
createComment ::
              (MonadIO m, DocumentClass self, GlibString string) =>
                self -> string -> m (Maybe Comment)
createComment self data'
  = liftIO
      (maybeNull (makeNewGObject mkComment)
         (withUTFString data' $
            \ dataPtr ->
              {# call webkit_dom_document_create_comment #} (toDocument self)
                dataPtr))
 
createCDATASection ::
                   (MonadIO m, DocumentClass self, GlibString string) =>
                     self -> string -> m (Maybe CDATASection)
createCDATASection self data'
  = liftIO
      (maybeNull (makeNewGObject mkCDATASection)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString data' $
                \ dataPtr ->
                  {# call webkit_dom_document_create_cdata_section #}
                    (toDocument self)
                    dataPtr
                errorPtr_))
 
createProcessingInstruction ::
                            (MonadIO m, DocumentClass self, GlibString string) =>
                              self -> string -> string -> m (Maybe ProcessingInstruction)
createProcessingInstruction self target data'
  = liftIO
      (maybeNull (makeNewGObject mkProcessingInstruction)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString data' $
                \ dataPtr ->
                  withUTFString target $
                    \ targetPtr ->
                      {# call webkit_dom_document_create_processing_instruction #}
                        (toDocument self)
                        targetPtr
                    dataPtr
                errorPtr_))
 
createAttribute ::
                (MonadIO m, DocumentClass self, GlibString string) =>
                  self -> string -> m (Maybe DOMAttr)
createAttribute self name
  = liftIO
      (maybeNull (makeNewGObject mkDOMAttr)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString name $
                \ namePtr ->
                  {# call webkit_dom_document_create_attribute #} (toDocument self)
                    namePtr
                errorPtr_))
 
createEntityReference ::
                      (MonadIO m, DocumentClass self, GlibString string) =>
                        self -> string -> m (Maybe EntityReference)
createEntityReference self name
  = liftIO
      (maybeNull (makeNewGObject mkEntityReference)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString name $
                \ namePtr ->
                  {# call webkit_dom_document_create_entity_reference #}
                    (toDocument self)
                    namePtr
                errorPtr_))
 
getElementsByTagName ::
                     (MonadIO m, DocumentClass self, GlibString string) =>
                       self -> string -> m (Maybe NodeList)
getElementsByTagName self tagname
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         (withUTFString tagname $
            \ tagnamePtr ->
              {# call webkit_dom_document_get_elements_by_tag_name #}
                (toDocument self)
                tagnamePtr))
 
importNode ::
           (MonadIO m, DocumentClass self, NodeClass importedNode) =>
             self -> Maybe importedNode -> Bool -> m (Maybe Node)
importNode self importedNode deep
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_document_import_node #} (toDocument self)
                (maybe (Node nullForeignPtr) toNode importedNode)
                (fromBool deep)
                errorPtr_))
 
createElementNS ::
                (MonadIO m, DocumentClass self, GlibString string) =>
                  self -> string -> string -> m (Maybe Element)
createElementNS self namespaceURI qualifiedName
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString qualifiedName $
                \ qualifiedNamePtr ->
                  withUTFString namespaceURI $
                    \ namespaceURIPtr ->
                      {# call webkit_dom_document_create_element_ns #} (toDocument self)
                        namespaceURIPtr
                    qualifiedNamePtr
                errorPtr_))
 
createAttributeNS ::
                  (MonadIO m, DocumentClass self, GlibString string) =>
                    self -> string -> string -> m (Maybe DOMAttr)
createAttributeNS self namespaceURI qualifiedName
  = liftIO
      (maybeNull (makeNewGObject mkDOMAttr)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString qualifiedName $
                \ qualifiedNamePtr ->
                  withUTFString namespaceURI $
                    \ namespaceURIPtr ->
                      {# call webkit_dom_document_create_attribute_ns #}
                        (toDocument self)
                        namespaceURIPtr
                    qualifiedNamePtr
                errorPtr_))
 
getElementsByTagNameNS ::
                       (MonadIO m, DocumentClass self, GlibString string) =>
                         self -> string -> string -> m (Maybe NodeList)
getElementsByTagNameNS self namespaceURI localName
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         (withUTFString localName $
            \ localNamePtr ->
              withUTFString namespaceURI $
                \ namespaceURIPtr ->
                  {# call webkit_dom_document_get_elements_by_tag_name_ns #}
                    (toDocument self)
                    namespaceURIPtr
                localNamePtr))
 
getElementById ::
               (MonadIO m, DocumentClass self, GlibString string) =>
                 self -> string -> m (Maybe Element)
getElementById self elementId
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         (withUTFString elementId $
            \ elementIdPtr ->
              {# call webkit_dom_document_get_element_by_id #} (toDocument self)
                elementIdPtr))
 
adoptNode ::
          (MonadIO m, DocumentClass self, NodeClass source) =>
            self -> Maybe source -> m (Maybe Node)
adoptNode self source
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_document_adopt_node #} (toDocument self)
                (maybe (Node nullForeignPtr) toNode source)
                errorPtr_))
 
createEvent ::
            (MonadIO m, DocumentClass self, GlibString string) =>
              self -> string -> m (Maybe Event)
createEvent self eventType
  = liftIO
      (maybeNull (makeNewGObject mkEvent)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString eventType $
                \ eventTypePtr ->
                  {# call webkit_dom_document_create_event #} (toDocument self)
                    eventTypePtr
                errorPtr_))
 
createRange ::
            (MonadIO m, DocumentClass self) => self -> m (Maybe DOMRange)
createRange self
  = liftIO
      (maybeNull (makeNewGObject mkDOMRange)
         ({# call webkit_dom_document_create_range #} (toDocument self)))
 
createNodeIterator ::
                   (MonadIO m, DocumentClass self, NodeClass root,
                    NodeFilterClass filter) =>
                     self ->
                       Maybe root ->
                         Word -> Maybe filter -> Bool -> m (Maybe NodeIterator)
createNodeIterator self root whatToShow filter
  expandEntityReferences
  = liftIO
      (maybeNull (makeNewGObject mkNodeIterator)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_document_create_node_iterator #}
                (toDocument self)
                (maybe (Node nullForeignPtr) toNode root)
                (fromIntegral whatToShow)
                (maybe (NodeFilter nullForeignPtr) toNodeFilter filter)
                (fromBool expandEntityReferences)
                errorPtr_))
 
createTreeWalker ::
                 (MonadIO m, DocumentClass self, NodeClass root,
                  NodeFilterClass filter) =>
                   self ->
                     Maybe root -> Word -> Maybe filter -> Bool -> m (Maybe TreeWalker)
createTreeWalker self root whatToShow filter expandEntityReferences
  = liftIO
      (maybeNull (makeNewGObject mkTreeWalker)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_document_create_tree_walker #} (toDocument self)
                (maybe (Node nullForeignPtr) toNode root)
                (fromIntegral whatToShow)
                (maybe (NodeFilter nullForeignPtr) toNodeFilter filter)
                (fromBool expandEntityReferences)
                errorPtr_))
 
getOverrideStyle ::
                 (MonadIO m, DocumentClass self, ElementClass element,
                  GlibString string) =>
                   self -> Maybe element -> string -> m (Maybe CSSStyleDeclaration)
getOverrideStyle self element pseudoElement
  = liftIO
      (maybeNull (makeNewGObject mkCSSStyleDeclaration)
         (withUTFString pseudoElement $
            \ pseudoElementPtr ->
              {# call webkit_dom_document_get_override_style #} (toDocument self)
                (maybe (Element nullForeignPtr) toElement element)
                pseudoElementPtr))
 
createExpression ::
                 (MonadIO m, DocumentClass self, XPathNSResolverClass resolver,
                  GlibString string) =>
                   self -> string -> Maybe resolver -> m (Maybe XPathExpression)
createExpression self expression resolver
  = liftIO
      (maybeNull (makeNewGObject mkXPathExpression)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString expression $
                \ expressionPtr ->
                  {# call webkit_dom_document_create_expression #} (toDocument self)
                    expressionPtr
                (maybe (XPathNSResolver nullForeignPtr) toXPathNSResolver resolver)
                errorPtr_))
 
createNSResolver ::
                 (MonadIO m, DocumentClass self, NodeClass nodeResolver) =>
                   self -> Maybe nodeResolver -> m (Maybe XPathNSResolver)
createNSResolver self nodeResolver
  = liftIO
      (maybeNull (makeNewGObject mkXPathNSResolver)
         ({# call webkit_dom_document_create_ns_resolver #}
            (toDocument self)
            (maybe (Node nullForeignPtr) toNode nodeResolver)))
 
evaluate ::
         (MonadIO m, DocumentClass self, NodeClass contextNode,
          XPathNSResolverClass resolver, XPathResultClass inResult,
          GlibString string) =>
           self ->
             string ->
               Maybe contextNode ->
                 Maybe resolver -> Word -> Maybe inResult -> m (Maybe XPathResult)
evaluate self expression contextNode resolver type' inResult
  = liftIO
      (maybeNull (makeNewGObject mkXPathResult)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString expression $
                \ expressionPtr ->
                  {# call webkit_dom_document_evaluate #} (toDocument self)
                    expressionPtr
                (maybe (Node nullForeignPtr) toNode contextNode)
                (maybe (XPathNSResolver nullForeignPtr) toXPathNSResolver resolver)
                (fromIntegral type')
                (maybe (XPathResult nullForeignPtr) toXPathResult inResult)
                errorPtr_))
 
execCommand ::
            (MonadIO m, DocumentClass self, GlibString string) =>
              self -> string -> Bool -> string -> m Bool
execCommand self command userInterface value
  = liftIO
      (toBool <$>
         (withUTFString value $
            \ valuePtr ->
              withUTFString command $
                \ commandPtr ->
                  {# call webkit_dom_document_exec_command #} (toDocument self)
                    commandPtr
                (fromBool userInterface)
                valuePtr))
 
queryCommandEnabled ::
                    (MonadIO m, DocumentClass self, GlibString string) =>
                      self -> string -> m Bool
queryCommandEnabled self command
  = liftIO
      (toBool <$>
         (withUTFString command $
            \ commandPtr ->
              {# call webkit_dom_document_query_command_enabled #}
                (toDocument self)
                commandPtr))
 
queryCommandIndeterm ::
                     (MonadIO m, DocumentClass self, GlibString string) =>
                       self -> string -> m Bool
queryCommandIndeterm self command
  = liftIO
      (toBool <$>
         (withUTFString command $
            \ commandPtr ->
              {# call webkit_dom_document_query_command_indeterm #}
                (toDocument self)
                commandPtr))
 
queryCommandState ::
                  (MonadIO m, DocumentClass self, GlibString string) =>
                    self -> string -> m Bool
queryCommandState self command
  = liftIO
      (toBool <$>
         (withUTFString command $
            \ commandPtr ->
              {# call webkit_dom_document_query_command_state #}
                (toDocument self)
                commandPtr))
 
queryCommandSupported ::
                      (MonadIO m, DocumentClass self, GlibString string) =>
                        self -> string -> m Bool
queryCommandSupported self command
  = liftIO
      (toBool <$>
         (withUTFString command $
            \ commandPtr ->
              {# call webkit_dom_document_query_command_supported #}
                (toDocument self)
                commandPtr))
 
queryCommandValue ::
                  (MonadIO m, DocumentClass self, GlibString string) =>
                    self -> string -> m string
queryCommandValue self command
  = liftIO
      ((withUTFString command $
          \ commandPtr ->
            {# call webkit_dom_document_query_command_value #}
              (toDocument self)
              commandPtr)
         >>=
         readUTFString)
 
getElementsByName ::
                  (MonadIO m, DocumentClass self, GlibString string) =>
                    self -> string -> m (Maybe NodeList)
getElementsByName self elementName
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         (withUTFString elementName $
            \ elementNamePtr ->
              {# call webkit_dom_document_get_elements_by_name #}
                (toDocument self)
                elementNamePtr))
 
elementFromPoint ::
                 (MonadIO m, DocumentClass self) =>
                   self -> Int -> Int -> m (Maybe Element)
elementFromPoint self x y
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         ({# call webkit_dom_document_element_from_point #}
            (toDocument self)
            (fromIntegral x)
            (fromIntegral y)))
 
caretRangeFromPoint ::
                    (MonadIO m, DocumentClass self) =>
                      self -> Int -> Int -> m (Maybe DOMRange)
caretRangeFromPoint self x y
  = liftIO
      (maybeNull (makeNewGObject mkDOMRange)
         ({# call webkit_dom_document_caret_range_from_point #}
            (toDocument self)
            (fromIntegral x)
            (fromIntegral y)))
 
createCSSStyleDeclaration ::
                          (MonadIO m, DocumentClass self) =>
                            self -> m (Maybe CSSStyleDeclaration)
createCSSStyleDeclaration self
  = liftIO
      (maybeNull (makeNewGObject mkCSSStyleDeclaration)
         ({# call webkit_dom_document_create_css_style_declaration #}
            (toDocument self)))
 
getElementsByClassName ::
                       (MonadIO m, DocumentClass self, GlibString string) =>
                         self -> string -> m (Maybe NodeList)
getElementsByClassName self tagname
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         (withUTFString tagname $
            \ tagnamePtr ->
              {# call webkit_dom_document_get_elements_by_class_name #}
                (toDocument self)
                tagnamePtr))

#if WEBKIT_CHECK_VERSION(2,5,1) 
hasFocus :: (MonadIO m, DocumentClass self) => self -> m Bool
hasFocus self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_document_has_focus #} (toDocument self)))
#endif
 
querySelector ::
              (MonadIO m, DocumentClass self, GlibString string) =>
                self -> string -> m (Maybe Element)
querySelector self selectors
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString selectors $
                \ selectorsPtr ->
                  {# call webkit_dom_document_query_selector #} (toDocument self)
                    selectorsPtr
                errorPtr_))
 
querySelectorAll ::
                 (MonadIO m, DocumentClass self, GlibString string) =>
                   self -> string -> m (Maybe NodeList)
querySelectorAll self selectors
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString selectors $
                \ selectorsPtr ->
                  {# call webkit_dom_document_query_selector_all #} (toDocument self)
                    selectorsPtr
                errorPtr_))
 
webkitCancelFullScreen ::
                       (MonadIO m, DocumentClass self) => self -> m ()
webkitCancelFullScreen self
  = liftIO
      ({# call webkit_dom_document_webkit_cancel_full_screen #}
         (toDocument self))
 
webkitExitFullscreen ::
                     (MonadIO m, DocumentClass self) => self -> m ()
webkitExitFullscreen self
  = liftIO
      ({# call webkit_dom_document_webkit_exit_fullscreen #}
         (toDocument self))

#if WEBKIT_CHECK_VERSION(2,2,2) 
webkitGetNamedFlows ::
                    (MonadIO m, DocumentClass self) =>
                      self -> m (Maybe DOMNamedFlowCollection)
webkitGetNamedFlows self
  = liftIO
      (maybeNull (makeNewGObject mkDOMNamedFlowCollection)
         ({# call webkit_dom_document_webkit_get_named_flows #}
            (toDocument self)))
#endif
 
createTouch ::
            (MonadIO m, DocumentClass self, DOMWindowClass window,
             EventTargetClass target) =>
              self ->
                Maybe window ->
                  Maybe target ->
                    Int ->
                      Int ->
                        Int ->
                          Int -> Int -> Int -> Int -> Float -> Float -> m (Maybe Touch)
createTouch self window target identifier pageX pageY screenX
  screenY webkitRadiusX webkitRadiusY webkitRotationAngle webkitForce
  = liftIO
      (maybeNull (makeNewGObject mkTouch)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_document_create_touch #} (toDocument self)
                (maybe (DOMWindow nullForeignPtr) toDOMWindow window)
                (maybe (EventTarget nullForeignPtr) toEventTarget target)
                (fromIntegral identifier)
                (fromIntegral pageX)
                (fromIntegral pageY)
                (fromIntegral screenX)
                (fromIntegral screenY)
                (fromIntegral webkitRadiusX)
                (fromIntegral webkitRadiusY)
                (realToFrac webkitRotationAngle)
                (realToFrac webkitForce)
                errorPtr_))
 
getDoctype ::
           (MonadIO m, DocumentClass self) => self -> m (Maybe DocumentType)
getDoctype self
  = liftIO
      (maybeNull (makeNewGObject mkDocumentType)
         ({# call webkit_dom_document_get_doctype #} (toDocument self)))
 
getImplementation ::
                  (MonadIO m, DocumentClass self) =>
                    self -> m (Maybe DOMImplementation)
getImplementation self
  = liftIO
      (maybeNull (makeNewGObject mkDOMImplementation)
         ({# call webkit_dom_document_get_implementation #}
            (toDocument self)))
 
getDocumentElement ::
                   (MonadIO m, DocumentClass self) => self -> m (Maybe Element)
getDocumentElement self
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         ({# call webkit_dom_document_get_document_element #}
            (toDocument self)))
 
getInputEncoding ::
                 (MonadIO m, DocumentClass self, GlibString string) =>
                   self -> m string
getInputEncoding self
  = liftIO
      (({# call webkit_dom_document_get_input_encoding #}
          (toDocument self))
         >>=
         readUTFString)
 
getXmlEncoding ::
               (MonadIO m, DocumentClass self, GlibString string) =>
                 self -> m string
getXmlEncoding self
  = liftIO
      (({# call webkit_dom_document_get_xml_encoding #}
          (toDocument self))
         >>=
         readUTFString)
 
setXmlVersion ::
              (MonadIO m, DocumentClass self, GlibString string) =>
                self -> string -> m ()
setXmlVersion self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString val $
             \ valPtr ->
               {# call webkit_dom_document_set_xml_version #} (toDocument self)
                 valPtr
             errorPtr_)
 
getXmlVersion ::
              (MonadIO m, DocumentClass self, GlibString string) =>
                self -> m string
getXmlVersion self
  = liftIO
      (({# call webkit_dom_document_get_xml_version #} (toDocument self))
         >>=
         readUTFString)
 
setXmlStandalone ::
                 (MonadIO m, DocumentClass self) => self -> Bool -> m ()
setXmlStandalone self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_document_set_xml_standalone #} (toDocument self)
             (fromBool val)
             errorPtr_)
 
getXmlStandalone ::
                 (MonadIO m, DocumentClass self) => self -> m Bool
getXmlStandalone self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_document_get_xml_standalone #}
            (toDocument self)))
 
getDocumentURI ::
               (MonadIO m, DocumentClass self, GlibString string) =>
                 self -> m string
getDocumentURI self
  = liftIO
      (({# call webkit_dom_document_get_document_uri #}
          (toDocument self))
         >>=
         readUTFString)
 
getDefaultView ::
               (MonadIO m, DocumentClass self) => self -> m (Maybe DOMWindow)
getDefaultView self
  = liftIO
      (maybeNull (makeNewGObject mkDOMWindow)
         ({# call webkit_dom_document_get_default_view #}
            (toDocument self)))
 
getStyleSheets ::
               (MonadIO m, DocumentClass self) => self -> m (Maybe StyleSheetList)
getStyleSheets self
  = liftIO
      (maybeNull (makeNewGObject mkStyleSheetList)
         ({# call webkit_dom_document_get_style_sheets #}
            (toDocument self)))
 
setTitle ::
         (MonadIO m, DocumentClass self, GlibString string) =>
           self -> string -> m ()
setTitle self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_document_set_title #} (toDocument self) valPtr)
 
getTitle ::
         (MonadIO m, DocumentClass self, GlibString string) =>
           self -> m string
getTitle self
  = liftIO
      (({# call webkit_dom_document_get_title #} (toDocument self)) >>=
         readUTFString)
 
getReferrer ::
            (MonadIO m, DocumentClass self, GlibString string) =>
              self -> m string
getReferrer self
  = liftIO
      (({# call webkit_dom_document_get_referrer #} (toDocument self))
         >>=
         readUTFString)
 
getDomain ::
          (MonadIO m, DocumentClass self, GlibString string) =>
            self -> m string
getDomain self
  = liftIO
      (({# call webkit_dom_document_get_domain #} (toDocument self)) >>=
         readUTFString)
 
setCookie ::
          (MonadIO m, DocumentClass self, GlibString string) =>
            self -> string -> m ()
setCookie self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString val $
             \ valPtr ->
               {# call webkit_dom_document_set_cookie #} (toDocument self) valPtr
             errorPtr_)
 
getCookie ::
          (MonadIO m, DocumentClass self, GlibString string) =>
            self -> m string
getCookie self
  = liftIO
      ((propagateGError $
          \ errorPtr_ ->
            {# call webkit_dom_document_get_cookie #} (toDocument self)
              errorPtr_)
         >>=
         readUTFString)
 
setBody ::
        (MonadIO m, HTMLElementClass val, DocumentClass self) =>
          self -> Maybe val -> m ()
setBody self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_document_set_body #} (toDocument self)
             (maybe (HTMLElement nullForeignPtr) toHTMLElement val)
             errorPtr_)
 
getBody ::
        (MonadIO m, DocumentClass self) => self -> m (Maybe HTMLElement)
getBody self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLElement)
         ({# call webkit_dom_document_get_body #} (toDocument self)))
 
getHead ::
        (MonadIO m, DocumentClass self) =>
          self -> m (Maybe HTMLHeadElement)
getHead self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLHeadElement)
         ({# call webkit_dom_document_get_head #} (toDocument self)))
 
getImages ::
          (MonadIO m, DocumentClass self) => self -> m (Maybe HTMLCollection)
getImages self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLCollection)
         ({# call webkit_dom_document_get_images #} (toDocument self)))
 
getApplets ::
           (MonadIO m, DocumentClass self) => self -> m (Maybe HTMLCollection)
getApplets self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLCollection)
         ({# call webkit_dom_document_get_applets #} (toDocument self)))
 
getLinks ::
         (MonadIO m, DocumentClass self) => self -> m (Maybe HTMLCollection)
getLinks self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLCollection)
         ({# call webkit_dom_document_get_links #} (toDocument self)))
 
getForms ::
         (MonadIO m, DocumentClass self) => self -> m (Maybe HTMLCollection)
getForms self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLCollection)
         ({# call webkit_dom_document_get_forms #} (toDocument self)))
 
getAnchors ::
           (MonadIO m, DocumentClass self) => self -> m (Maybe HTMLCollection)
getAnchors self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLCollection)
         ({# call webkit_dom_document_get_anchors #} (toDocument self)))
 
getLastModified ::
                (MonadIO m, DocumentClass self, GlibString string) =>
                  self -> m string
getLastModified self
  = liftIO
      (({# call webkit_dom_document_get_last_modified #}
          (toDocument self))
         >>=
         readUTFString)
 
setCharset ::
           (MonadIO m, DocumentClass self, GlibString string) =>
             self -> string -> m ()
setCharset self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_document_set_charset #} (toDocument self)
             valPtr)
 
getCharset ::
           (MonadIO m, DocumentClass self, GlibString string) =>
             self -> m string
getCharset self
  = liftIO
      (({# call webkit_dom_document_get_charset #} (toDocument self)) >>=
         readUTFString)
 
getDefaultCharset ::
                  (MonadIO m, DocumentClass self, GlibString string) =>
                    self -> m string
getDefaultCharset self
  = liftIO
      (({# call webkit_dom_document_get_default_charset #}
          (toDocument self))
         >>=
         readUTFString)
 
getReadyState ::
              (MonadIO m, DocumentClass self, GlibString string) =>
                self -> m string
getReadyState self
  = liftIO
      (({# call webkit_dom_document_get_ready_state #} (toDocument self))
         >>=
         readUTFString)
 
getCharacterSet ::
                (MonadIO m, DocumentClass self, GlibString string) =>
                  self -> m string
getCharacterSet self
  = liftIO
      (({# call webkit_dom_document_get_character_set #}
          (toDocument self))
         >>=
         readUTFString)
 
getPreferredStylesheetSet ::
                          (MonadIO m, DocumentClass self, GlibString string) =>
                            self -> m string
getPreferredStylesheetSet self
  = liftIO
      (({# call webkit_dom_document_get_preferred_stylesheet_set #}
          (toDocument self))
         >>=
         readUTFString)
 
setSelectedStylesheetSet ::
                         (MonadIO m, DocumentClass self, GlibString string) =>
                           self -> string -> m ()
setSelectedStylesheetSet self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_document_set_selected_stylesheet_set #}
             (toDocument self)
             valPtr)
 
getSelectedStylesheetSet ::
                         (MonadIO m, DocumentClass self, GlibString string) =>
                           self -> m string
getSelectedStylesheetSet self
  = liftIO
      (({# call webkit_dom_document_get_selected_stylesheet_set #}
          (toDocument self))
         >>=
         readUTFString)
 
getCompatMode ::
              (MonadIO m, DocumentClass self, GlibString string) =>
                self -> m string
getCompatMode self
  = liftIO
      (({# call webkit_dom_document_get_compat_mode #} (toDocument self))
         >>=
         readUTFString)
 
getWebkitIsFullScreen ::
                      (MonadIO m, DocumentClass self) => self -> m Bool
getWebkitIsFullScreen self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_document_get_webkit_is_full_screen #}
            (toDocument self)))
 
getWebkitFullScreenKeyboardInputAllowed ::
                                        (MonadIO m, DocumentClass self) => self -> m Bool
getWebkitFullScreenKeyboardInputAllowed self
  = liftIO
      (toBool <$>
         ({# call
            webkit_dom_document_get_webkit_full_screen_keyboard_input_allowed
            #}
            (toDocument self)))
 
getWebkitCurrentFullScreenElement ::
                                  (MonadIO m, DocumentClass self) => self -> m (Maybe Element)
getWebkitCurrentFullScreenElement self
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         ({# call webkit_dom_document_get_webkit_current_full_screen_element
            #}
            (toDocument self)))
 
getWebkitFullscreenEnabled ::
                           (MonadIO m, DocumentClass self) => self -> m Bool
getWebkitFullscreenEnabled self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_document_get_webkit_fullscreen_enabled #}
            (toDocument self)))
 
getWebkitFullscreenElement ::
                           (MonadIO m, DocumentClass self) => self -> m (Maybe Element)
getWebkitFullscreenElement self
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         ({# call webkit_dom_document_get_webkit_fullscreen_element #}
            (toDocument self)))
 
abort :: (DocumentClass self) => EventName self UIEvent
abort = EventName "abort"
 
blur :: (DocumentClass self) => EventName self UIEvent
blur = EventName "blur"
 
change :: (DocumentClass self) => EventName self Event
change = EventName "change"
 
click :: (DocumentClass self) => EventName self MouseEvent
click = EventName "click"
 
contextMenu :: (DocumentClass self) => EventName self MouseEvent
contextMenu = EventName "contextmenu"
 
dblClick :: (DocumentClass self) => EventName self MouseEvent
dblClick = EventName "dblclick"
 
drag :: (DocumentClass self) => EventName self MouseEvent
drag = EventName "drag"
 
dragEnd :: (DocumentClass self) => EventName self MouseEvent
dragEnd = EventName "dragend"
 
dragEnter :: (DocumentClass self) => EventName self MouseEvent
dragEnter = EventName "dragenter"
 
dragLeave :: (DocumentClass self) => EventName self MouseEvent
dragLeave = EventName "dragleave"
 
dragOver :: (DocumentClass self) => EventName self MouseEvent
dragOver = EventName "dragover"
 
dragStart :: (DocumentClass self) => EventName self MouseEvent
dragStart = EventName "dragstart"
 
drop :: (DocumentClass self) => EventName self MouseEvent
drop = EventName "drop"
 
error :: (DocumentClass self) => EventName self UIEvent
error = EventName "error"
 
focus :: (DocumentClass self) => EventName self UIEvent
focus = EventName "focus"
 
input :: (DocumentClass self) => EventName self Event
input = EventName "input"
 
invalid :: (DocumentClass self) => EventName self Event
invalid = EventName "invalid"
 
keyDown :: (DocumentClass self) => EventName self KeyboardEvent
keyDown = EventName "keydown"
 
keyPress :: (DocumentClass self) => EventName self KeyboardEvent
keyPress = EventName "keypress"
 
keyUp :: (DocumentClass self) => EventName self KeyboardEvent
keyUp = EventName "keyup"
 
load :: (DocumentClass self) => EventName self UIEvent
load = EventName "load"
 
mouseDown :: (DocumentClass self) => EventName self MouseEvent
mouseDown = EventName "mousedown"
 
mouseEnter :: (DocumentClass self) => EventName self MouseEvent
mouseEnter = EventName "mouseenter"
 
mouseLeave :: (DocumentClass self) => EventName self MouseEvent
mouseLeave = EventName "mouseleave"
 
mouseMove :: (DocumentClass self) => EventName self MouseEvent
mouseMove = EventName "mousemove"
 
mouseOut :: (DocumentClass self) => EventName self MouseEvent
mouseOut = EventName "mouseout"
 
mouseOver :: (DocumentClass self) => EventName self MouseEvent
mouseOver = EventName "mouseover"
 
mouseUp :: (DocumentClass self) => EventName self MouseEvent
mouseUp = EventName "mouseup"
 
mouseWheel :: (DocumentClass self) => EventName self MouseEvent
mouseWheel = EventName "mousewheel"
 
readyStateChange :: (DocumentClass self) => EventName self Event
readyStateChange = EventName "readystatechange"
 
scroll :: (DocumentClass self) => EventName self UIEvent
scroll = EventName "scroll"
 
select :: (DocumentClass self) => EventName self UIEvent
select = EventName "select"
 
submit :: (DocumentClass self) => EventName self Event
submit = EventName "submit"
 
wheel :: (DocumentClass self) => EventName self WheelEvent
wheel = EventName "wheel"
 
beforeCut :: (DocumentClass self) => EventName self Event
beforeCut = EventName "beforecut"
 
cut :: (DocumentClass self) => EventName self Event
cut = EventName "cut"
 
beforeCopy :: (DocumentClass self) => EventName self Event
beforeCopy = EventName "beforecopy"
 
copy :: (DocumentClass self) => EventName self Event
copy = EventName "copy"
 
beforePaste :: (DocumentClass self) => EventName self Event
beforePaste = EventName "beforepaste"
 
paste :: (DocumentClass self) => EventName self Event
paste = EventName "paste"
 
reset :: (DocumentClass self) => EventName self Event
reset = EventName "reset"
 
search :: (DocumentClass self) => EventName self Event
search = EventName "search"
 
selectStart :: (DocumentClass self) => EventName self Event
selectStart = EventName "selectstart"
 
selectionchange :: (DocumentClass self) => EventName self Event
selectionchange = EventName "selectionchange"
 
touchStart :: (DocumentClass self) => EventName self UIEvent
touchStart = EventName "touchstart"
 
touchMove :: (DocumentClass self) => EventName self UIEvent
touchMove = EventName "touchmove"
 
touchEnd :: (DocumentClass self) => EventName self UIEvent
touchEnd = EventName "touchend"
 
touchCancel :: (DocumentClass self) => EventName self UIEvent
touchCancel = EventName "touchcancel"
 
webKitFullscreenChange ::
                       (DocumentClass self) => EventName self Event
webKitFullscreenChange = EventName "webkitfullscreenchange"
 
webKitFullscreenError ::
                      (DocumentClass self) => EventName self Event
webKitFullscreenError = EventName "webkitfullscreenerror"
 
pointerlockchange :: (DocumentClass self) => EventName self Event
pointerlockchange = EventName "pointerlockchange"
 
pointerlockerror :: (DocumentClass self) => EventName self Event
pointerlockerror = EventName "pointerlockerror"
 
securitypolicyviolation ::
                        (DocumentClass self) => EventName self Event
securitypolicyviolation = EventName "securitypolicyviolation"
 
webKitWillRevealBottom ::
                       (DocumentClass self) => EventName self Event
webKitWillRevealBottom = EventName "webkitwillrevealbottom"
 
webKitWillRevealLeft ::
                     (DocumentClass self) => EventName self Event
webKitWillRevealLeft = EventName "webkitwillrevealleft"
 
webKitWillRevealRight ::
                      (DocumentClass self) => EventName self Event
webKitWillRevealRight = EventName "webkitwillrevealright"
 
webKitWillRevealTop :: (DocumentClass self) => EventName self Event
webKitWillRevealTop = EventName "webkitwillrevealtop"
 
getVisibilityState ::
                   (MonadIO m, DocumentClass self, GlibString string) =>
                     self -> m string
getVisibilityState self
  = liftIO
#if WEBKIT_CHECK_VERSION(2,2,2)
      (({# call webkit_dom_document_get_visibility_state #}
#else
      (({# call webkit_dom_document_get_webkit_visibility_state #}
#endif
          (toDocument self))
         >>=
         readUTFString)
 
getHidden :: (MonadIO m, DocumentClass self) => self -> m Bool
getHidden self
  = liftIO
      (toBool <$>
#if WEBKIT_CHECK_VERSION(2,2,2)
         ({# call webkit_dom_document_get_hidden #} (toDocument self)))
#else
         ({# call webkit_dom_document_get_webkit_hidden #} (toDocument self)))
#endif

#if WEBKIT_CHECK_VERSION(1,10,0) 
getSecurityPolicy ::
                  (MonadIO m, DocumentClass self) =>
                    self -> m (Maybe DOMSecurityPolicy)
getSecurityPolicy self
  = liftIO
      (maybeNull (makeNewGObject mkDOMSecurityPolicy)
         ({# call webkit_dom_document_get_security_policy #}
            (toDocument self)))
#endif

#if WEBKIT_CHECK_VERSION(2,2,2) 
getCurrentScript ::
                 (MonadIO m, DocumentClass self) =>
                   self -> m (Maybe HTMLScriptElement)
getCurrentScript self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLScriptElement)
         ({# call webkit_dom_document_get_current_script #}
            (toDocument self)))
#endif
