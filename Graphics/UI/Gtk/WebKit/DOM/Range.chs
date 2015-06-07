module Graphics.UI.Gtk.WebKit.DOM.Range(
setStart,
setEnd,
setStartBefore,
setStartAfter,
setEndBefore,
setEndAfter,
collapse,
selectNode,
selectNodeContents,
compareBoundaryPoints,
deleteContents,
extractContents,
cloneContents,
insertNode,
surroundContents,
cloneRange,
toString,
detach,
createContextualFragment,
intersectsNode,
compareNode,
comparePoint,
isPointInRange,
expand,
pattern START_TO_START,
pattern START_TO_END,
pattern END_TO_END,
pattern END_TO_START,
pattern NODE_BEFORE,
pattern NODE_AFTER,
pattern NODE_BEFORE_AND_AFTER,
pattern NODE_INSIDE,
getStartContainer,
getStartOffset,
getEndContainer,
getEndOffset,
getCollapsed,
getCommonAncestorContainer,
getText,
Range,
castToRange,
gTypeRange,
RangeClass,
toRange,
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

 
setStart ::
         (MonadIO m, RangeClass self, NodeClass refNode) =>
           self -> Maybe refNode -> Int -> m ()
setStart self refNode offset
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_set_start #} (toRange self)
             (maybe (Node nullForeignPtr) toNode refNode)
             (fromIntegral offset)
             errorPtr_)
 
setEnd ::
       (MonadIO m, RangeClass self, NodeClass refNode) =>
         self -> Maybe refNode -> Int -> m ()
setEnd self refNode offset
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_set_end #} (toRange self)
             (maybe (Node nullForeignPtr) toNode refNode)
             (fromIntegral offset)
             errorPtr_)
 
setStartBefore ::
               (MonadIO m, RangeClass self, NodeClass refNode) =>
                 self -> Maybe refNode -> m ()
setStartBefore self refNode
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_set_start_before #} (toRange self)
             (maybe (Node nullForeignPtr) toNode refNode)
             errorPtr_)
 
setStartAfter ::
              (MonadIO m, RangeClass self, NodeClass refNode) =>
                self -> Maybe refNode -> m ()
setStartAfter self refNode
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_set_start_after #} (toRange self)
             (maybe (Node nullForeignPtr) toNode refNode)
             errorPtr_)
 
setEndBefore ::
             (MonadIO m, RangeClass self, NodeClass refNode) =>
               self -> Maybe refNode -> m ()
setEndBefore self refNode
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_set_end_before #} (toRange self)
             (maybe (Node nullForeignPtr) toNode refNode)
             errorPtr_)
 
setEndAfter ::
            (MonadIO m, RangeClass self, NodeClass refNode) =>
              self -> Maybe refNode -> m ()
setEndAfter self refNode
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_set_end_after #} (toRange self)
             (maybe (Node nullForeignPtr) toNode refNode)
             errorPtr_)
 
collapse :: (MonadIO m, RangeClass self) => self -> Bool -> m ()
collapse self toStart
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_collapse #} (toRange self)
             (fromBool toStart)
             errorPtr_)
 
selectNode ::
           (MonadIO m, RangeClass self, NodeClass refNode) =>
             self -> Maybe refNode -> m ()
selectNode self refNode
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_select_node #} (toRange self)
             (maybe (Node nullForeignPtr) toNode refNode)
             errorPtr_)
 
selectNodeContents ::
                   (MonadIO m, RangeClass self, NodeClass refNode) =>
                     self -> Maybe refNode -> m ()
selectNodeContents self refNode
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_select_node_contents #} (toRange self)
             (maybe (Node nullForeignPtr) toNode refNode)
             errorPtr_)
 
compareBoundaryPoints ::
                      (MonadIO m, RangeClass self, RangeClass sourceRange) =>
                        self -> Word -> Maybe sourceRange -> m Int
compareBoundaryPoints self how sourceRange
  = liftIO
      (fromIntegral <$>
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_range_compare_boundary_points #} (toRange self)
                (fromIntegral how)
                (maybe (Range nullForeignPtr) toRange sourceRange)
                errorPtr_))
 
deleteContents :: (MonadIO m, RangeClass self) => self -> m ()
deleteContents self
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_delete_contents #} (toRange self)
             errorPtr_)
 
extractContents ::
                (MonadIO m, RangeClass self) => self -> m (Maybe DocumentFragment)
extractContents self
  = liftIO
      (maybeNull (makeNewGObject mkDocumentFragment)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_range_extract_contents #} (toRange self)
                errorPtr_))
 
cloneContents ::
              (MonadIO m, RangeClass self) => self -> m (Maybe DocumentFragment)
cloneContents self
  = liftIO
      (maybeNull (makeNewGObject mkDocumentFragment)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_range_clone_contents #} (toRange self)
                errorPtr_))
 
insertNode ::
           (MonadIO m, RangeClass self, NodeClass newNode) =>
             self -> Maybe newNode -> m ()
