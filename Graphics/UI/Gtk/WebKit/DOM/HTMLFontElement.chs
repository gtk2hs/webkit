module Graphics.UI.Gtk.WebKit.DOM.HTMLFontElement(
setColor,
getColor,
setFace,
getFace,
setSize,
getSize,
HTMLFontElement,
castToHTMLFontElement,
gTypeHTMLFontElement,
HTMLFontElementClass,
toHTMLFontElement,
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

 
setColor ::
         (MonadIO m, HTMLFontElementClass self, GlibString string) =>
           self -> string -> m ()
setColor self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_font_element_set_color #}
             (toHTMLFontElement self)
             valPtr)
 
getColor ::
         (MonadIO m, HTMLFontElementClass self, GlibString string) =>
           self -> m string
getColor self
  = liftIO
      (({# call webkit_dom_html_font_element_get_color #}
          (toHTMLFontElement self))
         >>=
         readUTFString)
 
setFace ::
        (MonadIO m, HTMLFontElementClass self, GlibString string) =>
          self -> string -> m ()
setFace self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_font_element_set_face #}
             (toHTMLFontElement self)
             valPtr)
 
getFace ::
        (MonadIO m, HTMLFontElementClass self, GlibString string) =>
          self -> m string
getFace self
  = liftIO
      (({# call webkit_dom_html_font_element_get_face #}
          (toHTMLFontElement self))
         >>=
         readUTFString)
 
setSize ::
        (MonadIO m, HTMLFontElementClass self, GlibString string) =>
          self -> string -> m ()
setSize self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_font_element_set_size #}
             (toHTMLFontElement self)
             valPtr)
 
getSize ::
        (MonadIO m, HTMLFontElementClass self, GlibString string) =>
          self -> m string
getSize self
  = liftIO
      (({# call webkit_dom_html_font_element_get_size #}
          (toHTMLFontElement self))
         >>=
         readUTFString)
