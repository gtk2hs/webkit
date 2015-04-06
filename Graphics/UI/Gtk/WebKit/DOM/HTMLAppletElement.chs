module Graphics.UI.Gtk.WebKit.DOM.HTMLAppletElement(
setAlign,
getAlign,
setAlt,
getAlt,
setArchive,
getArchive,
setCode,
getCode,
setCodeBase,
getCodeBase,
setHeight,
getHeight,
setHspace,
getHspace,
setName,
getName,
setObject,
getObject,
setVspace,
getVspace,
setWidth,
getWidth,
HTMLAppletElement,
castToHTMLAppletElement,
gTypeHTMLAppletElement,
HTMLAppletElementClass,
toHTMLAppletElement,
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
         (MonadIO m, HTMLAppletElementClass self, GlibString string) =>
           self -> string -> m ()
setAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_applet_element_set_align #}
             (toHTMLAppletElement self)
             valPtr)
 
getAlign ::
         (MonadIO m, HTMLAppletElementClass self, GlibString string) =>
           self -> m string
getAlign self
  = liftIO
      (({# call webkit_dom_html_applet_element_get_align #}
          (toHTMLAppletElement self))
         >>=
         readUTFString)
 
setAlt ::
       (MonadIO m, HTMLAppletElementClass self, GlibString string) =>
         self -> string -> m ()
setAlt self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_applet_element_set_alt #}
             (toHTMLAppletElement self)
             valPtr)
 
getAlt ::
       (MonadIO m, HTMLAppletElementClass self, GlibString string) =>
         self -> m string
getAlt self
  = liftIO
      (({# call webkit_dom_html_applet_element_get_alt #}
          (toHTMLAppletElement self))
         >>=
         readUTFString)
 
setArchive ::
           (MonadIO m, HTMLAppletElementClass self, GlibString string) =>
             self -> string -> m ()
setArchive self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_applet_element_set_archive #}
             (toHTMLAppletElement self)
             valPtr)
 
getArchive ::
           (MonadIO m, HTMLAppletElementClass self, GlibString string) =>
             self -> m string
getArchive self
  = liftIO
      (({# call webkit_dom_html_applet_element_get_archive #}
          (toHTMLAppletElement self))
         >>=
         readUTFString)
 
setCode ::
        (MonadIO m, HTMLAppletElementClass self, GlibString string) =>
          self -> string -> m ()
setCode self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_applet_element_set_code #}
             (toHTMLAppletElement self)
             valPtr)
 
getCode ::
        (MonadIO m, HTMLAppletElementClass self, GlibString string) =>
          self -> m string
getCode self
  = liftIO
      (({# call webkit_dom_html_applet_element_get_code #}
          (toHTMLAppletElement self))
         >>=
         readUTFString)
 
setCodeBase ::
            (MonadIO m, HTMLAppletElementClass self, GlibString string) =>
              self -> string -> m ()
setCodeBase self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_applet_element_set_code_base #}
             (toHTMLAppletElement self)
             valPtr)
 
getCodeBase ::
            (MonadIO m, HTMLAppletElementClass self, GlibString string) =>
              self -> m string
getCodeBase self
  = liftIO
      (({# call webkit_dom_html_applet_element_get_code_base #}
          (toHTMLAppletElement self))
         >>=
         readUTFString)
 
setHeight ::
          (MonadIO m, HTMLAppletElementClass self, GlibString string) =>
            self -> string -> m ()
setHeight self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_applet_element_set_height #}
             (toHTMLAppletElement self)
             valPtr)
 
getHeight ::
          (MonadIO m, HTMLAppletElementClass self, GlibString string) =>
            self -> m string
getHeight self
  = liftIO
      (({# call webkit_dom_html_applet_element_get_height #}
          (toHTMLAppletElement self))
         >>=
         readUTFString)
 
setHspace ::
          (MonadIO m, HTMLAppletElementClass self) => self -> Int -> m ()
setHspace self val
  = liftIO
      ({# call webkit_dom_html_applet_element_set_hspace #}
         (toHTMLAppletElement self)
         (fromIntegral val))
 
getHspace ::
          (MonadIO m, HTMLAppletElementClass self) => self -> m Int
getHspace self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_applet_element_get_hspace #}
            (toHTMLAppletElement self)))
 
setName ::
        (MonadIO m, HTMLAppletElementClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_applet_element_set_name #}
             (toHTMLAppletElement self)
             valPtr)
 
getName ::
        (MonadIO m, HTMLAppletElementClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_html_applet_element_get_name #}
          (toHTMLAppletElement self))
         >>=
         readUTFString)
 
setObject ::
          (MonadIO m, HTMLAppletElementClass self, GlibString string) =>
            self -> string -> m ()
setObject self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_applet_element_set_object #}
             (toHTMLAppletElement self)
             valPtr)
 
getObject ::
          (MonadIO m, HTMLAppletElementClass self, GlibString string) =>
            self -> m string
getObject self
  = liftIO
      (({# call webkit_dom_html_applet_element_get_object #}
          (toHTMLAppletElement self))
         >>=
         readUTFString)
 
setVspace ::
          (MonadIO m, HTMLAppletElementClass self) => self -> Int -> m ()
setVspace self val
  = liftIO
      ({# call webkit_dom_html_applet_element_set_vspace #}
         (toHTMLAppletElement self)
         (fromIntegral val))
 
getVspace ::
          (MonadIO m, HTMLAppletElementClass self) => self -> m Int
getVspace self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_applet_element_get_vspace #}
            (toHTMLAppletElement self)))
 
setWidth ::
         (MonadIO m, HTMLAppletElementClass self, GlibString string) =>
           self -> string -> m ()
setWidth self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_applet_element_set_width #}
             (toHTMLAppletElement self)
             valPtr)
 
getWidth ::
         (MonadIO m, HTMLAppletElementClass self, GlibString string) =>
           self -> m string
getWidth self
  = liftIO
      (({# call webkit_dom_html_applet_element_get_width #}
          (toHTMLAppletElement self))
         >>=
         readUTFString)
