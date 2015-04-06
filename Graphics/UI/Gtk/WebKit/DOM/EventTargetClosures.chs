{-# LANGUAGE CPP #-}
{-# CFILES events.c #-}
module Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
       (EventName(..), SaferEventListener(..), EventListener(..), unEventListener, EventListenerClass(..), eventListenerNew) where
import Control.Monad.Reader (ReaderT)
import System.Glib.FFI (newStablePtr, StablePtr, Ptr(..), toBool, CInt(..), CChar,
        withForeignPtr, fromBool)
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Control.Monad (void)

newtype EventName t e = EventName String
newtype SaferEventListener t e = SaferEventListener EventListener

{# pointer *GClosure as EventListener newtype #}

unEventListener (EventListener p) = p

class EventListenerClass a where
  toEventListener :: a -> EventListener

instance EventListenerClass EventListener where
  toEventListener a = a

foreign import ccall unsafe "gtk2hs_closure_new"
  gtk2hs_closure_new :: StablePtr a -> IO (Ptr EventListener)

eventListenerNew :: EventClass event => (event -> IO ()) -> IO EventListener
eventListenerNew callback = do -- EventListener . castRef <$> syncCallback1 AlwaysRetain True (callback . unsafeCastGObject . GObject)
  sptr <- newStablePtr action
  gclosurePtr <- gtk2hs_closure_new sptr
  return $ EventListener gclosurePtr
  where action :: Ptr GObject -> Ptr GObject -> IO ()
        action obj1 obj2 =
          failOnGError $
          makeNewGObject (GObject, objectUnrefFromMainloop) (return obj2) >>= \obj2' ->
          makeNewGObject (GObject, objectUnrefFromMainloop) (return obj1) >>= \obj1' ->
          callback (unsafeCastGObject obj2')

