module Graphics.UI.Gtk.WebKit.DOM.DOMWindow
       (domWindowGetSelection, domWindowFocus, domWindowBlur,
        domWindowPrint, domWindowStop, domWindowAlert, domWindowConfirm,
        domWindowPrompt, domWindowFind, domWindowScrollBy,
        domWindowScrollTo, domWindowScroll, domWindowMoveBy,
        domWindowMoveTo, domWindowResizeBy, domWindowResizeTo,
        domWindowMatchMedia, domWindowGetComputedStyle,
        domWindowWebkitConvertPointFromPageToNode,
        domWindowWebkitConvertPointFromNodeToPage, domWindowClearTimeout,
        domWindowClearInterval, domWindowAtob, domWindowBtoa,
        domWindowDispatchEvent, domWindowCaptureEvents,
        domWindowReleaseEvents, domWindowGetScreen, domWindowGetHistory,
        domWindowGetLocationbar, domWindowGetMenubar,
        domWindowGetPersonalbar, domWindowGetScrollbars,
        domWindowGetStatusbar, domWindowGetToolbar, domWindowGetNavigator,
        domWindowGetClientInformation, domWindowGetFrameElement,
        domWindowGetOffscreenBuffering, domWindowGetOuterHeight,
        domWindowGetOuterWidth, domWindowGetInnerHeight,
        domWindowGetInnerWidth, domWindowGetScreenX, domWindowGetScreenY,
        domWindowGetScreenLeft, domWindowGetScreenTop, domWindowGetScrollX,
        domWindowGetScrollY, domWindowGetPageXOffset,
        domWindowGetPageYOffset, domWindowGetClosed, domWindowGetLength,
        domWindowSetName, domWindowGetName, domWindowSetStatus,
        domWindowGetStatus, domWindowSetDefaultStatus,
        domWindowGetDefaultStatus, domWindowGetSelf, domWindowGetWindow,
        domWindowGetFrames, domWindowGetOpener, domWindowGetParent,
        domWindowGetTop, domWindowGetDocument, domWindowGetStyleMedia,
        domWindowGetDevicePixelRatio, domWindowGetApplicationCache,
        domWindowGetSessionStorage, domWindowGetLocalStorage,
        domWindowGetConsole, domWindowOnabort, domWindowOnbeforeunload,
        domWindowOnblur, domWindowOncanplay, domWindowOncanplaythrough,
        domWindowOnchange, domWindowOnclick, domWindowOncontextmenu,
        domWindowOndblclick, domWindowOndrag, domWindowOndragend,
        domWindowOndragenter, domWindowOndragleave, domWindowOndragover,
        domWindowOndragstart, domWindowOndrop, domWindowOndurationchange,
        domWindowOnemptied, domWindowOnended, domWindowOnerror,
        domWindowOnfocus, domWindowOnhashchange, domWindowOninput,
        domWindowOninvalid, domWindowOnkeydown, domWindowOnkeypress,
        domWindowOnkeyup, domWindowOnload, domWindowOnloadeddata,
        domWindowOnloadedmetadata, domWindowOnloadstart,
        domWindowOnmessage, domWindowOnmousedown, domWindowOnmousemove,
        domWindowOnmouseout, domWindowOnmouseover, domWindowOnmouseup,
        domWindowOnmousewheel, domWindowOnoffline, domWindowOnonline,
        domWindowOnpagehide, domWindowOnpageshow, domWindowOnpause,
        domWindowOnplay, domWindowOnplaying, domWindowOnpopstate,
        domWindowOnprogress, domWindowOnratechange, domWindowOnresize,
        domWindowOnscroll, domWindowOnseeked, domWindowOnseeking,
        domWindowOnselect, domWindowOnstalled, domWindowOnstorage,
        domWindowOnsubmit, domWindowOnsuspend, domWindowOntimeupdate,
        domWindowOnunload, domWindowOnvolumechange, domWindowOnwaiting,
        domWindowOnreset, domWindowOnsearch, domWindowOnwebkitanimationend,
        domWindowOnwebkitanimationiteration,
        domWindowOnwebkitanimationstart, domWindowOnwebkittransitionend,
        domWindowOntouchstart, domWindowOntouchmove, domWindowOntouchend,
        domWindowOntouchcancel, domWindowOndevicemotion,
        domWindowOndeviceorientation)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
