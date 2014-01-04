module Graphics.UI.Gtk.WebKit.DOM.KeyboardEvent
       (
#if WEBKIT_CHECK_VERSION(2,2,2)
        keyboardEventGetModifierState, keyboardEventInitKeyboardEvent,
        cKEY_LOCATION_STANDARD, cKEY_LOCATION_LEFT, cKEY_LOCATION_RIGHT,
        cKEY_LOCATION_NUMPAD, keyboardEventGetKeyIdentifier,
        keyboardEventGetKeyLocation, keyboardEventGetCtrlKey,
        keyboardEventGetShiftKey, keyboardEventGetAltKey,
        keyboardEventGetMetaKey, keyboardEventGetAltGraphKey,
        KeyboardEvent, KeyboardEventClass, castToKeyboardEvent,
        gTypeKeyboardEvent, toKeyboardEvent
#endif
       )
       where

#if WEBKIT_CHECK_VERSION(2,2,2)
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
keyboardEventGetModifierState ::
                              (KeyboardEventClass self) => self -> String -> IO Bool
keyboardEventGetModifierState self keyIdentifierArg
  = toBool <$>
      (withUTFString keyIdentifierArg $
         \ keyIdentifierArgPtr ->
           {# call webkit_dom_keyboard_event_get_modifier_state #}
             (toKeyboardEvent self)
             keyIdentifierArgPtr)
 
keyboardEventInitKeyboardEvent ::
                               (KeyboardEventClass self, DOMWindowClass view) =>
                                 self ->
                                   String ->
                                     Bool ->
                                       Bool ->
                                         Maybe view ->
                                           String ->
                                             Word -> Bool -> Bool -> Bool -> Bool -> Bool -> IO ()
keyboardEventInitKeyboardEvent self type' canBubble cancelable view
  keyIdentifier location ctrlKey altKey shiftKey metaKey altGraphKey
  = withUTFString keyIdentifier $
      \ keyIdentifierPtr ->
        withUTFString type' $
          \ typePtr ->
            {# call webkit_dom_keyboard_event_init_keyboard_event #}
              (toKeyboardEvent self)
              typePtr
          (fromBool canBubble)
          (fromBool cancelable)
          (maybe (DOMWindow nullForeignPtr) toDOMWindow view)
          keyIdentifierPtr
      (fromIntegral location)
      (fromBool ctrlKey)
      (fromBool altKey)
      (fromBool shiftKey)
      (fromBool metaKey)
      (fromBool altGraphKey)
cKEY_LOCATION_STANDARD = 0
cKEY_LOCATION_LEFT = 1
cKEY_LOCATION_RIGHT = 2
cKEY_LOCATION_NUMPAD = 3
 
keyboardEventGetKeyIdentifier ::
                              (KeyboardEventClass self) => self -> IO String
keyboardEventGetKeyIdentifier self
  = ({# call webkit_dom_keyboard_event_get_key_identifier #}
       (toKeyboardEvent self))
      >>=
      readUTFString
 
keyboardEventGetKeyLocation ::
                            (KeyboardEventClass self) => self -> IO Word
keyboardEventGetKeyLocation self
  = fromIntegral <$>
      ({# call webkit_dom_keyboard_event_get_key_location #}
         (toKeyboardEvent self))
 
keyboardEventGetCtrlKey ::
                        (KeyboardEventClass self) => self -> IO Bool
keyboardEventGetCtrlKey self
  = toBool <$>
      ({# call webkit_dom_keyboard_event_get_ctrl_key #}
         (toKeyboardEvent self))
 
keyboardEventGetShiftKey ::
                         (KeyboardEventClass self) => self -> IO Bool
keyboardEventGetShiftKey self
  = toBool <$>
      ({# call webkit_dom_keyboard_event_get_shift_key #}
         (toKeyboardEvent self))
 
keyboardEventGetAltKey ::
                       (KeyboardEventClass self) => self -> IO Bool
keyboardEventGetAltKey self
  = toBool <$>
      ({# call webkit_dom_keyboard_event_get_alt_key #}
         (toKeyboardEvent self))
 
keyboardEventGetMetaKey ::
                        (KeyboardEventClass self) => self -> IO Bool
keyboardEventGetMetaKey self
  = toBool <$>
      ({# call webkit_dom_keyboard_event_get_meta_key #}
         (toKeyboardEvent self))
 
keyboardEventGetAltGraphKey ::
                            (KeyboardEventClass self) => self -> IO Bool
keyboardEventGetAltGraphKey self
  = toBool <$>
      ({# call webkit_dom_keyboard_event_get_alt_graph_key #}
         (toKeyboardEvent self))
#endif
