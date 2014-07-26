{-# LANGUAGE CPP #-}
{-# CFILES events.c #-}
module Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
       (eventTargetAddEventListener) where
import System.Glib.FFI (newStablePtr, StablePtr, Ptr(..), toBool, CInt(..), CChar,
        withForeignPtr, fromBool)
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Control.Monad (void)

{# pointer *GClosure newtype #}

foreign import ccall unsafe "gtk2hs_closure_new"
  gtk2hs_closure_new :: StablePtr a -> IO (Ptr GClosure)

eventTargetAddEventListener ::
                         (GObjectClass self, EventClass event, GlibString string) =>
                           self -> string -> Bool -> (self -> event -> IO ()) -> IO (IO ())
eventTargetAddEventListener self eventName bubble user = do
  sptr <- newStablePtr action
  gclosurePtr <- gtk2hs_closure_new sptr
  toBool <$> (
    withUTFString eventName $ \ eventNamePtr ->
      {# call webkit_dom_event_target_add_event_listener_closure #}
        (unsafeCastGObject $ toGObject self)
        eventNamePtr
        (GClosure gclosurePtr)
        (fromBool bubble))
  return . void $
    withUTFString eventName $ \ eventNamePtr ->
      {# call webkit_dom_event_target_remove_event_listener_closure #}
        (unsafeCastGObject $ toGObject self)
        eventNamePtr
        (GClosure gclosurePtr)
        (fromBool bubble)
  where action :: Ptr GObject -> Ptr GObject -> IO ()
        action obj1 obj2 =
          failOnGError $
          makeNewGObject (GObject, objectUnrefFromMainloop) (return obj2) >>= \obj2' ->
          makeNewGObject (GObject, objectUnrefFromMainloop) (return obj1) >>= \obj1' ->
          user (unsafeCastGObject obj1') (unsafeCastGObject obj2')

