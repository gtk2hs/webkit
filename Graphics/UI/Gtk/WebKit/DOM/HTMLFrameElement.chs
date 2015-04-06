module Graphics.UI.Gtk.WebKit.DOM.HTMLFrameElement(
setFrameBorder,
getFrameBorder,
setLongDesc,
getLongDesc,
setMarginHeight,
getMarginHeight,
setMarginWidth,
getMarginWidth,
setName,
getName,
setNoResize,
getNoResize,
setScrolling,
getScrolling,
setSrc,
getSrc,
getContentDocument,
getContentWindow,
getWidth,
getHeight,
HTMLFrameElement,
castToHTMLFrameElement,
gTypeHTMLFrameElement,
HTMLFrameElementClass,
toHTMLFrameElement,
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

 
setFrameBorder ::
               (MonadIO m, HTMLFrameElementClass self, GlibString string) =>
                 self -> string -> m ()
setFrameBorder self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_frame_element_set_frame_border #}
             (toHTMLFrameElement self)
             valPtr)
 
getFrameBorder ::
               (MonadIO m, HTMLFrameElementClass self, GlibString string) =>
                 self -> m string
getFrameBorder self
  = liftIO
      (({# call webkit_dom_html_frame_element_get_frame_border #}
          (toHTMLFrameElement self))
         >>=
         readUTFString)
 
setLongDesc ::
            (MonadIO m, HTMLFrameElementClass self, GlibString string) =>
              self -> string -> m ()
setLongDesc self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_frame_element_set_long_desc #}
             (toHTMLFrameElement self)
             valPtr)
 
getLongDesc ::
            (MonadIO m, HTMLFrameElementClass self, GlibString string) =>
              self -> m string
getLongDesc self
  = liftIO
      (({# call webkit_dom_html_frame_element_get_long_desc #}
          (toHTMLFrameElement self))
         >>=
         readUTFString)
 
setMarginHeight ::
                (MonadIO m, HTMLFrameElementClass self, GlibString string) =>
                  self -> string -> m ()
setMarginHeight self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_frame_element_set_margin_height #}
             (toHTMLFrameElement self)
             valPtr)
 
getMarginHeight ::
                (MonadIO m, HTMLFrameElementClass self, GlibString string) =>
                  self -> m string
getMarginHeight self
  = liftIO
      (({# call webkit_dom_html_frame_element_get_margin_height #}
          (toHTMLFrameElement self))
         >>=
         readUTFString)
 
setMarginWidth ::
               (MonadIO m, HTMLFrameElementClass self, GlibString string) =>
                 self -> string -> m ()
setMarginWidth self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_frame_element_set_margin_width #}
             (toHTMLFrameElement self)
             valPtr)
 
getMarginWidth ::
               (MonadIO m, HTMLFrameElementClass self, GlibString string) =>
                 self -> m string
getMarginWidth self
  = liftIO
      (({# call webkit_dom_html_frame_element_get_margin_width #}
          (toHTMLFrameElement self))
         >>=
         readUTFString)
 
setName ::
        (MonadIO m, HTMLFrameElementClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_frame_element_set_name #}
             (toHTMLFrameElement self)
             valPtr)
 
getName ::
        (MonadIO m, HTMLFrameElementClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_html_frame_element_get_name #}
          (toHTMLFrameElement self))
         >>=
         readUTFString)
 
setNoResize ::
            (MonadIO m, HTMLFrameElementClass self) => self -> Bool -> m ()
setNoResize self val
  = liftIO
      ({# call webkit_dom_html_frame_element_set_no_resize #}
         (toHTMLFrameElement self)
         (fromBool val))
 
getNoResize ::
            (MonadIO m, HTMLFrameElementClass self) => self -> m Bool
getNoResize self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_frame_element_get_no_resize #}
            (toHTMLFrameElement self)))
 
setScrolling ::
             (MonadIO m, HTMLFrameElementClass self, GlibString string) =>
               self -> string -> m ()
setScrolling self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_frame_element_set_scrolling #}
             (toHTMLFrameElement self)
             valPtr)
 
getScrolling ::
             (MonadIO m, HTMLFrameElementClass self, GlibString string) =>
               self -> m string
getScrolling self
  = liftIO
      (({# call webkit_dom_html_frame_element_get_scrolling #}
          (toHTMLFrameElement self))
         >>=
         readUTFString)
 
setSrc ::
       (MonadIO m, HTMLFrameElementClass self, GlibString string) =>
         self -> string -> m ()
setSrc self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_frame_element_set_src #}
             (toHTMLFrameElement self)
             valPtr)
 
getSrc ::
       (MonadIO m, HTMLFrameElementClass self, GlibString string) =>
         self -> m string
getSrc self
  = liftIO
      (({# call webkit_dom_html_frame_element_get_src #}
          (toHTMLFrameElement self))
         >>=
         readUTFString)
 
getContentDocument ::
                   (MonadIO m, HTMLFrameElementClass self) =>
                     self -> m (Maybe Document)
getContentDocument self
  = liftIO
      (maybeNull (makeNewGObject mkDocument)
         ({# call webkit_dom_html_frame_element_get_content_document #}
            (toHTMLFrameElement self)))
 
getContentWindow ::
                 (MonadIO m, HTMLFrameElementClass self) =>
                   self -> m (Maybe DOMWindow)
getContentWindow self
  = liftIO
      (maybeNull (makeNewGObject mkDOMWindow)
         ({# call webkit_dom_html_frame_element_get_content_window #}
            (toHTMLFrameElement self)))
 
getWidth ::
         (MonadIO m, HTMLFrameElementClass self) => self -> m Int
getWidth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_frame_element_get_width #}
            (toHTMLFrameElement self)))
 
getHeight ::
          (MonadIO m, HTMLFrameElementClass self) => self -> m Int
getHeight self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_frame_element_get_height #}
            (toHTMLFrameElement self)))
