module Graphics.UI.Gtk.WebKit.DOM.TreeWalker(
getRoot,
getWhatToShow,
getFilter,
getExpandEntityReferences,
setCurrentNode,
getCurrentNode,
TreeWalker,
castToTreeWalker,
gTypeTreeWalker,
TreeWalkerClass,
toTreeWalker,
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

 
getRoot ::
        (MonadIO m, TreeWalkerClass self) => self -> m (Maybe Node)
getRoot self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_tree_walker_get_root #} (toTreeWalker self)))
 
getWhatToShow ::
              (MonadIO m, TreeWalkerClass self) => self -> m Word
getWhatToShow self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_tree_walker_get_what_to_show #}
            (toTreeWalker self)))
 
getFilter ::
          (MonadIO m, TreeWalkerClass self) => self -> m (Maybe NodeFilter)
getFilter self
  = liftIO
      (maybeNull (makeNewGObject mkNodeFilter)
         ({# call webkit_dom_tree_walker_get_filter #} (toTreeWalker self)))
 
getExpandEntityReferences ::
                          (MonadIO m, TreeWalkerClass self) => self -> m Bool
getExpandEntityReferences self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_tree_walker_get_expand_entity_references #}
            (toTreeWalker self)))
 
setCurrentNode ::
               (MonadIO m, NodeClass val, TreeWalkerClass self) =>
                 self -> Maybe val -> m ()
setCurrentNode self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_tree_walker_set_current_node #}
             (toTreeWalker self)
             (maybe (Node nullForeignPtr) toNode val)
             errorPtr_)
 
getCurrentNode ::
               (MonadIO m, TreeWalkerClass self) => self -> m (Maybe Node)
getCurrentNode self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_tree_walker_get_current_node #}
            (toTreeWalker self)))
