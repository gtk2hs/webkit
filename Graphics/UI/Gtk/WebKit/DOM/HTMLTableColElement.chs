module Graphics.UI.Gtk.WebKit.DOM.HTMLTableColElement(
setAlign,
getAlign,
setCh,
getCh,
setChOff,
getChOff,
setSpan,
getSpan,
setVAlign,
getVAlign,
setWidth,
getWidth,
HTMLTableColElement,
castToHTMLTableColElement,
gTypeHTMLTableColElement,
HTMLTableColElementClass,
toHTMLTableColElement,
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

 
setAlign ::
         (MonadIO m, HTMLTableColElementClass self, GlibString string) =>
           self -> string -> m ()
setAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_col_element_set_align #}
             (toHTMLTableColElement self)
             valPtr)
 
getAlign ::
         (MonadIO m, HTMLTableColElementClass self, GlibString string) =>
           self -> m string
getAlign self
  = liftIO
      (({# call webkit_dom_html_table_col_element_get_align #}
          (toHTMLTableColElement self))
         >>=
         readUTFString)
 
setCh ::
      (MonadIO m, HTMLTableColElementClass self, GlibString string) =>
        self -> string -> m ()
setCh self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_col_element_set_ch #}
             (toHTMLTableColElement self)
             valPtr)
 
getCh ::
      (MonadIO m, HTMLTableColElementClass self, GlibString string) =>
        self -> m string
getCh self
  = liftIO
      (({# call webkit_dom_html_table_col_element_get_ch #}
          (toHTMLTableColElement self))
         >>=
         readUTFString)
 
setChOff ::
         (MonadIO m, HTMLTableColElementClass self, GlibString string) =>
           self -> string -> m ()
setChOff self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_col_element_set_ch_off #}
             (toHTMLTableColElement self)
             valPtr)
 
getChOff ::
         (MonadIO m, HTMLTableColElementClass self, GlibString string) =>
           self -> m string
getChOff self
  = liftIO
      (({# call webkit_dom_html_table_col_element_get_ch_off #}
          (toHTMLTableColElement self))
         >>=
         readUTFString)
 
setSpan ::
        (MonadIO m, HTMLTableColElementClass self) => self -> Int -> m ()
setSpan self val
  = liftIO
      ({# call webkit_dom_html_table_col_element_set_span #}
         (toHTMLTableColElement self)
         (fromIntegral val))
 
getSpan ::
        (MonadIO m, HTMLTableColElementClass self) => self -> m Int
getSpan self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_table_col_element_get_span #}
            (toHTMLTableColElement self)))
 
setVAlign ::
          (MonadIO m, HTMLTableColElementClass self, GlibString string) =>
            self -> string -> m ()
setVAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_col_element_set_v_align #}
             (toHTMLTableColElement self)
             valPtr)
 
getVAlign ::
          (MonadIO m, HTMLTableColElementClass self, GlibString string) =>
            self -> m string
getVAlign self
  = liftIO
      (({# call webkit_dom_html_table_col_element_get_v_align #}
          (toHTMLTableColElement self))
         >>=
         readUTFString)
 
setWidth ::
         (MonadIO m, HTMLTableColElementClass self, GlibString string) =>
           self -> string -> m ()
setWidth self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_col_element_set_width #}
             (toHTMLTableColElement self)
             valPtr)
 
getWidth ::
         (MonadIO m, HTMLTableColElementClass self, GlibString string) =>
           self -> m string
getWidth self
  = liftIO
      (({# call webkit_dom_html_table_col_element_get_width #}
          (toHTMLTableColElement self))
         >>=
         readUTFString)
