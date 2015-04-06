module Graphics.UI.Gtk.WebKit.DOM.HTMLBaseFontElement(
setColor,
getColor,
setFace,
getFace,
setSize,
getSize,
HTMLBaseFontElement,
castToHTMLBaseFontElement,
gTypeHTMLBaseFontElement,
HTMLBaseFontElementClass,
toHTMLBaseFontElement,
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
         (MonadIO m, HTMLBaseFontElementClass self, GlibString string) =>
           self -> string -> m ()
setColor self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_base_font_element_set_color #}
             (toHTMLBaseFontElement self)
             valPtr)
 
getColor ::
         (MonadIO m, HTMLBaseFontElementClass self, GlibString string) =>
           self -> m string
getColor self
  = liftIO
      (({# call webkit_dom_html_base_font_element_get_color #}
          (toHTMLBaseFontElement self))
         >>=
         readUTFString)
 
setFace ::
        (MonadIO m, HTMLBaseFontElementClass self, GlibString string) =>
          self -> string -> m ()
setFace self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_base_font_element_set_face #}
             (toHTMLBaseFontElement self)
             valPtr)
 
getFace ::
        (MonadIO m, HTMLBaseFontElementClass self, GlibString string) =>
          self -> m string
getFace self
  = liftIO
      (({# call webkit_dom_html_base_font_element_get_face #}
          (toHTMLBaseFontElement self))
         >>=
         readUTFString)
 
setSize ::
        (MonadIO m, HTMLBaseFontElementClass self) => self -> Int -> m ()
setSize self val
  = liftIO
      ({# call webkit_dom_html_base_font_element_set_size #}
         (toHTMLBaseFontElement self)
         (fromIntegral val))
 
getSize ::
        (MonadIO m, HTMLBaseFontElementClass self) => self -> m Int
getSize self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_base_font_element_get_size #}
            (toHTMLBaseFontElement self)))
