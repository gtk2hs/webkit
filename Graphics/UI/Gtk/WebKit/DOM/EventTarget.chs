module Graphics.UI.Gtk.WebKit.DOM.EventTarget(
addEventListener,
removeEventListener,
dispatchEvent,
EventTarget,
castToEventTarget,
gTypeEventTarget,
EventTargetClass,
toEventTarget,
) where
import Prelude hiding (drop, error, print)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
{#import Graphics.UI.Gtk.WebKit.Types#}
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
addEventListener ::
                 (MonadIO m, EventTargetClass self, EventListenerClass listener,
                  GlibString string) =>
                   self -> string -> Maybe listener -> Bool -> m ()
addEventListener self type' listener useCapture
  = liftIO
      (void $
         withUTFString type' $
           \ typePtr ->
             {# call webkit_dom_event_target_add_event_listener_with_closure #}
               (toEventTarget self)
               typePtr
           (maybe nullPtr (castPtr . unEventListener . toEventListener)
              listener)
           (fromBool useCapture))
 
removeEventListener ::
                    (MonadIO m, EventTargetClass self, EventListenerClass listener,
                     GlibString string) =>
                      self -> string -> Maybe listener -> Bool -> m ()
removeEventListener self type' listener useCapture
  = liftIO
      (void $
         withUTFString type' $
           \ typePtr ->
             {# call webkit_dom_event_target_remove_event_listener_with_closure
               #}
               (toEventTarget self)
               typePtr
           (maybe nullPtr (castPtr . unEventListener . toEventListener)
              listener)
           (fromBool useCapture))
 
dispatchEvent ::
              (MonadIO m, EventTargetClass self, EventClass event) =>
                self -> Maybe event -> m Bool
dispatchEvent self event
  = liftIO
      (toBool <$>
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_event_target_dispatch_event #}
                (toEventTarget self)
                (maybe (Event nullForeignPtr) toEvent event)
                errorPtr_))
