module Graphics.UI.Gtk.WebKit.DOM.MouseEvent(
initMouseEvent,
getScreenX,
getScreenY,
getClientX,
getClientY,
getCtrlKey,
getShiftKey,
getAltKey,
getMetaKey,
getButton,
getRelatedTarget,
getMovementX,
getMovementY,
getOffsetX,
getOffsetY,
getX,
getY,
getFromElement,
getToElement,
MouseEvent,
castToMouseEvent,
gTypeMouseEvent,
MouseEventClass,
toMouseEvent,
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

 
initMouseEvent ::
               (MonadIO m, MouseEventClass self, DOMWindowClass view,
                EventTargetClass relatedTarget, GlibString string) =>
                 self ->
                   string ->
                     Bool ->
                       Bool ->
                         Maybe view ->
                           Int ->
                             Int ->
                               Int ->
                                 Int ->
                                   Int ->
                                     Bool ->
                                       Bool -> Bool -> Bool -> Word -> Maybe relatedTarget -> m ()
initMouseEvent self type' canBubble cancelable view detail screenX
  screenY clientX clientY ctrlKey altKey shiftKey metaKey button
  relatedTarget
  = liftIO
      (withUTFString type' $
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
         (maybe (EventTarget nullForeignPtr) toEventTarget relatedTarget))
 
getScreenX :: (MonadIO m, MouseEventClass self) => self -> m Int
getScreenX self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_mouse_event_get_screen_x #}
            (toMouseEvent self)))
 
getScreenY :: (MonadIO m, MouseEventClass self) => self -> m Int
getScreenY self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_mouse_event_get_screen_y #}
            (toMouseEvent self)))
 
getClientX :: (MonadIO m, MouseEventClass self) => self -> m Int
getClientX self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_mouse_event_get_client_x #}
            (toMouseEvent self)))
 
getClientY :: (MonadIO m, MouseEventClass self) => self -> m Int
getClientY self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_mouse_event_get_client_y #}
            (toMouseEvent self)))
 
getCtrlKey :: (MonadIO m, MouseEventClass self) => self -> m Bool
getCtrlKey self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_mouse_event_get_ctrl_key #}
            (toMouseEvent self)))
 
getShiftKey :: (MonadIO m, MouseEventClass self) => self -> m Bool
getShiftKey self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_mouse_event_get_shift_key #}
            (toMouseEvent self)))
 
getAltKey :: (MonadIO m, MouseEventClass self) => self -> m Bool
getAltKey self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_mouse_event_get_alt_key #}
            (toMouseEvent self)))
 
getMetaKey :: (MonadIO m, MouseEventClass self) => self -> m Bool
getMetaKey self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_mouse_event_get_meta_key #}
            (toMouseEvent self)))
 
getButton :: (MonadIO m, MouseEventClass self) => self -> m Word
getButton self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_mouse_event_get_button #} (toMouseEvent self)))
 
getRelatedTarget ::
                 (MonadIO m, MouseEventClass self) => self -> m (Maybe EventTarget)
getRelatedTarget self
  = liftIO
      (maybeNull (makeNewGObject mkEventTarget)
         ({# call webkit_dom_mouse_event_get_related_target #}
            (toMouseEvent self)))
 
getMovementX :: (MonadIO m, MouseEventClass self) => self -> m Int
getMovementX self
  = liftIO
      (fromIntegral <$>
#if WEBKIT_CHECK_VERSION(2,6,0)
         ({# call webkit_dom_mouse_event_get_movement_x #}
#else
         ({# call webkit_dom_mouse_event_get_webkit_movement_x #}
#endif
            (toMouseEvent self)))
 
getMovementY :: (MonadIO m, MouseEventClass self) => self -> m Int
getMovementY self
  = liftIO
      (fromIntegral <$>
#if WEBKIT_CHECK_VERSION(2,6,0)
         ({# call webkit_dom_mouse_event_get_movement_y #}
#else
         ({# call webkit_dom_mouse_event_get_webkit_movement_y #}
#endif
            (toMouseEvent self)))
 
getOffsetX :: (MonadIO m, MouseEventClass self) => self -> m Int
getOffsetX self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_mouse_event_get_offset_x #}
            (toMouseEvent self)))
 
getOffsetY :: (MonadIO m, MouseEventClass self) => self -> m Int
getOffsetY self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_mouse_event_get_offset_y #}
            (toMouseEvent self)))
 
getX :: (MonadIO m, MouseEventClass self) => self -> m Int
getX self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_mouse_event_get_x #} (toMouseEvent self)))
 
getY :: (MonadIO m, MouseEventClass self) => self -> m Int
getY self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_mouse_event_get_y #} (toMouseEvent self)))
 
getFromElement ::
               (MonadIO m, MouseEventClass self) => self -> m (Maybe Node)
getFromElement self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_mouse_event_get_from_element #}
            (toMouseEvent self)))
 
getToElement ::
             (MonadIO m, MouseEventClass self) => self -> m (Maybe Node)
getToElement self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_mouse_event_get_to_element #}
            (toMouseEvent self)))
