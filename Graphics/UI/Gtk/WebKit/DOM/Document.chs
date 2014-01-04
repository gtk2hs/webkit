module Graphics.UI.Gtk.WebKit.DOM.Document
       (documentCreateElement, documentCreateDocumentFragment,
        documentCreateTextNode, documentCreateComment,
        documentCreateCDATASection, documentCreateProcessingInstruction,
        documentCreateAttribute, documentCreateEntityReference,
        documentGetElementsByTagName, documentImportNode,
        documentCreateElementNS, documentCreateAttributeNS,
        documentGetElementsByTagNameNS, documentGetElementById,
        documentAdoptNode, documentCreateEvent, documentCreateRange,
        documentCreateNodeIterator, documentCreateTreeWalker,
        documentGetOverrideStyle, documentCreateExpression,
        documentCreateNSResolver, documentEvaluate, documentExecCommand,
        documentQueryCommandEnabled, documentQueryCommandIndeterm,
        documentQueryCommandState, documentQueryCommandSupported,
        documentQueryCommandValue, documentGetElementsByName,
        documentElementFromPoint, documentCaretRangeFromPoint,
        documentCreateCSSStyleDeclaration, documentGetElementsByClassName,
        documentQuerySelector, documentQuerySelectorAll,
#if WEBKIT_CHECK_VERSION(2,2,2)
        documentWebkitExitPointerLock, documentWebkitGetNamedFlows,
#endif
        documentGetDoctype, documentGetImplementation,
        documentGetDocumentElement, documentGetInputEncoding,
        documentGetXmlEncoding, documentSetXmlVersion,
        documentGetXmlVersion, documentSetXmlStandalone,
        documentGetXmlStandalone, documentSetDocumentURI,
        documentGetDocumentURI, documentGetDefaultView,
        documentGetStyleSheets, documentSetTitle, documentGetTitle,
        documentGetReferrer, documentGetDomain, documentSetCookie,
        documentGetCookie, documentSetBody, documentGetBody,
        documentGetHead, documentGetImages, documentGetApplets,
        documentGetLinks, documentGetForms, documentGetAnchors,
        documentGetLastModified, documentSetCharset, documentGetCharset,
        documentGetDefaultCharset, documentGetReadyState,
        documentGetCharacterSet, documentGetPreferredStylesheetSet,
        documentSetSelectedStylesheetSet, documentGetSelectedStylesheetSet,
        documentGetCompatMode,
#if WEBKIT_CHECK_VERSION(1,10,0)
        documentGetWebkitPointerLockElement,
#endif
        documentOnabort, documentOnblur, documentOnchange, documentOnclick,
        documentOncontextmenu, documentOndblclick, documentOndrag,
        documentOndragend, documentOndragenter, documentOndragleave,
        documentOndragover, documentOndragstart, documentOndrop,
        documentOnerror, documentOnfocus, documentOninput,
        documentOninvalid, documentOnkeydown, documentOnkeypress,
        documentOnkeyup, documentOnload, documentOnmousedown,
#if WEBKIT_CHECK_VERSION(2,2,2)
        documentOnmouseenter, documentOnmouseleave,
#endif
        documentOnmousemove, documentOnmouseout, documentOnmouseover,
        documentOnmouseup, documentOnmousewheel,
        documentOnreadystatechange, documentOnscroll, documentOnselect,
        documentOnsubmit, documentOnbeforecut, documentOncut,
        documentOnbeforecopy, documentOncopy, documentOnbeforepaste,
        documentOnpaste, documentOnreset, documentOnsearch,
        documentOnselectstart, documentOnselectionchange,
        documentOntouchstart, documentOntouchmove, documentOntouchend,
        documentOntouchcancel, documentOnwebkitfullscreenchange,
        documentOnwebkitfullscreenerror,
#if WEBKIT_CHECK_VERSION(1,10,0)
        documentOnwebkitpointerlockchange, documentOnwebkitpointerlockerror,
#endif
#if WEBKIT_CHECK_VERSION(2,2,2)
        documentOnsecuritypolicyviolation,
#endif
        documentGetVisibilityState,
        documentGetHidden,
#if WEBKIT_CHECK_VERSION(1,10,0)
        documentGetSecurityPolicy,
#endif
#if WEBKIT_CHECK_VERSION(2,2,2)
        documentGetCurrentScript,
#endif
        Document, DocumentClass, castToDocument, gTypeDocument, toDocument)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM

