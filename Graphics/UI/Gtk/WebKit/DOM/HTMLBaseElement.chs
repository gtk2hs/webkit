module Graphics.UI.Gtk.WebKit.DOM.HTMLBaseElement(
setHref,
getHref,
setTarget,
getTarget,
HTMLBaseElement,
castToHTMLBaseElement,
gTypeHTMLBaseElement,
HTMLBaseElementClass,
toHTMLBaseElement,
) where
import Prelude hiding (drop, error, print)
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

 
setHref ::
        (MonadIO m, HTMLBaseElementClass self, GlibString string) =>
          self -> string -> m ()
setHref self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_base_element_set_href #}
             (toHTMLBaseElement self)
             valPtr)
 
getHref ::
        (MonadIO m, HTMLBaseElementClass self, GlibString string) =>
          self -> m string
getHref self
  = liftIO
      (({# call webkit_dom_html_base_element_get_href #}
          (toHTMLBaseElement self))
         >>=
         readUTFString)
 
setTarget ::
          (MonadIO m, HTMLBaseElementClass self, GlibString string) =>
            self -> string -> m ()
setTarget self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_base_element_set_target #}
             (toHTMLBaseElement self)
             valPtr)
 
getTarget ::
          (MonadIO m, HTMLBaseElementClass self, GlibString string) =>
            self -> m string
getTarget self
  = liftIO
      (({# call webkit_dom_html_base_element_get_target #}
          (toHTMLBaseElement self))
         >>=
         readUTFString)
