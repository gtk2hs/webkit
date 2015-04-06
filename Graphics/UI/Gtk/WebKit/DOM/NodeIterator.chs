module Graphics.UI.Gtk.WebKit.DOM.NodeIterator(
detach,
getRoot,
getWhatToShow,
getFilter,
getExpandEntityReferences,
getReferenceNode,
getPointerBeforeReferenceNode,
NodeIterator,
castToNodeIterator,
gTypeNodeIterator,
NodeIteratorClass,
toNodeIterator,
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

 
detach :: (MonadIO m, NodeIteratorClass self) => self -> m ()
detach self
  = liftIO
      ({# call webkit_dom_node_iterator_detach #} (toNodeIterator self))
 
getRoot ::
        (MonadIO m, NodeIteratorClass self) => self -> m (Maybe Node)
getRoot self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_node_iterator_get_root #}
            (toNodeIterator self)))
 
getWhatToShow ::
              (MonadIO m, NodeIteratorClass self) => self -> m Word
getWhatToShow self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_node_iterator_get_what_to_show #}
            (toNodeIterator self)))
 
getFilter ::
          (MonadIO m, NodeIteratorClass self) => self -> m (Maybe NodeFilter)
getFilter self
  = liftIO
      (maybeNull (makeNewGObject mkNodeFilter)
         ({# call webkit_dom_node_iterator_get_filter #}
            (toNodeIterator self)))
 
getExpandEntityReferences ::
                          (MonadIO m, NodeIteratorClass self) => self -> m Bool
getExpandEntityReferences self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_node_iterator_get_expand_entity_references #}
            (toNodeIterator self)))
 
getReferenceNode ::
                 (MonadIO m, NodeIteratorClass self) => self -> m (Maybe Node)
getReferenceNode self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_node_iterator_get_reference_node #}
            (toNodeIterator self)))
 
getPointerBeforeReferenceNode ::
                              (MonadIO m, NodeIteratorClass self) => self -> m Bool
getPointerBeforeReferenceNode self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_node_iterator_get_pointer_before_reference_node
            #}
            (toNodeIterator self)))
