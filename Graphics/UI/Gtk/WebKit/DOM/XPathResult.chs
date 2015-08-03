module Graphics.UI.Gtk.WebKit.DOM.XPathResult(
iterateNext,
snapshotItem,
pattern ANY_TYPE,
pattern NUMBER_TYPE,
pattern STRING_TYPE,
pattern BOOLEAN_TYPE,
pattern UNORDERED_NODE_ITERATOR_TYPE,
pattern ORDERED_NODE_ITERATOR_TYPE,
pattern UNORDERED_NODE_SNAPSHOT_TYPE,
pattern ORDERED_NODE_SNAPSHOT_TYPE,
pattern ANY_UNORDERED_NODE_TYPE,
pattern FIRST_ORDERED_NODE_TYPE,
getResultType,
getNumberValue,
getStringValue,
getBooleanValue,
getSingleNodeValue,
getInvalidIteratorState,
getSnapshotLength,
XPathResult,
castToXPathResult,
gTypeXPathResult,
XPathResultClass,
toXPathResult,
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

 
iterateNext ::
            (MonadIO m, XPathResultClass self) => self -> m (Maybe Node)
iterateNext self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_xpath_result_iterate_next #}
                (toXPathResult self)
                errorPtr_))
 
snapshotItem ::
             (MonadIO m, XPathResultClass self) =>
               self -> Word -> m (Maybe Node)
snapshotItem self index
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_xpath_result_snapshot_item #}
                (toXPathResult self)
                (fromIntegral index)
                errorPtr_))
pattern ANY_TYPE = 0
pattern NUMBER_TYPE = 1
pattern STRING_TYPE = 2
pattern BOOLEAN_TYPE = 3
pattern UNORDERED_NODE_ITERATOR_TYPE = 4
pattern ORDERED_NODE_ITERATOR_TYPE = 5
pattern UNORDERED_NODE_SNAPSHOT_TYPE = 6
pattern ORDERED_NODE_SNAPSHOT_TYPE = 7
pattern ANY_UNORDERED_NODE_TYPE = 8
pattern FIRST_ORDERED_NODE_TYPE = 9
 
getResultType ::
              (MonadIO m, XPathResultClass self) => self -> m Word
getResultType self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_xpath_result_get_result_type #}
            (toXPathResult self)))
 
getNumberValue ::
               (MonadIO m, XPathResultClass self) => self -> m Double
getNumberValue self
  = liftIO
      (realToFrac <$>
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_xpath_result_get_number_value #}
                (toXPathResult self)
                errorPtr_))
 
getStringValue ::
               (MonadIO m, XPathResultClass self, GlibString string) =>
                 self -> m string
getStringValue self
  = liftIO
      ((propagateGError $
          \ errorPtr_ ->
            {# call webkit_dom_xpath_result_get_string_value #}
              (toXPathResult self)
              errorPtr_)
         >>=
         readUTFString)
 
getBooleanValue ::
                (MonadIO m, XPathResultClass self) => self -> m Bool
getBooleanValue self
  = liftIO
      (toBool <$>
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_xpath_result_get_boolean_value #}
                (toXPathResult self)
                errorPtr_))
 
getSingleNodeValue ::
                   (MonadIO m, XPathResultClass self) => self -> m (Maybe Node)
getSingleNodeValue self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_xpath_result_get_single_node_value #}
                (toXPathResult self)
                errorPtr_))
 
getInvalidIteratorState ::
                        (MonadIO m, XPathResultClass self) => self -> m Bool
getInvalidIteratorState self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_xpath_result_get_invalid_iterator_state #}
            (toXPathResult self)))
 
getSnapshotLength ::
                  (MonadIO m, XPathResultClass self) => self -> m Word
getSnapshotLength self
  = liftIO
      (fromIntegral <$>
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_xpath_result_get_snapshot_length #}
                (toXPathResult self)
                errorPtr_))
