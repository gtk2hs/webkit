module Graphics.UI.Gtk.WebKit.DOM.HTMLPreElement(
setWidth,
getWidth,
setWrap,
getWrap,
HTMLPreElement,
castToHTMLPreElement,
gTypeHTMLPreElement,
HTMLPreElementClass,
toHTMLPreElement,
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

 
setWidth ::
         (MonadIO m, HTMLPreElementClass self) => self -> Int -> m ()
setWidth self val
  = liftIO
      ({# call webkit_dom_html_pre_element_set_width #}
         (toHTMLPreElement self)
         (fromIntegral val))
 
getWidth :: (MonadIO m, HTMLPreElementClass self) => self -> m Int
getWidth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_pre_element_get_width #}
            (toHTMLPreElement self)))
 
setWrap ::
        (MonadIO m, HTMLPreElementClass self) => self -> Bool -> m ()
setWrap self val
  = liftIO
      ({# call webkit_dom_html_pre_element_set_wrap #}
         (toHTMLPreElement self)
         (fromBool val))
 
getWrap :: (MonadIO m, HTMLPreElementClass self) => self -> m Bool
getWrap self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_pre_element_get_wrap #}
            (toHTMLPreElement self)))