documentCreateElement ::
                      (DocumentClass self) => self -> String -> IO (Maybe Element)
documentCreateElement self tagName
  = maybeNull (makeNewGObject mkElement)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString tagName $
             \ tagNamePtr ->
               {# call webkit_dom_document_create_element #} (toDocument self)
                 tagNamePtr
             errorPtr_)

documentCreateDocumentFragment ::
                               (DocumentClass self) => self -> IO (Maybe DocumentFragment)
documentCreateDocumentFragment self
  = maybeNull (makeNewGObject mkDocumentFragment)
      ({# call webkit_dom_document_create_document_fragment #}
         (toDocument self))

documentCreateTextNode ::
                       (DocumentClass self) => self -> String -> IO (Maybe Text)
documentCreateTextNode self data'
  = maybeNull (makeNewGObject mkText)
      (withUTFString data' $
         \ dataPtr ->
           {# call webkit_dom_document_create_text_node #} (toDocument self)
             dataPtr)

documentCreateComment ::
                      (DocumentClass self) => self -> String -> IO (Maybe Comment)
documentCreateComment self data'
  = maybeNull (makeNewGObject mkComment)
      (withUTFString data' $
         \ dataPtr ->
           {# call webkit_dom_document_create_comment #} (toDocument self)
             dataPtr)

documentCreateCDATASection ::
                           (DocumentClass self) => self -> String -> IO (Maybe CDATASection)
documentCreateCDATASection self data'
  = maybeNull (makeNewGObject mkCDATASection)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString data' $
             \ dataPtr ->
               {# call webkit_dom_document_create_cdata_section #}
                 (toDocument self)
                 dataPtr
             errorPtr_)

documentCreateProcessingInstruction ::
                                    (DocumentClass self) =>
                                      self -> String -> String -> IO (Maybe ProcessingInstruction)
documentCreateProcessingInstruction self target data'
  = maybeNull (makeNewGObject mkProcessingInstruction)
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
             errorPtr_)

documentCreateAttribute ::
                        (DocumentClass self) => self -> String -> IO (Maybe DOMAttr)
documentCreateAttribute self name
  = maybeNull (makeNewGObject mkDOMAttr)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString name $
             \ namePtr ->
               {# call webkit_dom_document_create_attribute #} (toDocument self)
                 namePtr
             errorPtr_)

documentCreateEntityReference ::
                              (DocumentClass self) =>
                                self -> String -> IO (Maybe EntityReference)
documentCreateEntityReference self name
  = maybeNull (makeNewGObject mkEntityReference)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString name $
             \ namePtr ->
               {# call webkit_dom_document_create_entity_reference #}
                 (toDocument self)
                 namePtr
             errorPtr_)

documentGetElementsByTagName ::
                             (DocumentClass self) => self -> String -> IO (Maybe NodeList)
documentGetElementsByTagName self tagname
  = maybeNull (makeNewGObject mkNodeList)
      (withUTFString tagname $
         \ tagnamePtr ->
           {# call webkit_dom_document_get_elements_by_tag_name #}
             (toDocument self)
             tagnamePtr)

documentImportNode ::
                   (DocumentClass self, NodeClass importedNode) =>
                     self -> Maybe importedNode -> Bool -> IO (Maybe Node)
documentImportNode self importedNode deep
  = maybeNull (makeNewGObject mkNode)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_document_import_node #} (toDocument self)
             (maybe (Node nullForeignPtr) toNode importedNode)
             (fromBool deep)
             errorPtr_)

documentCreateElementNS ::
                        (DocumentClass self) =>
                          self -> String -> String -> IO (Maybe Element)
documentCreateElementNS self namespaceURI qualifiedName
  = maybeNull (makeNewGObject mkElement)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString qualifiedName $
             \ qualifiedNamePtr ->
               withUTFString namespaceURI $
                 \ namespaceURIPtr ->
                   {# call webkit_dom_document_create_element_ns #} (toDocument self)
                     namespaceURIPtr
                 qualifiedNamePtr
             errorPtr_)

documentCreateAttributeNS ::
                          (DocumentClass self) =>
                            self -> String -> String -> IO (Maybe DOMAttr)
documentCreateAttributeNS self namespaceURI qualifiedName
  = maybeNull (makeNewGObject mkDOMAttr)
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
             errorPtr_)

documentGetElementsByTagNameNS ::
                               (DocumentClass self) =>
                                 self -> String -> String -> IO (Maybe NodeList)
documentGetElementsByTagNameNS self namespaceURI localName
  = maybeNull (makeNewGObject mkNodeList)
      (withUTFString localName $
         \ localNamePtr ->
           withUTFString namespaceURI $
             \ namespaceURIPtr ->
               {# call webkit_dom_document_get_elements_by_tag_name_ns #}
                 (toDocument self)
                 namespaceURIPtr
             localNamePtr)

documentGetElementById ::
                       (DocumentClass self) => self -> String -> IO (Maybe Element)
documentGetElementById self elementId
  = maybeNull (makeNewGObject mkElement)
      (withUTFString elementId $
         \ elementIdPtr ->
           {# call webkit_dom_document_get_element_by_id #} (toDocument self)
             elementIdPtr)

documentAdoptNode ::
                  (DocumentClass self, NodeClass source) =>
                    self -> Maybe source -> IO (Maybe Node)
documentAdoptNode self source
  = maybeNull (makeNewGObject mkNode)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_document_adopt_node #} (toDocument self)
             (maybe (Node nullForeignPtr) toNode source)
             errorPtr_)

documentCreateEvent ::
                    (DocumentClass self) => self -> String -> IO (Maybe Event)
documentCreateEvent self eventType
  = maybeNull (makeNewGObject mkEvent)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString eventType $
             \ eventTypePtr ->
               {# call webkit_dom_document_create_event #} (toDocument self)
                 eventTypePtr
             errorPtr_)

documentCreateRange ::
                    (DocumentClass self) => self -> IO (Maybe DOMRange)
documentCreateRange self
  = maybeNull (makeNewGObject mkDOMRange)
      ({# call webkit_dom_document_create_range #} (toDocument self))

documentCreateNodeIterator ::
                           (DocumentClass self, NodeClass root, NodeFilterClass filter) =>
                             self ->
                               Maybe root ->
                                 Word -> Maybe filter -> Bool -> IO (Maybe NodeIterator)
documentCreateNodeIterator self root whatToShow filter
  expandEntityReferences
  = maybeNull (makeNewGObject mkNodeIterator)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_document_create_node_iterator #}
             (toDocument self)
             (maybe (Node nullForeignPtr) toNode root)
             (fromIntegral whatToShow)
             (maybe (NodeFilter nullForeignPtr) toNodeFilter filter)
             (fromBool expandEntityReferences)
             errorPtr_)

documentCreateTreeWalker ::
                         (DocumentClass self, NodeClass root, NodeFilterClass filter) =>
                           self ->
                             Maybe root -> Word -> Maybe filter -> Bool -> IO (Maybe TreeWalker)
documentCreateTreeWalker self root whatToShow filter
  expandEntityReferences
  = maybeNull (makeNewGObject mkTreeWalker)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_document_create_tree_walker #} (toDocument self)
             (maybe (Node nullForeignPtr) toNode root)
             (fromIntegral whatToShow)
             (maybe (NodeFilter nullForeignPtr) toNodeFilter filter)
             (fromBool expandEntityReferences)
             errorPtr_)

documentGetOverrideStyle ::
                         (DocumentClass self, ElementClass element) =>
                           self -> Maybe element -> String -> IO (Maybe CSSStyleDeclaration)
documentGetOverrideStyle self element pseudoElement
  = maybeNull (makeNewGObject mkCSSStyleDeclaration)
      (withUTFString pseudoElement $
         \ pseudoElementPtr ->
           {# call webkit_dom_document_get_override_style #} (toDocument self)
             (maybe (Element nullForeignPtr) toElement element)
             pseudoElementPtr)

documentCreateExpression ::
                         (DocumentClass self, XPathNSResolverClass resolver) =>
                           self -> String -> Maybe resolver -> IO (Maybe XPathExpression)
documentCreateExpression self expression resolver
  = maybeNull (makeNewGObject mkXPathExpression)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString expression $
             \ expressionPtr ->
               {# call webkit_dom_document_create_expression #} (toDocument self)
                 expressionPtr
             (maybe (XPathNSResolver nullForeignPtr) toXPathNSResolver resolver)
             errorPtr_)

documentCreateNSResolver ::
                         (DocumentClass self, NodeClass nodeResolver) =>
                           self -> Maybe nodeResolver -> IO (Maybe XPathNSResolver)
documentCreateNSResolver self nodeResolver
  = maybeNull (makeNewGObject mkXPathNSResolver)
      ({# call webkit_dom_document_create_ns_resolver #}
         (toDocument self)
         (maybe (Node nullForeignPtr) toNode nodeResolver))

documentEvaluate ::
                 (DocumentClass self, NodeClass contextNode,
                  XPathNSResolverClass resolver, XPathResultClass inResult) =>
                   self ->
                     String ->
                       Maybe contextNode ->
                         Maybe resolver -> Word -> Maybe inResult -> IO (Maybe XPathResult)
documentEvaluate self expression contextNode resolver type'
  inResult
  = maybeNull (makeNewGObject mkXPathResult)
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
             errorPtr_)

documentExecCommand ::
                    (DocumentClass self) => self -> String -> Bool -> String -> IO Bool
documentExecCommand self command userInterface value
  = toBool <$>
      (withUTFString value $
         \ valuePtr ->
           withUTFString command $
             \ commandPtr ->
               {# call webkit_dom_document_exec_command #} (toDocument self)
                 commandPtr
             (fromBool userInterface)
             valuePtr)

documentQueryCommandEnabled ::
                            (DocumentClass self) => self -> String -> IO Bool
documentQueryCommandEnabled self command
  = toBool <$>
      (withUTFString command $
         \ commandPtr ->
           {# call webkit_dom_document_query_command_enabled #}
             (toDocument self)
             commandPtr)

documentQueryCommandIndeterm ::
                             (DocumentClass self) => self -> String -> IO Bool
documentQueryCommandIndeterm self command
  = toBool <$>
      (withUTFString command $
         \ commandPtr ->
           {# call webkit_dom_document_query_command_indeterm #}
             (toDocument self)
             commandPtr)

documentQueryCommandState ::
                          (DocumentClass self) => self -> String -> IO Bool
documentQueryCommandState self command
  = toBool <$>
      (withUTFString command $
         \ commandPtr ->
           {# call webkit_dom_document_query_command_state #}
             (toDocument self)
             commandPtr)

documentQueryCommandSupported ::
                              (DocumentClass self) => self -> String -> IO Bool
documentQueryCommandSupported self command
  = toBool <$>
      (withUTFString command $
         \ commandPtr ->
           {# call webkit_dom_document_query_command_supported #}
             (toDocument self)
             commandPtr)

documentQueryCommandValue ::
                          (DocumentClass self) => self -> String -> IO String
documentQueryCommandValue self command
  = (withUTFString command $
       \ commandPtr ->
         {# call webkit_dom_document_query_command_value #}
           (toDocument self)
           commandPtr)
      >>=
      readUTFString

documentGetElementsByName ::
                          (DocumentClass self) => self -> String -> IO (Maybe NodeList)
documentGetElementsByName self elementName
  = maybeNull (makeNewGObject mkNodeList)
      (withUTFString elementName $
         \ elementNamePtr ->
           {# call webkit_dom_document_get_elements_by_name #}
             (toDocument self)
             elementNamePtr)

documentElementFromPoint ::
                         (DocumentClass self) => self -> Int -> Int -> IO (Maybe Element)
documentElementFromPoint self x y
  = maybeNull (makeNewGObject mkElement)
      ({# call webkit_dom_document_element_from_point #}
         (toDocument self)
         (fromIntegral x)
         (fromIntegral y))

documentCaretRangeFromPoint ::
                            (DocumentClass self) => self -> Int -> Int -> IO (Maybe DOMRange)
documentCaretRangeFromPoint self x y
  = maybeNull (makeNewGObject mkDOMRange)
      ({# call webkit_dom_document_caret_range_from_point #}
         (toDocument self)
         (fromIntegral x)
         (fromIntegral y))

documentCreateCSSStyleDeclaration ::
                                  (DocumentClass self) => self -> IO (Maybe CSSStyleDeclaration)
documentCreateCSSStyleDeclaration self
  = maybeNull (makeNewGObject mkCSSStyleDeclaration)
      ({# call webkit_dom_document_create_css_style_declaration #}
         (toDocument self))

documentGetElementsByClassName ::
                               (DocumentClass self) => self -> String -> IO (Maybe NodeList)
documentGetElementsByClassName self tagname
  = maybeNull (makeNewGObject mkNodeList)
      (withUTFString tagname $
         \ tagnamePtr ->
           {# call webkit_dom_document_get_elements_by_class_name #}
             (toDocument self)
             tagnamePtr)

documentQuerySelector ::
                      (DocumentClass self) => self -> String -> IO (Maybe Element)
documentQuerySelector self selectors
  = maybeNull (makeNewGObject mkElement)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString selectors $
             \ selectorsPtr ->
               {# call webkit_dom_document_query_selector #} (toDocument self)
                 selectorsPtr
             errorPtr_)

documentQuerySelectorAll ::
                         (DocumentClass self) => self -> String -> IO (Maybe NodeList)
documentQuerySelectorAll self selectors
  = maybeNull (makeNewGObject mkNodeList)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString selectors $
             \ selectorsPtr ->
               {# call webkit_dom_document_query_selector_all #} (toDocument self)
                 selectorsPtr
             errorPtr_)

#if WEBKIT_CHECK_VERSION(2,2,2)
documentWebkitExitPointerLock ::
                              (DocumentClass self) => self -> IO ()
documentWebkitExitPointerLock self
  = {# call webkit_dom_document_webkit_exit_pointer_lock #}
      (toDocument self)
 
documentWebkitGetNamedFlows ::
                            (DocumentClass self) => self -> IO (Maybe DOMNamedFlowCollection)
documentWebkitGetNamedFlows self
  = maybeNull (makeNewGObject mkDOMNamedFlowCollection)
      ({# call webkit_dom_document_webkit_get_named_flows #}
         (toDocument self))
#endif

documentGetDoctype ::
                   (DocumentClass self) => self -> IO (Maybe DocumentType)
documentGetDoctype self
  = maybeNull (makeNewGObject mkDocumentType)
      ({# call webkit_dom_document_get_doctype #} (toDocument self))

documentGetImplementation ::
                          (DocumentClass self) => self -> IO (Maybe DOMImplementation)
documentGetImplementation self
  = maybeNull (makeNewGObject mkDOMImplementation)
      ({# call webkit_dom_document_get_implementation #}
         (toDocument self))

documentGetDocumentElement ::
                           (DocumentClass self) => self -> IO (Maybe Element)
documentGetDocumentElement self
  = maybeNull (makeNewGObject mkElement)
      ({# call webkit_dom_document_get_document_element #}
         (toDocument self))

documentGetInputEncoding ::
                         (DocumentClass self) => self -> IO String
documentGetInputEncoding self
  = ({# call webkit_dom_document_get_input_encoding #}
       (toDocument self))
      >>=
      readUTFString

documentGetXmlEncoding :: (DocumentClass self) => self -> IO String
documentGetXmlEncoding self
  = ({# call webkit_dom_document_get_xml_encoding #}
       (toDocument self))
      >>=
      readUTFString

documentSetXmlVersion ::
                      (DocumentClass self) => self -> String -> IO ()
documentSetXmlVersion self val
  = propagateGError $
      \ errorPtr_ ->
        withUTFString val $
          \ valPtr ->
            {# call webkit_dom_document_set_xml_version #} (toDocument self)
              valPtr
          errorPtr_

documentGetXmlVersion :: (DocumentClass self) => self -> IO String
documentGetXmlVersion self
  = ({# call webkit_dom_document_get_xml_version #}
       (toDocument self))
      >>=
      readUTFString

documentSetXmlStandalone ::
                         (DocumentClass self) => self -> Bool -> IO ()
documentSetXmlStandalone self val
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_document_set_xml_standalone #} (toDocument self)
          (fromBool val)
          errorPtr_

documentGetXmlStandalone :: (DocumentClass self) => self -> IO Bool
documentGetXmlStandalone self
  = toBool <$>
      ({# call webkit_dom_document_get_xml_standalone #}
         (toDocument self))

documentSetDocumentURI ::
                       (DocumentClass self) => self -> String -> IO ()
documentSetDocumentURI self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_document_set_document_uri #} (toDocument self)
          valPtr

documentGetDocumentURI :: (DocumentClass self) => self -> IO String
documentGetDocumentURI self
  = ({# call webkit_dom_document_get_document_uri #}
       (toDocument self))
      >>=
      readUTFString

documentGetDefaultView ::
                       (DocumentClass self) => self -> IO (Maybe DOMWindow)
documentGetDefaultView self
  = maybeNull (makeNewGObject mkDOMWindow)
      ({# call webkit_dom_document_get_default_view #} (toDocument self))

documentGetStyleSheets ::
                       (DocumentClass self) => self -> IO (Maybe StyleSheetList)
documentGetStyleSheets self
  = maybeNull (makeNewGObject mkStyleSheetList)
      ({# call webkit_dom_document_get_style_sheets #} (toDocument self))

documentSetTitle :: (DocumentClass self) => self -> String -> IO ()
documentSetTitle self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_document_set_title #} (toDocument self) valPtr

documentGetTitle :: (DocumentClass self) => self -> IO String
documentGetTitle self
  = ({# call webkit_dom_document_get_title #} (toDocument self)) >>=
      readUTFString

documentGetReferrer :: (DocumentClass self) => self -> IO String
documentGetReferrer self
  = ({# call webkit_dom_document_get_referrer #} (toDocument self))
      >>=
      readUTFString

documentGetDomain :: (DocumentClass self) => self -> IO String
documentGetDomain self
  = ({# call webkit_dom_document_get_domain #} (toDocument self)) >>=
      readUTFString

documentSetCookie ::
                  (DocumentClass self) => self -> String -> IO ()
documentSetCookie self val
  = propagateGError $
      \ errorPtr_ ->
        withUTFString val $
          \ valPtr ->
            {# call webkit_dom_document_set_cookie #} (toDocument self) valPtr
          errorPtr_

documentGetCookie :: (DocumentClass self) => self -> IO String
documentGetCookie self
  = (propagateGError $
       \ errorPtr_ ->
         {# call webkit_dom_document_get_cookie #} (toDocument self)
           errorPtr_)
      >>=
      readUTFString

documentSetBody ::
                (HTMLElementClass val, DocumentClass self) =>
                  self -> Maybe val -> IO ()
documentSetBody self val
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_document_set_body #} (toDocument self)
          (maybe (HTMLElement nullForeignPtr) toHTMLElement val)
          errorPtr_

documentGetBody ::
                (DocumentClass self) => self -> IO (Maybe HTMLElement)
documentGetBody self
  = maybeNull (makeNewGObject mkHTMLElement)
      ({# call webkit_dom_document_get_body #} (toDocument self))

documentGetHead ::
                (DocumentClass self) => self -> IO (Maybe HTMLHeadElement)
documentGetHead self
  = maybeNull (makeNewGObject mkHTMLHeadElement)
      ({# call webkit_dom_document_get_head #} (toDocument self))

documentGetImages ::
                  (DocumentClass self) => self -> IO (Maybe HTMLCollection)
documentGetImages self
  = maybeNull (makeNewGObject mkHTMLCollection)
      ({# call webkit_dom_document_get_images #} (toDocument self))

documentGetApplets ::
                   (DocumentClass self) => self -> IO (Maybe HTMLCollection)
documentGetApplets self
  = maybeNull (makeNewGObject mkHTMLCollection)
      ({# call webkit_dom_document_get_applets #} (toDocument self))

documentGetLinks ::
                 (DocumentClass self) => self -> IO (Maybe HTMLCollection)
documentGetLinks self
  = maybeNull (makeNewGObject mkHTMLCollection)
      ({# call webkit_dom_document_get_links #} (toDocument self))

documentGetForms ::
                 (DocumentClass self) => self -> IO (Maybe HTMLCollection)
documentGetForms self
  = maybeNull (makeNewGObject mkHTMLCollection)
      ({# call webkit_dom_document_get_forms #} (toDocument self))

documentGetAnchors ::
                   (DocumentClass self) => self -> IO (Maybe HTMLCollection)
documentGetAnchors self
  = maybeNull (makeNewGObject mkHTMLCollection)
      ({# call webkit_dom_document_get_anchors #} (toDocument self))

documentGetLastModified ::
                        (DocumentClass self) => self -> IO String
documentGetLastModified self
  = ({# call webkit_dom_document_get_last_modified #}
       (toDocument self))
      >>=
      readUTFString

documentSetCharset ::
                   (DocumentClass self) => self -> String -> IO ()
documentSetCharset self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_document_set_charset #} (toDocument self) valPtr

documentGetCharset :: (DocumentClass self) => self -> IO String
documentGetCharset self
  = ({# call webkit_dom_document_get_charset #} (toDocument self))
      >>=
      readUTFString

documentGetDefaultCharset ::
                          (DocumentClass self) => self -> IO String
documentGetDefaultCharset self
  = ({# call webkit_dom_document_get_default_charset #}
       (toDocument self))
      >>=
      readUTFString

documentGetReadyState :: (DocumentClass self) => self -> IO String
documentGetReadyState self
  = ({# call webkit_dom_document_get_ready_state #}
       (toDocument self))
      >>=
      readUTFString

documentGetCharacterSet ::
                        (DocumentClass self) => self -> IO String
documentGetCharacterSet self
  = ({# call webkit_dom_document_get_character_set #}
       (toDocument self))
      >>=
      readUTFString

documentGetPreferredStylesheetSet ::
                                  (DocumentClass self) => self -> IO String
documentGetPreferredStylesheetSet self
  = ({# call webkit_dom_document_get_preferred_stylesheet_set #}
       (toDocument self))
      >>=
      readUTFString

documentSetSelectedStylesheetSet ::
                                 (DocumentClass self) => self -> String -> IO ()
documentSetSelectedStylesheetSet self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_document_set_selected_stylesheet_set #}
          (toDocument self)
          valPtr

documentGetSelectedStylesheetSet ::
                                 (DocumentClass self) => self -> IO String
documentGetSelectedStylesheetSet self
  = ({# call webkit_dom_document_get_selected_stylesheet_set #}
       (toDocument self))
      >>=
      readUTFString

documentGetCompatMode :: (DocumentClass self) => self -> IO String
documentGetCompatMode self
  = ({# call webkit_dom_document_get_compat_mode #}
       (toDocument self))
      >>=
      readUTFString

#if WEBKIT_CHECK_VERSION(1,10,0)
documentGetWebkitPointerLockElement ::
                                    (DocumentClass self) => self -> IO (Maybe Element)
documentGetWebkitPointerLockElement self
  = maybeNull (makeNewGObject mkElement)
      ({# call webkit_dom_document_get_webkit_pointer_lock_element #}
         (toDocument self))
#endif

documentOnabort ::
                (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnabort = (connect "abort")

documentOnblur ::
               (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnblur = (connect "blur")

documentOnchange ::
                 (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnchange = (connect "change")

documentOnclick ::
                (DocumentClass self) => Signal self (EventM MouseEvent self ())
documentOnclick = (connect "click")

documentOncontextmenu ::
                      (DocumentClass self) => Signal self (EventM MouseEvent self ())
documentOncontextmenu = (connect "contextmenu")

documentOndblclick ::
                   (DocumentClass self) => Signal self (EventM MouseEvent self ())
documentOndblclick = (connect "dblclick")

documentOndrag ::
               (DocumentClass self) => Signal self (EventM MouseEvent self ())
documentOndrag = (connect "drag")

documentOndragend ::
                  (DocumentClass self) => Signal self (EventM MouseEvent self ())
documentOndragend = (connect "dragend")

documentOndragenter ::
                    (DocumentClass self) => Signal self (EventM MouseEvent self ())
documentOndragenter = (connect "dragenter")

documentOndragleave ::
                    (DocumentClass self) => Signal self (EventM MouseEvent self ())
documentOndragleave = (connect "dragleave")

documentOndragover ::
                   (DocumentClass self) => Signal self (EventM MouseEvent self ())
documentOndragover = (connect "dragover")

documentOndragstart ::
                    (DocumentClass self) => Signal self (EventM MouseEvent self ())
documentOndragstart = (connect "dragstart")

documentOndrop ::
               (DocumentClass self) => Signal self (EventM MouseEvent self ())
documentOndrop = (connect "drop")

documentOnerror ::
                (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnerror = (connect "error")

documentOnfocus ::
                (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnfocus = (connect "focus")

documentOninput ::
                (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOninput = (connect "input")

documentOninvalid ::
                  (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOninvalid = (connect "invalid")

documentOnkeydown ::
                  (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnkeydown = (connect "keydown")

documentOnkeypress ::
                   (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnkeypress = (connect "keypress")

documentOnkeyup ::
                (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnkeyup = (connect "keyup")

documentOnload ::
               (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnload = (connect "load")

documentOnmousedown ::
                    (DocumentClass self) => Signal self (EventM MouseEvent self ())
documentOnmousedown = (connect "mousedown")

#if WEBKIT_CHECK_VERSION(2,2,2)
documentOnmouseenter ::
                     (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnmouseenter = (connect "mouseenter")

documentOnmouseleave ::
                     (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnmouseleave = (connect "mouseleave")
#endif

documentOnmousemove ::
                    (DocumentClass self) => Signal self (EventM MouseEvent self ())
documentOnmousemove = (connect "mousemove")

documentOnmouseout ::
                   (DocumentClass self) => Signal self (EventM MouseEvent self ())
documentOnmouseout = (connect "mouseout")

documentOnmouseover ::
                    (DocumentClass self) => Signal self (EventM MouseEvent self ())
documentOnmouseover = (connect "mouseover")

documentOnmouseup ::
                  (DocumentClass self) => Signal self (EventM MouseEvent self ())
documentOnmouseup = (connect "mouseup")

documentOnmousewheel ::
                     (DocumentClass self) => Signal self (EventM MouseEvent self ())
documentOnmousewheel = (connect "mousewheel")

documentOnreadystatechange ::
                           (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnreadystatechange = (connect "readystatechange")

documentOnscroll ::
                 (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnscroll = (connect "scroll")

documentOnselect ::
                 (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnselect = (connect "select")

documentOnsubmit ::
                 (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnsubmit = (connect "submit")

documentOnbeforecut ::
                    (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnbeforecut = (connect "beforecut")

documentOncut ::
              (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOncut = (connect "cut")

documentOnbeforecopy ::
                     (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnbeforecopy = (connect "beforecopy")

documentOncopy ::
               (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOncopy = (connect "copy")

documentOnbeforepaste ::
                      (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnbeforepaste = (connect "beforepaste")

documentOnpaste ::
                (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnpaste = (connect "paste")

documentOnreset ::
                (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnreset = (connect "reset")

documentOnsearch ::
                 (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnsearch = (connect "search")

documentOnselectstart ::
                      (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnselectstart = (connect "selectstart")

documentOnselectionchange ::
                          (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnselectionchange = (connect "selectionchange")

documentOntouchstart ::
                     (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOntouchstart = (connect "touchstart")

documentOntouchmove ::
                    (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOntouchmove = (connect "touchmove")

documentOntouchend ::
                   (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOntouchend = (connect "touchend")

documentOntouchcancel ::
                      (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOntouchcancel = (connect "touchcancel")

documentOnwebkitfullscreenchange ::
                                 (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnwebkitfullscreenchange
  = (connect "webkitfullscreenchange")

documentOnwebkitfullscreenerror ::
                                (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnwebkitfullscreenerror = (connect "webkitfullscreenerror")

#if WEBKIT_CHECK_VERSION(1,10,0)
documentOnwebkitpointerlockchange ::
                                  (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnwebkitpointerlockchange
  = (connect "webkitpointerlockchange")

documentOnwebkitpointerlockerror ::
                                 (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnwebkitpointerlockerror
  = (connect "webkitpointerlockerror")
#endif

#if WEBKIT_CHECK_VERSION(2,2,2)
documentOnsecuritypolicyviolation ::
                                  (DocumentClass self) => Signal self (EventM UIEvent self ())
documentOnsecuritypolicyviolation
  = (connect "securitypolicyviolation")
#endif

documentGetVisibilityState ::
                           (DocumentClass self) => self -> IO String
documentGetVisibilityState self
#if WEBKIT_CHECK_VERSION(2,2,2)
  = ({# call webkit_dom_document_get_visibility_state #}
#else
  = ({# call webkit_dom_document_get_webkit_visibility_state #}
#endif
       (toDocument self))
      >>=
      readUTFString

documentGetHidden :: (DocumentClass self) => self -> IO Bool
documentGetHidden self
  = toBool <$>
#if WEBKIT_CHECK_VERSION(2,2,2)
      ({# call webkit_dom_document_get_hidden #} (toDocument self))
#else
      ({# call webkit_dom_document_get_webkit_hidden #} (toDocument self))
#endif
 
#if WEBKIT_CHECK_VERSION(1,10,0)
documentGetSecurityPolicy ::
                          (DocumentClass self) => self -> IO (Maybe DOMSecurityPolicy)
documentGetSecurityPolicy self
  = maybeNull (makeNewGObject mkDOMSecurityPolicy)
      ({# call webkit_dom_document_get_security_policy #}
         (toDocument self))
#endif

#if WEBKIT_CHECK_VERSION(2,2,2)
documentGetCurrentScript ::
                         (DocumentClass self) => self -> IO (Maybe HTMLScriptElement)
documentGetCurrentScript self
  = maybeNull (makeNewGObject mkHTMLScriptElement)
      ({# call webkit_dom_document_get_current_script #}
         (toDocument self))
#endif
