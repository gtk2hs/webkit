module Graphics.UI.Gtk.WebKit.DOM.HTMLOptionsCollection(
#if WEBKIT_CHECK_VERSION(2,2,2)
namedItem,
#endif
#if WEBKIT_CHECK_VERSION(99,0,0)
addBefore,
add,
#endif
setSelectedIndex,
getSelectedIndex,
HTMLOptionsCollection,
castToHTMLOptionsCollection,
gTypeHTMLOptionsCollection,
HTMLOptionsCollectionClass,
toHTMLOptionsCollection,
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


#if WEBKIT_CHECK_VERSION(2,2,2) 
namedItem ::
          (MonadIO m, HTMLOptionsCollectionClass self, GlibString string) =>
            self -> string -> m (Maybe Node)
namedItem self name
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (withUTFString name $
            \ namePtr ->
              {# call webkit_dom_html_options_collection_named_item #}
                (toHTMLOptionsCollection self)
                namePtr))
#endif

#if WEBKIT_CHECK_VERSION(99,0,0) 
addBefore ::
          (MonadIO m, HTMLOptionsCollectionClass self,
           HTMLElementClass element, HTMLElementClass before) =>
            self -> Maybe element -> Maybe before -> m ()
addBefore self element before
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_options_collection_add #}
             (toHTMLOptionsCollection self)
             (maybe (HTMLElement nullForeignPtr) toHTMLElement element)
             (maybe (HTMLElement nullForeignPtr) toHTMLElement before)
             errorPtr_)
 
add ::
    (MonadIO m, HTMLOptionsCollectionClass self,
     HTMLElementClass element) =>
      self -> Maybe element -> Int -> m ()
add self element index
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_options_collection_add #}
             (toHTMLOptionsCollection self)
             (maybe (HTMLElement nullForeignPtr) toHTMLElement element)
             (fromIntegral index)
             errorPtr_)
#endif
 
setSelectedIndex ::
                 (MonadIO m, HTMLOptionsCollectionClass self) => self -> Int -> m ()
setSelectedIndex self val
  = liftIO
      ({# call webkit_dom_html_options_collection_set_selected_index #}
         (toHTMLOptionsCollection self)
         (fromIntegral val))
 
getSelectedIndex ::
                 (MonadIO m, HTMLOptionsCollectionClass self) => self -> m Int
getSelectedIndex self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_options_collection_get_selected_index #}
            (toHTMLOptionsCollection self)))
