module Graphics.UI.Gtk.WebKit.DOM.Event(
stopPropagation,
preventDefault,
initEvent,
stopImmediatePropagation,
pattern NONE,
pattern CAPTURING_PHASE,
pattern AT_TARGET,
pattern BUBBLING_PHASE,
pattern MOUSEDOWN,
pattern MOUSEUP,
pattern MOUSEOVER,
pattern MOUSEOUT,
pattern MOUSEMOVE,
pattern MOUSEDRAG,
pattern CLICK,
pattern DBLCLICK,
pattern KEYDOWN,
pattern KEYUP,
pattern KEYPRESS,
pattern DRAGDROP,
pattern FOCUS,
pattern BLUR,
pattern SELECT,
pattern CHANGE,
getTarget,
getCurrentTarget,
getEventPhase,
getBubbles,
getCancelable,
getTimeStamp,
getDefaultPrevented,
getSrcElement,
setReturnValue,
getReturnValue,
setCancelBubble,
getCancelBubble,
Event,
castToEvent,
gTypeEvent,
EventClass,
toEvent,
) where
import Prelude hiding (drop, error, print)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
stopPropagation :: (MonadIO m, EventClass self) => self -> m ()
stopPropagation self
  = liftIO
      ({# call webkit_dom_event_stop_propagation #} (toEvent self))
 
preventDefault :: (MonadIO m, EventClass self) => self -> m ()
preventDefault self
  = liftIO
      ({# call webkit_dom_event_prevent_default #} (toEvent self))
 
initEvent ::
          (MonadIO m, EventClass self, GlibString string) =>
            self -> string -> Bool -> Bool -> m ()
initEvent self eventTypeArg canBubbleArg cancelableArg
  = liftIO
      (withUTFString eventTypeArg $
         \ eventTypeArgPtr ->
           {# call webkit_dom_event_init_event #} (toEvent self)
             eventTypeArgPtr
         (fromBool canBubbleArg)
         (fromBool cancelableArg))
 
stopImmediatePropagation ::
                         (MonadIO m, EventClass self) => self -> m ()
stopImmediatePropagation self
  = liftIO
      ({# call webkit_dom_event_stop_immediate_propagation #}
         (toEvent self))
pattern NONE = 0
pattern CAPTURING_PHASE = 1
pattern AT_TARGET = 2
pattern BUBBLING_PHASE = 3
pattern MOUSEDOWN = 1
pattern MOUSEUP = 2
pattern MOUSEOVER = 4
pattern MOUSEOUT = 8
pattern MOUSEMOVE = 16
pattern MOUSEDRAG = 32
pattern CLICK = 64
pattern DBLCLICK = 128
pattern KEYDOWN = 256
pattern KEYUP = 512
pattern KEYPRESS = 1024
pattern DRAGDROP = 2048
pattern FOCUS = 4096
pattern BLUR = 8192
pattern SELECT = 16384
pattern CHANGE = 32768
 
getTarget ::
          (MonadIO m, EventClass self) => self -> m (Maybe EventTarget)
getTarget self
  = liftIO
      (maybeNull (makeNewGObject mkEventTarget)
         ({# call webkit_dom_event_get_target #} (toEvent self)))
 
getCurrentTarget ::
                 (MonadIO m, EventClass self) => self -> m (Maybe EventTarget)
getCurrentTarget self
  = liftIO
      (maybeNull (makeNewGObject mkEventTarget)
         ({# call webkit_dom_event_get_current_target #} (toEvent self)))
 
getEventPhase :: (MonadIO m, EventClass self) => self -> m Word
getEventPhase self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_event_get_event_phase #} (toEvent self)))
 
getBubbles :: (MonadIO m, EventClass self) => self -> m Bool
getBubbles self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_event_get_bubbles #} (toEvent self)))
 
getCancelable :: (MonadIO m, EventClass self) => self -> m Bool
getCancelable self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_event_get_cancelable #} (toEvent self)))
 
getTimeStamp :: (MonadIO m, EventClass self) => self -> m Word
getTimeStamp self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_event_get_time_stamp #} (toEvent self)))
 
getDefaultPrevented ::
                    (MonadIO m, EventClass self) => self -> m Bool
getDefaultPrevented self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_event_get_default_prevented #} (toEvent self)))
 
getSrcElement ::
              (MonadIO m, EventClass self) => self -> m (Maybe EventTarget)
getSrcElement self
  = liftIO
      (maybeNull (makeNewGObject mkEventTarget)
         ({# call webkit_dom_event_get_src_element #} (toEvent self)))
 
setReturnValue ::
               (MonadIO m, EventClass self) => self -> Bool -> m ()
setReturnValue self val
  = liftIO
      ({# call webkit_dom_event_set_return_value #} (toEvent self)
         (fromBool val))
 
getReturnValue :: (MonadIO m, EventClass self) => self -> m Bool
getReturnValue self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_event_get_return_value #} (toEvent self)))
 
setCancelBubble ::
                (MonadIO m, EventClass self) => self -> Bool -> m ()
setCancelBubble self val
  = liftIO
      ({# call webkit_dom_event_set_cancel_bubble #} (toEvent self)
         (fromBool val))
 
getCancelBubble :: (MonadIO m, EventClass self) => self -> m Bool
getCancelBubble self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_event_get_cancel_bubble #} (toEvent self)))
