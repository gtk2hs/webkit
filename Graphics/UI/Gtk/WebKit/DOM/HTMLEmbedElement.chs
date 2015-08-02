module Graphics.UI.Gtk.WebKit.DOM.HTMLEmbedElement(
setAlign,
getAlign,
setHeight,
getHeight,
setName,
getName,
setSrc,
getSrc,
setWidth,
getWidth,
HTMLEmbedElement,
castToHTMLEmbedElement,
gTypeHTMLEmbedElement,
HTMLEmbedElementClass,
toHTMLEmbedElement,
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

 
setAlign ::
         (MonadIO m, HTMLEmbedElementClass self, GlibString string) =>
           self -> string -> m ()
setAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_embed_element_set_align #}
             (toHTMLEmbedElement self)
             valPtr)
 
getAlign ::
         (MonadIO m, HTMLEmbedElementClass self, GlibString string) =>
           self -> m string
getAlign self
  = liftIO
      (({# call webkit_dom_html_embed_element_get_align #}
          (toHTMLEmbedElement self))
         >>=
         readUTFString)
 
setHeight ::
          (MonadIO m, HTMLEmbedElementClass self) => self -> Int -> m ()
setHeight self val
  = liftIO
      ({# call webkit_dom_html_embed_element_set_height #}
         (toHTMLEmbedElement self)
         (fromIntegral val))
 
getHeight ::
          (MonadIO m, HTMLEmbedElementClass self) => self -> m Int
getHeight self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_embed_element_get_height #}
            (toHTMLEmbedElement self)))
 
setName ::
        (MonadIO m, HTMLEmbedElementClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_embed_element_set_name #}
             (toHTMLEmbedElement self)
             valPtr)
 
getName ::
        (MonadIO m, HTMLEmbedElementClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_html_embed_element_get_name #}
          (toHTMLEmbedElement self))
         >>=
         readUTFString)
 
setSrc ::
       (MonadIO m, HTMLEmbedElementClass self, GlibString string) =>
         self -> string -> m ()
setSrc self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_embed_element_set_src #}
             (toHTMLEmbedElement self)
             valPtr)
 
getSrc ::
       (MonadIO m, HTMLEmbedElementClass self, GlibString string) =>
         self -> m string
getSrc self
  = liftIO
      (({# call webkit_dom_html_embed_element_get_src #}
          (toHTMLEmbedElement self))
         >>=
         readUTFString)
 
setWidth ::
         (MonadIO m, HTMLEmbedElementClass self) => self -> Int -> m ()
setWidth self val
  = liftIO
      ({# call webkit_dom_html_embed_element_set_width #}
         (toHTMLEmbedElement self)
         (fromIntegral val))
 
getWidth ::
         (MonadIO m, HTMLEmbedElementClass self) => self -> m Int
getWidth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_embed_element_get_width #}
            (toHTMLEmbedElement self)))
