module Graphics.UI.Gtk.WebKit.DOM.HTMLScriptElement(
setText,
getText,
setHtmlFor,
getHtmlFor,
setEvent,
getEvent,
setCharset,
getCharset,
setAsync,
getAsync,
setDefer,
getDefer,
setSrc,
getSrc,
setCrossOrigin,
getCrossOrigin,
setNonce,
getNonce,
HTMLScriptElement,
castToHTMLScriptElement,
gTypeHTMLScriptElement,
HTMLScriptElementClass,
toHTMLScriptElement,
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

 
setText ::
        (MonadIO m, HTMLScriptElementClass self, GlibString string) =>
          self -> string -> m ()
setText self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_script_element_set_text #}
             (toHTMLScriptElement self)
             valPtr)
 
getText ::
        (MonadIO m, HTMLScriptElementClass self, GlibString string) =>
          self -> m string
getText self
  = liftIO
      (({# call webkit_dom_html_script_element_get_text #}
          (toHTMLScriptElement self))
         >>=
         readUTFString)
 
setHtmlFor ::
           (MonadIO m, HTMLScriptElementClass self, GlibString string) =>
             self -> string -> m ()
setHtmlFor self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_script_element_set_html_for #}
             (toHTMLScriptElement self)
             valPtr)
 
getHtmlFor ::
           (MonadIO m, HTMLScriptElementClass self, GlibString string) =>
             self -> m string
getHtmlFor self
  = liftIO
      (({# call webkit_dom_html_script_element_get_html_for #}
          (toHTMLScriptElement self))
         >>=
         readUTFString)
 
setEvent ::
         (MonadIO m, HTMLScriptElementClass self, GlibString string) =>
           self -> string -> m ()
setEvent self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_script_element_set_event #}
             (toHTMLScriptElement self)
             valPtr)
 
getEvent ::
         (MonadIO m, HTMLScriptElementClass self, GlibString string) =>
           self -> m string
getEvent self
  = liftIO
      (({# call webkit_dom_html_script_element_get_event #}
          (toHTMLScriptElement self))
         >>=
         readUTFString)
 
setCharset ::
           (MonadIO m, HTMLScriptElementClass self, GlibString string) =>
             self -> string -> m ()
setCharset self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_script_element_set_charset #}
             (toHTMLScriptElement self)
             valPtr)
 
getCharset ::
           (MonadIO m, HTMLScriptElementClass self, GlibString string) =>
             self -> m string
getCharset self
  = liftIO
      (({# call webkit_dom_html_script_element_get_charset #}
          (toHTMLScriptElement self))
         >>=
         readUTFString)
 
setAsync ::
         (MonadIO m, HTMLScriptElementClass self) => self -> Bool -> m ()
setAsync self val
  = liftIO
      ({# call webkit_dom_html_script_element_set_async #}
         (toHTMLScriptElement self)
         (fromBool val))
 
getAsync ::
         (MonadIO m, HTMLScriptElementClass self) => self -> m Bool
getAsync self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_script_element_get_async #}
            (toHTMLScriptElement self)))
 
setDefer ::
         (MonadIO m, HTMLScriptElementClass self) => self -> Bool -> m ()
setDefer self val
  = liftIO
      ({# call webkit_dom_html_script_element_set_defer #}
         (toHTMLScriptElement self)
         (fromBool val))
 
getDefer ::
         (MonadIO m, HTMLScriptElementClass self) => self -> m Bool
getDefer self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_script_element_get_defer #}
            (toHTMLScriptElement self)))
 
setSrc ::
       (MonadIO m, HTMLScriptElementClass self, GlibString string) =>
         self -> string -> m ()
setSrc self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_script_element_set_src #}
             (toHTMLScriptElement self)
             valPtr)
 
getSrc ::
       (MonadIO m, HTMLScriptElementClass self, GlibString string) =>
         self -> m string
getSrc self
  = liftIO
      (({# call webkit_dom_html_script_element_get_src #}
          (toHTMLScriptElement self))
         >>=
         readUTFString)
 
setCrossOrigin ::
               (MonadIO m, HTMLScriptElementClass self, GlibString string) =>
                 self -> string -> m ()
setCrossOrigin self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_script_element_set_cross_origin #}
             (toHTMLScriptElement self)
             valPtr)
 
getCrossOrigin ::
               (MonadIO m, HTMLScriptElementClass self, GlibString string) =>
                 self -> m string
getCrossOrigin self
  = liftIO
      (({# call webkit_dom_html_script_element_get_cross_origin #}
          (toHTMLScriptElement self))
         >>=
         readUTFString)
 
setNonce ::
         (MonadIO m, HTMLScriptElementClass self, GlibString string) =>
           self -> string -> m ()
setNonce self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_script_element_set_nonce #}
             (toHTMLScriptElement self)
             valPtr)
 
getNonce ::
         (MonadIO m, HTMLScriptElementClass self, GlibString string) =>
           self -> m string
getNonce self
  = liftIO
      (({# call webkit_dom_html_script_element_get_nonce #}
          (toHTMLScriptElement self))
         >>=
         readUTFString)
