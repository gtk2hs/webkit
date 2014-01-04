module Graphics.UI.Gtk.WebKit.DOM.Range
       (rangeSetStart, rangeSetEnd, rangeSetStartBefore,
        rangeSetStartAfter, rangeSetEndBefore, rangeSetEndAfter,
        rangeCollapse, rangeSelectNode, rangeSelectNodeContents,
        rangeCompareBoundaryPoints, rangeDeleteContents,
        rangeExtractContents, rangeCloneContents, rangeInsertNode,
        rangeSurroundContents, rangeCloneRange, rangeToString, rangeDetach,
        rangeCreateContextualFragment, rangeIntersectsNode,
        rangeCompareNode, rangeComparePoint, rangeIsPointInRange,
        rangeExpand, cSTART_TO_START, cSTART_TO_END, cEND_TO_END,
        cEND_TO_START, cNODE_BEFORE, cNODE_AFTER, cNODE_BEFORE_AND_AFTER,
        cNODE_INSIDE, rangeGetStartContainer, rangeGetStartOffset,
        rangeGetEndContainer, rangeGetEndOffset, rangeGetCollapsed,
        rangeGetCommonAncestorContainer, rangeGetText, DOMRange,
        DOMRangeClass, castToDOMRange, gTypeDOMRange, toDOMRange)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
rangeSetStart ::
              (DOMRangeClass self, NodeClass refNode) =>
                self -> Maybe refNode -> Int -> IO ()
rangeSetStart self refNode offset
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_range_set_start #} (toDOMRange self)
          (maybe (Node nullForeignPtr) toNode refNode)
          (fromIntegral offset)
          errorPtr_
 
rangeSetEnd ::
            (DOMRangeClass self, NodeClass refNode) =>
              self -> Maybe refNode -> Int -> IO ()
rangeSetEnd self refNode offset
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_range_set_end #} (toDOMRange self)
          (maybe (Node nullForeignPtr) toNode refNode)
          (fromIntegral offset)
          errorPtr_
 
rangeSetStartBefore ::
                    (DOMRangeClass self, NodeClass refNode) =>
                      self -> Maybe refNode -> IO ()
rangeSetStartBefore self refNode
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_range_set_start_before #} (toDOMRange self)
          (maybe (Node nullForeignPtr) toNode refNode)
          errorPtr_
 
rangeSetStartAfter ::
                   (DOMRangeClass self, NodeClass refNode) =>
                     self -> Maybe refNode -> IO ()
rangeSetStartAfter self refNode
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_range_set_start_after #} (toDOMRange self)
          (maybe (Node nullForeignPtr) toNode refNode)
          errorPtr_
 
rangeSetEndBefore ::
                  (DOMRangeClass self, NodeClass refNode) =>
                    self -> Maybe refNode -> IO ()
rangeSetEndBefore self refNode
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_range_set_end_before #} (toDOMRange self)
          (maybe (Node nullForeignPtr) toNode refNode)
          errorPtr_
 
rangeSetEndAfter ::
                 (DOMRangeClass self, NodeClass refNode) =>
                   self -> Maybe refNode -> IO ()
rangeSetEndAfter self refNode
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_range_set_end_after #} (toDOMRange self)
          (maybe (Node nullForeignPtr) toNode refNode)
          errorPtr_
 
rangeCollapse :: (DOMRangeClass self) => self -> Bool -> IO ()
rangeCollapse self toStart
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_range_collapse #} (toDOMRange self)
          (fromBool toStart)
          errorPtr_
 
rangeSelectNode ::
                (DOMRangeClass self, NodeClass refNode) =>
                  self -> Maybe refNode -> IO ()
rangeSelectNode self refNode
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_range_select_node #} (toDOMRange self)
          (maybe (Node nullForeignPtr) toNode refNode)
          errorPtr_
 
rangeSelectNodeContents ::
                        (DOMRangeClass self, NodeClass refNode) =>
                          self -> Maybe refNode -> IO ()
rangeSelectNodeContents self refNode
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_range_select_node_contents #} (toDOMRange self)
          (maybe (Node nullForeignPtr) toNode refNode)
          errorPtr_
 
rangeCompareBoundaryPoints ::
                           (DOMRangeClass self, DOMRangeClass sourceRange) =>
                             self -> Word -> Maybe sourceRange -> IO Int
rangeCompareBoundaryPoints self how sourceRange
  = fromIntegral <$>
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_compare_boundary_points #}
             (toDOMRange self)
             (fromIntegral how)
             (maybe (DOMRange nullForeignPtr) toDOMRange sourceRange)
             errorPtr_)
 
rangeDeleteContents :: (DOMRangeClass self) => self -> IO ()
rangeDeleteContents self
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_range_delete_contents #} (toDOMRange self)
          errorPtr_
 
rangeExtractContents ::
                     (DOMRangeClass self) => self -> IO (Maybe DocumentFragment)
rangeExtractContents self
  = maybeNull (makeNewGObject mkDocumentFragment)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_extract_contents #} (toDOMRange self)
             errorPtr_)
 
rangeCloneContents ::
                   (DOMRangeClass self) => self -> IO (Maybe DocumentFragment)
rangeCloneContents self
  = maybeNull (makeNewGObject mkDocumentFragment)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_clone_contents #} (toDOMRange self)
             errorPtr_)
 
