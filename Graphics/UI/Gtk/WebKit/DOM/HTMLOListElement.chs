module Graphics.UI.Gtk.WebKit.DOM.HTMLOListElement(
setCompact,
getCompact,
setStart,
getStart,
setReversed,
getReversed,
HTMLOListElement,
castToHTMLOListElement,
gTypeHTMLOListElement,
HTMLOListElementClass,
toHTMLOListElement,
) where
import Prelude hiding (drop, error, print)
import Data.Typeable (Typeable)
import Foreign.Marshal (maybePeek, maybeWith)
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

 
setCompact ::
           (MonadIO m, HTMLOListElementClass self) => self -> Bool -> m ()
setCompact self val
  = liftIO
      ({# call webkit_dom_htmlo_list_element_set_compact #}
         (toHTMLOListElement self)
         (fromBool val))
 
getCompact ::
           (MonadIO m, HTMLOListElementClass self) => self -> m Bool
getCompact self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_htmlo_list_element_get_compact #}
            (toHTMLOListElement self)))
 
setStart ::
         (MonadIO m, HTMLOListElementClass self) => self -> Int -> m ()
setStart self val
  = liftIO
      ({# call webkit_dom_htmlo_list_element_set_start #}
         (toHTMLOListElement self)
         (fromIntegral val))
 
getStart ::
         (MonadIO m, HTMLOListElementClass self) => self -> m Int
getStart self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_htmlo_list_element_get_start #}
            (toHTMLOListElement self)))
 
setReversed ::
            (MonadIO m, HTMLOListElementClass self) => self -> Bool -> m ()
setReversed self val
  = liftIO
      ({# call webkit_dom_htmlo_list_element_set_reversed #}
         (toHTMLOListElement self)
         (fromBool val))
 
getReversed ::
            (MonadIO m, HTMLOListElementClass self) => self -> m Bool
getReversed self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_htmlo_list_element_get_reversed #}
            (toHTMLOListElement self)))
