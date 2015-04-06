module Graphics.UI.Gtk.WebKit.DOM.EventM
(
  EventM (..)
, EventName (..)
, newListener
, addListener
, removeListener
, on
, event
, eventTarget
, eventCurrentTarget
, eventPhase
, bubbles
, cancelable
, timeStamp
, stopPropagation
, preventDefault
, defaultPrevented
, stopImmediatePropagation
, srcElement
, getCancelBubble
, cancelBubble
, getReturnValue
, returnValue
, uiView
, uiDetail
, uiKeyCode
, uiCharCode
, uiLayerX
, uiLayerY
, uiLayerXY
, uiPageX
, uiPageY
, uiPageXY
, uiWhich
, mouseScreenX
, mouseScreenY
, mouseScreenXY
, mouseClientX
, mouseClientY
, mouseClientXY
, mouseMovementX
, mouseMovementY
, mouseMovementXY
, mouseCtrlKey
, mouseShiftKey
, mouseAltKey
, mouseMetaKey
, mouseButton
, mouseRelatedTarget
, mouseOffsetX
, mouseOffsetY
, mouseOffsetXY
, mouseX
, mouseY
, mouseXY
, mouseFromElement
, mouseToElement
)
where
import           Control.Applicative ((<$>))
import           Control.Monad.Reader (ReaderT, ask, runReaderT)
import           Control.Monad.Trans (MonadIO(..))
import           System.IO.Unsafe (unsafePerformIO)
import           System.Glib.FFI (CString)
import           System.Glib.UTFString (GlibString(..))
import           Graphics.UI.Gtk.WebKit.Types
import qualified Graphics.UI.Gtk.WebKit.DOM.Event as Event
import qualified Graphics.UI.Gtk.WebKit.DOM.UIEvent as UIEvent
import qualified Graphics.UI.Gtk.WebKit.DOM.MouseEvent as MouseEvent
import           Graphics.UI.Gtk.WebKit.DOM.EventTarget
import           Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import           Data.Word (Word)

type EventM t e = ReaderT e IO

newListener :: (EventClass e) => EventM t e () -> IO (SaferEventListener t e)
newListener f = SaferEventListener <$> eventListenerNew (runReaderT f)

addListener :: (EventTargetClass t, EventClass e) => t -> EventName t e -> SaferEventListener t e -> Bool -> IO ()
addListener target (EventName eventName) (SaferEventListener l) useCapture =
    addEventListener target eventName (Just l) useCapture

removeListener :: (EventTargetClass t, EventClass e) => t -> EventName t e -> SaferEventListener t e -> Bool -> IO ()
removeListener target (EventName eventName) (SaferEventListener l) useCapture =
    removeEventListener target eventName (Just l) useCapture

on :: (EventTargetClass t, EventClass e) => t -> EventName t e -> EventM t e () -> IO (IO ())
on target eventName callback = do
    l <- newListener callback
    addListener target eventName l False
    return (removeListener target eventName l False)

target :: (EventClass e, GObjectClass t) => EventM t e (Maybe t)
target = (fmap (unsafeCastGObject . toGObject)) <$> (ask >>= Event.getTarget)

event :: EventM t e e
event = ask

eventTarget :: EventClass e => EventM t e (Maybe EventTarget)
eventTarget = event >>= Event.getTarget

eventCurrentTarget :: EventClass e => EventM t e (Maybe EventTarget)
eventCurrentTarget = event >>= Event.getCurrentTarget

eventPhase :: EventClass e => EventM t e Word
eventPhase = event >>= Event.getEventPhase

bubbles :: EventClass e => EventM t e Bool
bubbles = event >>= Event.getBubbles

cancelable :: EventClass e => EventM t e Bool
cancelable = event >>= Event.getCancelable

timeStamp :: EventClass e => EventM t e Word
timeStamp = event >>= Event.getTimeStamp

stopPropagation :: EventClass e => EventM t e ()
stopPropagation = event >>= Event.stopPropagation

preventDefault :: EventClass e => EventM t e ()
preventDefault = event >>= Event.preventDefault

defaultPrevented :: EventClass e => EventM t e Bool
defaultPrevented = event >>= Event.getDefaultPrevented

stopImmediatePropagation :: EventClass e => EventM t e ()
stopImmediatePropagation = event >>= Event.stopImmediatePropagation

srcElement :: EventClass e => EventM t e (Maybe EventTarget)
srcElement = event >>= Event.getSrcElement

getCancelBubble :: EventClass e => EventM t e Bool
getCancelBubble = event >>= Event.getCancelBubble

cancelBubble :: EventClass e => Bool -> EventM t e ()
cancelBubble f = event >>= flip Event.setCancelBubble f

getReturnValue :: EventClass e => EventM t e Bool
getReturnValue = event >>= Event.getReturnValue

returnValue :: EventClass e => Bool -> EventM t e ()
returnValue f = event >>= flip Event.setReturnValue f

