module Graphics.UI.Gtk.WebKit.DOM.HTMLModElement(
setCite,
getCite,
setDateTime,
getDateTime,
HTMLModElement,
castToHTMLModElement,
gTypeHTMLModElement,
HTMLModElementClass,
toHTMLModElement,
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

 
setCite ::
        (MonadIO m, HTMLModElementClass self, GlibString string) =>
          self -> string -> m ()
setCite self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_mod_element_set_cite #}
             (toHTMLModElement self)
             valPtr)
 
getCite ::
        (MonadIO m, HTMLModElementClass self, GlibString string) =>
          self -> m string
getCite self
  = liftIO
      (({# call webkit_dom_html_mod_element_get_cite #}
          (toHTMLModElement self))
         >>=
         readUTFString)
 
setDateTime ::
            (MonadIO m, HTMLModElementClass self, GlibString string) =>
              self -> string -> m ()
setDateTime self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_mod_element_set_date_time #}
             (toHTMLModElement self)
             valPtr)
 
getDateTime ::
            (MonadIO m, HTMLModElementClass self, GlibString string) =>
              self -> m string
getDateTime self
  = liftIO
      (({# call webkit_dom_html_mod_element_get_date_time #}
          (toHTMLModElement self))
         >>=
         readUTFString)
