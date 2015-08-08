module Graphics.UI.Gtk.WebKit.DOM.KeyboardEvent(
#if WEBKIT_CHECK_VERSION(2,2,2)
getModifierState,
initKeyboardEvent,
pattern KEY_LOCATION_STANDARD,
pattern KEY_LOCATION_LEFT,
pattern KEY_LOCATION_RIGHT,
pattern KEY_LOCATION_NUMPAD,
getKeyIdentifier,
getKeyLocation,
getCtrlKey,
getShiftKey,
getAltKey,
getMetaKey,
getAltGraphKey,
#if WEBKIT_CHECK_VERSION(99,0,0)
getKeyCode,
getCharCode,
#endif
KeyboardEvent,
castToKeyboardEvent,
gTypeKeyboardEvent,
KeyboardEventClass,
toKeyboardEvent,
#endif
) where
#if WEBKIT_CHECK_VERSION(2,2,2)
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

 
getModifierState ::
                 (MonadIO m, KeyboardEventClass self, GlibString string) =>
                   self -> string -> m Bool
getModifierState self keyIdentifierArg
  = liftIO
      (toBool <$>
         (withUTFString keyIdentifierArg $
            \ keyIdentifierArgPtr ->
              {# call webkit_dom_keyboard_event_get_modifier_state #}
                (toKeyboardEvent self)
                keyIdentifierArgPtr))
 
initKeyboardEvent ::
                  (MonadIO m, KeyboardEventClass self, WindowClass view,
                   GlibString string) =>
                    self ->
                      string ->
                        Bool ->
                          Bool ->
                            Maybe view ->
                              string -> Word -> Bool -> Bool -> Bool -> Bool -> Bool -> m ()
initKeyboardEvent self type' canBubble cancelable view
  keyIdentifier location ctrlKey altKey shiftKey metaKey altGraphKey
  = liftIO
      (withUTFString keyIdentifier $
         \ keyIdentifierPtr ->
           withUTFString type' $
             \ typePtr ->
               {# call webkit_dom_keyboard_event_init_keyboard_event #}
                 (toKeyboardEvent self)
                 typePtr
             (fromBool canBubble)
             (fromBool cancelable)
             (maybe (Window nullForeignPtr) toWindow view)
             keyIdentifierPtr
         (fromIntegral location)
         (fromBool ctrlKey)
         (fromBool altKey)
         (fromBool shiftKey)
         (fromBool metaKey)
         (fromBool altGraphKey))
pattern KEY_LOCATION_STANDARD = 0
pattern KEY_LOCATION_LEFT = 1
pattern KEY_LOCATION_RIGHT = 2
pattern KEY_LOCATION_NUMPAD = 3
 
getKeyIdentifier ::
                 (MonadIO m, KeyboardEventClass self, GlibString string) =>
                   self -> m string
getKeyIdentifier self
  = liftIO
      (({# call webkit_dom_keyboard_event_get_key_identifier #}
          (toKeyboardEvent self))
         >>=
         readUTFString)
 
getKeyLocation ::
               (MonadIO m, KeyboardEventClass self) => self -> m Word
getKeyLocation self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_keyboard_event_get_key_location #}
            (toKeyboardEvent self)))
 
getCtrlKey ::
           (MonadIO m, KeyboardEventClass self) => self -> m Bool
getCtrlKey self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_keyboard_event_get_ctrl_key #}
            (toKeyboardEvent self)))
 
getShiftKey ::
            (MonadIO m, KeyboardEventClass self) => self -> m Bool
getShiftKey self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_keyboard_event_get_shift_key #}
            (toKeyboardEvent self)))
 
getAltKey :: (MonadIO m, KeyboardEventClass self) => self -> m Bool
getAltKey self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_keyboard_event_get_alt_key #}
            (toKeyboardEvent self)))
 
getMetaKey ::
           (MonadIO m, KeyboardEventClass self) => self -> m Bool
getMetaKey self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_keyboard_event_get_meta_key #}
            (toKeyboardEvent self)))
 
getAltGraphKey ::
               (MonadIO m, KeyboardEventClass self) => self -> m Bool
getAltGraphKey self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_keyboard_event_get_alt_graph_key #}
            (toKeyboardEvent self)))

#if WEBKIT_CHECK_VERSION(99,0,0) 
getKeyCode :: (MonadIO m, KeyboardEventClass self) => self -> m Int
getKeyCode self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_keyboard_event_get_key_code #}
            (toKeyboardEvent self)))
 
getCharCode ::
            (MonadIO m, KeyboardEventClass self) => self -> m Int
getCharCode self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_keyboard_event_get_char_code #}
            (toKeyboardEvent self)))
#endif
#endif
