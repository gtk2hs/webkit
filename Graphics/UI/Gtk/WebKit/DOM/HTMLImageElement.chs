module Graphics.UI.Gtk.WebKit.DOM.HTMLImageElement(
setName,
getName,
setAlign,
getAlign,
setAlt,
getAlt,
setBorder,
getBorder,
setCrossOrigin,
getCrossOrigin,
setHeight,
getHeight,
setHspace,
getHspace,
setIsMap,
getIsMap,
setLongDesc,
getLongDesc,
setSrc,
getSrc,
#if WEBKIT_CHECK_VERSION(2,2,2)
setSrcset,
getSrcset,
#endif
#if WEBKIT_CHECK_VERSION(99,0,0)
setSizes,
getSizes,
getCurrentSrc,
#endif
setUseMap,
getUseMap,
setVspace,
getVspace,
setWidth,
getWidth,
getComplete,
setLowsrc,
getLowsrc,
getNaturalHeight,
getNaturalWidth,
getX,
getY,
HTMLImageElement,
castToHTMLImageElement,
gTypeHTMLImageElement,
HTMLImageElementClass,
toHTMLImageElement,
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

 
setName ::
        (MonadIO m, HTMLImageElementClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_image_element_set_name #}
             (toHTMLImageElement self)
             valPtr)
 
getName ::
        (MonadIO m, HTMLImageElementClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_html_image_element_get_name #}
          (toHTMLImageElement self))
         >>=
         readUTFString)
 
setAlign ::
         (MonadIO m, HTMLImageElementClass self, GlibString string) =>
           self -> string -> m ()
setAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_image_element_set_align #}
             (toHTMLImageElement self)
             valPtr)
 
getAlign ::
         (MonadIO m, HTMLImageElementClass self, GlibString string) =>
           self -> m string
getAlign self
  = liftIO
      (({# call webkit_dom_html_image_element_get_align #}
          (toHTMLImageElement self))
         >>=
         readUTFString)
 
setAlt ::
       (MonadIO m, HTMLImageElementClass self, GlibString string) =>
         self -> string -> m ()
setAlt self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_image_element_set_alt #}
             (toHTMLImageElement self)
             valPtr)
 
getAlt ::
       (MonadIO m, HTMLImageElementClass self, GlibString string) =>
         self -> m string
getAlt self
  = liftIO
      (({# call webkit_dom_html_image_element_get_alt #}
          (toHTMLImageElement self))
         >>=
         readUTFString)
 
setBorder ::
          (MonadIO m, HTMLImageElementClass self, GlibString string) =>
            self -> string -> m ()
setBorder self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_image_element_set_border #}
             (toHTMLImageElement self)
             valPtr)
 
getBorder ::
          (MonadIO m, HTMLImageElementClass self, GlibString string) =>
            self -> m string
getBorder self
  = liftIO
      (({# call webkit_dom_html_image_element_get_border #}
          (toHTMLImageElement self))
         >>=
         readUTFString)
 
setCrossOrigin ::
               (MonadIO m, HTMLImageElementClass self, GlibString string) =>
                 self -> string -> m ()
setCrossOrigin self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_image_element_set_cross_origin #}
             (toHTMLImageElement self)
             valPtr)
 
getCrossOrigin ::
               (MonadIO m, HTMLImageElementClass self, GlibString string) =>
                 self -> m string
getCrossOrigin self
  = liftIO
      (({# call webkit_dom_html_image_element_get_cross_origin #}
          (toHTMLImageElement self))
         >>=
         readUTFString)
 
setHeight ::
          (MonadIO m, HTMLImageElementClass self) => self -> Int -> m ()
setHeight self val
  = liftIO
      ({# call webkit_dom_html_image_element_set_height #}
         (toHTMLImageElement self)
         (fromIntegral val))
 
getHeight ::
          (MonadIO m, HTMLImageElementClass self) => self -> m Int
getHeight self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_image_element_get_height #}
            (toHTMLImageElement self)))
 
setHspace ::
          (MonadIO m, HTMLImageElementClass self) => self -> Int -> m ()
setHspace self val
  = liftIO
      ({# call webkit_dom_html_image_element_set_hspace #}
         (toHTMLImageElement self)
         (fromIntegral val))
 
getHspace ::
          (MonadIO m, HTMLImageElementClass self) => self -> m Int
getHspace self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_image_element_get_hspace #}
            (toHTMLImageElement self)))
 
setIsMap ::
         (MonadIO m, HTMLImageElementClass self) => self -> Bool -> m ()
setIsMap self val
  = liftIO
      ({# call webkit_dom_html_image_element_set_is_map #}
         (toHTMLImageElement self)
         (fromBool val))
 
getIsMap ::
         (MonadIO m, HTMLImageElementClass self) => self -> m Bool
getIsMap self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_image_element_get_is_map #}
            (toHTMLImageElement self)))
 
setLongDesc ::
            (MonadIO m, HTMLImageElementClass self, GlibString string) =>
              self -> string -> m ()
setLongDesc self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_image_element_set_long_desc #}
             (toHTMLImageElement self)
             valPtr)
 
