module Graphics.UI.Gtk.WebKit.DOM.Element
       (elementGetAttribute, elementSetAttribute, elementRemoveAttribute,
        elementGetAttributeNode, elementSetAttributeNode,
        elementRemoveAttributeNode, elementGetElementsByTagName,
#if WEBKIT_CHECK_VERSION(2,2,2)
        elementHasAttributes,
#endif
        elementGetAttributeNS, elementSetAttributeNS,
        elementRemoveAttributeNS, elementGetElementsByTagNameNS,
        elementGetAttributeNodeNS, elementSetAttributeNodeNS,
        elementHasAttribute, elementHasAttributeNS, elementFocus,
        elementBlur, elementScrollIntoView, elementScrollIntoViewIfNeeded,
        elementScrollByLines, elementScrollByPages,
        elementGetElementsByClassName, elementQuerySelector,
        elementQuerySelectorAll, elementWebkitMatchesSelector,
#if WEBKIT_CHECK_VERSION(2,2,2)
        elementWebkitRequestPointerLock,
#endif
        elementGetTagName,
#if WEBKIT_CHECK_VERSION(2,2,2)
        elementGetAttributes,
#endif
        elementGetStyle,
#if WEBKIT_CHECK_VERSION(2,2,2)
        elementSetId, elementGetId,
#endif
        elementGetOffsetLeft,
        elementGetOffsetTop, elementGetOffsetWidth, elementGetOffsetHeight,
        elementGetOffsetParent, elementGetClientLeft, elementGetClientTop,
        elementGetClientWidth, elementGetClientHeight,
        elementSetScrollLeft, elementGetScrollLeft, elementSetScrollTop,
        elementGetScrollTop, elementGetScrollWidth, elementGetScrollHeight,
#if WEBKIT_CHECK_VERSION(1,10,0)
        elementSetClassName, elementGetClassName, elementGetClassList,
#endif
        elementGetFirstElementChild, elementGetLastElementChild,
        elementGetPreviousElementSibling, elementGetNextElementSibling,
        elementGetChildElementCount,
#if WEBKIT_CHECK_VERSION(1,10,0)
        elementGetWebkitRegionOverset,
#endif
        elementOnabort, elementOnblur, elementOnchange, elementOnclick,
        elementOncontextmenu, elementOndblclick, elementOndrag,
        elementOndragend, elementOndragenter, elementOndragleave,
        elementOndragover, elementOndragstart, elementOndrop,
        elementOnerror, elementOnfocus, elementOninput, elementOninvalid,
        elementOnkeydown, elementOnkeypress, elementOnkeyup, elementOnload,
        elementOnmousedown,
#if WEBKIT_CHECK_VERSION(2,2,2)
        elementOnmouseenter, elementOnmouseleave,
#endif
        elementOnmousemove, elementOnmouseout,
        elementOnmouseover, elementOnmouseup, elementOnmousewheel,
        elementOnscroll, elementOnselect, elementOnsubmit,
        elementOnbeforecut, elementOncut, elementOnbeforecopy,
        elementOncopy, elementOnbeforepaste, elementOnpaste,
        elementOnreset, elementOnsearch, elementOnselectstart,
        elementOntouchstart, elementOntouchmove, elementOntouchend,
        elementOntouchcancel, elementOnwebkitfullscreenchange,
        elementOnwebkitfullscreenerror,
        Element, ElementClass, castToElement, gTypeElement, toElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
elementGetAttribute ::
                    (ElementClass self) => self -> String -> IO String
elementGetAttribute self name
  = (withUTFString name $
       \ namePtr ->
         {# call webkit_dom_element_get_attribute #} (toElement self)
           namePtr)
      >>=
      readUTFString
 
elementSetAttribute ::
                    (ElementClass self) => self -> String -> String -> IO ()
elementSetAttribute self name value
  = propagateGError $
      \ errorPtr_ ->
        withUTFString value $
          \ valuePtr ->
            withUTFString name $
              \ namePtr ->
                {# call webkit_dom_element_set_attribute #} (toElement self)
                  namePtr
              valuePtr
          errorPtr_
 
elementRemoveAttribute ::
                       (ElementClass self) => self -> String -> IO ()
elementRemoveAttribute self name
  = withUTFString name $
      \ namePtr ->
        {# call webkit_dom_element_remove_attribute #} (toElement self)
          namePtr
 
elementGetAttributeNode ::
                        (ElementClass self) => self -> String -> IO (Maybe DOMAttr)
elementGetAttributeNode self name
  = maybeNull (makeNewGObject mkDOMAttr)
      (withUTFString name $
         \ namePtr ->
           {# call webkit_dom_element_get_attribute_node #} (toElement self)
             namePtr)
 
elementSetAttributeNode ::
                        (ElementClass self, DOMAttrClass newAttr) =>
                          self -> Maybe newAttr -> IO (Maybe DOMAttr)
elementSetAttributeNode self newAttr
  = maybeNull (makeNewGObject mkDOMAttr)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_element_set_attribute_node #} (toElement self)
             (maybe (DOMAttr nullForeignPtr) toDOMAttr newAttr)
             errorPtr_)
 
elementRemoveAttributeNode ::
                           (ElementClass self, DOMAttrClass oldAttr) =>
                             self -> Maybe oldAttr -> IO (Maybe DOMAttr)
elementRemoveAttributeNode self oldAttr
  = maybeNull (makeNewGObject mkDOMAttr)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_element_remove_attribute_node #}
             (toElement self)
             (maybe (DOMAttr nullForeignPtr) toDOMAttr oldAttr)
             errorPtr_)
 
elementGetElementsByTagName ::
                            (ElementClass self) => self -> String -> IO (Maybe NodeList)
elementGetElementsByTagName self name
  = maybeNull (makeNewGObject mkNodeList)
      (withUTFString name $
         \ namePtr ->
           {# call webkit_dom_element_get_elements_by_tag_name #}
             (toElement self)
             namePtr)
 
#if WEBKIT_CHECK_VERSION(2,2,2)
elementHasAttributes :: (ElementClass self) => self -> IO Bool
elementHasAttributes self
  = toBool <$>
      ({# call webkit_dom_element_has_attributes #} (toElement self))
#endif

elementGetAttributeNS ::
                      (ElementClass self) => self -> String -> String -> IO String
elementGetAttributeNS self namespaceURI localName
  = (withUTFString localName $
       \ localNamePtr ->
         withUTFString namespaceURI $
           \ namespaceURIPtr ->
             {# call webkit_dom_element_get_attribute_ns #} (toElement self)
               namespaceURIPtr
           localNamePtr)
      >>=
      readUTFString
 
elementSetAttributeNS ::
                      (ElementClass self) => self -> String -> String -> String -> IO ()
elementSetAttributeNS self namespaceURI qualifiedName value
  = propagateGError $
      \ errorPtr_ ->
        withUTFString value $
          \ valuePtr ->
            withUTFString qualifiedName $
              \ qualifiedNamePtr ->
                withUTFString namespaceURI $
                  \ namespaceURIPtr ->
                    {# call webkit_dom_element_set_attribute_ns #} (toElement self)
                      namespaceURIPtr
                  qualifiedNamePtr
              valuePtr
          errorPtr_
 
elementRemoveAttributeNS ::
                         (ElementClass self) => self -> String -> String -> IO ()
elementRemoveAttributeNS self namespaceURI localName
  = withUTFString localName $
      \ localNamePtr ->
        withUTFString namespaceURI $
          \ namespaceURIPtr ->
            {# call webkit_dom_element_remove_attribute_ns #} (toElement self)
              namespaceURIPtr
          localNamePtr
 
elementGetElementsByTagNameNS ::
                              (ElementClass self) =>
                                self -> String -> String -> IO (Maybe NodeList)
elementGetElementsByTagNameNS self namespaceURI localName
  = maybeNull (makeNewGObject mkNodeList)
      (withUTFString localName $
         \ localNamePtr ->
           withUTFString namespaceURI $
             \ namespaceURIPtr ->
               {# call webkit_dom_element_get_elements_by_tag_name_ns #}
                 (toElement self)
                 namespaceURIPtr
             localNamePtr)
 
elementGetAttributeNodeNS ::
                          (ElementClass self) =>
                            self -> String -> String -> IO (Maybe DOMAttr)
elementGetAttributeNodeNS self namespaceURI localName
  = maybeNull (makeNewGObject mkDOMAttr)
      (withUTFString localName $
         \ localNamePtr ->
           withUTFString namespaceURI $
             \ namespaceURIPtr ->
               {# call webkit_dom_element_get_attribute_node_ns #}
                 (toElement self)
                 namespaceURIPtr
             localNamePtr)
 
elementSetAttributeNodeNS ::
                          (ElementClass self, DOMAttrClass newAttr) =>
                            self -> Maybe newAttr -> IO (Maybe DOMAttr)
elementSetAttributeNodeNS self newAttr
  = maybeNull (makeNewGObject mkDOMAttr)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_element_set_attribute_node_ns #}
             (toElement self)
             (maybe (DOMAttr nullForeignPtr) toDOMAttr newAttr)
             errorPtr_)
 
elementHasAttribute ::
                    (ElementClass self) => self -> String -> IO Bool
elementHasAttribute self name
  = toBool <$>
      (withUTFString name $
         \ namePtr ->
           {# call webkit_dom_element_has_attribute #} (toElement self)
             namePtr)
 
elementHasAttributeNS ::
                      (ElementClass self) => self -> String -> String -> IO Bool
elementHasAttributeNS self namespaceURI localName
  = toBool <$>
      (withUTFString localName $
         \ localNamePtr ->
           withUTFString namespaceURI $
             \ namespaceURIPtr ->
               {# call webkit_dom_element_has_attribute_ns #} (toElement self)
                 namespaceURIPtr
             localNamePtr)
 
elementFocus :: (ElementClass self) => self -> IO ()
elementFocus self
  = {# call webkit_dom_element_focus #} (toElement self)
 
elementBlur :: (ElementClass self) => self -> IO ()
elementBlur self
  = {# call webkit_dom_element_blur #} (toElement self)
 
elementScrollIntoView ::
                      (ElementClass self) => self -> Bool -> IO ()
elementScrollIntoView self alignWithTop
  = {# call webkit_dom_element_scroll_into_view #} (toElement self)
      (fromBool alignWithTop)
 
elementScrollIntoViewIfNeeded ::
                              (ElementClass self) => self -> Bool -> IO ()
elementScrollIntoViewIfNeeded self centerIfNeeded
  = {# call webkit_dom_element_scroll_into_view_if_needed #}
      (toElement self)
      (fromBool centerIfNeeded)
 
elementScrollByLines :: (ElementClass self) => self -> Int -> IO ()
elementScrollByLines self lines
  = {# call webkit_dom_element_scroll_by_lines #} (toElement self)
      (fromIntegral lines)
 
elementScrollByPages :: (ElementClass self) => self -> Int -> IO ()
elementScrollByPages self pages
  = {# call webkit_dom_element_scroll_by_pages #} (toElement self)
      (fromIntegral pages)
 
elementGetElementsByClassName ::
                              (ElementClass self) => self -> String -> IO (Maybe NodeList)
elementGetElementsByClassName self name
  = maybeNull (makeNewGObject mkNodeList)
      (withUTFString name $
         \ namePtr ->
           {# call webkit_dom_element_get_elements_by_class_name #}
             (toElement self)
             namePtr)
 
elementQuerySelector ::
                     (ElementClass self) => self -> String -> IO (Maybe Element)
elementQuerySelector self selectors
  = maybeNull (makeNewGObject mkElement)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString selectors $
             \ selectorsPtr ->
               {# call webkit_dom_element_query_selector #} (toElement self)
                 selectorsPtr
             errorPtr_)
 
elementQuerySelectorAll ::
                        (ElementClass self) => self -> String -> IO (Maybe NodeList)
elementQuerySelectorAll self selectors
  = maybeNull (makeNewGObject mkNodeList)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString selectors $
             \ selectorsPtr ->
               {# call webkit_dom_element_query_selector_all #} (toElement self)
                 selectorsPtr
             errorPtr_)
 
elementWebkitMatchesSelector ::
                             (ElementClass self) => self -> String -> IO Bool
elementWebkitMatchesSelector self selectors
  = toBool <$>
      (propagateGError $
         \ errorPtr_ ->
           withUTFString selectors $
             \ selectorsPtr ->
               {# call webkit_dom_element_webkit_matches_selector #}
                 (toElement self)
                 selectorsPtr
             errorPtr_)
 
#if WEBKIT_CHECK_VERSION(2,2,2)
elementWebkitRequestPointerLock ::
                                (ElementClass self) => self -> IO ()
elementWebkitRequestPointerLock self
  = {# call webkit_dom_element_webkit_request_pointer_lock #}
      (toElement self)
#endif

elementGetTagName :: (ElementClass self) => self -> IO String
elementGetTagName self
  = ({# call webkit_dom_element_get_tag_name #} (toElement self)) >>=
      readUTFString
 
#if WEBKIT_CHECK_VERSION(2,2,2)
elementGetAttributes ::
                     (ElementClass self) => self -> IO (Maybe NamedNodeMap)
elementGetAttributes self
  = maybeNull (makeNewGObject mkNamedNodeMap)
      ({# call webkit_dom_element_get_attributes #} (toElement self))
#endif

elementGetStyle ::
                (ElementClass self) => self -> IO (Maybe CSSStyleDeclaration)
elementGetStyle self
  = maybeNull (makeNewGObject mkCSSStyleDeclaration)
      ({# call webkit_dom_element_get_style #} (toElement self))
 
#if WEBKIT_CHECK_VERSION(2,2,2)
elementSetId :: (ElementClass self) => self -> String -> IO ()
elementSetId self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_element_set_id #} (toElement self) valPtr
 
elementGetId :: (ElementClass self) => self -> IO String
elementGetId self
  = ({# call webkit_dom_element_get_id #} (toElement self)) >>=
      readUTFString
#endif

elementGetOffsetLeft :: (ElementClass self) => self -> IO Int
elementGetOffsetLeft self
  = fromIntegral <$>
      ({# call webkit_dom_element_get_offset_left #} (toElement self))
 
elementGetOffsetTop :: (ElementClass self) => self -> IO Int
elementGetOffsetTop self
  = fromIntegral <$>
      ({# call webkit_dom_element_get_offset_top #} (toElement self))
 
elementGetOffsetWidth :: (ElementClass self) => self -> IO Int
elementGetOffsetWidth self
  = fromIntegral <$>
      ({# call webkit_dom_element_get_offset_width #} (toElement self))
 
elementGetOffsetHeight :: (ElementClass self) => self -> IO Int
elementGetOffsetHeight self
  = fromIntegral <$>
      ({# call webkit_dom_element_get_offset_height #} (toElement self))
 
elementGetOffsetParent ::
                       (ElementClass self) => self -> IO (Maybe Element)
elementGetOffsetParent self
  = maybeNull (makeNewGObject mkElement)
      ({# call webkit_dom_element_get_offset_parent #} (toElement self))
 
elementGetClientLeft :: (ElementClass self) => self -> IO Int
elementGetClientLeft self
  = fromIntegral <$>
      ({# call webkit_dom_element_get_client_left #} (toElement self))
 
elementGetClientTop :: (ElementClass self) => self -> IO Int
elementGetClientTop self
  = fromIntegral <$>
      ({# call webkit_dom_element_get_client_top #} (toElement self))
 
elementGetClientWidth :: (ElementClass self) => self -> IO Int
elementGetClientWidth self
  = fromIntegral <$>
      ({# call webkit_dom_element_get_client_width #} (toElement self))
 
elementGetClientHeight :: (ElementClass self) => self -> IO Int
elementGetClientHeight self
  = fromIntegral <$>
      ({# call webkit_dom_element_get_client_height #} (toElement self))
 
elementSetScrollLeft :: (ElementClass self) => self -> Int -> IO ()
elementSetScrollLeft self val
  = {# call webkit_dom_element_set_scroll_left #} (toElement self)
      (fromIntegral val)
 
elementGetScrollLeft :: (ElementClass self) => self -> IO Int
elementGetScrollLeft self
  = fromIntegral <$>
      ({# call webkit_dom_element_get_scroll_left #} (toElement self))
 
elementSetScrollTop :: (ElementClass self) => self -> Int -> IO ()
elementSetScrollTop self val
  = {# call webkit_dom_element_set_scroll_top #} (toElement self)
      (fromIntegral val)
 
elementGetScrollTop :: (ElementClass self) => self -> IO Int
elementGetScrollTop self
  = fromIntegral <$>
      ({# call webkit_dom_element_get_scroll_top #} (toElement self))
 
elementGetScrollWidth :: (ElementClass self) => self -> IO Int
elementGetScrollWidth self
  = fromIntegral <$>
      ({# call webkit_dom_element_get_scroll_width #} (toElement self))
 
elementGetScrollHeight :: (ElementClass self) => self -> IO Int
elementGetScrollHeight self
  = fromIntegral <$>
      ({# call webkit_dom_element_get_scroll_height #} (toElement self))
 
#if WEBKIT_CHECK_VERSION(1,10,0)
elementSetClassName ::
                    (ElementClass self) => self -> String -> IO ()
elementSetClassName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_element_set_class_name #} (toElement self)
          valPtr
 
elementGetClassName :: (ElementClass self) => self -> IO String
elementGetClassName self
  = ({# call webkit_dom_element_get_class_name #} (toElement self))
      >>=
      readUTFString
 
elementGetClassList ::
                    (ElementClass self) => self -> IO (Maybe DOMTokenList)
elementGetClassList self
  = maybeNull (makeNewGObject mkDOMTokenList)
      ({# call webkit_dom_element_get_class_list #} (toElement self))
#endif
 
elementGetFirstElementChild ::
                            (ElementClass self) => self -> IO (Maybe Element)
elementGetFirstElementChild self
  = maybeNull (makeNewGObject mkElement)
      ({# call webkit_dom_element_get_first_element_child #}
         (toElement self))
 
elementGetLastElementChild ::
                           (ElementClass self) => self -> IO (Maybe Element)
elementGetLastElementChild self
  = maybeNull (makeNewGObject mkElement)
      ({# call webkit_dom_element_get_last_element_child #}
         (toElement self))
 
elementGetPreviousElementSibling ::
                                 (ElementClass self) => self -> IO (Maybe Element)
elementGetPreviousElementSibling self
  = maybeNull (makeNewGObject mkElement)
      ({# call webkit_dom_element_get_previous_element_sibling #}
         (toElement self))
 
elementGetNextElementSibling ::
                             (ElementClass self) => self -> IO (Maybe Element)
elementGetNextElementSibling self
  = maybeNull (makeNewGObject mkElement)
      ({# call webkit_dom_element_get_next_element_sibling #}
         (toElement self))
 
elementGetChildElementCount ::
                            (ElementClass self) => self -> IO Word
elementGetChildElementCount self
  = fromIntegral <$>
      ({# call webkit_dom_element_get_child_element_count #}
         (toElement self))
 
#if WEBKIT_CHECK_VERSION(1,10,0)
elementGetWebkitRegionOverset ::
                              (ElementClass self) => self -> IO String
elementGetWebkitRegionOverset self
  = ({# call webkit_dom_element_get_webkit_region_overset #}
       (toElement self))
      >>=
      readUTFString
#endif
 
elementOnabort ::
               (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnabort = (connect "abort")
 
elementOnblur ::
              (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnblur = (connect "blur")
 
elementOnchange ::
                (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnchange = (connect "change")
 
elementOnclick ::
               (ElementClass self) => Signal self (EventM MouseEvent self ())
elementOnclick = (connect "click")
 
elementOncontextmenu ::
                     (ElementClass self) => Signal self (EventM MouseEvent self ())
elementOncontextmenu = (connect "contextmenu")
 
elementOndblclick ::
                  (ElementClass self) => Signal self (EventM MouseEvent self ())
elementOndblclick = (connect "dblclick")
 
elementOndrag ::
              (ElementClass self) => Signal self (EventM MouseEvent self ())
elementOndrag = (connect "drag")
 
elementOndragend ::
                 (ElementClass self) => Signal self (EventM MouseEvent self ())
elementOndragend = (connect "dragend")
 
elementOndragenter ::
                   (ElementClass self) => Signal self (EventM MouseEvent self ())
elementOndragenter = (connect "dragenter")
 
elementOndragleave ::
                   (ElementClass self) => Signal self (EventM MouseEvent self ())
elementOndragleave = (connect "dragleave")
 
elementOndragover ::
                  (ElementClass self) => Signal self (EventM MouseEvent self ())
elementOndragover = (connect "dragover")
 
elementOndragstart ::
                   (ElementClass self) => Signal self (EventM MouseEvent self ())
elementOndragstart = (connect "dragstart")
 
elementOndrop ::
              (ElementClass self) => Signal self (EventM MouseEvent self ())
elementOndrop = (connect "drop")
 
elementOnerror ::
               (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnerror = (connect "error")
 
elementOnfocus ::
               (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnfocus = (connect "focus")
 
elementOninput ::
               (ElementClass self) => Signal self (EventM UIEvent self ())
elementOninput = (connect "input")
 
elementOninvalid ::
                 (ElementClass self) => Signal self (EventM UIEvent self ())
elementOninvalid = (connect "invalid")
 
elementOnkeydown ::
                 (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnkeydown = (connect "keydown")
 
elementOnkeypress ::
                  (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnkeypress = (connect "keypress")
 
elementOnkeyup ::
               (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnkeyup = (connect "keyup")
 
elementOnload ::
              (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnload = (connect "load")
 
elementOnmousedown ::
                   (ElementClass self) => Signal self (EventM MouseEvent self ())
elementOnmousedown = (connect "mousedown")
 
#if WEBKIT_CHECK_VERSION(2,2,2)
elementOnmouseenter ::
                    (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnmouseenter = (connect "mouseenter")
 
elementOnmouseleave ::
                    (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnmouseleave = (connect "mouseleave")
#endif

elementOnmousemove ::
                   (ElementClass self) => Signal self (EventM MouseEvent self ())
elementOnmousemove = (connect "mousemove")
 
elementOnmouseout ::
                  (ElementClass self) => Signal self (EventM MouseEvent self ())
elementOnmouseout = (connect "mouseout")
 
elementOnmouseover ::
                   (ElementClass self) => Signal self (EventM MouseEvent self ())
elementOnmouseover = (connect "mouseover")
 
elementOnmouseup ::
                 (ElementClass self) => Signal self (EventM MouseEvent self ())
elementOnmouseup = (connect "mouseup")
 
elementOnmousewheel ::
                    (ElementClass self) => Signal self (EventM MouseEvent self ())
elementOnmousewheel = (connect "mousewheel")
 
elementOnscroll ::
                (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnscroll = (connect "scroll")
 
elementOnselect ::
                (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnselect = (connect "select")
 
elementOnsubmit ::
                (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnsubmit = (connect "submit")
 
elementOnbeforecut ::
                   (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnbeforecut = (connect "beforecut")
 
elementOncut ::
             (ElementClass self) => Signal self (EventM UIEvent self ())
elementOncut = (connect "cut")
 
elementOnbeforecopy ::
                    (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnbeforecopy = (connect "beforecopy")
 
elementOncopy ::
              (ElementClass self) => Signal self (EventM UIEvent self ())
elementOncopy = (connect "copy")
 
elementOnbeforepaste ::
                     (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnbeforepaste = (connect "beforepaste")
 
elementOnpaste ::
               (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnpaste = (connect "paste")
 
elementOnreset ::
               (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnreset = (connect "reset")
 
elementOnsearch ::
                (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnsearch = (connect "search")
 
elementOnselectstart ::
                     (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnselectstart = (connect "selectstart")
 
elementOntouchstart ::
                    (ElementClass self) => Signal self (EventM UIEvent self ())
elementOntouchstart = (connect "touchstart")
 
elementOntouchmove ::
                   (ElementClass self) => Signal self (EventM UIEvent self ())
elementOntouchmove = (connect "touchmove")
 
elementOntouchend ::
                  (ElementClass self) => Signal self (EventM UIEvent self ())
elementOntouchend = (connect "touchend")
 
elementOntouchcancel ::
                     (ElementClass self) => Signal self (EventM UIEvent self ())
elementOntouchcancel = (connect "touchcancel")
 
elementOnwebkitfullscreenchange ::
                                (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnwebkitfullscreenchange
  = (connect "webkitfullscreenchange")
 
elementOnwebkitfullscreenerror ::
                               (ElementClass self) => Signal self (EventM UIEvent self ())
elementOnwebkitfullscreenerror = (connect "webkitfullscreenerror")
