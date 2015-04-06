module Graphics.UI.Gtk.WebKit.DOM.HTMLCanvasElement(
setWidth,
getWidth,
setHeight,
getHeight,
HTMLCanvasElement,
castToHTMLCanvasElement,
gTypeHTMLCanvasElement,
HTMLCanvasElementClass,
toHTMLCanvasElement,
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

 
setWidth ::
         (MonadIO m, HTMLCanvasElementClass self) => self -> Int -> m ()
setWidth self val
  = liftIO
      ({# call webkit_dom_html_canvas_element_set_width #}
         (toHTMLCanvasElement self)
         (fromIntegral val))
 
getWidth ::
         (MonadIO m, HTMLCanvasElementClass self) => self -> m Int
getWidth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_canvas_element_get_width #}
            (toHTMLCanvasElement self)))
 
setHeight ::
          (MonadIO m, HTMLCanvasElementClass self) => self -> Int -> m ()
setHeight self val
  = liftIO
      ({# call webkit_dom_html_canvas_element_set_height #}
         (toHTMLCanvasElement self)
         (fromIntegral val))
 
getHeight ::
          (MonadIO m, HTMLCanvasElementClass self) => self -> m Int
getHeight self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_canvas_element_get_height #}
            (toHTMLCanvasElement self)))
