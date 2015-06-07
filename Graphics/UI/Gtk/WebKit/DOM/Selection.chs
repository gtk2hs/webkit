module Graphics.UI.Gtk.WebKit.DOM.Selection(
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
Selection,
castToSelection,
gTypeSelection,
SelectionClass,
toSelection,
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

 
collapse ::
         (MonadIO m, SelectionClass self, NodeClass node) =>
           self -> Maybe node -> Int -> m ()
collapse self node index
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_selection_collapse #} (toSelection self)
             (maybe (Node nullForeignPtr) toNode node)
             (fromIntegral index)
             errorPtr_)
 
collapseToEnd :: (MonadIO m, SelectionClass self) => self -> m ()
collapseToEnd self
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_selection_collapse_to_end #}
             (toSelection self)
             errorPtr_)
 
collapseToStart :: (MonadIO m, SelectionClass self) => self -> m ()
collapseToStart self
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_selection_collapse_to_start #}
             (toSelection self)
             errorPtr_)
 
deleteFromDocument ::
                   (MonadIO m, SelectionClass self) => self -> m ()
deleteFromDocument self
  = liftIO
      ({# call webkit_dom_dom_selection_delete_from_document #}
         (toSelection self))
 
containsNode ::
             (MonadIO m, SelectionClass self, NodeClass node) =>
               self -> Maybe node -> Bool -> m Bool
containsNode self node allowPartial
  = liftIO
      (toBool <$>
         ({# call webkit_dom_dom_selection_contains_node #}
            (toSelection self)
            (maybe (Node nullForeignPtr) toNode node)
            (fromBool allowPartial)))
 
selectAllChildren ::
                  (MonadIO m, SelectionClass self, NodeClass node) =>
                    self -> Maybe node -> m ()
selectAllChildren self node
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_selection_select_all_children #}
             (toSelection self)
             (maybe (Node nullForeignPtr) toNode node)
             errorPtr_)
 
extend ::
       (MonadIO m, SelectionClass self, NodeClass node) =>
         self -> Maybe node -> Int -> m ()
extend self node offset
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_selection_extend #} (toSelection self)
             (maybe (Node nullForeignPtr) toNode node)
             (fromIntegral offset)
             errorPtr_)
 
getRangeAt ::
           (MonadIO m, SelectionClass self) => self -> Int -> m (Maybe Range)
getRangeAt self index
  = liftIO
      (maybeNull (makeNewGObject mkRange)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_dom_selection_get_range_at #} (toSelection self)
                (fromIntegral index)
                errorPtr_))
 
removeAllRanges :: (MonadIO m, SelectionClass self) => self -> m ()
removeAllRanges self
  = liftIO
      ({# call webkit_dom_dom_selection_remove_all_ranges #}
         (toSelection self))
 
addRange ::
         (MonadIO m, SelectionClass self, RangeClass range) =>
           self -> Maybe range -> m ()
addRange self range
  = liftIO
      ({# call webkit_dom_dom_selection_add_range #} (toSelection self)
         (maybe (Range nullForeignPtr) toRange range))
 
modify ::
       (MonadIO m, SelectionClass self, GlibString string) =>
         self -> string -> string -> string -> m ()
modify self alter direction granularity
  = liftIO
      (withUTFString granularity $
         \ granularityPtr ->
           withUTFString direction $
             \ directionPtr ->
               withUTFString alter $
                 \ alterPtr ->
                   {# call webkit_dom_dom_selection_modify #} (toSelection self)
                     alterPtr
                 directionPtr
             granularityPtr)
 
setBaseAndExtent ::
                 (MonadIO m, SelectionClass self, NodeClass baseNode,
                  NodeClass extentNode) =>
                   self -> Maybe baseNode -> Int -> Maybe extentNode -> Int -> m ()
setBaseAndExtent self baseNode baseOffset extentNode extentOffset
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_selection_set_base_and_extent #}
             (toSelection self)
             (maybe (Node nullForeignPtr) toNode baseNode)
             (fromIntegral baseOffset)
             (maybe (Node nullForeignPtr) toNode extentNode)
             (fromIntegral extentOffset)
             errorPtr_)
 
setPosition ::
            (MonadIO m, SelectionClass self, NodeClass node) =>
              self -> Maybe node -> Int -> m ()
setPosition self node offset
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_selection_set_position #} (toSelection self)
             (maybe (Node nullForeignPtr) toNode node)
             (fromIntegral offset)
             errorPtr_)
 
empty :: (MonadIO m, SelectionClass self) => self -> m ()
empty self
  = liftIO
      ({# call webkit_dom_dom_selection_empty #} (toSelection self))
 
getAnchorNode ::
              (MonadIO m, SelectionClass self) => self -> m (Maybe Node)
getAnchorNode self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_dom_selection_get_anchor_node #}
            (toSelection self)))
 
getAnchorOffset ::
                (MonadIO m, SelectionClass self) => self -> m Int
getAnchorOffset self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_selection_get_anchor_offset #}
            (toSelection self)))
 
getFocusNode ::
             (MonadIO m, SelectionClass self) => self -> m (Maybe Node)
getFocusNode self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_dom_selection_get_focus_node #}
            (toSelection self)))
 
getFocusOffset :: (MonadIO m, SelectionClass self) => self -> m Int
getFocusOffset self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_selection_get_focus_offset #}
            (toSelection self)))
 
getIsCollapsed ::
               (MonadIO m, SelectionClass self) => self -> m Bool
getIsCollapsed self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_dom_selection_get_is_collapsed #}
            (toSelection self)))
 
getRangeCount :: (MonadIO m, SelectionClass self) => self -> m Int
getRangeCount self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_selection_get_range_count #}
            (toSelection self)))
 
getBaseNode ::
            (MonadIO m, SelectionClass self) => self -> m (Maybe Node)
getBaseNode self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_dom_selection_get_base_node #}
            (toSelection self)))
 
getBaseOffset :: (MonadIO m, SelectionClass self) => self -> m Int
getBaseOffset self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_selection_get_base_offset #}
            (toSelection self)))
 
getExtentNode ::
              (MonadIO m, SelectionClass self) => self -> m (Maybe Node)
getExtentNode self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_dom_selection_get_extent_node #}
            (toSelection self)))
 
getExtentOffset ::
                (MonadIO m, SelectionClass self) => self -> m Int
getExtentOffset self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_selection_get_extent_offset #}
            (toSelection self)))