getLongDesc ::
            (MonadIO m, HTMLImageElementClass self, GlibString string) =>
              self -> m string
getLongDesc self
  = liftIO
      (({# call webkit_dom_html_image_element_get_long_desc #}
          (toHTMLImageElement self))
         >>=
         readUTFString)
 
setSrc ::
       (MonadIO m, HTMLImageElementClass self, GlibString string) =>
         self -> string -> m ()
setSrc self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_image_element_set_src #}
             (toHTMLImageElement self)
             valPtr)
 
getSrc ::
       (MonadIO m, HTMLImageElementClass self, GlibString string) =>
         self -> m string
getSrc self
  = liftIO
      (({# call webkit_dom_html_image_element_get_src #}
          (toHTMLImageElement self))
         >>=
         readUTFString)

#if WEBKIT_CHECK_VERSION(2,2,2) 
setSrcset ::
          (MonadIO m, HTMLImageElementClass self, GlibString string) =>
            self -> string -> m ()
setSrcset self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_image_element_set_srcset #}
             (toHTMLImageElement self)
             valPtr)
 
getSrcset ::
          (MonadIO m, HTMLImageElementClass self, GlibString string) =>
            self -> m string
getSrcset self
  = liftIO
      (({# call webkit_dom_html_image_element_get_srcset #}
          (toHTMLImageElement self))
         >>=
         readUTFString)
#endif

#if WEBKIT_CHECK_VERSION(99,0,0) 
setSizes ::
         (MonadIO m, HTMLImageElementClass self, GlibString string) =>
           self -> string -> m ()
setSizes self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_image_element_set_sizes #}
             (toHTMLImageElement self)
             valPtr)
 
getSizes ::
         (MonadIO m, HTMLImageElementClass self, GlibString string) =>
           self -> m string
getSizes self
  = liftIO
      (({# call webkit_dom_html_image_element_get_sizes #}
          (toHTMLImageElement self))
         >>=
         readUTFString)
 
getCurrentSrc ::
              (MonadIO m, HTMLImageElementClass self, GlibString string) =>
                self -> m string
getCurrentSrc self
  = liftIO
      (({# call webkit_dom_html_image_element_get_current_src #}
          (toHTMLImageElement self))
         >>=
         readUTFString)
#endif
 
setUseMap ::
          (MonadIO m, HTMLImageElementClass self, GlibString string) =>
            self -> string -> m ()
setUseMap self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_image_element_set_use_map #}
             (toHTMLImageElement self)
             valPtr)
 
getUseMap ::
          (MonadIO m, HTMLImageElementClass self, GlibString string) =>
            self -> m string
getUseMap self
  = liftIO
      (({# call webkit_dom_html_image_element_get_use_map #}
          (toHTMLImageElement self))
         >>=
         readUTFString)
 
setVspace ::
          (MonadIO m, HTMLImageElementClass self) => self -> Int -> m ()
setVspace self val
  = liftIO
      ({# call webkit_dom_html_image_element_set_vspace #}
         (toHTMLImageElement self)
         (fromIntegral val))
 
getVspace ::
          (MonadIO m, HTMLImageElementClass self) => self -> m Int
getVspace self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_image_element_get_vspace #}
            (toHTMLImageElement self)))
 
setWidth ::
         (MonadIO m, HTMLImageElementClass self) => self -> Int -> m ()
setWidth self val
  = liftIO
      ({# call webkit_dom_html_image_element_set_width #}
         (toHTMLImageElement self)
         (fromIntegral val))
 
getWidth ::
         (MonadIO m, HTMLImageElementClass self) => self -> m Int
getWidth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_image_element_get_width #}
            (toHTMLImageElement self)))
 
getComplete ::
            (MonadIO m, HTMLImageElementClass self) => self -> m Bool
getComplete self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_image_element_get_complete #}
            (toHTMLImageElement self)))
 
setLowsrc ::
          (MonadIO m, HTMLImageElementClass self, GlibString string) =>
            self -> string -> m ()
setLowsrc self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_image_element_set_lowsrc #}
             (toHTMLImageElement self)
             valPtr)
 
getLowsrc ::
          (MonadIO m, HTMLImageElementClass self, GlibString string) =>
            self -> m string
getLowsrc self
  = liftIO
      (({# call webkit_dom_html_image_element_get_lowsrc #}
          (toHTMLImageElement self))
         >>=
         readUTFString)
 
getNaturalHeight ::
                 (MonadIO m, HTMLImageElementClass self) => self -> m Int
getNaturalHeight self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_image_element_get_natural_height #}
            (toHTMLImageElement self)))
 
getNaturalWidth ::
                (MonadIO m, HTMLImageElementClass self) => self -> m Int
getNaturalWidth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_image_element_get_natural_width #}
            (toHTMLImageElement self)))
 
getX :: (MonadIO m, HTMLImageElementClass self) => self -> m Int
getX self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_image_element_get_x #}
            (toHTMLImageElement self)))
 
getY :: (MonadIO m, HTMLImageElementClass self) => self -> m Int
getY self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_image_element_get_y #}
            (toHTMLImageElement self)))
