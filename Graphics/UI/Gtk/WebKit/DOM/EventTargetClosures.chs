{-# LANGUAGE CPP #-}
{-# CFILES events.c #-}
module Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
       (EventName(..), SaferEventListener(..), EventListener(..), unEventListener, EventListenerClass(..),
       eventListenerNew, eventListenerNewAsync, eventListenerNewSync, eventListenerRelease) where
import Control.Monad.Reader (ReaderT)
import System.Glib.FFI (newStablePtr, freeStablePtr, StablePtr, Ptr(..), toBool, CInt(..), CChar,
        withForeignPtr, fromBool)
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Control.Monad (void)

newtype EventName t e = EventName String
newtype SaferEventListener t e = SaferEventListener EventListener

{# pointer *GClosure newtype #}

data EventListener = EventListener (Ptr GClosure) (StablePtr (Ptr GObject -> Ptr GObject -> IO ()))

unEventListener (EventListener p _) = p

class EventListenerClass a where
  toEventListener :: a -> EventListener

instance EventListenerClass EventListener where
  toEventListener a = a

foreign import ccall unsafe "gtk2hs_closure_new"
  gtk2hs_closure_new :: StablePtr a -> IO (Ptr GClosure)

eventListenerNew :: EventClass event => (event -> IO ()) -> IO EventListener
eventListenerNew callback = do
  sptr <- newStablePtr action
  gclosurePtr <- gtk2hs_closure_new sptr
  return $ EventListener gclosurePtr sptr
  where action :: Ptr GObject -> Ptr GObject -> IO ()
        action obj1 obj2 =
          failOnGError $
          makeNewGObject (GObject, objectUnrefFromMainloop) (return obj2) >>= \obj2' ->
          makeNewGObject (GObject, objectUnrefFromMainloop) (return obj1) >>= \obj1' ->
          callback (unsafeCastGObject obj2')

eventListenerNewAsync :: EventClass event => (event -> IO ()) -> IO EventListener
eventListenerNewAsync = eventListenerNew

eventListenerNewSync :: EventClass event => (event -> IO ()) -> IO EventListener
eventListenerNewSync = eventListenerNew

foreign import ccall unsafe "g_closure_unref"
  g_closure_unref :: Ptr GClosure -> IO ()

eventListenerRelease :: EventListener -> IO ()
eventListenerRelease (EventListener gclosurePtr _) = g_closure_unref gclosurePtr

