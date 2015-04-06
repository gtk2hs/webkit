module Graphics.UI.Gtk.WebKit.DOM.HTMLCollection(
item,
namedItem,
getLength,
HTMLCollection,
castToHTMLCollection,
gTypeHTMLCollection,
HTMLCollectionClass,
toHTMLCollection,
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

 
item ::
     (MonadIO m, HTMLCollectionClass self) =>
       self -> Word -> m (Maybe Node)
item self index
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_html_collection_item #} (toHTMLCollection self)
            (fromIntegral index)))
 
namedItem ::
          (MonadIO m, HTMLCollectionClass self, GlibString string) =>
            self -> string -> m (Maybe Node)
namedItem self name
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (withUTFString name $
            \ namePtr ->
              {# call webkit_dom_html_collection_named_item #}
                (toHTMLCollection self)
                namePtr))
 
getLength ::
          (MonadIO m, HTMLCollectionClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_collection_get_length #}
            (toHTMLCollection self)))
