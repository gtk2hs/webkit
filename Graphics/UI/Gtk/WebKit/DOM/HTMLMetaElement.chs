module Graphics.UI.Gtk.WebKit.DOM.HTMLMetaElement(
setContent,
getContent,
setHttpEquiv,
getHttpEquiv,
setName,
getName,
setScheme,
getScheme,
HTMLMetaElement,
castToHTMLMetaElement,
gTypeHTMLMetaElement,
HTMLMetaElementClass,
toHTMLMetaElement,
) where
import Prelude hiding (drop, error, print)
import Data.Typeable (Typeable)
import Foreign.Marshal (maybePeek, maybeWith)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CLLong(..), CULLong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
{#import Graphics.UI.Gtk.WebKit.Types#}
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
setContent ::
           (MonadIO m, HTMLMetaElementClass self, GlibString string) =>
             self -> string -> m ()
setContent self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_meta_element_set_content #}
             (toHTMLMetaElement self)
             valPtr)
 
getContent ::
           (MonadIO m, HTMLMetaElementClass self, GlibString string) =>
             self -> m string
getContent self
  = liftIO
      (({# call webkit_dom_html_meta_element_get_content #}
          (toHTMLMetaElement self))
         >>=
         readUTFString)
 
setHttpEquiv ::
             (MonadIO m, HTMLMetaElementClass self, GlibString string) =>
               self -> string -> m ()
setHttpEquiv self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_meta_element_set_http_equiv #}
             (toHTMLMetaElement self)
             valPtr)
 
getHttpEquiv ::
             (MonadIO m, HTMLMetaElementClass self, GlibString string) =>
               self -> m string
getHttpEquiv self
  = liftIO
      (({# call webkit_dom_html_meta_element_get_http_equiv #}
          (toHTMLMetaElement self))
         >>=
         readUTFString)
 
setName ::
        (MonadIO m, HTMLMetaElementClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_meta_element_set_name #}
             (toHTMLMetaElement self)
             valPtr)
 
getName ::
        (MonadIO m, HTMLMetaElementClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_html_meta_element_get_name #}
          (toHTMLMetaElement self))
         >>=
         readUTFString)
 
setScheme ::
          (MonadIO m, HTMLMetaElementClass self, GlibString string) =>
            self -> string -> m ()
setScheme self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_meta_element_set_scheme #}
             (toHTMLMetaElement self)
             valPtr)
 
getScheme ::
          (MonadIO m, HTMLMetaElementClass self, GlibString string) =>
            self -> m string
getScheme self
  = liftIO
      (({# call webkit_dom_html_meta_element_get_scheme #}
          (toHTMLMetaElement self))
         >>=
         readUTFString)
