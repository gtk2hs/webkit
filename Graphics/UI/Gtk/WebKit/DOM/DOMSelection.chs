module Graphics.UI.Gtk.WebKit.DOM.DOMSelection(
collapse,
collapseToEnd,
collapseToStart,
deleteFromDocument,
containsNode,
selectAllChildren,
extend,
getRangeAt,
removeAllRanges,
addRange,
modify,
setBaseAndExtent,
setPosition,
empty,
getAnchorNode,
getAnchorOffset,
getFocusNode,
getFocusOffset,
getIsCollapsed,
getRangeCount,
getBaseNode,
getBaseOffset,
getExtentNode,
getExtentOffset,
DOMSelection,
castToDOMSelection,
gTypeDOMSelection,
DOMSelectionClass,
toDOMSelection,
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

 
collapse ::
         (MonadIO m, DOMSelectionClass self, NodeClass node) =>
           self -> Maybe node -> Int -> m ()
collapse self node index
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_selection_collapse #} (toDOMSelection self)
             (maybe (Node nullForeignPtr) toNode node)
             (fromIntegral index)
             errorPtr_)
 
collapseToEnd ::
              (MonadIO m, DOMSelectionClass self) => self -> m ()
collapseToEnd self
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_selection_collapse_to_end #}
             (toDOMSelection self)
             errorPtr_)
 
collapseToStart ::
                (MonadIO m, DOMSelectionClass self) => self -> m ()
collapseToStart self
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_selection_collapse_to_start #}
             (toDOMSelection self)
             errorPtr_)
 
deleteFromDocument ::
                   (MonadIO m, DOMSelectionClass self) => self -> m ()
deleteFromDocument self
  = liftIO
      ({# call webkit_dom_dom_selection_delete_from_document #}
         (toDOMSelection self))
 
containsNode ::
             (MonadIO m, DOMSelectionClass self, NodeClass node) =>
               self -> Maybe node -> Bool -> m Bool
containsNode self node allowPartial
  = liftIO
      (toBool <$>
         ({# call webkit_dom_dom_selection_contains_node #}
            (toDOMSelection self)
            (maybe (Node nullForeignPtr) toNode node)
            (fromBool allowPartial)))
 
selectAllChildren ::
                  (MonadIO m, DOMSelectionClass self, NodeClass node) =>
                    self -> Maybe node -> m ()
selectAllChildren self node
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_selection_select_all_children #}
             (toDOMSelection self)
             (maybe (Node nullForeignPtr) toNode node)
             errorPtr_)
 
extend ::
       (MonadIO m, DOMSelectionClass self, NodeClass node) =>
         self -> Maybe node -> Int -> m ()
extend self node offset
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_selection_extend #} (toDOMSelection self)
             (maybe (Node nullForeignPtr) toNode node)
             (fromIntegral offset)
             errorPtr_)
 
getRangeAt ::
           (MonadIO m, DOMSelectionClass self) =>
             self -> Int -> m (Maybe DOMRange)
getRangeAt self index
  = liftIO
      (maybeNull (makeNewGObject mkDOMRange)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_dom_selection_get_range_at #}
                (toDOMSelection self)
                (fromIntegral index)
                errorPtr_))
 
removeAllRanges ::
                (MonadIO m, DOMSelectionClass self) => self -> m ()
removeAllRanges self
  = liftIO
      ({# call webkit_dom_dom_selection_remove_all_ranges #}
         (toDOMSelection self))
 
addRange ::
         (MonadIO m, DOMSelectionClass self, DOMRangeClass range) =>
           self -> Maybe range -> m ()
addRange self range
  = liftIO
      ({# call webkit_dom_dom_selection_add_range #}
         (toDOMSelection self)
         (maybe (DOMRange nullForeignPtr) toDOMRange range))
 
modify ::
       (MonadIO m, DOMSelectionClass self, GlibString string) =>
         self -> string -> string -> string -> m ()
modify self alter direction granularity
  = liftIO
      (withUTFString granularity $
         \ granularityPtr ->
           withUTFString direction $
             \ directionPtr ->
               withUTFString alter $
                 \ alterPtr ->
                   {# call webkit_dom_dom_selection_modify #} (toDOMSelection self)
                     alterPtr
                 directionPtr
             granularityPtr)
 
setBaseAndExtent ::
                 (MonadIO m, DOMSelectionClass self, NodeClass baseNode,
                  NodeClass extentNode) =>
                   self -> Maybe baseNode -> Int -> Maybe extentNode -> Int -> m ()
setBaseAndExtent self baseNode baseOffset extentNode extentOffset
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_selection_set_base_and_extent #}
             (toDOMSelection self)
             (maybe (Node nullForeignPtr) toNode baseNode)
             (fromIntegral baseOffset)
             (maybe (Node nullForeignPtr) toNode extentNode)
             (fromIntegral extentOffset)
             errorPtr_)
 
setPosition ::
            (MonadIO m, DOMSelectionClass self, NodeClass node) =>
              self -> Maybe node -> Int -> m ()
setPosition self node offset
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_selection_set_position #}
             (toDOMSelection self)
             (maybe (Node nullForeignPtr) toNode node)
             (fromIntegral offset)
             errorPtr_)
 
empty :: (MonadIO m, DOMSelectionClass self) => self -> m ()
empty self
  = liftIO
      ({# call webkit_dom_dom_selection_empty #} (toDOMSelection self))
 
getAnchorNode ::
              (MonadIO m, DOMSelectionClass self) => self -> m (Maybe Node)
getAnchorNode self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_dom_selection_get_anchor_node #}
            (toDOMSelection self)))
 
getAnchorOffset ::
                (MonadIO m, DOMSelectionClass self) => self -> m Int
getAnchorOffset self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_selection_get_anchor_offset #}
            (toDOMSelection self)))
 
getFocusNode ::
             (MonadIO m, DOMSelectionClass self) => self -> m (Maybe Node)
getFocusNode self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_dom_selection_get_focus_node #}
            (toDOMSelection self)))
 
getFocusOffset ::
               (MonadIO m, DOMSelectionClass self) => self -> m Int
getFocusOffset self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_selection_get_focus_offset #}
            (toDOMSelection self)))
 
getIsCollapsed ::
               (MonadIO m, DOMSelectionClass self) => self -> m Bool
getIsCollapsed self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_dom_selection_get_is_collapsed #}
            (toDOMSelection self)))
 
getRangeCount ::
              (MonadIO m, DOMSelectionClass self) => self -> m Int
getRangeCount self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_selection_get_range_count #}
            (toDOMSelection self)))
 
getBaseNode ::
            (MonadIO m, DOMSelectionClass self) => self -> m (Maybe Node)
getBaseNode self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_dom_selection_get_base_node #}
            (toDOMSelection self)))
 
getBaseOffset ::
              (MonadIO m, DOMSelectionClass self) => self -> m Int
getBaseOffset self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_selection_get_base_offset #}
            (toDOMSelection self)))
 
getExtentNode ::
              (MonadIO m, DOMSelectionClass self) => self -> m (Maybe Node)
getExtentNode self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_dom_selection_get_extent_node #}
            (toDOMSelection self)))
 
getExtentOffset ::
                (MonadIO m, DOMSelectionClass self) => self -> m Int
getExtentOffset self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_selection_get_extent_offset #}
            (toDOMSelection self)))
