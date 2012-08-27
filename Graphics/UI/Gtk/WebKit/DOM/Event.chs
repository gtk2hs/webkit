module Graphics.UI.Gtk.WebKit.DOM.Event
       (eventStopPropagation, eventPreventDefault, eventInitEvent,
        eventStopImmediatePropagation, cCAPTURING_PHASE, cAT_TARGET,
        cBUBBLING_PHASE, cMOUSEDOWN, cMOUSEUP, cMOUSEOVER, cMOUSEOUT,
        cMOUSEMOVE, cMOUSEDRAG, cCLICK, cDBLCLICK, cKEYDOWN, cKEYUP,
        cKEYPRESS, cDRAGDROP, cFOCUS, cBLUR, cSELECT, cCHANGE,
        eventGetTarget, eventGetCurrentTarget, eventGetEventPhase,
        eventGetBubbles, eventGetCancelable, eventGetTimeStamp,
        eventGetDefaultPrevented, eventGetSrcElement, eventSetReturnValue,
        eventGetReturnValue, eventSetCancelBubble, eventGetCancelBubble)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
 
eventStopPropagation :: (EventClass self) => self -> IO ()
eventStopPropagation self
  = {# call webkit_dom_event_stop_propagation #} (toEvent self)
 
eventPreventDefault :: (EventClass self) => self -> IO ()
eventPreventDefault self
  = {# call webkit_dom_event_prevent_default #} (toEvent self)
 
eventInitEvent ::
               (EventClass self) => self -> String -> Bool -> Bool -> IO ()
eventInitEvent self eventTypeArg canBubbleArg cancelableArg
  = withUTFString eventTypeArg $
      \ eventTypeArgPtr ->
        {# call webkit_dom_event_init_event #} (toEvent self)
          eventTypeArgPtr
      (fromBool canBubbleArg)
      (fromBool cancelableArg)
 
eventStopImmediatePropagation :: (EventClass self) => self -> IO ()
eventStopImmediatePropagation self
  = {# call webkit_dom_event_stop_immediate_propagation #}
      (toEvent self)
cCAPTURING_PHASE = 1
cAT_TARGET = 2
cBUBBLING_PHASE = 3
cMOUSEDOWN = 1
cMOUSEUP = 2
cMOUSEOVER = 4
cMOUSEOUT = 8
cMOUSEMOVE = 16
cMOUSEDRAG = 32
cCLICK = 64
cDBLCLICK = 128
cKEYDOWN = 256
cKEYUP = 512
cKEYPRESS = 1024
cDRAGDROP = 2048
cFOCUS = 4096
cBLUR = 8192
cSELECT = 16384
cCHANGE = 32768
 
eventGetTarget ::
               (EventClass self) => self -> IO (Maybe EventTarget)
eventGetTarget self
  = maybeNull (makeNewGObject mkEventTarget)
      ({# call webkit_dom_event_get_target #} (toEvent self))
 
eventGetCurrentTarget ::
                      (EventClass self) => self -> IO (Maybe EventTarget)
eventGetCurrentTarget self
  = maybeNull (makeNewGObject mkEventTarget)
      ({# call webkit_dom_event_get_current_target #} (toEvent self))
 
eventGetEventPhase :: (EventClass self) => self -> IO Word
eventGetEventPhase self
  = fromIntegral <$>
      ({# call webkit_dom_event_get_event_phase #} (toEvent self))
 
eventGetBubbles :: (EventClass self) => self -> IO Bool
eventGetBubbles self
  = toBool <$>
      ({# call webkit_dom_event_get_bubbles #} (toEvent self))
 
eventGetCancelable :: (EventClass self) => self -> IO Bool
eventGetCancelable self
  = toBool <$>
      ({# call webkit_dom_event_get_cancelable #} (toEvent self))
 
eventGetTimeStamp :: (EventClass self) => self -> IO Word
eventGetTimeStamp self
  = fromIntegral <$>
      ({# call webkit_dom_event_get_time_stamp #} (toEvent self))
 
eventGetDefaultPrevented :: (EventClass self) => self -> IO Bool
eventGetDefaultPrevented self
  = toBool <$>
      ({# call webkit_dom_event_get_default_prevented #} (toEvent self))
 
eventGetSrcElement ::
                   (EventClass self) => self -> IO (Maybe EventTarget)
eventGetSrcElement self
  = maybeNull (makeNewGObject mkEventTarget)
      ({# call webkit_dom_event_get_src_element #} (toEvent self))
 
eventSetReturnValue :: (EventClass self) => self -> Bool -> IO ()
eventSetReturnValue self val
  = {# call webkit_dom_event_set_return_value #} (toEvent self)
      (fromBool val)
 
eventGetReturnValue :: (EventClass self) => self -> IO Bool
eventGetReturnValue self
  = toBool <$>
      ({# call webkit_dom_event_get_return_value #} (toEvent self))
 
eventSetCancelBubble :: (EventClass self) => self -> Bool -> IO ()
eventSetCancelBubble self val
  = {# call webkit_dom_event_set_cancel_bubble #} (toEvent self)
      (fromBool val)
 
eventGetCancelBubble :: (EventClass self) => self -> IO Bool
eventGetCancelBubble self
  = toBool <$>
      ({# call webkit_dom_event_get_cancel_bubble #} (toEvent self))