insertNode self newNode
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_insert_node #} (toRange self)
             (maybe (Node nullForeignPtr) toNode newNode)
             errorPtr_)
 
surroundContents ::
                 (MonadIO m, RangeClass self, NodeClass newParent) =>
                   self -> Maybe newParent -> m ()
surroundContents self newParent
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_surround_contents #} (toRange self)
             (maybe (Node nullForeignPtr) toNode newParent)
             errorPtr_)
 
cloneRange ::
           (MonadIO m, RangeClass self) => self -> m (Maybe Range)
cloneRange self
  = liftIO
      (maybeNull (makeNewGObject mkRange)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_range_clone_range #} (toRange self) errorPtr_))
 
toString ::
         (MonadIO m, RangeClass self, GlibString string) => self -> m string
toString self
  = liftIO
      ((propagateGError $
          \ errorPtr_ ->
            {# call webkit_dom_range_to_string #} (toRange self) errorPtr_)
         >>=
         readUTFString)
 
detach :: (MonadIO m, RangeClass self) => self -> m ()
detach self
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_detach #} (toRange self) errorPtr_)
 
createContextualFragment ::
                         (MonadIO m, RangeClass self, GlibString string) =>
                           self -> string -> m (Maybe DocumentFragment)
createContextualFragment self html
  = liftIO
      (maybeNull (makeNewGObject mkDocumentFragment)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString html $
                \ htmlPtr ->
                  {# call webkit_dom_range_create_contextual_fragment #}
                    (toRange self)
                    htmlPtr
                errorPtr_))
 
intersectsNode ::
               (MonadIO m, RangeClass self, NodeClass refNode) =>
                 self -> Maybe refNode -> m Bool
intersectsNode self refNode
  = liftIO
      (toBool <$>
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_range_intersects_node #} (toRange self)
                (maybe (Node nullForeignPtr) toNode refNode)
                errorPtr_))
 
compareNode ::
            (MonadIO m, RangeClass self, NodeClass refNode) =>
              self -> Maybe refNode -> m Int
compareNode self refNode
  = liftIO
      (fromIntegral <$>
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_range_compare_node #} (toRange self)
                (maybe (Node nullForeignPtr) toNode refNode)
                errorPtr_))
 
comparePoint ::
             (MonadIO m, RangeClass self, NodeClass refNode) =>
               self -> Maybe refNode -> Int -> m Int
comparePoint self refNode offset
  = liftIO
      (fromIntegral <$>
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_range_compare_point #} (toRange self)
                (maybe (Node nullForeignPtr) toNode refNode)
                (fromIntegral offset)
                errorPtr_))
 
isPointInRange ::
               (MonadIO m, RangeClass self, NodeClass refNode) =>
                 self -> Maybe refNode -> Int -> m Bool
isPointInRange self refNode offset
  = liftIO
      (toBool <$>
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_range_is_point_in_range #} (toRange self)
                (maybe (Node nullForeignPtr) toNode refNode)
                (fromIntegral offset)
                errorPtr_))
 
expand ::
       (MonadIO m, RangeClass self, GlibString string) =>
         self -> string -> m ()
expand self unit
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString unit $
             \ unitPtr ->
               {# call webkit_dom_range_expand #} (toRange self) unitPtr
             errorPtr_)
pattern START_TO_START = 0
pattern START_TO_END = 1
pattern END_TO_END = 2
pattern END_TO_START = 3
pattern NODE_BEFORE = 0
pattern NODE_AFTER = 1
pattern NODE_BEFORE_AND_AFTER = 2
pattern NODE_INSIDE = 3
 
getStartContainer ::
                  (MonadIO m, RangeClass self) => self -> m (Maybe Node)
getStartContainer self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_range_get_start_container #} (toRange self)
                errorPtr_))
 
getStartOffset :: (MonadIO m, RangeClass self) => self -> m Int
getStartOffset self
  = liftIO
      (fromIntegral <$>
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_range_get_start_offset #} (toRange self)
                errorPtr_))
 
getEndContainer ::
                (MonadIO m, RangeClass self) => self -> m (Maybe Node)
getEndContainer self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_range_get_end_container #} (toRange self)
                errorPtr_))
 
getEndOffset :: (MonadIO m, RangeClass self) => self -> m Int
getEndOffset self
  = liftIO
      (fromIntegral <$>
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_range_get_end_offset #} (toRange self)
                errorPtr_))
 
getCollapsed :: (MonadIO m, RangeClass self) => self -> m Bool
getCollapsed self
  = liftIO
      (toBool <$>
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_range_get_collapsed #} (toRange self)
                errorPtr_))
 
getCommonAncestorContainer ::
                           (MonadIO m, RangeClass self) => self -> m (Maybe Node)
getCommonAncestorContainer self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_range_get_common_ancestor_container #}
                (toRange self)
                errorPtr_))
 
getText ::
        (MonadIO m, RangeClass self, GlibString string) => self -> m string
getText self
  = liftIO
      (({# call webkit_dom_range_get_text #} (toRange self)) >>=
         readUTFString)
