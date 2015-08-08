module Graphics.UI.Gtk.WebKit.DOM.Element(
getAttribute,
setAttribute,
removeAttribute,
getAttributeNode,
setAttributeNode,
removeAttributeNode,
getElementsByTagName,
#if WEBKIT_CHECK_VERSION(2,2,2)
hasAttributes,
#endif
getAttributeNS,
setAttributeNS,
removeAttributeNS,
getElementsByTagNameNS,
getAttributeNodeNS,
setAttributeNodeNS,
hasAttribute,
hasAttributeNS,
focus,
blur,
scrollIntoView,
scrollIntoViewIfNeeded,
scrollByLines,
scrollByPages,
getElementsByClassName,
querySelector,
querySelectorAll,
#if WEBKIT_CHECK_VERSION(99,0,0)
matches,
closest,
#endif
webkitMatchesSelector,
#if WEBKIT_CHECK_VERSION(2,2,2)
webkitRequestFullScreen,
webkitRequestFullscreen,
requestPointerLock,
#endif
#if WEBKIT_CHECK_VERSION(99,0,0)
webkitGetRegionFlowRanges,
#endif
pattern ALLOW_KEYBOARD_INPUT,
getTagName,
#if WEBKIT_CHECK_VERSION(2,2,2)
getAttributes,
#endif
getStyle,
#if WEBKIT_CHECK_VERSION(2,2,2)
setId,
getId,
#endif
getOffsetLeft,
getOffsetTop,
getOffsetWidth,
getOffsetHeight,
getClientLeft,
getClientTop,
getClientWidth,
getClientHeight,
setScrollLeft,
getScrollLeft,
setScrollTop,
getScrollTop,
getScrollWidth,
getScrollHeight,
getOffsetParent,
setInnerHTML,
getInnerHTML,
setOuterHTML,
getOuterHTML,
#if WEBKIT_CHECK_VERSION(2,2,2)
setClassName,
getClassName,
getClassList,
#endif
getFirstElementChild,
getLastElementChild,
getPreviousElementSibling,
getNextElementSibling,
getChildElementCount,
#if WEBKIT_CHECK_VERSION(2,2,2)
getWebkitRegionOverset,
#endif
abort,
blurEvent,
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
focusEvent,
input,
invalid,
#if WEBKIT_CHECK_VERSION(2,2,2)
keyDown,
keyPress,
keyUp,
#endif
load,
mouseDown,
mouseEnter,
mouseLeave,
mouseMove,
mouseOut,
mouseOver,
mouseUp,
mouseWheel,
scroll,
select,
submit,
#if WEBKIT_CHECK_VERSION(2,4,0)
wheel,
#endif
beforeCut,
cut,
beforeCopy,
copy,
beforePaste,
paste,
reset,
search,
selectStart,
touchStart,
touchMove,
touchEnd,
touchCancel,
webKitFullscreenChange,
webKitFullscreenError,
webKitWillRevealBottom,
webKitWillRevealLeft,
webKitWillRevealRight,
webKitWillRevealTop,
Element,
castToElement,
gTypeElement,
ElementClass,
toElement,
) where
import Prelude hiding (drop, error, print)
import Data.Typeable (Typeable)
import Foreign.Marshal (maybePeek, maybeWith)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CLLong(..), CULLong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
{#import Graphics.UI.Gtk.WebKit.Types#}
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
getAttribute ::
             (MonadIO m, ElementClass self, GlibString string) =>
               self -> string -> m (Maybe string)
getAttribute self name
  = liftIO
      ((withUTFString name $
          \ namePtr ->
            {# call webkit_dom_element_get_attribute #} (toElement self)
              namePtr)
         >>=
         maybePeek readUTFString)
 
setAttribute ::
             (MonadIO m, ElementClass self, GlibString string) =>
               self -> string -> string -> m ()
setAttribute self name value
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString value $
             \ valuePtr ->
               withUTFString name $
                 \ namePtr ->
                   {# call webkit_dom_element_set_attribute #} (toElement self)
                     namePtr
                 valuePtr
             errorPtr_)
 
removeAttribute ::
                (MonadIO m, ElementClass self, GlibString string) =>
                  self -> string -> m ()
removeAttribute self name
  = liftIO
      (withUTFString name $
         \ namePtr ->
           {# call webkit_dom_element_remove_attribute #} (toElement self)
             namePtr)
 
getAttributeNode ::
                 (MonadIO m, ElementClass self, GlibString string) =>
                   self -> string -> m (Maybe Attr)
getAttributeNode self name
  = liftIO
      (maybeNull (makeNewGObject mkAttr)
         (withUTFString name $
            \ namePtr ->
              {# call webkit_dom_element_get_attribute_node #} (toElement self)
                namePtr))
 
setAttributeNode ::
                 (MonadIO m, ElementClass self, AttrClass newAttr) =>
                   self -> Maybe newAttr -> m (Maybe Attr)
setAttributeNode self newAttr
  = liftIO
      (maybeNull (makeNewGObject mkAttr)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_element_set_attribute_node #} (toElement self)
                (maybe (Attr nullForeignPtr) toAttr newAttr)
                errorPtr_))
 
removeAttributeNode ::
                    (MonadIO m, ElementClass self, AttrClass oldAttr) =>
                      self -> Maybe oldAttr -> m (Maybe Attr)
removeAttributeNode self oldAttr
  = liftIO
      (maybeNull (makeNewGObject mkAttr)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_element_remove_attribute_node #}
                (toElement self)
                (maybe (Attr nullForeignPtr) toAttr oldAttr)
                errorPtr_))
 
getElementsByTagName ::
                     (MonadIO m, ElementClass self, GlibString string) =>
                       self -> string -> m (Maybe NodeList)
getElementsByTagName self name
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         (withUTFString name $
            \ namePtr ->
              {# call webkit_dom_element_get_elements_by_tag_name #}
                (toElement self)
                namePtr))

#if WEBKIT_CHECK_VERSION(2,2,2) 
hasAttributes :: (MonadIO m, ElementClass self) => self -> m Bool
hasAttributes self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_element_has_attributes #} (toElement self)))
#endif
 
getAttributeNS ::
               (MonadIO m, ElementClass self, GlibString string) =>
                 self -> (Maybe string) -> string -> m string
getAttributeNS self namespaceURI localName
  = liftIO
      ((withUTFString localName $
          \ localNamePtr ->
            maybeWith withUTFString namespaceURI $
              \ namespaceURIPtr ->
                {# call webkit_dom_element_get_attribute_ns #} (toElement self)
                  namespaceURIPtr
              localNamePtr)
         >>=
         readUTFString)
 
setAttributeNS ::
               (MonadIO m, ElementClass self, GlibString string) =>
                 self -> (Maybe string) -> string -> string -> m ()
setAttributeNS self namespaceURI qualifiedName value
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString value $
             \ valuePtr ->
               withUTFString qualifiedName $
                 \ qualifiedNamePtr ->
                   maybeWith withUTFString namespaceURI $
                     \ namespaceURIPtr ->
                       {# call webkit_dom_element_set_attribute_ns #} (toElement self)
                         namespaceURIPtr
                     qualifiedNamePtr
                 valuePtr
             errorPtr_)
 
removeAttributeNS ::
                  (MonadIO m, ElementClass self, GlibString string) =>
                    self -> (Maybe string) -> string -> m ()
removeAttributeNS self namespaceURI localName
  = liftIO
      (withUTFString localName $
         \ localNamePtr ->
           maybeWith withUTFString namespaceURI $
             \ namespaceURIPtr ->
               {# call webkit_dom_element_remove_attribute_ns #} (toElement self)
                 namespaceURIPtr
             localNamePtr)
 
getElementsByTagNameNS ::
                       (MonadIO m, ElementClass self, GlibString string) =>
                         self -> (Maybe string) -> string -> m (Maybe NodeList)
getElementsByTagNameNS self namespaceURI localName
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         (withUTFString localName $
            \ localNamePtr ->
              maybeWith withUTFString namespaceURI $
                \ namespaceURIPtr ->
                  {# call webkit_dom_element_get_elements_by_tag_name_ns #}
                    (toElement self)
                    namespaceURIPtr
                localNamePtr))
 
getAttributeNodeNS ::
                   (MonadIO m, ElementClass self, GlibString string) =>
                     self -> (Maybe string) -> string -> m (Maybe Attr)
getAttributeNodeNS self namespaceURI localName
  = liftIO
      (maybeNull (makeNewGObject mkAttr)
         (withUTFString localName $
            \ localNamePtr ->
              maybeWith withUTFString namespaceURI $
                \ namespaceURIPtr ->
                  {# call webkit_dom_element_get_attribute_node_ns #}
                    (toElement self)
                    namespaceURIPtr
                localNamePtr))
 
setAttributeNodeNS ::
                   (MonadIO m, ElementClass self, AttrClass newAttr) =>
                     self -> Maybe newAttr -> m (Maybe Attr)
setAttributeNodeNS self newAttr
  = liftIO
      (maybeNull (makeNewGObject mkAttr)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_element_set_attribute_node_ns #}
                (toElement self)
                (maybe (Attr nullForeignPtr) toAttr newAttr)
                errorPtr_))
 
hasAttribute ::
             (MonadIO m, ElementClass self, GlibString string) =>
               self -> string -> m Bool
hasAttribute self name
  = liftIO
      (toBool <$>
         (withUTFString name $
            \ namePtr ->
              {# call webkit_dom_element_has_attribute #} (toElement self)
                namePtr))
 
hasAttributeNS ::
               (MonadIO m, ElementClass self, GlibString string) =>
                 self -> (Maybe string) -> string -> m Bool
hasAttributeNS self namespaceURI localName
  = liftIO
      (toBool <$>
         (withUTFString localName $
            \ localNamePtr ->
              maybeWith withUTFString namespaceURI $
                \ namespaceURIPtr ->
                  {# call webkit_dom_element_has_attribute_ns #} (toElement self)
                    namespaceURIPtr
                localNamePtr))
 
focus :: (MonadIO m, ElementClass self) => self -> m ()
focus self
  = liftIO ({# call webkit_dom_element_focus #} (toElement self))
 
blur :: (MonadIO m, ElementClass self) => self -> m ()
blur self
  = liftIO ({# call webkit_dom_element_blur #} (toElement self))
 
scrollIntoView ::
               (MonadIO m, ElementClass self) => self -> Bool -> m ()
scrollIntoView self alignWithTop
  = liftIO
      ({# call webkit_dom_element_scroll_into_view #} (toElement self)
         (fromBool alignWithTop))
 
scrollIntoViewIfNeeded ::
                       (MonadIO m, ElementClass self) => self -> Bool -> m ()
scrollIntoViewIfNeeded self centerIfNeeded
  = liftIO
      ({# call webkit_dom_element_scroll_into_view_if_needed #}
         (toElement self)
         (fromBool centerIfNeeded))
 
scrollByLines ::
              (MonadIO m, ElementClass self) => self -> Int -> m ()
scrollByLines self lines
  = liftIO
      ({# call webkit_dom_element_scroll_by_lines #} (toElement self)
         (fromIntegral lines))
 
scrollByPages ::
              (MonadIO m, ElementClass self) => self -> Int -> m ()
scrollByPages self pages
  = liftIO
      ({# call webkit_dom_element_scroll_by_pages #} (toElement self)
         (fromIntegral pages))
 
getElementsByClassName ::
                       (MonadIO m, ElementClass self, GlibString string) =>
                         self -> string -> m (Maybe NodeList)
getElementsByClassName self name
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         (withUTFString name $
            \ namePtr ->
              {# call webkit_dom_element_get_elements_by_class_name #}
                (toElement self)
                namePtr))
 
querySelector ::
              (MonadIO m, ElementClass self, GlibString string) =>
                self -> string -> m (Maybe Element)
querySelector self selectors
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString selectors $
                \ selectorsPtr ->
                  {# call webkit_dom_element_query_selector #} (toElement self)
                    selectorsPtr
                errorPtr_))
 
querySelectorAll ::
                 (MonadIO m, ElementClass self, GlibString string) =>
                   self -> string -> m (Maybe NodeList)
querySelectorAll self selectors
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString selectors $
                \ selectorsPtr ->
                  {# call webkit_dom_element_query_selector_all #} (toElement self)
                    selectorsPtr
                errorPtr_))

#if WEBKIT_CHECK_VERSION(99,0,0) 
matches ::
        (MonadIO m, ElementClass self, GlibString string) =>
          self -> string -> m Bool
matches self selectors
  = liftIO
      (toBool <$>
         (propagateGError $
            \ errorPtr_ ->
              withUTFString selectors $
                \ selectorsPtr ->
                  {# call webkit_dom_element_matches #} (toElement self) selectorsPtr
                errorPtr_))
 
closest ::
        (MonadIO m, ElementClass self, GlibString string) =>
          self -> string -> m (Maybe Element)
closest self selectors
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString selectors $
                \ selectorsPtr ->
                  {# call webkit_dom_element_closest #} (toElement self) selectorsPtr
                errorPtr_))
#endif
 
webkitMatchesSelector ::
                      (MonadIO m, ElementClass self, GlibString string) =>
                        self -> string -> m Bool
webkitMatchesSelector self selectors
  = liftIO
      (toBool <$>
         (propagateGError $
            \ errorPtr_ ->
              withUTFString selectors $
                \ selectorsPtr ->
                  {# call webkit_dom_element_webkit_matches_selector #}
                    (toElement self)
                    selectorsPtr
                errorPtr_))

#if WEBKIT_CHECK_VERSION(2,2,2) 
webkitRequestFullScreen ::
                        (MonadIO m, ElementClass self) => self -> Word -> m ()
webkitRequestFullScreen self flags
  = liftIO
      ({# call webkit_dom_element_webkit_request_full_screen #}
         (toElement self)
         (fromIntegral flags))
 
webkitRequestFullscreen ::
                        (MonadIO m, ElementClass self) => self -> m ()
webkitRequestFullscreen self
  = liftIO
      ({# call webkit_dom_element_webkit_request_fullscreen #}
         (toElement self))
 
requestPointerLock ::
                   (MonadIO m, ElementClass self) => self -> m ()
requestPointerLock self
  = liftIO
#if WEBKIT_CHECK_VERSION(2,6,0)
      ({# call webkit_dom_element_request_pointer_lock #}
#else
      ({# call webkit_dom_element_webkit_request_pointer_lock #}
#endif
         (toElement self))
#endif

#if WEBKIT_CHECK_VERSION(99,0,0) 
webkitGetRegionFlowRanges ::
                          (MonadIO m, ElementClass self) => self -> m [Maybe Range]
webkitGetRegionFlowRanges self
  = liftIO
      ({# call webkit_dom_element_webkit_get_region_flow_ranges #}
         (toElement self))
#endif
pattern ALLOW_KEYBOARD_INPUT = 1
 
getTagName ::
           (MonadIO m, ElementClass self, GlibString string) =>
             self -> m (Maybe string)
getTagName self
  = liftIO
      (({# call webkit_dom_element_get_tag_name #} (toElement self)) >>=
         maybePeek readUTFString)

#if WEBKIT_CHECK_VERSION(2,2,2) 
getAttributes ::
              (MonadIO m, ElementClass self) => self -> m (Maybe NamedNodeMap)
getAttributes self
  = liftIO
      (maybeNull (makeNewGObject mkNamedNodeMap)
         ({# call webkit_dom_element_get_attributes #} (toElement self)))
#endif
 
getStyle ::
         (MonadIO m, ElementClass self) =>
           self -> m (Maybe CSSStyleDeclaration)
getStyle self
  = liftIO
      (maybeNull (makeNewGObject mkCSSStyleDeclaration)
         ({# call webkit_dom_element_get_style #} (toElement self)))

#if WEBKIT_CHECK_VERSION(2,2,2) 
setId ::
      (MonadIO m, ElementClass self, GlibString string) =>
        self -> string -> m ()
setId self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_element_set_id #} (toElement self) valPtr)
 
getId ::
      (MonadIO m, ElementClass self, GlibString string) =>
        self -> m string
getId self
  = liftIO
      (({# call webkit_dom_element_get_id #} (toElement self)) >>=
         readUTFString)
#endif
 
getOffsetLeft :: (MonadIO m, ElementClass self) => self -> m Double
getOffsetLeft self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_element_get_offset_left #} (toElement self)))
 
getOffsetTop :: (MonadIO m, ElementClass self) => self -> m Double
getOffsetTop self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_element_get_offset_top #} (toElement self)))
 
getOffsetWidth ::
               (MonadIO m, ElementClass self) => self -> m Double
getOffsetWidth self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_element_get_offset_width #} (toElement self)))
 
getOffsetHeight ::
                (MonadIO m, ElementClass self) => self -> m Double
getOffsetHeight self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_element_get_offset_height #} (toElement self)))
 
getClientLeft :: (MonadIO m, ElementClass self) => self -> m Double
getClientLeft self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_element_get_client_left #} (toElement self)))
 
getClientTop :: (MonadIO m, ElementClass self) => self -> m Double
getClientTop self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_element_get_client_top #} (toElement self)))
 
getClientWidth ::
               (MonadIO m, ElementClass self) => self -> m Double
getClientWidth self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_element_get_client_width #} (toElement self)))
 
getClientHeight ::
                (MonadIO m, ElementClass self) => self -> m Double
getClientHeight self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_element_get_client_height #} (toElement self)))
 
setScrollLeft ::
              (MonadIO m, ElementClass self) => self -> Int -> m ()
setScrollLeft self val
  = liftIO
      ({# call webkit_dom_element_set_scroll_left #} (toElement self)
         (fromIntegral val))
 
getScrollLeft :: (MonadIO m, ElementClass self) => self -> m Int
getScrollLeft self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_element_get_scroll_left #} (toElement self)))
 
setScrollTop ::
             (MonadIO m, ElementClass self) => self -> Int -> m ()
setScrollTop self val
  = liftIO
      ({# call webkit_dom_element_set_scroll_top #} (toElement self)
         (fromIntegral val))
 
getScrollTop :: (MonadIO m, ElementClass self) => self -> m Int
getScrollTop self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_element_get_scroll_top #} (toElement self)))
 
getScrollWidth :: (MonadIO m, ElementClass self) => self -> m Int
getScrollWidth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_element_get_scroll_width #} (toElement self)))
 
getScrollHeight :: (MonadIO m, ElementClass self) => self -> m Int
getScrollHeight self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_element_get_scroll_height #} (toElement self)))
 
getOffsetParent ::
                (MonadIO m, ElementClass self) => self -> m (Maybe Element)
getOffsetParent self
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         ({# call webkit_dom_element_get_offset_parent #} (toElement self)))
 
setInnerHTML ::
             (MonadIO m, ElementClass self, GlibString string) =>
               self -> (Maybe string) -> m ()
setInnerHTML self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           maybeWith withUTFString val $
             \ valPtr ->
#if WEBKIT_CHECK_VERSION(2,8,0)
               {# call webkit_dom_element_set_inner_html #} (toElement self)
#else
               ({# call webkit_dom_html_element_set_inner_html #} . castToHTMLElement) (toElement self)
#endif
                 valPtr
             errorPtr_)
 
getInnerHTML ::
             (MonadIO m, ElementClass self, GlibString string) =>
               self -> m (Maybe string)
getInnerHTML self
  = liftIO
#if WEBKIT_CHECK_VERSION(2,8,0)
      (({# call webkit_dom_element_get_inner_html #} (toElement self))
#else
      ((({# call webkit_dom_html_element_get_inner_html #} . castToHTMLElement) (toElement self))
#endif
         >>=
         maybePeek readUTFString)
 
setOuterHTML ::
             (MonadIO m, ElementClass self, GlibString string) =>
               self -> (Maybe string) -> m ()
setOuterHTML self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           maybeWith withUTFString val $
             \ valPtr ->
#if WEBKIT_CHECK_VERSION(2,8,0)
               {# call webkit_dom_element_set_outer_html #} (toElement self)
#else
               ({# call webkit_dom_html_element_set_outer_html #} . castToHTMLElement) (toElement self)
#endif
                 valPtr
             errorPtr_)
 
getOuterHTML ::
             (MonadIO m, ElementClass self, GlibString string) =>
               self -> m (Maybe string)
getOuterHTML self
  = liftIO
#if WEBKIT_CHECK_VERSION(2,8,0)
      (({# call webkit_dom_element_get_outer_html #} (toElement self))
#else
      ((({# call webkit_dom_html_element_get_outer_html #} . castToHTMLElement) (toElement self))
#endif
         >>=
         maybePeek readUTFString)

#if WEBKIT_CHECK_VERSION(2,2,2) 
setClassName ::
             (MonadIO m, ElementClass self, GlibString string) =>
               self -> string -> m ()
setClassName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_element_set_class_name #} (toElement self)
             valPtr)
 
getClassName ::
             (MonadIO m, ElementClass self, GlibString string) =>
               self -> m string
getClassName self
  = liftIO
      (({# call webkit_dom_element_get_class_name #} (toElement self))
         >>=
         readUTFString)
 
getClassList ::
             (MonadIO m, ElementClass self) => self -> m (Maybe DOMTokenList)
getClassList self
  = liftIO
      (maybeNull (makeNewGObject mkDOMTokenList)
         ({# call webkit_dom_element_get_class_list #} (toElement self)))
#endif
 
getFirstElementChild ::
                     (MonadIO m, ElementClass self) => self -> m (Maybe Element)
getFirstElementChild self
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         ({# call webkit_dom_element_get_first_element_child #}
            (toElement self)))
 
getLastElementChild ::
                    (MonadIO m, ElementClass self) => self -> m (Maybe Element)
getLastElementChild self
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         ({# call webkit_dom_element_get_last_element_child #}
            (toElement self)))
 
getPreviousElementSibling ::
                          (MonadIO m, ElementClass self) => self -> m (Maybe Element)
getPreviousElementSibling self
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         ({# call webkit_dom_element_get_previous_element_sibling #}
            (toElement self)))
 
getNextElementSibling ::
                      (MonadIO m, ElementClass self) => self -> m (Maybe Element)
getNextElementSibling self
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         ({# call webkit_dom_element_get_next_element_sibling #}
            (toElement self)))
 
getChildElementCount ::
                     (MonadIO m, ElementClass self) => self -> m Word
getChildElementCount self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_element_get_child_element_count #}
            (toElement self)))

#if WEBKIT_CHECK_VERSION(2,2,2) 
getWebkitRegionOverset ::
                       (MonadIO m, ElementClass self, GlibString string) =>
                         self -> m string
getWebkitRegionOverset self
  = liftIO
      (({# call webkit_dom_element_get_webkit_region_overset #}
          (toElement self))
         >>=
         readUTFString)
#endif
 
abort :: (ElementClass self) => EventName self UIEvent
abort = EventName "abort"
 
blurEvent :: (ElementClass self) => EventName self UIEvent
blurEvent = EventName "blur"
 
change :: (ElementClass self) => EventName self Event
change = EventName "change"
 
click :: (ElementClass self) => EventName self MouseEvent
click = EventName "click"
 
contextMenu :: (ElementClass self) => EventName self MouseEvent
contextMenu = EventName "contextmenu"
 
dblClick :: (ElementClass self) => EventName self MouseEvent
dblClick = EventName "dblclick"
 
drag :: (ElementClass self) => EventName self MouseEvent
drag = EventName "drag"
 
dragEnd :: (ElementClass self) => EventName self MouseEvent
dragEnd = EventName "dragend"
 
dragEnter :: (ElementClass self) => EventName self MouseEvent
dragEnter = EventName "dragenter"
 
dragLeave :: (ElementClass self) => EventName self MouseEvent
dragLeave = EventName "dragleave"
 
dragOver :: (ElementClass self) => EventName self MouseEvent
dragOver = EventName "dragover"
 
dragStart :: (ElementClass self) => EventName self MouseEvent
dragStart = EventName "dragstart"
 
drop :: (ElementClass self) => EventName self MouseEvent
drop = EventName "drop"
 
error :: (ElementClass self) => EventName self UIEvent
error = EventName "error"
 
focusEvent :: (ElementClass self) => EventName self UIEvent
focusEvent = EventName "focus"
 
input :: (ElementClass self) => EventName self Event
input = EventName "input"
 
invalid :: (ElementClass self) => EventName self Event
invalid = EventName "invalid"

#if WEBKIT_CHECK_VERSION(2,2,2) 
keyDown :: (ElementClass self) => EventName self KeyboardEvent
keyDown = EventName "keydown"
 
keyPress :: (ElementClass self) => EventName self KeyboardEvent
keyPress = EventName "keypress"
 
keyUp :: (ElementClass self) => EventName self KeyboardEvent
keyUp = EventName "keyup"
#endif
 
load :: (ElementClass self) => EventName self UIEvent
load = EventName "load"
 
mouseDown :: (ElementClass self) => EventName self MouseEvent
mouseDown = EventName "mousedown"
 
mouseEnter :: (ElementClass self) => EventName self MouseEvent
mouseEnter = EventName "mouseenter"
 
mouseLeave :: (ElementClass self) => EventName self MouseEvent
mouseLeave = EventName "mouseleave"
 
mouseMove :: (ElementClass self) => EventName self MouseEvent
mouseMove = EventName "mousemove"
 
mouseOut :: (ElementClass self) => EventName self MouseEvent
mouseOut = EventName "mouseout"
 
mouseOver :: (ElementClass self) => EventName self MouseEvent
mouseOver = EventName "mouseover"
 
mouseUp :: (ElementClass self) => EventName self MouseEvent
mouseUp = EventName "mouseup"
 
mouseWheel :: (ElementClass self) => EventName self MouseEvent
mouseWheel = EventName "mousewheel"
 
scroll :: (ElementClass self) => EventName self UIEvent
scroll = EventName "scroll"
 
select :: (ElementClass self) => EventName self UIEvent
select = EventName "select"
 
submit :: (ElementClass self) => EventName self Event
submit = EventName "submit"

#if WEBKIT_CHECK_VERSION(2,4,0) 
wheel :: (ElementClass self) => EventName self WheelEvent
wheel = EventName "wheel"
#endif
 
beforeCut :: (ElementClass self) => EventName self Event
beforeCut = EventName "beforecut"
 
cut :: (ElementClass self) => EventName self Event
cut = EventName "cut"
 
beforeCopy :: (ElementClass self) => EventName self Event
beforeCopy = EventName "beforecopy"
 
copy :: (ElementClass self) => EventName self Event
copy = EventName "copy"
 
beforePaste :: (ElementClass self) => EventName self Event
beforePaste = EventName "beforepaste"
 
paste :: (ElementClass self) => EventName self Event
paste = EventName "paste"
 
reset :: (ElementClass self) => EventName self Event
reset = EventName "reset"
 
search :: (ElementClass self) => EventName self Event
search = EventName "search"
 
selectStart :: (ElementClass self) => EventName self Event
selectStart = EventName "selectstart"
 
touchStart :: (ElementClass self) => EventName self UIEvent
touchStart = EventName "touchstart"
 
touchMove :: (ElementClass self) => EventName self UIEvent
touchMove = EventName "touchmove"
 
touchEnd :: (ElementClass self) => EventName self UIEvent
touchEnd = EventName "touchend"
 
touchCancel :: (ElementClass self) => EventName self UIEvent
touchCancel = EventName "touchcancel"
 
webKitFullscreenChange ::
                       (ElementClass self) => EventName self Event
webKitFullscreenChange = EventName "webkitfullscreenchange"
 
webKitFullscreenError ::
                      (ElementClass self) => EventName self Event
webKitFullscreenError = EventName "webkitfullscreenerror"
 
webKitWillRevealBottom ::
                       (ElementClass self) => EventName self Event
webKitWillRevealBottom = EventName "webkitwillrevealbottom"
 
webKitWillRevealLeft :: (ElementClass self) => EventName self Event
webKitWillRevealLeft = EventName "webkitwillrevealleft"
 
webKitWillRevealRight ::
                      (ElementClass self) => EventName self Event
webKitWillRevealRight = EventName "webkitwillrevealright"
 
webKitWillRevealTop :: (ElementClass self) => EventName self Event
webKitWillRevealTop = EventName "webkitwillrevealtop"
