module Graphics.UI.Gtk.WebKit.DOM.HTMLIFrameElement(
setAlign,
getAlign,
setFrameBorder,
getFrameBorder,
setHeight,
getHeight,
setLongDesc,
getLongDesc,
setMarginHeight,
getMarginHeight,
setMarginWidth,
getMarginWidth,
setName,
getName,
setSandbox,
getSandbox,
setScrolling,
getScrolling,
setSrc,
getSrc,
#if WEBKIT_CHECK_VERSION(2,2,2)
setSrcdoc,
getSrcdoc,
#endif
setWidth,
getWidth,
getContentDocument,
getContentWindow,
HTMLIFrameElement,
castToHTMLIFrameElement,
gTypeHTMLIFrameElement,
HTMLIFrameElementClass,
toHTMLIFrameElement,
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

 
setAlign ::
         (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
           self -> string -> m ()
setAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_iframe_element_set_align #}
             (toHTMLIFrameElement self)
             valPtr)
 
getAlign ::
         (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
           self -> m string
getAlign self
  = liftIO
      (({# call webkit_dom_html_iframe_element_get_align #}
          (toHTMLIFrameElement self))
         >>=
         readUTFString)
 
setFrameBorder ::
               (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
                 self -> string -> m ()
setFrameBorder self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_iframe_element_set_frame_border #}
             (toHTMLIFrameElement self)
             valPtr)
 
getFrameBorder ::
               (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
                 self -> m string
getFrameBorder self
  = liftIO
      (({# call webkit_dom_html_iframe_element_get_frame_border #}
          (toHTMLIFrameElement self))
         >>=
         readUTFString)
 
setHeight ::
          (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
            self -> string -> m ()
setHeight self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_iframe_element_set_height #}
             (toHTMLIFrameElement self)
             valPtr)
 
getHeight ::
          (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
            self -> m string
getHeight self
  = liftIO
      (({# call webkit_dom_html_iframe_element_get_height #}
          (toHTMLIFrameElement self))
         >>=
         readUTFString)
 
setLongDesc ::
            (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
              self -> string -> m ()
setLongDesc self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_iframe_element_set_long_desc #}
             (toHTMLIFrameElement self)
             valPtr)
 
getLongDesc ::
            (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
              self -> m string
getLongDesc self
  = liftIO
      (({# call webkit_dom_html_iframe_element_get_long_desc #}
          (toHTMLIFrameElement self))
         >>=
         readUTFString)
 
setMarginHeight ::
                (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
                  self -> string -> m ()
setMarginHeight self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_iframe_element_set_margin_height #}
             (toHTMLIFrameElement self)
             valPtr)
 
getMarginHeight ::
                (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
                  self -> m string
getMarginHeight self
  = liftIO
      (({# call webkit_dom_html_iframe_element_get_margin_height #}
          (toHTMLIFrameElement self))
         >>=
         readUTFString)
 
setMarginWidth ::
               (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
                 self -> string -> m ()
setMarginWidth self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_iframe_element_set_margin_width #}
             (toHTMLIFrameElement self)
             valPtr)
 
getMarginWidth ::
               (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
                 self -> m string
getMarginWidth self
  = liftIO
      (({# call webkit_dom_html_iframe_element_get_margin_width #}
          (toHTMLIFrameElement self))
         >>=
         readUTFString)
 
setName ::
        (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_iframe_element_set_name #}
             (toHTMLIFrameElement self)
             valPtr)
 
getName ::
        (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_html_iframe_element_get_name #}
          (toHTMLIFrameElement self))
         >>=
         readUTFString)
 
setSandbox ::
           (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
             self -> string -> m ()
setSandbox self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_iframe_element_set_sandbox #}
             (toHTMLIFrameElement self)
             valPtr)
 
getSandbox ::
           (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
             self -> m string
getSandbox self
  = liftIO
      (({# call webkit_dom_html_iframe_element_get_sandbox #}
          (toHTMLIFrameElement self))
         >>=
         readUTFString)
 
setScrolling ::
             (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
               self -> string -> m ()
setScrolling self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_iframe_element_set_scrolling #}
             (toHTMLIFrameElement self)
             valPtr)
 
getScrolling ::
             (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
               self -> m string
getScrolling self
  = liftIO
      (({# call webkit_dom_html_iframe_element_get_scrolling #}
          (toHTMLIFrameElement self))
         >>=
         readUTFString)
 
setSrc ::
       (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
         self -> string -> m ()
setSrc self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_iframe_element_set_src #}
             (toHTMLIFrameElement self)
             valPtr)
 
getSrc ::
       (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
         self -> m string
getSrc self
  = liftIO
      (({# call webkit_dom_html_iframe_element_get_src #}
          (toHTMLIFrameElement self))
         >>=
         readUTFString)

#if WEBKIT_CHECK_VERSION(2,2,2) 
setSrcdoc ::
          (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
            self -> string -> m ()
setSrcdoc self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_iframe_element_set_srcdoc #}
             (toHTMLIFrameElement self)
             valPtr)
 
getSrcdoc ::
          (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
            self -> m string
getSrcdoc self
  = liftIO
      (({# call webkit_dom_html_iframe_element_get_srcdoc #}
          (toHTMLIFrameElement self))
         >>=
         readUTFString)
#endif
 
setWidth ::
         (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
           self -> string -> m ()
setWidth self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_iframe_element_set_width #}
             (toHTMLIFrameElement self)
             valPtr)
 
getWidth ::
         (MonadIO m, HTMLIFrameElementClass self, GlibString string) =>
           self -> m string
getWidth self
  = liftIO
      (({# call webkit_dom_html_iframe_element_get_width #}
          (toHTMLIFrameElement self))
         >>=
         readUTFString)
 
getContentDocument ::
                   (MonadIO m, HTMLIFrameElementClass self) =>
                     self -> m (Maybe Document)
getContentDocument self
  = liftIO
      (maybeNull (makeNewGObject mkDocument)
         ({# call webkit_dom_html_iframe_element_get_content_document #}
            (toHTMLIFrameElement self)))
 
getContentWindow ::
                 (MonadIO m, HTMLIFrameElementClass self) =>
                   self -> m (Maybe Window)
getContentWindow self
  = liftIO
      (maybeNull (makeNewGObject mkWindow)
         ({# call webkit_dom_html_iframe_element_get_content_window #}
            (toHTMLIFrameElement self)))