domWindowGetSelection ::
                      (DOMWindowClass self) => self -> IO (Maybe DOMSelection)
domWindowGetSelection self
  = maybeNull (makeNewGObject mkDOMSelection)
      ({# call webkit_dom_dom_window_get_selection #} (toDOMWindow self))
 
domWindowFocus :: (DOMWindowClass self) => self -> IO ()
domWindowFocus self
  = {# call webkit_dom_dom_window_focus #} (toDOMWindow self)
 
domWindowBlur :: (DOMWindowClass self) => self -> IO ()
domWindowBlur self
  = {# call webkit_dom_dom_window_blur #} (toDOMWindow self)
 
domWindowPrint :: (DOMWindowClass self) => self -> IO ()
domWindowPrint self
  = {# call webkit_dom_dom_window_print #} (toDOMWindow self)
 
domWindowStop :: (DOMWindowClass self) => self -> IO ()
domWindowStop self
  = {# call webkit_dom_dom_window_stop #} (toDOMWindow self)
 
domWindowAlert :: (DOMWindowClass self) => self -> String -> IO ()
domWindowAlert self message
  = withUTFString message $
      \ messagePtr ->
        {# call webkit_dom_dom_window_alert #} (toDOMWindow self)
          messagePtr
 
domWindowConfirm ::
                 (DOMWindowClass self) => self -> String -> IO Bool
domWindowConfirm self message
  = toBool <$>
      (withUTFString message $
         \ messagePtr ->
           {# call webkit_dom_dom_window_confirm #} (toDOMWindow self)
             messagePtr)
 
domWindowPrompt ::
                (DOMWindowClass self) => self -> String -> String -> IO String
domWindowPrompt self message defaultValue
  = (withUTFString defaultValue $
       \ defaultValuePtr ->
         withUTFString message $
           \ messagePtr ->
             {# call webkit_dom_dom_window_prompt #} (toDOMWindow self)
               messagePtr
           defaultValuePtr)
      >>=
      readUTFString
 
domWindowFind ::
              (DOMWindowClass self) =>
                self ->
                  String -> Bool -> Bool -> Bool -> Bool -> Bool -> Bool -> IO Bool
domWindowFind self string caseSensitive backwards wrap wholeWord
  searchInFrames showDialog
  = toBool <$>
      (withUTFString string $
         \ stringPtr ->
           {# call webkit_dom_dom_window_find #} (toDOMWindow self) stringPtr
         (fromBool caseSensitive)
         (fromBool backwards)
         (fromBool wrap)
         (fromBool wholeWord)
         (fromBool searchInFrames)
         (fromBool showDialog))
 
domWindowScrollBy ::
                  (DOMWindowClass self) => self -> Int -> Int -> IO ()
domWindowScrollBy self x y
  = {# call webkit_dom_dom_window_scroll_by #} (toDOMWindow self)
      (fromIntegral x)
      (fromIntegral y)
 
domWindowScrollTo ::
                  (DOMWindowClass self) => self -> Int -> Int -> IO ()
domWindowScrollTo self x y
  = {# call webkit_dom_dom_window_scroll_to #} (toDOMWindow self)
      (fromIntegral x)
      (fromIntegral y)
 
domWindowScroll ::
                (DOMWindowClass self) => self -> Int -> Int -> IO ()
domWindowScroll self x y
  = {# call webkit_dom_dom_window_scroll #} (toDOMWindow self)
      (fromIntegral x)
      (fromIntegral y)
 
domWindowMoveBy ::
                (DOMWindowClass self) => self -> Float -> Float -> IO ()
domWindowMoveBy self x y
  = {# call webkit_dom_dom_window_move_by #} (toDOMWindow self)
      (realToFrac x)
      (realToFrac y)
 
domWindowMoveTo ::
                (DOMWindowClass self) => self -> Float -> Float -> IO ()
domWindowMoveTo self x y
  = {# call webkit_dom_dom_window_move_to #} (toDOMWindow self)
      (realToFrac x)
      (realToFrac y)
 
domWindowResizeBy ::
                  (DOMWindowClass self) => self -> Float -> Float -> IO ()
domWindowResizeBy self x y
  = {# call webkit_dom_dom_window_resize_by #} (toDOMWindow self)
      (realToFrac x)
      (realToFrac y)
 
domWindowResizeTo ::
                  (DOMWindowClass self) => self -> Float -> Float -> IO ()
domWindowResizeTo self width height
  = {# call webkit_dom_dom_window_resize_to #} (toDOMWindow self)
      (realToFrac width)
      (realToFrac height)
 
domWindowMatchMedia ::
                    (DOMWindowClass self) =>
                      self -> String -> IO (Maybe MediaQueryList)
domWindowMatchMedia self query
  = maybeNull (makeNewGObject mkMediaQueryList)
      (withUTFString query $
         \ queryPtr ->
           {# call webkit_dom_dom_window_match_media #} (toDOMWindow self)
             queryPtr)
 
domWindowGetComputedStyle ::
                          (DOMWindowClass self, ElementClass element) =>
                            self -> Maybe element -> String -> IO (Maybe CSSStyleDeclaration)
domWindowGetComputedStyle self element pseudoElement
  = maybeNull (makeNewGObject mkCSSStyleDeclaration)
      (withUTFString pseudoElement $
         \ pseudoElementPtr ->
           {# call webkit_dom_dom_window_get_computed_style #}
             (toDOMWindow self)
             (maybe (Element nullForeignPtr) toElement element)
             pseudoElementPtr)
 
domWindowWebkitConvertPointFromPageToNode ::
                                          (DOMWindowClass self, NodeClass node,
                                           WebKitPointClass p) =>
                                            self -> Maybe node -> Maybe p -> IO (Maybe WebKitPoint)
domWindowWebkitConvertPointFromPageToNode self node p
  = maybeNull (makeNewGObject mkWebKitPoint)
      ({# call
         webkit_dom_dom_window_webkit_convert_point_from_page_to_node
         #}
         (toDOMWindow self)
         (maybe (Node nullForeignPtr) toNode node)
         (maybe (WebKitPoint nullForeignPtr) toWebKitPoint p))
 
domWindowWebkitConvertPointFromNodeToPage ::
                                          (DOMWindowClass self, NodeClass node,
                                           WebKitPointClass p) =>
                                            self -> Maybe node -> Maybe p -> IO (Maybe WebKitPoint)
domWindowWebkitConvertPointFromNodeToPage self node p
  = maybeNull (makeNewGObject mkWebKitPoint)
      ({# call
         webkit_dom_dom_window_webkit_convert_point_from_node_to_page
         #}
         (toDOMWindow self)
         (maybe (Node nullForeignPtr) toNode node)
         (maybe (WebKitPoint nullForeignPtr) toWebKitPoint p))
 
domWindowClearTimeout ::
                      (DOMWindowClass self) => self -> Int -> IO ()
domWindowClearTimeout self handle
  = {# call webkit_dom_dom_window_clear_timeout #} (toDOMWindow self)
      (fromIntegral handle)
 
domWindowClearInterval ::
                       (DOMWindowClass self) => self -> Int -> IO ()
domWindowClearInterval self handle
  = {# call webkit_dom_dom_window_clear_interval #}
      (toDOMWindow self)
      (fromIntegral handle)
 
domWindowAtob ::
              (DOMWindowClass self) => self -> String -> IO String
domWindowAtob self string
  = (propagateGError $
       \ errorPtr_ ->
         withUTFString string $
           \ stringPtr ->
             {# call webkit_dom_dom_window_atob #} (toDOMWindow self) stringPtr
           errorPtr_)
      >>=
      readUTFString
 
domWindowBtoa ::
              (DOMWindowClass self) => self -> String -> IO String
domWindowBtoa self string
  = (propagateGError $
       \ errorPtr_ ->
         withUTFString string $
           \ stringPtr ->
             {# call webkit_dom_dom_window_btoa #} (toDOMWindow self) stringPtr
           errorPtr_)
      >>=
      readUTFString
 
domWindowDispatchEvent ::
                       (DOMWindowClass self, EventClass evt) =>
                         self -> Maybe evt -> IO Bool
domWindowDispatchEvent self evt
  = toBool <$>
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_window_dispatch_event #} (toDOMWindow self)
             (maybe (Event nullForeignPtr) toEvent evt)
             errorPtr_)
 
domWindowCaptureEvents :: (DOMWindowClass self) => self -> IO ()
domWindowCaptureEvents self
  = {# call webkit_dom_dom_window_capture_events #}
      (toDOMWindow self)
 
domWindowReleaseEvents :: (DOMWindowClass self) => self -> IO ()
domWindowReleaseEvents self
  = {# call webkit_dom_dom_window_release_events #}
      (toDOMWindow self)
 
domWindowGetScreen ::
                   (DOMWindowClass self) => self -> IO (Maybe DOMScreen)
domWindowGetScreen self
  = maybeNull (makeNewGObject mkDOMScreen)
      ({# call webkit_dom_dom_window_get_screen #} (toDOMWindow self))
 
domWindowGetHistory ::
                    (DOMWindowClass self) => self -> IO (Maybe History)
domWindowGetHistory self
  = maybeNull (makeNewGObject mkHistory)
      ({# call webkit_dom_dom_window_get_history #} (toDOMWindow self))
 
domWindowGetLocationbar ::
                        (DOMWindowClass self) => self -> IO (Maybe BarInfo)
domWindowGetLocationbar self
  = maybeNull (makeNewGObject mkBarInfo)
      ({# call webkit_dom_dom_window_get_locationbar #}
         (toDOMWindow self))
 
domWindowGetMenubar ::
                    (DOMWindowClass self) => self -> IO (Maybe BarInfo)
domWindowGetMenubar self
  = maybeNull (makeNewGObject mkBarInfo)
      ({# call webkit_dom_dom_window_get_menubar #} (toDOMWindow self))
 
domWindowGetPersonalbar ::
                        (DOMWindowClass self) => self -> IO (Maybe BarInfo)
domWindowGetPersonalbar self
  = maybeNull (makeNewGObject mkBarInfo)
      ({# call webkit_dom_dom_window_get_personalbar #}
         (toDOMWindow self))
 
domWindowGetScrollbars ::
                       (DOMWindowClass self) => self -> IO (Maybe BarInfo)
domWindowGetScrollbars self
  = maybeNull (makeNewGObject mkBarInfo)
      ({# call webkit_dom_dom_window_get_scrollbars #}
         (toDOMWindow self))
 
domWindowGetStatusbar ::
                      (DOMWindowClass self) => self -> IO (Maybe BarInfo)
domWindowGetStatusbar self
  = maybeNull (makeNewGObject mkBarInfo)
      ({# call webkit_dom_dom_window_get_statusbar #} (toDOMWindow self))
 
domWindowGetToolbar ::
                    (DOMWindowClass self) => self -> IO (Maybe BarInfo)
domWindowGetToolbar self
  = maybeNull (makeNewGObject mkBarInfo)
      ({# call webkit_dom_dom_window_get_toolbar #} (toDOMWindow self))
 
domWindowGetNavigator ::
                      (DOMWindowClass self) => self -> IO (Maybe Navigator)
domWindowGetNavigator self
  = maybeNull (makeNewGObject mkNavigator)
      ({# call webkit_dom_dom_window_get_navigator #} (toDOMWindow self))
 
domWindowGetClientInformation ::
                              (DOMWindowClass self) => self -> IO (Maybe Navigator)
domWindowGetClientInformation self
  = maybeNull (makeNewGObject mkNavigator)
      ({# call webkit_dom_dom_window_get_client_information #}
         (toDOMWindow self))
 
domWindowGetFrameElement ::
                         (DOMWindowClass self) => self -> IO (Maybe Element)
domWindowGetFrameElement self
  = maybeNull (makeNewGObject mkElement)
      ({# call webkit_dom_dom_window_get_frame_element #}
         (toDOMWindow self))
 
domWindowGetOffscreenBuffering ::
                               (DOMWindowClass self) => self -> IO Bool
domWindowGetOffscreenBuffering self
  = toBool <$>
      ({# call webkit_dom_dom_window_get_offscreen_buffering #}
         (toDOMWindow self))
 
domWindowGetOuterHeight :: (DOMWindowClass self) => self -> IO Int
domWindowGetOuterHeight self
  = fromIntegral <$>
      ({# call webkit_dom_dom_window_get_outer_height #}
         (toDOMWindow self))
 
domWindowGetOuterWidth :: (DOMWindowClass self) => self -> IO Int
domWindowGetOuterWidth self
  = fromIntegral <$>
      ({# call webkit_dom_dom_window_get_outer_width #}
         (toDOMWindow self))
 
domWindowGetInnerHeight :: (DOMWindowClass self) => self -> IO Int
domWindowGetInnerHeight self
  = fromIntegral <$>
      ({# call webkit_dom_dom_window_get_inner_height #}
         (toDOMWindow self))
 
domWindowGetInnerWidth :: (DOMWindowClass self) => self -> IO Int
domWindowGetInnerWidth self
  = fromIntegral <$>
      ({# call webkit_dom_dom_window_get_inner_width #}
         (toDOMWindow self))
 
domWindowGetScreenX :: (DOMWindowClass self) => self -> IO Int
domWindowGetScreenX self
  = fromIntegral <$>
      ({# call webkit_dom_dom_window_get_screen_x #} (toDOMWindow self))
 
domWindowGetScreenY :: (DOMWindowClass self) => self -> IO Int
domWindowGetScreenY self
  = fromIntegral <$>
      ({# call webkit_dom_dom_window_get_screen_y #} (toDOMWindow self))
 
domWindowGetScreenLeft :: (DOMWindowClass self) => self -> IO Int
domWindowGetScreenLeft self
  = fromIntegral <$>
      ({# call webkit_dom_dom_window_get_screen_left #}
         (toDOMWindow self))
 
domWindowGetScreenTop :: (DOMWindowClass self) => self -> IO Int
domWindowGetScreenTop self
  = fromIntegral <$>
      ({# call webkit_dom_dom_window_get_screen_top #}
         (toDOMWindow self))
 
domWindowGetScrollX :: (DOMWindowClass self) => self -> IO Int
domWindowGetScrollX self
  = fromIntegral <$>
      ({# call webkit_dom_dom_window_get_scroll_x #} (toDOMWindow self))
 
domWindowGetScrollY :: (DOMWindowClass self) => self -> IO Int
domWindowGetScrollY self
  = fromIntegral <$>
      ({# call webkit_dom_dom_window_get_scroll_y #} (toDOMWindow self))
 
domWindowGetPageXOffset :: (DOMWindowClass self) => self -> IO Int
domWindowGetPageXOffset self
  = fromIntegral <$>
      ({# call webkit_dom_dom_window_get_page_x_offset #}
         (toDOMWindow self))
 
domWindowGetPageYOffset :: (DOMWindowClass self) => self -> IO Int
domWindowGetPageYOffset self
  = fromIntegral <$>
      ({# call webkit_dom_dom_window_get_page_y_offset #}
         (toDOMWindow self))
 
domWindowGetClosed :: (DOMWindowClass self) => self -> IO Bool
domWindowGetClosed self
  = toBool <$>
      ({# call webkit_dom_dom_window_get_closed #} (toDOMWindow self))
 
domWindowGetLength :: (DOMWindowClass self) => self -> IO Word
domWindowGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_dom_window_get_length #} (toDOMWindow self))
 
domWindowSetName ::
                 (DOMWindowClass self) => self -> String -> IO ()
domWindowSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_dom_window_set_name #} (toDOMWindow self) valPtr
 
domWindowGetName :: (DOMWindowClass self) => self -> IO String
domWindowGetName self
  = ({# call webkit_dom_dom_window_get_name #} (toDOMWindow self))
      >>=
      readUTFString
 
domWindowSetStatus ::
                   (DOMWindowClass self) => self -> String -> IO ()
domWindowSetStatus self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_dom_window_set_status #} (toDOMWindow self)
          valPtr
 
domWindowGetStatus :: (DOMWindowClass self) => self -> IO String
domWindowGetStatus self
  = ({# call webkit_dom_dom_window_get_status #} (toDOMWindow self))
      >>=
      readUTFString
 
domWindowSetDefaultStatus ::
                          (DOMWindowClass self) => self -> String -> IO ()
domWindowSetDefaultStatus self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_dom_window_set_default_status #}
          (toDOMWindow self)
          valPtr
 
domWindowGetDefaultStatus ::
                          (DOMWindowClass self) => self -> IO String
domWindowGetDefaultStatus self
  = ({# call webkit_dom_dom_window_get_default_status #}
       (toDOMWindow self))
      >>=
      readUTFString
 
domWindowGetSelf ::
                 (DOMWindowClass self) => self -> IO (Maybe DOMWindow)
domWindowGetSelf self
  = maybeNull (makeNewGObject mkDOMWindow)
      ({# call webkit_dom_dom_window_get_self #} (toDOMWindow self))
 
domWindowGetWindow ::
                   (DOMWindowClass self) => self -> IO (Maybe DOMWindow)
domWindowGetWindow self
  = maybeNull (makeNewGObject mkDOMWindow)
      ({# call webkit_dom_dom_window_get_window #} (toDOMWindow self))
 
domWindowGetFrames ::
                   (DOMWindowClass self) => self -> IO (Maybe DOMWindow)
domWindowGetFrames self
  = maybeNull (makeNewGObject mkDOMWindow)
      ({# call webkit_dom_dom_window_get_frames #} (toDOMWindow self))
 
domWindowGetOpener ::
                   (DOMWindowClass self) => self -> IO (Maybe DOMWindow)
domWindowGetOpener self
  = maybeNull (makeNewGObject mkDOMWindow)
      ({# call webkit_dom_dom_window_get_opener #} (toDOMWindow self))
 
domWindowGetParent ::
                   (DOMWindowClass self) => self -> IO (Maybe DOMWindow)
domWindowGetParent self
  = maybeNull (makeNewGObject mkDOMWindow)
      ({# call webkit_dom_dom_window_get_parent #} (toDOMWindow self))
 
domWindowGetTop ::
                (DOMWindowClass self) => self -> IO (Maybe DOMWindow)
domWindowGetTop self
  = maybeNull (makeNewGObject mkDOMWindow)
      ({# call webkit_dom_dom_window_get_top #} (toDOMWindow self))
 
domWindowGetDocument ::
                     (DOMWindowClass self) => self -> IO (Maybe Document)
domWindowGetDocument self
  = maybeNull (makeNewGObject mkDocument)
      ({# call webkit_dom_dom_window_get_document #} (toDOMWindow self))
 
domWindowGetStyleMedia ::
                       (DOMWindowClass self) => self -> IO (Maybe StyleMedia)
domWindowGetStyleMedia self
  = maybeNull (makeNewGObject mkStyleMedia)
      ({# call webkit_dom_dom_window_get_style_media #}
         (toDOMWindow self))
 
domWindowGetDevicePixelRatio ::
                             (DOMWindowClass self) => self -> IO Double
domWindowGetDevicePixelRatio self
  = realToFrac <$>
      ({# call webkit_dom_dom_window_get_device_pixel_ratio #}
         (toDOMWindow self))
 
domWindowGetApplicationCache ::
                             (DOMWindowClass self) => self -> IO (Maybe DOMApplicationCache)
domWindowGetApplicationCache self
  = maybeNull (makeNewGObject mkDOMApplicationCache)
      ({# call webkit_dom_dom_window_get_application_cache #}
         (toDOMWindow self))
 
domWindowGetSessionStorage ::
                           (DOMWindowClass self) => self -> IO (Maybe Storage)
domWindowGetSessionStorage self
  = maybeNull (makeNewGObject mkStorage)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_window_get_session_storage #}
             (toDOMWindow self)
             errorPtr_)
 
domWindowGetLocalStorage ::
                         (DOMWindowClass self) => self -> IO (Maybe Storage)
domWindowGetLocalStorage self
  = maybeNull (makeNewGObject mkStorage)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_window_get_local_storage #}
             (toDOMWindow self)
             errorPtr_)
 
domWindowGetConsole ::
                    (DOMWindowClass self) => self -> IO (Maybe Console)
domWindowGetConsole self
  = maybeNull (makeNewGObject mkConsole)
      ({# call webkit_dom_dom_window_get_console #} (toDOMWindow self))
 
domWindowOnabort ::
                 (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnabort = (connect "abort")
 
domWindowOnbeforeunload ::
                        (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnbeforeunload = (connect "beforeunload")
 
domWindowOnblur ::
                (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnblur = (connect "blur")
 
domWindowOncanplay ::
                   (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOncanplay = (connect "canplay")
 
domWindowOncanplaythrough ::
                          (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOncanplaythrough = (connect "canplaythrough")
 
domWindowOnchange ::
                  (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnchange = (connect "change")
 
domWindowOnclick ::
                 (DOMWindowClass self) => Signal self (EventM MouseEvent self ())
domWindowOnclick = (connect "click")
 
domWindowOncontextmenu ::
                       (DOMWindowClass self) => Signal self (EventM MouseEvent self ())
domWindowOncontextmenu = (connect "contextmenu")
 
domWindowOndblclick ::
                    (DOMWindowClass self) => Signal self (EventM MouseEvent self ())
domWindowOndblclick = (connect "dblclick")
 
domWindowOndrag ::
                (DOMWindowClass self) => Signal self (EventM MouseEvent self ())
domWindowOndrag = (connect "drag")
 
domWindowOndragend ::
                   (DOMWindowClass self) => Signal self (EventM MouseEvent self ())
domWindowOndragend = (connect "dragend")
 
domWindowOndragenter ::
                     (DOMWindowClass self) => Signal self (EventM MouseEvent self ())
domWindowOndragenter = (connect "dragenter")
 
domWindowOndragleave ::
                     (DOMWindowClass self) => Signal self (EventM MouseEvent self ())
domWindowOndragleave = (connect "dragleave")
 
domWindowOndragover ::
                    (DOMWindowClass self) => Signal self (EventM MouseEvent self ())
domWindowOndragover = (connect "dragover")
 
domWindowOndragstart ::
                     (DOMWindowClass self) => Signal self (EventM MouseEvent self ())
domWindowOndragstart = (connect "dragstart")
 
domWindowOndrop ::
                (DOMWindowClass self) => Signal self (EventM MouseEvent self ())
domWindowOndrop = (connect "drop")
 
domWindowOndurationchange ::
                          (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOndurationchange = (connect "durationchange")
 
domWindowOnemptied ::
                   (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnemptied = (connect "emptied")
 
domWindowOnended ::
                 (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnended = (connect "ended")
 
domWindowOnerror ::
                 (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnerror = (connect "error")
 
domWindowOnfocus ::
                 (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnfocus = (connect "focus")
 
domWindowOnhashchange ::
                      (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnhashchange = (connect "hashchange")
 
domWindowOninput ::
                 (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOninput = (connect "input")
 
domWindowOninvalid ::
                   (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOninvalid = (connect "invalid")
 
domWindowOnkeydown ::
                   (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnkeydown = (connect "keydown")
 
domWindowOnkeypress ::
                    (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnkeypress = (connect "keypress")
 
domWindowOnkeyup ::
                 (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnkeyup = (connect "keyup")
 
domWindowOnload ::
                (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnload = (connect "load")
 
domWindowOnloadeddata ::
                      (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnloadeddata = (connect "loadeddata")
 
domWindowOnloadedmetadata ::
                          (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnloadedmetadata = (connect "loadedmetadata")
 
domWindowOnloadstart ::
                     (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnloadstart = (connect "loadstart")
 
domWindowOnmessage ::
                   (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnmessage = (connect "message")
 
domWindowOnmousedown ::
                     (DOMWindowClass self) => Signal self (EventM MouseEvent self ())
domWindowOnmousedown = (connect "mousedown")
 
domWindowOnmousemove ::
                     (DOMWindowClass self) => Signal self (EventM MouseEvent self ())
domWindowOnmousemove = (connect "mousemove")
 
domWindowOnmouseout ::
                    (DOMWindowClass self) => Signal self (EventM MouseEvent self ())
domWindowOnmouseout = (connect "mouseout")
 
domWindowOnmouseover ::
                     (DOMWindowClass self) => Signal self (EventM MouseEvent self ())
domWindowOnmouseover = (connect "mouseover")
 
domWindowOnmouseup ::
                   (DOMWindowClass self) => Signal self (EventM MouseEvent self ())
domWindowOnmouseup = (connect "mouseup")
 
domWindowOnmousewheel ::
                      (DOMWindowClass self) => Signal self (EventM MouseEvent self ())
domWindowOnmousewheel = (connect "mousewheel")
 
domWindowOnoffline ::
                   (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnoffline = (connect "offline")
 
domWindowOnonline ::
                  (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnonline = (connect "online")
 
domWindowOnpagehide ::
                    (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnpagehide = (connect "pagehide")
 
domWindowOnpageshow ::
                    (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnpageshow = (connect "pageshow")
 
domWindowOnpause ::
                 (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnpause = (connect "pause")
 
domWindowOnplay ::
                (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnplay = (connect "play")
 
domWindowOnplaying ::
                   (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnplaying = (connect "playing")
 
domWindowOnpopstate ::
                    (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnpopstate = (connect "popstate")
 
domWindowOnprogress ::
                    (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnprogress = (connect "progress")
 
domWindowOnratechange ::
                      (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnratechange = (connect "ratechange")
 
domWindowOnresize ::
                  (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnresize = (connect "resize")
 
domWindowOnscroll ::
                  (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnscroll = (connect "scroll")
 
domWindowOnseeked ::
                  (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnseeked = (connect "seeked")
 
domWindowOnseeking ::
                   (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnseeking = (connect "seeking")
 
domWindowOnselect ::
                  (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnselect = (connect "select")
 
domWindowOnstalled ::
                   (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnstalled = (connect "stalled")
 
domWindowOnstorage ::
                   (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnstorage = (connect "storage")
 
domWindowOnsubmit ::
                  (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnsubmit = (connect "submit")
 
domWindowOnsuspend ::
                   (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnsuspend = (connect "suspend")
 
domWindowOntimeupdate ::
                      (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOntimeupdate = (connect "timeupdate")
 
domWindowOnunload ::
                  (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnunload = (connect "unload")
 
domWindowOnvolumechange ::
                        (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnvolumechange = (connect "volumechange")
 
domWindowOnwaiting ::
                   (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnwaiting = (connect "waiting")
 
domWindowOnreset ::
                 (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnreset = (connect "reset")
 
domWindowOnsearch ::
                  (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnsearch = (connect "search")
 
domWindowOnwebkitanimationend ::
                              (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnwebkitanimationend = (connect "webkitanimationend")
 
domWindowOnwebkitanimationiteration ::
                                    (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnwebkitanimationiteration
  = (connect "webkitanimationiteration")
 
domWindowOnwebkitanimationstart ::
                                (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnwebkitanimationstart = (connect "webkitanimationstart")
 
domWindowOnwebkittransitionend ::
                               (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOnwebkittransitionend = (connect "webkittransitionend")
 
domWindowOntouchstart ::
                      (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOntouchstart = (connect "touchstart")
 
domWindowOntouchmove ::
                     (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOntouchmove = (connect "touchmove")
 
domWindowOntouchend ::
                    (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOntouchend = (connect "touchend")
 
domWindowOntouchcancel ::
                       (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOntouchcancel = (connect "touchcancel")
 
domWindowOndevicemotion ::
                        (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOndevicemotion = (connect "devicemotion")
 
domWindowOndeviceorientation ::
                             (DOMWindowClass self) => Signal self (EventM UIEvent self ())
domWindowOndeviceorientation = (connect "deviceorientation")
