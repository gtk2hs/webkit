module Graphics.UI.Gtk.WebKit.DOM.HTMLParamElement(
setName,
getName,
setValue,
getValue,
setValueType,
getValueType,
HTMLParamElement,
castToHTMLParamElement,
gTypeHTMLParamElement,
HTMLParamElementClass,
toHTMLParamElement,
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

 
setName ::
        (MonadIO m, HTMLParamElementClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_param_element_set_name #}
             (toHTMLParamElement self)
             valPtr)
 
getName ::
        (MonadIO m, HTMLParamElementClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_html_param_element_get_name #}
          (toHTMLParamElement self))
         >>=
         readUTFString)
 
setValue ::
         (MonadIO m, HTMLParamElementClass self, GlibString string) =>
           self -> string -> m ()
setValue self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_param_element_set_value #}
             (toHTMLParamElement self)
             valPtr)
 
getValue ::
         (MonadIO m, HTMLParamElementClass self, GlibString string) =>
           self -> m string
getValue self
  = liftIO
      (({# call webkit_dom_html_param_element_get_value #}
          (toHTMLParamElement self))
         >>=
         readUTFString)
 
setValueType ::
             (MonadIO m, HTMLParamElementClass self, GlibString string) =>
               self -> string -> m ()
setValueType self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_param_element_set_value_type #}
             (toHTMLParamElement self)
             valPtr)
 
getValueType ::
             (MonadIO m, HTMLParamElementClass self, GlibString string) =>
               self -> m string
getValueType self
  = liftIO
      (({# call webkit_dom_html_param_element_get_value_type #}
          (toHTMLParamElement self))
         >>=
         readUTFString)
