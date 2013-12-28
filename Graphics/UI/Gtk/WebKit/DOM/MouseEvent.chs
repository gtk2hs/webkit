module Graphics.UI.Gtk.WebKit.DOM.MouseEvent
       (mouseEventInitMouseEvent, mouseEventGetScreenX,
        mouseEventGetScreenY, mouseEventGetClientX, mouseEventGetClientY,
        mouseEventGetCtrlKey, mouseEventGetShiftKey, mouseEventGetAltKey,
        mouseEventGetMetaKey, mouseEventGetButton,
        mouseEventGetRelatedTarget, mouseEventGetWebkitMovementX,
        mouseEventGetWebkitMovementY, mouseEventGetOffsetX,
        mouseEventGetOffsetY, mouseEventGetX, mouseEventGetY,
        mouseEventGetFromElement, mouseEventGetToElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
 
mouseEventInitMouseEvent ::
                         (MouseEventClass self, DOMWindowClass view,
                          EventTargetClass relatedTarget) =>
                           self ->
                             String ->
                               Bool ->
                                 Bool ->
                                   Maybe view ->
                                     Int ->
                                       Int ->
                                         Int ->
                                           Int ->
                                             Int ->
                                               Bool ->
                                                 Bool ->
                                                   Bool ->
                                                     Bool -> Word -> Maybe relatedTarget -> IO ()
mouseEventInitMouseEvent self type' canBubble cancelable view
  detail screenX screenY clientX clientY ctrlKey altKey shiftKey
  metaKey button relatedTarget
  = withUTFString type' $
      \ typePtr ->
        {# call webkit_dom_mouse_event_init_mouse_event #}
          (toMouseEvent self)
          typePtr
      (fromBool canBubble)
      (fromBool cancelable)
      (maybe (DOMWindow nullForeignPtr) toDOMWindow view)
      (fromIntegral detail)
      (fromIntegral screenX)
      (fromIntegral screenY)
      (fromIntegral clientX)
      (fromIntegral clientY)
      (fromBool ctrlKey)
      (fromBool altKey)
      (fromBool shiftKey)
      (fromBool metaKey)
      (fromIntegral button)
      (maybe (EventTarget nullForeignPtr) toEventTarget relatedTarget)
 
mouseEventGetScreenX :: (MouseEventClass self) => self -> IO Int
mouseEventGetScreenX self
  = fromIntegral <$>
      ({# call webkit_dom_mouse_event_get_screen_x #}
         (toMouseEvent self))
 
mouseEventGetScreenY :: (MouseEventClass self) => self -> IO Int
mouseEventGetScreenY self
  = fromIntegral <$>
      ({# call webkit_dom_mouse_event_get_screen_y #}
         (toMouseEvent self))
 
mouseEventGetClientX :: (MouseEventClass self) => self -> IO Int
mouseEventGetClientX self
  = fromIntegral <$>
      ({# call webkit_dom_mouse_event_get_client_x #}
         (toMouseEvent self))
 
mouseEventGetClientY :: (MouseEventClass self) => self -> IO Int
mouseEventGetClientY self
  = fromIntegral <$>
      ({# call webkit_dom_mouse_event_get_client_y #}
         (toMouseEvent self))
 
mouseEventGetCtrlKey :: (MouseEventClass self) => self -> IO Bool
mouseEventGetCtrlKey self
  = toBool <$>
      ({# call webkit_dom_mouse_event_get_ctrl_key #}
         (toMouseEvent self))
 
mouseEventGetShiftKey :: (MouseEventClass self) => self -> IO Bool
mouseEventGetShiftKey self
  = toBool <$>
      ({# call webkit_dom_mouse_event_get_shift_key #}
         (toMouseEvent self))
 
mouseEventGetAltKey :: (MouseEventClass self) => self -> IO Bool
mouseEventGetAltKey self
  = toBool <$>
      ({# call webkit_dom_mouse_event_get_alt_key #} (toMouseEvent self))
 
mouseEventGetMetaKey :: (MouseEventClass self) => self -> IO Bool
mouseEventGetMetaKey self
  = toBool <$>
      ({# call webkit_dom_mouse_event_get_meta_key #}
         (toMouseEvent self))
 
mouseEventGetButton :: (MouseEventClass self) => self -> IO Word
mouseEventGetButton self
  = fromIntegral <$>
      ({# call webkit_dom_mouse_event_get_button #} (toMouseEvent self))
 
mouseEventGetRelatedTarget ::
                           (MouseEventClass self) => self -> IO (Maybe EventTarget)
mouseEventGetRelatedTarget self
  = maybeNull (makeNewGObject mkEventTarget)
      ({# call webkit_dom_mouse_event_get_related_target #}
         (toMouseEvent self))
 
mouseEventGetWebkitMovementX ::
                             (MouseEventClass self) => self -> IO Int
mouseEventGetWebkitMovementX self
  = fromIntegral <$>
      ({# call webkit_dom_mouse_event_get_webkit_movement_x #}
         (toMouseEvent self))
 
mouseEventGetWebkitMovementY ::
                             (MouseEventClass self) => self -> IO Int
mouseEventGetWebkitMovementY self
  = fromIntegral <$>
      ({# call webkit_dom_mouse_event_get_webkit_movement_y #}
         (toMouseEvent self))
 
mouseEventGetOffsetX :: (MouseEventClass self) => self -> IO Int
mouseEventGetOffsetX self
  = fromIntegral <$>
      ({# call webkit_dom_mouse_event_get_offset_x #}
         (toMouseEvent self))
 
mouseEventGetOffsetY :: (MouseEventClass self) => self -> IO Int
mouseEventGetOffsetY self
  = fromIntegral <$>
      ({# call webkit_dom_mouse_event_get_offset_y #}
         (toMouseEvent self))
 
mouseEventGetX :: (MouseEventClass self) => self -> IO Int
mouseEventGetX self
  = fromIntegral <$>
      ({# call webkit_dom_mouse_event_get_x #} (toMouseEvent self))
 
mouseEventGetY :: (MouseEventClass self) => self -> IO Int
mouseEventGetY self
  = fromIntegral <$>
      ({# call webkit_dom_mouse_event_get_y #} (toMouseEvent self))
 
mouseEventGetFromElement ::
                         (MouseEventClass self) => self -> IO (Maybe Node)
mouseEventGetFromElement self
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_mouse_event_get_from_element #}
         (toMouseEvent self))
 
mouseEventGetToElement ::
                       (MouseEventClass self) => self -> IO (Maybe Node)
mouseEventGetToElement self
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_mouse_event_get_to_element #}
         (toMouseEvent self))
