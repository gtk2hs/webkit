module Graphics.UI.Gtk.WebKit.DOM.Window(
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
#if WEBKIT_CHECK_VERSION(2,2,2)
getPerformance,
getCSS,
#endif
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
#if WEBKIT_CHECK_VERSION(2,4,0)
wheel,
#endif
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
Window,
castToWindow,
gTypeWindow,
WindowClass,
toWindow,
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

 
getSelection ::
             (MonadIO m, WindowClass self) => self -> m (Maybe Selection)
getSelection self
  = liftIO
      (maybeNull (makeNewGObject mkSelection)
         ({# call webkit_dom_dom_window_get_selection #} (toWindow self)))
 
blur :: (MonadIO m, WindowClass self) => self -> m ()
blur self
  = liftIO ({# call webkit_dom_dom_window_blur #} (toWindow self))
 
print :: (MonadIO m, WindowClass self) => self -> m ()
print self
  = liftIO ({# call webkit_dom_dom_window_print #} (toWindow self))
 
stop :: (MonadIO m, WindowClass self) => self -> m ()
stop self
  = liftIO ({# call webkit_dom_dom_window_stop #} (toWindow self))
 
alert ::
      (MonadIO m, WindowClass self, GlibString string) =>
        self -> string -> m ()
alert self message
  = liftIO
      (withUTFString message $
         \ messagePtr ->
           {# call webkit_dom_dom_window_alert #} (toWindow self) messagePtr)
 
confirm ::
        (MonadIO m, WindowClass self, GlibString string) =>
          self -> string -> m Bool
confirm self message
  = liftIO
      (toBool <$>
         (withUTFString message $
            \ messagePtr ->
              {# call webkit_dom_dom_window_confirm #} (toWindow self)
                messagePtr))
 
prompt ::
       (MonadIO m, WindowClass self, GlibString string) =>
         self -> string -> (Maybe string) -> m (Maybe string)
prompt self message defaultValue
  = liftIO
      ((maybeWith withUTFString defaultValue $
          \ defaultValuePtr ->
            withUTFString message $
              \ messagePtr ->
                {# call webkit_dom_dom_window_prompt #} (toWindow self) messagePtr
              defaultValuePtr)
         >>=
         maybePeek readUTFString)
 
find ::
     (MonadIO m, WindowClass self, GlibString string) =>
       self ->
         string -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> m Bool
find self string caseSensitive backwards wrap wholeWord
  searchInFrames showDialog
  = liftIO
      (toBool <$>
         (withUTFString string $
            \ stringPtr ->
              {# call webkit_dom_dom_window_find #} (toWindow self) stringPtr
            (fromBool caseSensitive)
            (fromBool backwards)
            (fromBool wrap)
            (fromBool wholeWord)
            (fromBool searchInFrames)
            (fromBool showDialog)))
 
scrollBy ::
         (MonadIO m, WindowClass self) => self -> Int -> Int -> m ()
scrollBy self x y
  = liftIO
      ({# call webkit_dom_dom_window_scroll_by #} (toWindow self)
         (fromIntegral x)
         (fromIntegral y))
 
scrollTo ::
         (MonadIO m, WindowClass self) => self -> Int -> Int -> m ()
scrollTo self x y
  = liftIO
      ({# call webkit_dom_dom_window_scroll_to #} (toWindow self)
         (fromIntegral x)
         (fromIntegral y))
 
scroll ::
       (MonadIO m, WindowClass self) => self -> Int -> Int -> m ()
scroll self x y
  = liftIO
      ({# call webkit_dom_dom_window_scroll #} (toWindow self)
         (fromIntegral x)
         (fromIntegral y))
 
moveBy ::
       (MonadIO m, WindowClass self) => self -> Float -> Float -> m ()
moveBy self x y
  = liftIO
      ({# call webkit_dom_dom_window_move_by #} (toWindow self)
         (realToFrac x)
         (realToFrac y))
 
moveTo ::
       (MonadIO m, WindowClass self) => self -> Float -> Float -> m ()
moveTo self x y
  = liftIO
      ({# call webkit_dom_dom_window_move_to #} (toWindow self)
         (realToFrac x)
         (realToFrac y))
 
resizeBy ::
         (MonadIO m, WindowClass self) => self -> Float -> Float -> m ()
resizeBy self x y
  = liftIO
      ({# call webkit_dom_dom_window_resize_by #} (toWindow self)
         (realToFrac x)
         (realToFrac y))
 
resizeTo ::
         (MonadIO m, WindowClass self) => self -> Float -> Float -> m ()
resizeTo self width height
  = liftIO
      ({# call webkit_dom_dom_window_resize_to #} (toWindow self)
         (realToFrac width)
         (realToFrac height))
 
matchMedia ::
           (MonadIO m, WindowClass self, GlibString string) =>
             self -> string -> m (Maybe MediaQueryList)
matchMedia self query
  = liftIO
      (maybeNull (makeNewGObject mkMediaQueryList)
         (withUTFString query $
            \ queryPtr ->
              {# call webkit_dom_dom_window_match_media #} (toWindow self)
                queryPtr))
 
getComputedStyle ::
                 (MonadIO m, WindowClass self, ElementClass element,
                  GlibString string) =>
                   self ->
                     Maybe element -> (Maybe string) -> m (Maybe CSSStyleDeclaration)
getComputedStyle self element pseudoElement
  = liftIO
      (maybeNull (makeNewGObject mkCSSStyleDeclaration)
         (maybeWith withUTFString pseudoElement $
            \ pseudoElementPtr ->
              {# call webkit_dom_dom_window_get_computed_style #} (toWindow self)
                (maybe (Element nullForeignPtr) toElement element)
                pseudoElementPtr))
 
webkitConvertPointFromPageToNode ::
                                 (MonadIO m, WindowClass self, NodeClass node,
                                  WebKitPointClass p) =>
                                   self -> Maybe node -> Maybe p -> m (Maybe WebKitPoint)
webkitConvertPointFromPageToNode self node p
  = liftIO
      (maybeNull (makeNewGObject mkWebKitPoint)
         ({# call
            webkit_dom_dom_window_webkit_convert_point_from_page_to_node
            #}
            (toWindow self)
            (maybe (Node nullForeignPtr) toNode node)
            (maybe (WebKitPoint nullForeignPtr) toWebKitPoint p)))
 
webkitConvertPointFromNodeToPage ::
                                 (MonadIO m, WindowClass self, NodeClass node,
                                  WebKitPointClass p) =>
                                   self -> Maybe node -> Maybe p -> m (Maybe WebKitPoint)
webkitConvertPointFromNodeToPage self node p
  = liftIO
      (maybeNull (makeNewGObject mkWebKitPoint)
         ({# call
            webkit_dom_dom_window_webkit_convert_point_from_node_to_page
            #}
            (toWindow self)
            (maybe (Node nullForeignPtr) toNode node)
            (maybe (WebKitPoint nullForeignPtr) toWebKitPoint p)))
 
captureEvents :: (MonadIO m, WindowClass self) => self -> m ()
captureEvents self
  = liftIO
      ({# call webkit_dom_dom_window_capture_events #} (toWindow self))
 
releaseEvents :: (MonadIO m, WindowClass self) => self -> m ()
releaseEvents self
  = liftIO
      ({# call webkit_dom_dom_window_release_events #} (toWindow self))
 
getWebkitStorageInfo ::
                     (MonadIO m, WindowClass self) => self -> m (Maybe StorageInfo)
getWebkitStorageInfo self
  = liftIO
      (maybeNull (makeNewGObject mkStorageInfo)
         ({# call webkit_dom_dom_window_get_webkit_storage_info #}
            (toWindow self)))
 
getScreen ::
          (MonadIO m, WindowClass self) => self -> m (Maybe Screen)
getScreen self
  = liftIO
      (maybeNull (makeNewGObject mkScreen)
         ({# call webkit_dom_dom_window_get_screen #} (toWindow self)))
 
getHistory ::
           (MonadIO m, WindowClass self) => self -> m (Maybe History)
getHistory self
  = liftIO
      (maybeNull (makeNewGObject mkHistory)
         ({# call webkit_dom_dom_window_get_history #} (toWindow self)))
 
getLocationbar ::
               (MonadIO m, WindowClass self) => self -> m (Maybe BarProp)
getLocationbar self
  = liftIO
      (maybeNull (makeNewGObject mkBarProp)
         ({# call webkit_dom_dom_window_get_locationbar #} (toWindow self)))
 
getMenubar ::
           (MonadIO m, WindowClass self) => self -> m (Maybe BarProp)
getMenubar self
  = liftIO
      (maybeNull (makeNewGObject mkBarProp)
         ({# call webkit_dom_dom_window_get_menubar #} (toWindow self)))
 
getPersonalbar ::
               (MonadIO m, WindowClass self) => self -> m (Maybe BarProp)
getPersonalbar self
  = liftIO
      (maybeNull (makeNewGObject mkBarProp)
         ({# call webkit_dom_dom_window_get_personalbar #} (toWindow self)))
 
getScrollbars ::
              (MonadIO m, WindowClass self) => self -> m (Maybe BarProp)
getScrollbars self
  = liftIO
      (maybeNull (makeNewGObject mkBarProp)
         ({# call webkit_dom_dom_window_get_scrollbars #} (toWindow self)))
 
getStatusbar ::
             (MonadIO m, WindowClass self) => self -> m (Maybe BarProp)
getStatusbar self
  = liftIO
      (maybeNull (makeNewGObject mkBarProp)
         ({# call webkit_dom_dom_window_get_statusbar #} (toWindow self)))
 
getToolbar ::
           (MonadIO m, WindowClass self) => self -> m (Maybe BarProp)
getToolbar self
  = liftIO
      (maybeNull (makeNewGObject mkBarProp)
         ({# call webkit_dom_dom_window_get_toolbar #} (toWindow self)))
 
getNavigator ::
             (MonadIO m, WindowClass self) => self -> m (Maybe Navigator)
getNavigator self
  = liftIO
      (maybeNull (makeNewGObject mkNavigator)
         ({# call webkit_dom_dom_window_get_navigator #} (toWindow self)))
 
getClientInformation ::
                     (MonadIO m, WindowClass self) => self -> m (Maybe Navigator)
getClientInformation self
  = liftIO
      (maybeNull (makeNewGObject mkNavigator)
         ({# call webkit_dom_dom_window_get_client_information #}
            (toWindow self)))
 
getFrameElement ::
                (MonadIO m, WindowClass self) => self -> m (Maybe Element)
getFrameElement self
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         ({# call webkit_dom_dom_window_get_frame_element #}
            (toWindow self)))
 
getOffscreenBuffering ::
                      (MonadIO m, WindowClass self) => self -> m Bool
getOffscreenBuffering self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_dom_window_get_offscreen_buffering #}
            (toWindow self)))
 
getOuterHeight :: (MonadIO m, WindowClass self) => self -> m Int
getOuterHeight self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_outer_height #}
            (toWindow self)))
 
getOuterWidth :: (MonadIO m, WindowClass self) => self -> m Int
getOuterWidth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_outer_width #} (toWindow self)))
 
getInnerHeight :: (MonadIO m, WindowClass self) => self -> m Int
getInnerHeight self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_inner_height #}
            (toWindow self)))
 
getInnerWidth :: (MonadIO m, WindowClass self) => self -> m Int
getInnerWidth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_inner_width #} (toWindow self)))
 
getScreenX :: (MonadIO m, WindowClass self) => self -> m Int
getScreenX self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_screen_x #} (toWindow self)))
 
getScreenY :: (MonadIO m, WindowClass self) => self -> m Int
getScreenY self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_screen_y #} (toWindow self)))
 
getScreenLeft :: (MonadIO m, WindowClass self) => self -> m Int
getScreenLeft self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_screen_left #} (toWindow self)))
 
getScreenTop :: (MonadIO m, WindowClass self) => self -> m Int
getScreenTop self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_screen_top #} (toWindow self)))
 
getScrollX :: (MonadIO m, WindowClass self) => self -> m Int
getScrollX self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_scroll_x #} (toWindow self)))
 
getScrollY :: (MonadIO m, WindowClass self) => self -> m Int
getScrollY self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_scroll_y #} (toWindow self)))
 
getPageXOffset :: (MonadIO m, WindowClass self) => self -> m Int
getPageXOffset self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_page_x_offset #}
            (toWindow self)))
 
getPageYOffset :: (MonadIO m, WindowClass self) => self -> m Int
getPageYOffset self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_page_y_offset #}
            (toWindow self)))
 
getClosed :: (MonadIO m, WindowClass self) => self -> m Bool
getClosed self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_dom_window_get_closed #} (toWindow self)))
 
getLength :: (MonadIO m, WindowClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_window_get_length #} (toWindow self)))
 
setName ::
        (MonadIO m, WindowClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_dom_window_set_name #} (toWindow self) valPtr)
 
getName ::
        (MonadIO m, WindowClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_dom_window_get_name #} (toWindow self)) >>=
         readUTFString)
 
setStatus ::
          (MonadIO m, WindowClass self, GlibString string) =>
            self -> string -> m ()
setStatus self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_dom_window_set_status #} (toWindow self) valPtr)
 
getStatus ::
          (MonadIO m, WindowClass self, GlibString string) =>
            self -> m string
getStatus self
  = liftIO
      (({# call webkit_dom_dom_window_get_status #} (toWindow self)) >>=
         readUTFString)
 
setDefaultStatus ::
                 (MonadIO m, WindowClass self, GlibString string) =>
                   self -> string -> m ()
setDefaultStatus self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_dom_window_set_default_status #} (toWindow self)
             valPtr)
 
getDefaultStatus ::
                 (MonadIO m, WindowClass self, GlibString string) =>
                   self -> m string
getDefaultStatus self
  = liftIO
      (({# call webkit_dom_dom_window_get_default_status #}
          (toWindow self))
         >>=
         readUTFString)
 
getSelf ::
        (MonadIO m, WindowClass self) => self -> m (Maybe Window)
getSelf self
  = liftIO
      (maybeNull (makeNewGObject mkWindow)
         ({# call webkit_dom_dom_window_get_self #} (toWindow self)))
 
getWindow ::
          (MonadIO m, WindowClass self) => self -> m (Maybe Window)
getWindow self
  = liftIO
      (maybeNull (makeNewGObject mkWindow)
         ({# call webkit_dom_dom_window_get_window #} (toWindow self)))
 
getFrames ::
          (MonadIO m, WindowClass self) => self -> m (Maybe Window)
getFrames self
  = liftIO
      (maybeNull (makeNewGObject mkWindow)
         ({# call webkit_dom_dom_window_get_frames #} (toWindow self)))
 
getOpener ::
          (MonadIO m, WindowClass self) => self -> m (Maybe Window)
getOpener self
  = liftIO
      (maybeNull (makeNewGObject mkWindow)
         ({# call webkit_dom_dom_window_get_opener #} (toWindow self)))
 
getParent ::
          (MonadIO m, WindowClass self) => self -> m (Maybe Window)
getParent self
  = liftIO
      (maybeNull (makeNewGObject mkWindow)
         ({# call webkit_dom_dom_window_get_parent #} (toWindow self)))
 
getTop :: (MonadIO m, WindowClass self) => self -> m (Maybe Window)
getTop self
  = liftIO
      (maybeNull (makeNewGObject mkWindow)
         ({# call webkit_dom_dom_window_get_top #} (toWindow self)))
 
getDocument ::
            (MonadIO m, WindowClass self) => self -> m (Maybe Document)
getDocument self
  = liftIO
      (maybeNull (makeNewGObject mkDocument)
         ({# call webkit_dom_dom_window_get_document #} (toWindow self)))
 
getStyleMedia ::
              (MonadIO m, WindowClass self) => self -> m (Maybe StyleMedia)
getStyleMedia self
  = liftIO
      (maybeNull (makeNewGObject mkStyleMedia)
         ({# call webkit_dom_dom_window_get_style_media #} (toWindow self)))
 
getDevicePixelRatio ::
                    (MonadIO m, WindowClass self) => self -> m Double
getDevicePixelRatio self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_dom_window_get_device_pixel_ratio #}
            (toWindow self)))
 
getApplicationCache ::
                    (MonadIO m, WindowClass self) => self -> m (Maybe ApplicationCache)
getApplicationCache self
  = liftIO
      (maybeNull (makeNewGObject mkApplicationCache)
         ({# call webkit_dom_dom_window_get_application_cache #}
            (toWindow self)))
 
getSessionStorage ::
                  (MonadIO m, WindowClass self) => self -> m (Maybe Storage)
getSessionStorage self
  = liftIO
      (maybeNull (makeNewGObject mkStorage)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_dom_window_get_session_storage #}
                (toWindow self)
                errorPtr_))
 
getLocalStorage ::
                (MonadIO m, WindowClass self) => self -> m (Maybe Storage)
getLocalStorage self
  = liftIO
      (maybeNull (makeNewGObject mkStorage)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_dom_window_get_local_storage #} (toWindow self)
                errorPtr_))

#if WEBKIT_CHECK_VERSION(2,2,2) 
getPerformance ::
               (MonadIO m, WindowClass self) => self -> m (Maybe Performance)
getPerformance self
  = liftIO
      (maybeNull (makeNewGObject mkPerformance)
         ({# call webkit_dom_dom_window_get_performance #} (toWindow self)))
 
getCSS :: (MonadIO m, WindowClass self) => self -> m (Maybe CSS)
getCSS self
  = liftIO
      (maybeNull (makeNewGObject mkCSS)
         ({# call webkit_dom_dom_window_get_css #} (toWindow self)))
#endif
 
abort :: (WindowClass self) => EventName self UIEvent
abort = EventName "abort"
 
beforeUnload :: (WindowClass self) => EventName self Event
beforeUnload = EventName "beforeunload"
 
blurEvent :: (WindowClass self) => EventName self UIEvent
blurEvent = EventName "blur"
 
canPlay :: (WindowClass self) => EventName self Event
canPlay = EventName "canplay"
 
canPlayThrough :: (WindowClass self) => EventName self Event
canPlayThrough = EventName "canplaythrough"
 
change :: (WindowClass self) => EventName self Event
change = EventName "change"
 
click :: (WindowClass self) => EventName self MouseEvent
click = EventName "click"
 
contextMenu :: (WindowClass self) => EventName self MouseEvent
contextMenu = EventName "contextmenu"
 
dblClick :: (WindowClass self) => EventName self MouseEvent
dblClick = EventName "dblclick"
 
drag :: (WindowClass self) => EventName self MouseEvent
drag = EventName "drag"
 
dragEnd :: (WindowClass self) => EventName self MouseEvent
dragEnd = EventName "dragend"
 
dragEnter :: (WindowClass self) => EventName self MouseEvent
dragEnter = EventName "dragenter"
 
dragLeave :: (WindowClass self) => EventName self MouseEvent
dragLeave = EventName "dragleave"
 
dragOver :: (WindowClass self) => EventName self MouseEvent
dragOver = EventName "dragover"
 
dragStart :: (WindowClass self) => EventName self MouseEvent
dragStart = EventName "dragstart"
 
drop :: (WindowClass self) => EventName self MouseEvent
drop = EventName "drop"
 
durationChange :: (WindowClass self) => EventName self Event
durationChange = EventName "durationchange"
 
emptied :: (WindowClass self) => EventName self Event
emptied = EventName "emptied"
 
ended :: (WindowClass self) => EventName self Event
ended = EventName "ended"
 
error :: (WindowClass self) => EventName self UIEvent
error = EventName "error"
 
focusEvent :: (WindowClass self) => EventName self UIEvent
focusEvent = EventName "focus"
 
hashChange :: (WindowClass self) => EventName self Event
hashChange = EventName "hashchange"
 
input :: (WindowClass self) => EventName self Event
input = EventName "input"
 
invalid :: (WindowClass self) => EventName self Event
invalid = EventName "invalid"
 
keyDown :: (WindowClass self) => EventName self KeyboardEvent
keyDown = EventName "keydown"
 
keyPress :: (WindowClass self) => EventName self KeyboardEvent
keyPress = EventName "keypress"
 
keyUp :: (WindowClass self) => EventName self KeyboardEvent
keyUp = EventName "keyup"
 
load :: (WindowClass self) => EventName self UIEvent
load = EventName "load"
 
loadedData :: (WindowClass self) => EventName self Event
loadedData = EventName "loadeddata"
 
loadedMetadata :: (WindowClass self) => EventName self Event
loadedMetadata = EventName "loadedmetadata"
 
loadStart :: (WindowClass self) => EventName self Event
loadStart = EventName "loadstart"
 
message :: (WindowClass self) => EventName self Event
message = EventName "message"
 
mouseDown :: (WindowClass self) => EventName self MouseEvent
mouseDown = EventName "mousedown"
 
mouseEnter :: (WindowClass self) => EventName self MouseEvent
mouseEnter = EventName "mouseenter"
 
mouseLeave :: (WindowClass self) => EventName self MouseEvent
mouseLeave = EventName "mouseleave"
 
mouseMove :: (WindowClass self) => EventName self MouseEvent
mouseMove = EventName "mousemove"
 
mouseOut :: (WindowClass self) => EventName self MouseEvent
mouseOut = EventName "mouseout"
 
mouseOver :: (WindowClass self) => EventName self MouseEvent
mouseOver = EventName "mouseover"
 
mouseUp :: (WindowClass self) => EventName self MouseEvent
mouseUp = EventName "mouseup"
 
mouseWheel :: (WindowClass self) => EventName self MouseEvent
mouseWheel = EventName "mousewheel"
 
offline :: (WindowClass self) => EventName self Event
offline = EventName "offline"
 
online :: (WindowClass self) => EventName self Event
online = EventName "online"
 
pageHide :: (WindowClass self) => EventName self Event
pageHide = EventName "pagehide"
 
pageShow :: (WindowClass self) => EventName self Event
pageShow = EventName "pageshow"
 
pause :: (WindowClass self) => EventName self Event
pause = EventName "pause"
 
play :: (WindowClass self) => EventName self Event
play = EventName "play"
 
playing :: (WindowClass self) => EventName self Event
playing = EventName "playing"
 
popState :: (WindowClass self) => EventName self Event
popState = EventName "popstate"
 
progress :: (WindowClass self) => EventName self Event
progress = EventName "progress"
 
rateChange :: (WindowClass self) => EventName self Event
rateChange = EventName "ratechange"
 
resize :: (WindowClass self) => EventName self UIEvent
resize = EventName "resize"
 
scrollEvent :: (WindowClass self) => EventName self UIEvent
scrollEvent = EventName "scroll"
 
seeked :: (WindowClass self) => EventName self Event
seeked = EventName "seeked"
 
seeking :: (WindowClass self) => EventName self Event
seeking = EventName "seeking"
 
select :: (WindowClass self) => EventName self UIEvent
select = EventName "select"
 
stalled :: (WindowClass self) => EventName self Event
stalled = EventName "stalled"
 
storage :: (WindowClass self) => EventName self Event
storage = EventName "storage"
 
submit :: (WindowClass self) => EventName self Event
submit = EventName "submit"
 
suspend :: (WindowClass self) => EventName self Event
suspend = EventName "suspend"
 
timeUpdate :: (WindowClass self) => EventName self Event
timeUpdate = EventName "timeupdate"
 
unload :: (WindowClass self) => EventName self UIEvent
unload = EventName "unload"
 
volumeChange :: (WindowClass self) => EventName self Event
volumeChange = EventName "volumechange"
 
waiting :: (WindowClass self) => EventName self Event
waiting = EventName "waiting"

#if WEBKIT_CHECK_VERSION(2,4,0) 
wheel :: (WindowClass self) => EventName self WheelEvent
wheel = EventName "wheel"
#endif
 
reset :: (WindowClass self) => EventName self Event
reset = EventName "reset"
 
search :: (WindowClass self) => EventName self Event
search = EventName "search"
 
webKitAnimationEnd :: (WindowClass self) => EventName self Event
webKitAnimationEnd = EventName "webkitanimationend"
 
webKitAnimationIteration ::
                         (WindowClass self) => EventName self Event
webKitAnimationIteration = EventName "webkitanimationiteration"
 
webKitAnimationStart :: (WindowClass self) => EventName self Event
webKitAnimationStart = EventName "webkitanimationstart"
 
animationEnd :: (WindowClass self) => EventName self Event
animationEnd = EventName "animationend"
 
animationIteration :: (WindowClass self) => EventName self Event
animationIteration = EventName "animationiteration"
 
animationStart :: (WindowClass self) => EventName self Event
animationStart = EventName "animationstart"
 
webKitTransitionEnd :: (WindowClass self) => EventName self Event
webKitTransitionEnd = EventName "webkittransitionend"
 
transitionEnd :: (WindowClass self) => EventName self Event
transitionEnd = EventName "transitionend"
 
touchStart :: (WindowClass self) => EventName self UIEvent
touchStart = EventName "touchstart"
 
touchMove :: (WindowClass self) => EventName self UIEvent
touchMove = EventName "touchmove"
 
touchEnd :: (WindowClass self) => EventName self UIEvent
touchEnd = EventName "touchend"
 
touchCancel :: (WindowClass self) => EventName self UIEvent
touchCancel = EventName "touchcancel"
 
gestureStart :: (WindowClass self) => EventName self UIEvent
gestureStart = EventName "gesturestart"
 
gestureChange :: (WindowClass self) => EventName self UIEvent
gestureChange = EventName "gesturechange"
 
gestureEnd :: (WindowClass self) => EventName self UIEvent
gestureEnd = EventName "gestureend"
 
deviceMotion :: (WindowClass self) => EventName self Event
deviceMotion = EventName "devicemotion"
 
deviceOrientation :: (WindowClass self) => EventName self Event
deviceOrientation = EventName "deviceorientation"
 
webKitDeviceProximity :: (WindowClass self) => EventName self Event
webKitDeviceProximity = EventName "webkitdeviceproximity"
 
webKitWillRevealBottom ::
                       (WindowClass self) => EventName self Event
webKitWillRevealBottom = EventName "webkitwillrevealbottom"
 
webKitWillRevealLeft :: (WindowClass self) => EventName self Event
webKitWillRevealLeft = EventName "webkitwillrevealleft"
 
webKitWillRevealRight :: (WindowClass self) => EventName self Event
webKitWillRevealRight = EventName "webkitwillrevealright"
 
webKitWillRevealTop :: (WindowClass self) => EventName self Event
webKitWillRevealTop = EventName "webkitwillrevealtop"
