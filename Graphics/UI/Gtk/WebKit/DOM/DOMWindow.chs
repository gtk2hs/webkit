module Graphics.UI.Gtk.WebKit.DOM.DOMWindow(
getSelection,
blur,
print,
stop,
alert,
confirm,
prompt,
find,
scrollBy,
scrollTo,
scroll,
moveBy,
moveTo,
resizeBy,
resizeTo,
matchMedia,
getComputedStyle,
webkitConvertPointFromPageToNode,
webkitConvertPointFromNodeToPage,
captureEvents,
releaseEvents,
getWebkitStorageInfo,
getScreen,
getHistory,
getLocationbar,
getMenubar,
getPersonalbar,
getScrollbars,
getStatusbar,
getToolbar,
getNavigator,
getClientInformation,
getFrameElement,
getOffscreenBuffering,
getOuterHeight,
getOuterWidth,
getInnerHeight,
getInnerWidth,
getScreenX,
getScreenY,
getScreenLeft,
getScreenTop,
getScrollX,
getScrollY,
getPageXOffset,
getPageYOffset,
getClosed,
getLength,
setName,
getName,
setStatus,
getStatus,
setDefaultStatus,
getDefaultStatus,
getSelf,
getWindow,
getFrames,
getOpener,
getParent,
getTop,
getDocument,
getStyleMedia,
getDevicePixelRatio,
getApplicationCache,
getSessionStorage,
getLocalStorage,
getPerformance,
getCSS,
abort,
beforeUnload,
blurEvent,
canPlay,
canPlayThrough,
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
durationChange,
emptied,
ended,
error,
focusEvent,
hashChange,
input,
invalid,
keyDown,
keyPress,
keyUp,
load,
loadedData,
loadedMetadata,
loadStart,
message,
mouseDown,
mouseEnter,
mouseLeave,
mouseMove,
mouseOut,
mouseOver,
mouseUp,
mouseWheel,
offline,
online,
pageHide,
pageShow,
pause,
play,
playing,
popState,
progress,
rateChange,
resize,
scrollEvent,
seeked,
seeking,
select,
stalled,
storage,
submit,
suspend,
timeUpdate,
unload,
volumeChange,
waiting,
wheel,
reset,
search,
webKitAnimationEnd,
webKitAnimationIteration,
webKitAnimationStart,
animationEnd,
animationIteration,
animationStart,
webKitTransitionEnd,
transitionEnd,
touchStart,
touchMove,
touchEnd,
touchCancel,
gestureStart,
gestureChange,
gestureEnd,
deviceMotion,
deviceOrientation,
webKitDeviceProximity,
webKitWillRevealBottom,
webKitWillRevealLeft,
webKitWillRevealRight,
webKitWillRevealTop,
DOMWindow,
castToDOMWindow,
gTypeDOMWindow,
DOMWindowClass,
toDOMWindow,
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

 
getSelection ::
             (MonadIO m, DOMWindowClass self) => self -> m (Maybe DOMSelection)
getSelection self
  = liftIO
      (maybeNull (makeNewGObject mkDOMSelection)
         ({# call webkit_dom_dom_window_get_selection #}
            (toDOMWindow self)))
 
blur :: (MonadIO m, DOMWindowClass self) => self -> m ()
blur self
  = liftIO ({# call webkit_dom_dom_window_blur #} (toDOMWindow self))
 
print :: (MonadIO m, DOMWindowClass self) => self -> m ()
print self
  = liftIO
      ({# call webkit_dom_dom_window_print #} (toDOMWindow self))
 
stop :: (MonadIO m, DOMWindowClass self) => self -> m ()
stop self
  = liftIO ({# call webkit_dom_dom_window_stop #} (toDOMWindow self))
 
alert ::
      (MonadIO m, DOMWindowClass self, GlibString string) =>
        self -> string -> m ()
alert self message
  = liftIO
      (withUTFString message $
         \ messagePtr ->
           {# call webkit_dom_dom_window_alert #} (toDOMWindow self)
             messagePtr)
 
confirm ::
        (MonadIO m, DOMWindowClass self, GlibString string) =>
          self -> string -> m Bool
confirm self message
  = liftIO
      (toBool <$>
         (withUTFString message $
            \ messagePtr ->
              {# call webkit_dom_dom_window_confirm #} (toDOMWindow self)
                messagePtr))
 
prompt ::
       (MonadIO m, DOMWindowClass self, GlibString string) =>
         self -> string -> string -> m string
prompt self message defaultValue
  = liftIO
      ((withUTFString defaultValue $
          \ defaultValuePtr ->
            withUTFString message $
              \ messagePtr ->
                {# call webkit_dom_dom_window_prompt #} (toDOMWindow self)
                  messagePtr
              defaultValuePtr)
         >>=
         readUTFString)
 
find ::
     (MonadIO m, DOMWindowClass self, GlibString string) =>
       self ->
         string -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> m Bool
find self string caseSensitive backwards wrap wholeWord
  searchInFrames showDialog
  = liftIO
      (toBool <$>
         (withUTFString string $
            \ stringPtr ->
              {# call webkit_dom_dom_window_find #} (toDOMWindow self) stringPtr
            (fromBool caseSensitive)
            (fromBool backwards)
            (fromBool wrap)
            (fromBool wholeWord)
            (fromBool searchInFrames)
            (fromBool showDialog)))
 
scrollBy ::
         (MonadIO m, DOMWindowClass self) => self -> Int -> Int -> m ()
scrollBy self x y
  = liftIO
      ({# call webkit_dom_dom_window_scroll_by #} (toDOMWindow self)
         (fromIntegral x)
         (fromIntegral y))
 
scrollTo ::
         (MonadIO m, DOMWindowClass self) => self -> Int -> Int -> m ()
scrollTo self x y
  = liftIO
      ({# call webkit_dom_dom_window_scroll_to #} (toDOMWindow self)
         (fromIntegral x)
         (fromIntegral y))
 
scroll ::
       (MonadIO m, DOMWindowClass self) => self -> Int -> Int -> m ()
scroll self x y
  = liftIO
      ({# call webkit_dom_dom_window_scroll #} (toDOMWindow self)
         (fromIntegral x)
         (fromIntegral y))
 
moveBy ::
       (MonadIO m, DOMWindowClass self) => self -> Float -> Float -> m ()
moveBy self x y
  = liftIO
      ({# call webkit_dom_dom_window_move_by #} (toDOMWindow self)
         (realToFrac x)
         (realToFrac y))
 
moveTo ::
       (MonadIO m, DOMWindowClass self) => self -> Float -> Float -> m ()
moveTo self x y
  = liftIO
      ({# call webkit_dom_dom_window_move_to #} (toDOMWindow self)
         (realToFrac x)
         (realToFrac y))
 
resizeBy ::
         (MonadIO m, DOMWindowClass self) => self -> Float -> Float -> m ()
resizeBy self x y
  = liftIO
      ({# call webkit_dom_dom_window_resize_by #} (toDOMWindow self)
         (realToFrac x)
         (realToFrac y))
 
resizeTo ::
         (MonadIO m, DOMWindowClass self) => self -> Float -> Float -> m ()
resizeTo self width height
  = liftIO
      ({# call webkit_dom_dom_window_resize_to #} (toDOMWindow self)
         (realToFrac width)
         (realToFrac height))
 
matchMedia ::
           (MonadIO m, DOMWindowClass self, GlibString string) =>
             self -> string -> m (Maybe MediaQueryList)
matchMedia self query
  = liftIO
      (maybeNull (makeNewGObject mkMediaQueryList)
         (withUTFString query $
            \ queryPtr ->
              {# call webkit_dom_dom_window_match_media #} (toDOMWindow self)
                queryPtr))
 
getComputedStyle ::
                 (MonadIO m, DOMWindowClass self, ElementClass element,
                  GlibString string) =>
                   self -> Maybe element -> string -> m (Maybe CSSStyleDeclaration)
getComputedStyle self element pseudoElement
  = liftIO
      (maybeNull (makeNewGObject mkCSSStyleDeclaration)
         (withUTFString pseudoElement $
            \ pseudoElementPtr ->
              {# call webkit_dom_dom_window_get_computed_style #}
                (toDOMWindow self)
                (maybe (Element nullForeignPtr) toElement element)
                pseudoElementPtr))
 
webkitConvertPointFromPageToNode ::
                                 (MonadIO m, DOMWindowClass self, NodeClass node,
                                  WebKitPointClass p) =>
                                   self -> Maybe node -> Maybe p -> m (Maybe WebKitPoint)
webkitConvertPointFromPageToNode self node p
  = liftIO
      (maybeNull (makeNewGObject mkWebKitPoint)
         ({# call
            webkit_dom_dom_window_webkit_convert_point_from_page_to_node
            #}
            (toDOMWindow self)
            (maybe (Node nullForeignPtr) toNode node)
            (maybe (WebKitPoint nullForeignPtr) toWebKitPoint p)))
 
webkitConvertPointFromNodeToPage ::
                                 (MonadIO m, DOMWindowClass self, NodeClass node,
                                  WebKitPointClass p) =>
                                   self -> Maybe node -> Maybe p -> m (Maybe WebKitPoint)
webkitConvertPointFromNodeToPage self node p
  = liftIO
      (maybeNull (makeNewGObject mkWebKitPoint)
         ({# call
            webkit_dom_dom_window_webkit_convert_point_from_node_to_page
            #}
            (toDOMWindow self)
            (maybe (Node nullForeignPtr) toNode node)
            (maybe (WebKitPoint nullForeignPtr) toWebKitPoint p)))
 
captureEvents :: (MonadIO m, DOMWindowClass self) => self -> m ()
captureEvents self
  = liftIO
      ({# call webkit_dom_dom_window_capture_events #}
         (toDOMWindow self))
 
releaseEvents :: (MonadIO m, DOMWindowClass self) => self -> m ()
releaseEvents self
  = liftIO
      ({# call webkit_dom_dom_window_release_events #}
         (toDOMWindow self))
 
getWebkitStorageInfo ::
                     (MonadIO m, DOMWindowClass self) => self -> m (Maybe StorageInfo)
getWebkitStorageInfo self
  = liftIO
      (maybeNull (makeNewGObject mkStorageInfo)
         ({# call webkit_dom_dom_window_get_webkit_storage_info #}
            (toDOMWindow self)))
 
getScreen ::
          (MonadIO m, DOMWindowClass self) => self -> m (Maybe DOMScreen)
getScreen self
  = liftIO
      (maybeNull (makeNewGObject mkDOMScreen)
         ({# call webkit_dom_dom_window_get_screen #} (toDOMWindow self)))
 
getHistory ::
           (MonadIO m, DOMWindowClass self) => self -> m (Maybe History)
getHistory self
  = liftIO
      (maybeNull (makeNewGObject mkHistory)
         ({# call webkit_dom_dom_window_get_history #} (toDOMWindow self)))
 
getLocationbar ::
               (MonadIO m, DOMWindowClass self) => self -> m (Maybe BarProp)
getLocationbar self
  = liftIO
      (maybeNull (makeNewGObject mkBarProp)
         ({# call webkit_dom_dom_window_get_locationbar #}
            (toDOMWindow self)))
 
getMenubar ::
           (MonadIO m, DOMWindowClass self) => self -> m (Maybe BarProp)
getMenubar self
  = liftIO
      (maybeNull (makeNewGObject mkBarProp)
         ({# call webkit_dom_dom_window_get_menubar #} (toDOMWindow self)))
 
getPersonalbar ::
               (MonadIO m, DOMWindowClass self) => self -> m (Maybe BarProp)
getPersonalbar self
  = liftIO
      (maybeNull (makeNewGObject mkBarProp)
         ({# call webkit_dom_dom_window_get_personalbar #}
            (toDOMWindow self)))
 
getScrollbars ::
              (MonadIO m, DOMWindowClass self) => self -> m (Maybe BarProp)
getScrollbars self
  = liftIO
      (maybeNull (makeNewGObject mkBarProp)
         ({# call webkit_dom_dom_window_get_scrollbars #}
            (toDOMWindow self)))
 
getStatusbar ::
             (MonadIO m, DOMWindowClass self) => self -> m (Maybe BarProp)
getStatusbar self
  = liftIO
      (maybeNull (makeNewGObject mkBarProp)
         ({# call webkit_dom_dom_window_get_statusbar #}
            (toDOMWindow self)))
 
getToolbar ::
           (MonadIO m, DOMWindowClass self) => self -> m (Maybe BarProp)
getToolbar self
  = liftIO
      (maybeNull (makeNewGObject mkBarProp)
         ({# call webkit_dom_dom_window_get_toolbar #} (toDOMWindow self)))
 
getNavigator ::
             (MonadIO m, DOMWindowClass self) => self -> m (Maybe Navigator)
getNavigator self
  = liftIO
      (maybeNull (makeNewGObject mkNavigator)
         ({# call webkit_dom_dom_window_get_navigator #}
            (toDOMWindow self)))
 
getClientInformation ::
                     (MonadIO m, DOMWindowClass self) => self -> m (Maybe Navigator)
getClientInformation self
  = liftIO
      (maybeNull (makeNewGObject mkNavigator)
         ({# call webkit_dom_dom_window_get_client_information #}
            (toDOMWindow self)))
 
getFrameElement ::
                (MonadIO m, DOMWindowClass self) => self -> m (Maybe Element)
getFrameElement self
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         ({# call webkit_dom_dom_window_get_frame_element #}
            (toDOMWindow self)))
 
getOffscreenBuffering ::
                      (MonadIO m, DOMWindowClass self) => self -> m Bool
getOffscreenBuffering self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_dom_window_get_offscreen_buffering #}
            (toDOMWindow self)))
 
getOuterHeight :: (MonadIO m, DOMWindowClass self) => self -> m Int
getOuterHeight self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_outer_height #}
            (toDOMWindow self)))
 
getOuterWidth :: (MonadIO m, DOMWindowClass self) => self -> m Int
getOuterWidth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_outer_width #}
            (toDOMWindow self)))
 
getInnerHeight :: (MonadIO m, DOMWindowClass self) => self -> m Int
getInnerHeight self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_inner_height #}
            (toDOMWindow self)))
 
getInnerWidth :: (MonadIO m, DOMWindowClass self) => self -> m Int
getInnerWidth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_inner_width #}
            (toDOMWindow self)))
 
getScreenX :: (MonadIO m, DOMWindowClass self) => self -> m Int
getScreenX self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_screen_x #} (toDOMWindow self)))
 
getScreenY :: (MonadIO m, DOMWindowClass self) => self -> m Int
getScreenY self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_screen_y #} (toDOMWindow self)))
 
getScreenLeft :: (MonadIO m, DOMWindowClass self) => self -> m Int
getScreenLeft self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_screen_left #}
            (toDOMWindow self)))
 
getScreenTop :: (MonadIO m, DOMWindowClass self) => self -> m Int
getScreenTop self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_screen_top #}
            (toDOMWindow self)))
 
getScrollX :: (MonadIO m, DOMWindowClass self) => self -> m Int
getScrollX self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_scroll_x #} (toDOMWindow self)))
 
getScrollY :: (MonadIO m, DOMWindowClass self) => self -> m Int
getScrollY self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_scroll_y #} (toDOMWindow self)))
 
getPageXOffset :: (MonadIO m, DOMWindowClass self) => self -> m Int
getPageXOffset self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_page_x_offset #}
            (toDOMWindow self)))
 
getPageYOffset :: (MonadIO m, DOMWindowClass self) => self -> m Int
getPageYOffset self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_page_y_offset #}
            (toDOMWindow self)))
 
getClosed :: (MonadIO m, DOMWindowClass self) => self -> m Bool
getClosed self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_dom_window_get_closed #} (toDOMWindow self)))
 
getLength :: (MonadIO m, DOMWindowClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_length #} (toDOMWindow self)))
 
setName ::
        (MonadIO m, DOMWindowClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_dom_window_set_name #} (toDOMWindow self)
             valPtr)
 
getName ::
        (MonadIO m, DOMWindowClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_dom_window_get_name #} (toDOMWindow self)) >>=
         readUTFString)
 
setStatus ::
          (MonadIO m, DOMWindowClass self, GlibString string) =>
            self -> string -> m ()
setStatus self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_dom_window_set_status #} (toDOMWindow self)
             valPtr)
 
getStatus ::
          (MonadIO m, DOMWindowClass self, GlibString string) =>
            self -> m string
getStatus self
  = liftIO
      (({# call webkit_dom_dom_window_get_status #} (toDOMWindow self))
         >>=
         readUTFString)
 
setDefaultStatus ::
                 (MonadIO m, DOMWindowClass self, GlibString string) =>
                   self -> string -> m ()
setDefaultStatus self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_dom_window_set_default_status #}
             (toDOMWindow self)
             valPtr)
 
getDefaultStatus ::
                 (MonadIO m, DOMWindowClass self, GlibString string) =>
                   self -> m string
getDefaultStatus self
  = liftIO
      (({# call webkit_dom_dom_window_get_default_status #}
          (toDOMWindow self))
         >>=
         readUTFString)
 
getSelf ::
        (MonadIO m, DOMWindowClass self) => self -> m (Maybe DOMWindow)
getSelf self
  = liftIO
      (maybeNull (makeNewGObject mkDOMWindow)
         ({# call webkit_dom_dom_window_get_self #} (toDOMWindow self)))
 
getWindow ::
          (MonadIO m, DOMWindowClass self) => self -> m (Maybe DOMWindow)
getWindow self
  = liftIO
      (maybeNull (makeNewGObject mkDOMWindow)
         ({# call webkit_dom_dom_window_get_window #} (toDOMWindow self)))
 
getFrames ::
          (MonadIO m, DOMWindowClass self) => self -> m (Maybe DOMWindow)
getFrames self
  = liftIO
      (maybeNull (makeNewGObject mkDOMWindow)
         ({# call webkit_dom_dom_window_get_frames #} (toDOMWindow self)))
 
getOpener ::
          (MonadIO m, DOMWindowClass self) => self -> m (Maybe DOMWindow)
getOpener self
  = liftIO
      (maybeNull (makeNewGObject mkDOMWindow)
         ({# call webkit_dom_dom_window_get_opener #} (toDOMWindow self)))
 
getParent ::
          (MonadIO m, DOMWindowClass self) => self -> m (Maybe DOMWindow)
getParent self
  = liftIO
      (maybeNull (makeNewGObject mkDOMWindow)
         ({# call webkit_dom_dom_window_get_parent #} (toDOMWindow self)))
 
getTop ::
       (MonadIO m, DOMWindowClass self) => self -> m (Maybe DOMWindow)
getTop self
  = liftIO
      (maybeNull (makeNewGObject mkDOMWindow)
         ({# call webkit_dom_dom_window_get_top #} (toDOMWindow self)))
 
getDocument ::
            (MonadIO m, DOMWindowClass self) => self -> m (Maybe Document)
getDocument self
  = liftIO
      (maybeNull (makeNewGObject mkDocument)
         ({# call webkit_dom_dom_window_get_document #} (toDOMWindow self)))
 
getStyleMedia ::
              (MonadIO m, DOMWindowClass self) => self -> m (Maybe StyleMedia)
getStyleMedia self
  = liftIO
      (maybeNull (makeNewGObject mkStyleMedia)
         ({# call webkit_dom_dom_window_get_style_media #}
            (toDOMWindow self)))
 
getDevicePixelRatio ::
                    (MonadIO m, DOMWindowClass self) => self -> m Double
getDevicePixelRatio self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_dom_window_get_device_pixel_ratio #}
            (toDOMWindow self)))
 
getApplicationCache ::
                    (MonadIO m, DOMWindowClass self) =>
                      self -> m (Maybe DOMApplicationCache)
getApplicationCache self
  = liftIO
      (maybeNull (makeNewGObject mkDOMApplicationCache)
         ({# call webkit_dom_dom_window_get_application_cache #}
            (toDOMWindow self)))
 
getSessionStorage ::
                  (MonadIO m, DOMWindowClass self) => self -> m (Maybe Storage)
getSessionStorage self
  = liftIO
      (maybeNull (makeNewGObject mkStorage)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_dom_window_get_session_storage #}
                (toDOMWindow self)
                errorPtr_))
 
getLocalStorage ::
                (MonadIO m, DOMWindowClass self) => self -> m (Maybe Storage)
getLocalStorage self
  = liftIO
      (maybeNull (makeNewGObject mkStorage)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_dom_window_get_local_storage #}
                (toDOMWindow self)
                errorPtr_))
 
getPerformance ::
               (MonadIO m, DOMWindowClass self) => self -> m (Maybe Performance)
getPerformance self
  = liftIO
      (maybeNull (makeNewGObject mkPerformance)
         ({# call webkit_dom_dom_window_get_performance #}
            (toDOMWindow self)))
 
getCSS ::
       (MonadIO m, DOMWindowClass self) => self -> m (Maybe DOMWindowCSS)
getCSS self
  = liftIO
      (maybeNull (makeNewGObject mkDOMWindowCSS)
         ({# call webkit_dom_dom_window_get_css #} (toDOMWindow self)))
 
abort :: (DOMWindowClass self) => EventName self UIEvent
abort = EventName "abort"
 
beforeUnload :: (DOMWindowClass self) => EventName self Event
beforeUnload = EventName "beforeunload"
 
blurEvent :: (DOMWindowClass self) => EventName self UIEvent
blurEvent = EventName "blur"
 
canPlay :: (DOMWindowClass self) => EventName self Event
canPlay = EventName "canplay"
 
canPlayThrough :: (DOMWindowClass self) => EventName self Event
canPlayThrough = EventName "canplaythrough"
 
change :: (DOMWindowClass self) => EventName self Event
change = EventName "change"
 
click :: (DOMWindowClass self) => EventName self MouseEvent
click = EventName "click"
 
contextMenu :: (DOMWindowClass self) => EventName self MouseEvent
contextMenu = EventName "contextmenu"
 
dblClick :: (DOMWindowClass self) => EventName self MouseEvent
dblClick = EventName "dblclick"
 
drag :: (DOMWindowClass self) => EventName self MouseEvent
drag = EventName "drag"
 
dragEnd :: (DOMWindowClass self) => EventName self MouseEvent
dragEnd = EventName "dragend"
 
dragEnter :: (DOMWindowClass self) => EventName self MouseEvent
dragEnter = EventName "dragenter"
 
dragLeave :: (DOMWindowClass self) => EventName self MouseEvent
dragLeave = EventName "dragleave"
 
dragOver :: (DOMWindowClass self) => EventName self MouseEvent
dragOver = EventName "dragover"
 
dragStart :: (DOMWindowClass self) => EventName self MouseEvent
dragStart = EventName "dragstart"
 
drop :: (DOMWindowClass self) => EventName self MouseEvent
drop = EventName "drop"
 
durationChange :: (DOMWindowClass self) => EventName self Event
durationChange = EventName "durationchange"
 
emptied :: (DOMWindowClass self) => EventName self Event
emptied = EventName "emptied"
 
ended :: (DOMWindowClass self) => EventName self Event
ended = EventName "ended"
 
error :: (DOMWindowClass self) => EventName self UIEvent
error = EventName "error"
 
focusEvent :: (DOMWindowClass self) => EventName self UIEvent
focusEvent = EventName "focus"
 
hashChange :: (DOMWindowClass self) => EventName self Event
hashChange = EventName "hashchange"
 
input :: (DOMWindowClass self) => EventName self Event
input = EventName "input"
 
invalid :: (DOMWindowClass self) => EventName self Event
invalid = EventName "invalid"
 
keyDown :: (DOMWindowClass self) => EventName self KeyboardEvent
keyDown = EventName "keydown"
 
keyPress :: (DOMWindowClass self) => EventName self KeyboardEvent
keyPress = EventName "keypress"
 
keyUp :: (DOMWindowClass self) => EventName self KeyboardEvent
keyUp = EventName "keyup"
 
load :: (DOMWindowClass self) => EventName self UIEvent
load = EventName "load"
 
loadedData :: (DOMWindowClass self) => EventName self Event
loadedData = EventName "loadeddata"
 
loadedMetadata :: (DOMWindowClass self) => EventName self Event
loadedMetadata = EventName "loadedmetadata"
 
loadStart :: (DOMWindowClass self) => EventName self Event
loadStart = EventName "loadstart"
 
message :: (DOMWindowClass self) => EventName self Event
message = EventName "message"
 
mouseDown :: (DOMWindowClass self) => EventName self MouseEvent
mouseDown = EventName "mousedown"
 
mouseEnter :: (DOMWindowClass self) => EventName self MouseEvent
mouseEnter = EventName "mouseenter"
 
mouseLeave :: (DOMWindowClass self) => EventName self MouseEvent
mouseLeave = EventName "mouseleave"
 
mouseMove :: (DOMWindowClass self) => EventName self MouseEvent
mouseMove = EventName "mousemove"
 
mouseOut :: (DOMWindowClass self) => EventName self MouseEvent
mouseOut = EventName "mouseout"
 
mouseOver :: (DOMWindowClass self) => EventName self MouseEvent
mouseOver = EventName "mouseover"
 
mouseUp :: (DOMWindowClass self) => EventName self MouseEvent
mouseUp = EventName "mouseup"
 
mouseWheel :: (DOMWindowClass self) => EventName self MouseEvent
mouseWheel = EventName "mousewheel"
 
offline :: (DOMWindowClass self) => EventName self Event
offline = EventName "offline"
 
online :: (DOMWindowClass self) => EventName self Event
online = EventName "online"
 
pageHide :: (DOMWindowClass self) => EventName self Event
pageHide = EventName "pagehide"
 
pageShow :: (DOMWindowClass self) => EventName self Event
pageShow = EventName "pageshow"
 
pause :: (DOMWindowClass self) => EventName self Event
pause = EventName "pause"
 
play :: (DOMWindowClass self) => EventName self Event
play = EventName "play"
 
playing :: (DOMWindowClass self) => EventName self Event
playing = EventName "playing"
 
popState :: (DOMWindowClass self) => EventName self Event
popState = EventName "popstate"
 
progress :: (DOMWindowClass self) => EventName self Event
progress = EventName "progress"
 
rateChange :: (DOMWindowClass self) => EventName self Event
rateChange = EventName "ratechange"
 
resize :: (DOMWindowClass self) => EventName self UIEvent
resize = EventName "resize"
 
scrollEvent :: (DOMWindowClass self) => EventName self UIEvent
scrollEvent = EventName "scroll"
 
seeked :: (DOMWindowClass self) => EventName self Event
seeked = EventName "seeked"
 
seeking :: (DOMWindowClass self) => EventName self Event
seeking = EventName "seeking"
 
select :: (DOMWindowClass self) => EventName self UIEvent
select = EventName "select"
 
stalled :: (DOMWindowClass self) => EventName self Event
stalled = EventName "stalled"
 
storage :: (DOMWindowClass self) => EventName self Event
storage = EventName "storage"
 
submit :: (DOMWindowClass self) => EventName self Event
submit = EventName "submit"
 
suspend :: (DOMWindowClass self) => EventName self Event
suspend = EventName "suspend"
 
timeUpdate :: (DOMWindowClass self) => EventName self Event
timeUpdate = EventName "timeupdate"
 
unload :: (DOMWindowClass self) => EventName self UIEvent
unload = EventName "unload"
 
volumeChange :: (DOMWindowClass self) => EventName self Event
volumeChange = EventName "volumechange"
 
waiting :: (DOMWindowClass self) => EventName self Event
waiting = EventName "waiting"
 
wheel :: (DOMWindowClass self) => EventName self WheelEvent
wheel = EventName "wheel"
 
reset :: (DOMWindowClass self) => EventName self Event
reset = EventName "reset"
 
search :: (DOMWindowClass self) => EventName self Event
search = EventName "search"
 
webKitAnimationEnd :: (DOMWindowClass self) => EventName self Event
webKitAnimationEnd = EventName "webkitanimationend"
 
webKitAnimationIteration ::
                         (DOMWindowClass self) => EventName self Event
webKitAnimationIteration = EventName "webkitanimationiteration"
 
webKitAnimationStart ::
                     (DOMWindowClass self) => EventName self Event
webKitAnimationStart = EventName "webkitanimationstart"
 
animationEnd :: (DOMWindowClass self) => EventName self Event
animationEnd = EventName "animationend"
 
animationIteration :: (DOMWindowClass self) => EventName self Event
animationIteration = EventName "animationiteration"
 
animationStart :: (DOMWindowClass self) => EventName self Event
animationStart = EventName "animationstart"
 
webKitTransitionEnd ::
                    (DOMWindowClass self) => EventName self Event
webKitTransitionEnd = EventName "webkittransitionend"
 
transitionEnd :: (DOMWindowClass self) => EventName self Event
transitionEnd = EventName "transitionend"
 
touchStart :: (DOMWindowClass self) => EventName self UIEvent
touchStart = EventName "touchstart"
 
touchMove :: (DOMWindowClass self) => EventName self UIEvent
touchMove = EventName "touchmove"
 
touchEnd :: (DOMWindowClass self) => EventName self UIEvent
touchEnd = EventName "touchend"
 
touchCancel :: (DOMWindowClass self) => EventName self UIEvent
touchCancel = EventName "touchcancel"
 
gestureStart :: (DOMWindowClass self) => EventName self UIEvent
gestureStart = EventName "gesturestart"
 
gestureChange :: (DOMWindowClass self) => EventName self UIEvent
gestureChange = EventName "gesturechange"
 
gestureEnd :: (DOMWindowClass self) => EventName self UIEvent
gestureEnd = EventName "gestureend"
 
deviceMotion :: (DOMWindowClass self) => EventName self Event
deviceMotion = EventName "devicemotion"
 
deviceOrientation :: (DOMWindowClass self) => EventName self Event
deviceOrientation = EventName "deviceorientation"
 
webKitDeviceProximity ::
                      (DOMWindowClass self) => EventName self Event
webKitDeviceProximity = EventName "webkitdeviceproximity"
 
webKitWillRevealBottom ::
                       (DOMWindowClass self) => EventName self Event
webKitWillRevealBottom = EventName "webkitwillrevealbottom"
 
webKitWillRevealLeft ::
                     (DOMWindowClass self) => EventName self Event
webKitWillRevealLeft = EventName "webkitwillrevealleft"
 
webKitWillRevealRight ::
                      (DOMWindowClass self) => EventName self Event
webKitWillRevealRight = EventName "webkitwillrevealright"
 
webKitWillRevealTop ::
                    (DOMWindowClass self) => EventName self Event
webKitWillRevealTop = EventName "webkitwillrevealtop"
