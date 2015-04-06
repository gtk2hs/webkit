module Graphics.UI.Gtk.WebKit.DOM.HTMLBodyElement(
setALink,
getALink,
setBackground,
getBackground,
setBgColor,
getBgColor,
setLink,
getLink,
setText,
getText,
setVLink,
getVLink,
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
HTMLBodyElement,
castToHTMLBodyElement,
gTypeHTMLBodyElement,
HTMLBodyElementClass,
toHTMLBodyElement,
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
import Graphics.UI.Gtk.WebKit.DOM.EventM
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
setALink ::
         (MonadIO m, HTMLBodyElementClass self, GlibString string) =>
           self -> string -> m ()
setALink self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_body_element_set_a_link #}
             (toHTMLBodyElement self)
             valPtr)
 
getALink ::
         (MonadIO m, HTMLBodyElementClass self, GlibString string) =>
           self -> m string
getALink self
  = liftIO
      (({# call webkit_dom_html_body_element_get_a_link #}
          (toHTMLBodyElement self))
         >>=
         readUTFString)
 
setBackground ::
              (MonadIO m, HTMLBodyElementClass self, GlibString string) =>
                self -> string -> m ()
setBackground self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_body_element_set_background #}
             (toHTMLBodyElement self)
             valPtr)
 
getBackground ::
              (MonadIO m, HTMLBodyElementClass self, GlibString string) =>
                self -> m string
getBackground self
  = liftIO
      (({# call webkit_dom_html_body_element_get_background #}
          (toHTMLBodyElement self))
         >>=
         readUTFString)
 
setBgColor ::
           (MonadIO m, HTMLBodyElementClass self, GlibString string) =>
             self -> string -> m ()
setBgColor self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_body_element_set_bg_color #}
             (toHTMLBodyElement self)
             valPtr)
 
getBgColor ::
           (MonadIO m, HTMLBodyElementClass self, GlibString string) =>
             self -> m string
getBgColor self
  = liftIO
      (({# call webkit_dom_html_body_element_get_bg_color #}
          (toHTMLBodyElement self))
         >>=
         readUTFString)
 
setLink ::
        (MonadIO m, HTMLBodyElementClass self, GlibString string) =>
          self -> string -> m ()
setLink self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_body_element_set_link #}
             (toHTMLBodyElement self)
             valPtr)
 
getLink ::
        (MonadIO m, HTMLBodyElementClass self, GlibString string) =>
          self -> m string
getLink self
  = liftIO
      (({# call webkit_dom_html_body_element_get_link #}
          (toHTMLBodyElement self))
         >>=
         readUTFString)
 
setText ::
        (MonadIO m, HTMLBodyElementClass self, GlibString string) =>
          self -> string -> m ()
setText self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_body_element_set_text #}
             (toHTMLBodyElement self)
             valPtr)
 
getText ::
        (MonadIO m, HTMLBodyElementClass self, GlibString string) =>
          self -> m string
getText self
  = liftIO
      (({# call webkit_dom_html_body_element_get_text #}
          (toHTMLBodyElement self))
         >>=
         readUTFString)
 
setVLink ::
         (MonadIO m, HTMLBodyElementClass self, GlibString string) =>
           self -> string -> m ()
setVLink self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_body_element_set_v_link #}
             (toHTMLBodyElement self)
             valPtr)
 
getVLink ::
         (MonadIO m, HTMLBodyElementClass self, GlibString string) =>
           self -> m string
getVLink self
  = liftIO
      (({# call webkit_dom_html_body_element_get_v_link #}
          (toHTMLBodyElement self))
         >>=
         readUTFString)
 
beforeUnload :: (HTMLBodyElementClass self) => EventName self Event
beforeUnload = EventName "beforeunload"
 
hashChange :: (HTMLBodyElementClass self) => EventName self Event
hashChange = EventName "hashchange"
 
message :: (HTMLBodyElementClass self) => EventName self Event
message = EventName "message"
 
offline :: (HTMLBodyElementClass self) => EventName self Event
offline = EventName "offline"
 
online :: (HTMLBodyElementClass self) => EventName self Event
online = EventName "online"
 
popState :: (HTMLBodyElementClass self) => EventName self Event
popState = EventName "popstate"
 
resize :: (HTMLBodyElementClass self) => EventName self UIEvent
resize = EventName "resize"
 
storage :: (HTMLBodyElementClass self) => EventName self Event
storage = EventName "storage"
 
unload :: (HTMLBodyElementClass self) => EventName self UIEvent
unload = EventName "unload"
 
orientationChange ::
                  (HTMLBodyElementClass self) => EventName self Event
orientationChange = EventName "orientationchange"
 
blur :: (HTMLBodyElementClass self) => EventName self UIEvent
blur = EventName "blur"
 
error :: (HTMLBodyElementClass self) => EventName self UIEvent
error = EventName "error"
 
focus :: (HTMLBodyElementClass self) => EventName self UIEvent
focus = EventName "focus"
 
load :: (HTMLBodyElementClass self) => EventName self UIEvent
load = EventName "load"