uiView :: UIEventClass e => EventM t e (Maybe DOMWindow)
uiView = event >>= UIEvent.getView

uiDetail :: UIEventClass e => EventM t e Int
uiDetail = event >>= UIEvent.getDetail

uiKeyCode :: UIEventClass e => EventM t e Int
uiKeyCode = event >>= UIEvent.getKeyCode

uiCharCode :: UIEventClass e => EventM t e Int
uiCharCode = event >>= UIEvent.getCharCode

uiLayerX :: UIEventClass e => EventM t e Int
uiLayerX = event >>= UIEvent.getLayerX

uiLayerY :: UIEventClass e => EventM t e Int
uiLayerY = event >>= UIEvent.getLayerY

uiLayerXY :: UIEventClass e => EventM t e (Int, Int)
uiLayerXY = do
    e <- event
    x <- UIEvent.getLayerX e
    y <- UIEvent.getLayerY e
    return (x, y)

uiPageX :: UIEventClass e => EventM t e Int
uiPageX = event >>= UIEvent.getPageX

uiPageY :: UIEventClass e => EventM t e Int
uiPageY = event >>= UIEvent.getPageY

uiPageXY :: UIEventClass e => EventM t e (Int, Int)
uiPageXY = do
    e <- event
    x <- UIEvent.getPageX e
    y <- UIEvent.getPageY e
    return (x, y)

uiWhich :: UIEventClass e => EventM t e Int
uiWhich = event >>= UIEvent.getWhich

mouseScreenX :: MouseEventClass e => EventM t e Int
mouseScreenX = event >>= MouseEvent.getScreenX

mouseScreenY :: MouseEventClass e => EventM t e Int
mouseScreenY = event >>= MouseEvent.getScreenY

mouseScreenXY :: MouseEventClass e => EventM t e (Int, Int)
mouseScreenXY = do
    e <- event
    x <- MouseEvent.getScreenX e
    y <- MouseEvent.getScreenY e
    return (x, y)

mouseClientX :: MouseEventClass e => EventM t e Int
mouseClientX = event >>= MouseEvent.getClientX

mouseClientY :: MouseEventClass e => EventM t e Int
mouseClientY = event >>= MouseEvent.getClientY

mouseClientXY :: MouseEventClass e => EventM t e (Int, Int)
mouseClientXY = do
    e <- event
    x <- MouseEvent.getClientX e
    y <- MouseEvent.getClientY e
    return (x, y)

mouseMovementX :: MouseEventClass e => EventM t e Int
mouseMovementX = event >>= MouseEvent.getMovementX

mouseMovementY :: MouseEventClass e => EventM t e Int
mouseMovementY = event >>= MouseEvent.getMovementY

mouseMovementXY :: MouseEventClass e => EventM t e (Int, Int)
mouseMovementXY = do
    e <- event
    x <- MouseEvent.getMovementX e
    y <- MouseEvent.getMovementY e
    return (x, y)

mouseCtrlKey :: MouseEventClass e => EventM t e Bool
mouseCtrlKey = event >>= MouseEvent.getCtrlKey

mouseShiftKey :: MouseEventClass e => EventM t e Bool
mouseShiftKey = event >>= MouseEvent.getShiftKey

mouseAltKey :: MouseEventClass e => EventM t e Bool
mouseAltKey = event >>= MouseEvent.getAltKey

mouseMetaKey :: MouseEventClass e => EventM t e Bool
mouseMetaKey = event >>= MouseEvent.getMetaKey

mouseButton :: MouseEventClass e => EventM t e Word
mouseButton = event >>= MouseEvent.getButton

mouseRelatedTarget :: MouseEventClass e => EventM t e (Maybe EventTarget)
mouseRelatedTarget = event >>= MouseEvent.getRelatedTarget

mouseOffsetX :: MouseEventClass e => EventM t e Int
mouseOffsetX = event >>= MouseEvent.getOffsetX

mouseOffsetY :: MouseEventClass e => EventM t e Int
mouseOffsetY = event >>= MouseEvent.getOffsetY

mouseOffsetXY :: MouseEventClass e => EventM t e (Int, Int)
mouseOffsetXY = do
    e <- event
    x <- MouseEvent.getOffsetX e
    y <- MouseEvent.getOffsetY e
    return (x, y)

mouseX :: MouseEventClass e => EventM t e Int
mouseX = event >>= MouseEvent.getX

mouseY :: MouseEventClass e => EventM t e Int
mouseY = event >>= MouseEvent.getY

mouseXY :: MouseEventClass e => EventM t e (Int, Int)
mouseXY = do
    e <- event
    x <- MouseEvent.getX e
    y <- MouseEvent.getY e
    return (x, y)

mouseFromElement :: MouseEventClass e => EventM t e (Maybe Node)
mouseFromElement = event >>= MouseEvent.getFromElement

mouseToElement :: MouseEventClass e => EventM t e (Maybe Node)
mouseToElement = event >>= MouseEvent.getToElement

