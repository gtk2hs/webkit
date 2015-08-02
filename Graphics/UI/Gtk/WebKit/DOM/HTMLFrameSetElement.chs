module Graphics.UI.Gtk.WebKit.DOM.HTMLFrameSetElement(
setCols,
getCols,
setRows,
getRows,
beforeUnload,
hashChange,
message,
offline,
online,
popState,
resize,
storage,
unload,
orientationChange,
blur,
error,
focus,
load,
HTMLFrameSetElement,
castToHTMLFrameSetElement,
gTypeHTMLFrameSetElement,
HTMLFrameSetElementClass,
toHTMLFrameSetElement,
) where
import Prelude hiding (drop, error, print)
import Data.Typeable (Typeable)
import Foreign.Marshal (maybePeek, maybeWith)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
{#import Graphics.UI.Gtk.WebKit.Types#}
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
setCols ::
        (MonadIO m, HTMLFrameSetElementClass self, GlibString string) =>
          self -> string -> m ()
setCols self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_frame_set_element_set_cols #}
             (toHTMLFrameSetElement self)
             valPtr)
 
getCols ::
        (MonadIO m, HTMLFrameSetElementClass self, GlibString string) =>
          self -> m string
getCols self
  = liftIO
      (({# call webkit_dom_html_frame_set_element_get_cols #}
          (toHTMLFrameSetElement self))
         >>=
         readUTFString)
 
setRows ::
        (MonadIO m, HTMLFrameSetElementClass self, GlibString string) =>
          self -> string -> m ()
setRows self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_frame_set_element_set_rows #}
             (toHTMLFrameSetElement self)
             valPtr)
 
getRows ::
        (MonadIO m, HTMLFrameSetElementClass self, GlibString string) =>
          self -> m string
getRows self
  = liftIO
      (({# call webkit_dom_html_frame_set_element_get_rows #}
          (toHTMLFrameSetElement self))
         >>=
         readUTFString)
 
beforeUnload ::
             (HTMLFrameSetElementClass self) => EventName self Event
beforeUnload = EventName "beforeunload"
 
hashChange ::
           (HTMLFrameSetElementClass self) => EventName self Event
hashChange = EventName "hashchange"
 
message :: (HTMLFrameSetElementClass self) => EventName self Event
message = EventName "message"
 
offline :: (HTMLFrameSetElementClass self) => EventName self Event
offline = EventName "offline"
 
online :: (HTMLFrameSetElementClass self) => EventName self Event
online = EventName "online"
 
popState :: (HTMLFrameSetElementClass self) => EventName self Event
popState = EventName "popstate"
 
resize :: (HTMLFrameSetElementClass self) => EventName self UIEvent
resize = EventName "resize"
 
storage :: (HTMLFrameSetElementClass self) => EventName self Event
storage = EventName "storage"
 
unload :: (HTMLFrameSetElementClass self) => EventName self UIEvent
unload = EventName "unload"
 
orientationChange ::
                  (HTMLFrameSetElementClass self) => EventName self Event
orientationChange = EventName "orientationchange"
 
blur :: (HTMLFrameSetElementClass self) => EventName self UIEvent
blur = EventName "blur"
 
error :: (HTMLFrameSetElementClass self) => EventName self UIEvent
error = EventName "error"
 
focus :: (HTMLFrameSetElementClass self) => EventName self UIEvent
focus = EventName "focus"
 
load :: (HTMLFrameSetElementClass self) => EventName self UIEvent
load = EventName "load"