rangeInsertNode ::
                (DOMRangeClass self, NodeClass newNode) =>
                  self -> Maybe newNode -> IO ()
rangeInsertNode self newNode
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_range_insert_node #} (toDOMRange self)
          (maybe (Node nullForeignPtr) toNode newNode)
          errorPtr_
 
rangeSurroundContents ::
                      (DOMRangeClass self, NodeClass newParent) =>
                        self -> Maybe newParent -> IO ()
rangeSurroundContents self newParent
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_range_surround_contents #} (toDOMRange self)
          (maybe (Node nullForeignPtr) toNode newParent)
          errorPtr_
 
rangeCloneRange ::
                (DOMRangeClass self) => self -> IO (Maybe DOMRange)
rangeCloneRange self
  = maybeNull (makeNewGObject mkDOMRange)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_clone_range #} (toDOMRange self)
             errorPtr_)
 
rangeToString :: (DOMRangeClass self) => self -> IO String
rangeToString self
  = (propagateGError $
       \ errorPtr_ ->
         {# call webkit_dom_range_to_string #} (toDOMRange self) errorPtr_)
      >>=
      readUTFString
 
rangeDetach :: (DOMRangeClass self) => self -> IO ()
rangeDetach self
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_range_detach #} (toDOMRange self) errorPtr_
 
rangeCreateContextualFragment ::
                              (DOMRangeClass self) =>
                                self -> String -> IO (Maybe DocumentFragment)
rangeCreateContextualFragment self html
  = maybeNull (makeNewGObject mkDocumentFragment)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString html $
             \ htmlPtr ->
               {# call webkit_dom_range_create_contextual_fragment #}
                 (toDOMRange self)
                 htmlPtr
             errorPtr_)
 
rangeIntersectsNode ::
                    (DOMRangeClass self, NodeClass refNode) =>
                      self -> Maybe refNode -> IO Bool
rangeIntersectsNode self refNode
  = toBool <$>
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_intersects_node #} (toDOMRange self)
             (maybe (Node nullForeignPtr) toNode refNode)
             errorPtr_)
 
rangeCompareNode ::
                 (DOMRangeClass self, NodeClass refNode) =>
                   self -> Maybe refNode -> IO Int
rangeCompareNode self refNode
  = fromIntegral <$>
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_compare_node #} (toDOMRange self)
             (maybe (Node nullForeignPtr) toNode refNode)
             errorPtr_)
 
rangeComparePoint ::
                  (DOMRangeClass self, NodeClass refNode) =>
                    self -> Maybe refNode -> Int -> IO Int
rangeComparePoint self refNode offset
  = fromIntegral <$>
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_compare_point #} (toDOMRange self)
             (maybe (Node nullForeignPtr) toNode refNode)
             (fromIntegral offset)
             errorPtr_)
 
rangeIsPointInRange ::
                    (DOMRangeClass self, NodeClass refNode) =>
                      self -> Maybe refNode -> Int -> IO Bool
rangeIsPointInRange self refNode offset
  = toBool <$>
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_is_point_in_range #} (toDOMRange self)
             (maybe (Node nullForeignPtr) toNode refNode)
             (fromIntegral offset)
             errorPtr_)
 
rangeExpand :: (DOMRangeClass self) => self -> String -> IO ()
rangeExpand self unit
  = propagateGError $
      \ errorPtr_ ->
        withUTFString unit $
          \ unitPtr ->
            {# call webkit_dom_range_expand #} (toDOMRange self) unitPtr
          errorPtr_
cSTART_TO_START = 0
cSTART_TO_END = 1
cEND_TO_END = 2
cEND_TO_START = 3
cNODE_BEFORE = 0
cNODE_AFTER = 1
cNODE_BEFORE_AND_AFTER = 2
cNODE_INSIDE = 3
 
rangeGetStartContainer ::
                       (DOMRangeClass self) => self -> IO (Maybe Node)
rangeGetStartContainer self
  = maybeNull (makeNewGObject mkNode)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_get_start_container #} (toDOMRange self)
             errorPtr_)
 
rangeGetStartOffset :: (DOMRangeClass self) => self -> IO Int
rangeGetStartOffset self
  = fromIntegral <$>
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_get_start_offset #} (toDOMRange self)
             errorPtr_)
 
rangeGetEndContainer ::
                     (DOMRangeClass self) => self -> IO (Maybe Node)
rangeGetEndContainer self
  = maybeNull (makeNewGObject mkNode)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_get_end_container #} (toDOMRange self)
             errorPtr_)
 
rangeGetEndOffset :: (DOMRangeClass self) => self -> IO Int
rangeGetEndOffset self
  = fromIntegral <$>
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_get_end_offset #} (toDOMRange self)
             errorPtr_)
 
rangeGetCollapsed :: (DOMRangeClass self) => self -> IO Bool
rangeGetCollapsed self
  = toBool <$>
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_get_collapsed #} (toDOMRange self)
             errorPtr_)
 
rangeGetCommonAncestorContainer ::
                                (DOMRangeClass self) => self -> IO (Maybe Node)
rangeGetCommonAncestorContainer self
  = maybeNull (makeNewGObject mkNode)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_range_get_common_ancestor_container #}
             (toDOMRange self)
             errorPtr_)
 
rangeGetText :: (DOMRangeClass self) => self -> IO String
rangeGetText self
  = ({# call webkit_dom_range_get_text #} (toDOMRange self)) >>=
      readUTFString
