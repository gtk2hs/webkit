module Graphics.UI.Gtk.WebKit.DOM.UIEvent
       (uiEventInitUIEvent, uiEventGetView, uiEventGetDetail,
        uiEventGetKeyCode, uiEventGetCharCode, uiEventGetLayerX,
        uiEventGetLayerY, uiEventGetPageX, uiEventGetPageY,
        uiEventGetWhich, UIEvent, UIEventClass, castToUIEvent,
        gTypeUIEvent, toUIEvent)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
 
uiEventInitUIEvent ::
                   (UIEventClass self, DOMWindowClass view) =>
                     self -> String -> Bool -> Bool -> Maybe view -> Int -> IO ()
uiEventInitUIEvent self type' canBubble cancelable view detail
  = withUTFString type' $
      \ typePtr ->
        {# call webkit_dom_ui_event_init_ui_event #} (toUIEvent self)
          typePtr
      (fromBool canBubble)
      (fromBool cancelable)
      (maybe (DOMWindow nullForeignPtr) toDOMWindow view)
      (fromIntegral detail)
 
uiEventGetView ::
               (UIEventClass self) => self -> IO (Maybe DOMWindow)
uiEventGetView self
  = maybeNull (makeNewGObject mkDOMWindow)
      ({# call webkit_dom_ui_event_get_view #} (toUIEvent self))
 
uiEventGetDetail :: (UIEventClass self) => self -> IO Int
uiEventGetDetail self
  = fromIntegral <$>
      ({# call webkit_dom_ui_event_get_detail #} (toUIEvent self))
 
uiEventGetKeyCode :: (UIEventClass self) => self -> IO Int
uiEventGetKeyCode self
  = fromIntegral <$>
      ({# call webkit_dom_ui_event_get_key_code #} (toUIEvent self))
 
uiEventGetCharCode :: (UIEventClass self) => self -> IO Int
uiEventGetCharCode self
  = fromIntegral <$>
      ({# call webkit_dom_ui_event_get_char_code #} (toUIEvent self))
 
uiEventGetLayerX :: (UIEventClass self) => self -> IO Int
uiEventGetLayerX self
  = fromIntegral <$>
      ({# call webkit_dom_ui_event_get_layer_x #} (toUIEvent self))
 
uiEventGetLayerY :: (UIEventClass self) => self -> IO Int
uiEventGetLayerY self
  = fromIntegral <$>
      ({# call webkit_dom_ui_event_get_layer_y #} (toUIEvent self))
 
uiEventGetPageX :: (UIEventClass self) => self -> IO Int
uiEventGetPageX self
  = fromIntegral <$>
      ({# call webkit_dom_ui_event_get_page_x #} (toUIEvent self))
 
uiEventGetPageY :: (UIEventClass self) => self -> IO Int
uiEventGetPageY self
  = fromIntegral <$>
      ({# call webkit_dom_ui_event_get_page_y #} (toUIEvent self))
 
uiEventGetWhich :: (UIEventClass self) => self -> IO Int
uiEventGetWhich self
  = fromIntegral <$>
      ({# call webkit_dom_ui_event_get_which #} (toUIEvent self))
