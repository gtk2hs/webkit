module Graphics.UI.Gtk.WebKit.DOM.DOMSelection
       (domSelectionCollapse, domSelectionCollapseToEnd,
        domSelectionCollapseToStart, domSelectionDeleteFromDocument,
        domSelectionContainsNode, domSelectionSelectAllChildren,
        domSelectionExtend, domSelectionGetRangeAt,
        domSelectionRemoveAllRanges, domSelectionAddRange,
        domSelectionModify, domSelectionSetBaseAndExtent,
        domSelectionSetPosition, domSelectionEmpty,
        domSelectionGetAnchorNode, domSelectionGetAnchorOffset,
        domSelectionGetFocusNode, domSelectionGetFocusOffset,
        domSelectionGetIsCollapsed, domSelectionGetRangeCount,
        domSelectionGetBaseNode, domSelectionGetBaseOffset,
        domSelectionGetExtentNode, domSelectionGetExtentOffset,
        DOMSelection, DOMSelectionClass, castToDOMSelection,
        gTypeDOMSelection, toDOMSelection)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
domSelectionCollapse ::
                     (DOMSelectionClass self, NodeClass node) =>
                       self -> Maybe node -> Int -> IO ()
domSelectionCollapse self node index
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_dom_selection_collapse #} (toDOMSelection self)
          (maybe (Node nullForeignPtr) toNode node)
          (fromIntegral index)
          errorPtr_
 
domSelectionCollapseToEnd ::
                          (DOMSelectionClass self) => self -> IO ()
domSelectionCollapseToEnd self
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_dom_selection_collapse_to_end #}
          (toDOMSelection self)
          errorPtr_
 
domSelectionCollapseToStart ::
                            (DOMSelectionClass self) => self -> IO ()
domSelectionCollapseToStart self
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_dom_selection_collapse_to_start #}
          (toDOMSelection self)
          errorPtr_
 
domSelectionDeleteFromDocument ::
                               (DOMSelectionClass self) => self -> IO ()
domSelectionDeleteFromDocument self
  = {# call webkit_dom_dom_selection_delete_from_document #}
      (toDOMSelection self)
 
domSelectionContainsNode ::
                         (DOMSelectionClass self, NodeClass node) =>
                           self -> Maybe node -> Bool -> IO Bool
domSelectionContainsNode self node allowPartial
  = toBool <$>
      ({# call webkit_dom_dom_selection_contains_node #}
         (toDOMSelection self)
         (maybe (Node nullForeignPtr) toNode node)
         (fromBool allowPartial))
 
domSelectionSelectAllChildren ::
                              (DOMSelectionClass self, NodeClass node) =>
                                self -> Maybe node -> IO ()
domSelectionSelectAllChildren self node
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_dom_selection_select_all_children #}
          (toDOMSelection self)
          (maybe (Node nullForeignPtr) toNode node)
          errorPtr_
 
domSelectionExtend ::
                   (DOMSelectionClass self, NodeClass node) =>
                     self -> Maybe node -> Int -> IO ()
domSelectionExtend self node offset
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_dom_selection_extend #} (toDOMSelection self)
          (maybe (Node nullForeignPtr) toNode node)
          (fromIntegral offset)
          errorPtr_
 
domSelectionGetRangeAt ::
                       (DOMSelectionClass self) => self -> Int -> IO (Maybe DOMRange)
domSelectionGetRangeAt self index
  = maybeNull (makeNewGObject mkDOMRange)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_selection_get_range_at #}
             (toDOMSelection self)
             (fromIntegral index)
             errorPtr_)
 
domSelectionRemoveAllRanges ::
                            (DOMSelectionClass self) => self -> IO ()
domSelectionRemoveAllRanges self
  = {# call webkit_dom_dom_selection_remove_all_ranges #}
      (toDOMSelection self)
 
domSelectionAddRange ::
                     (DOMSelectionClass self, DOMRangeClass range) =>
                       self -> Maybe range -> IO ()
domSelectionAddRange self range
  = {# call webkit_dom_dom_selection_add_range #}
      (toDOMSelection self)
      (maybe (DOMRange nullForeignPtr) toDOMRange range)
 
domSelectionModify ::
                   (DOMSelectionClass self) =>
                     self -> String -> String -> String -> IO ()
domSelectionModify self alter direction granularity
  = withUTFString granularity $
      \ granularityPtr ->
        withUTFString direction $
          \ directionPtr ->
            withUTFString alter $
              \ alterPtr ->
                {# call webkit_dom_dom_selection_modify #} (toDOMSelection self)
                  alterPtr
              directionPtr
          granularityPtr
 
domSelectionSetBaseAndExtent ::
                             (DOMSelectionClass self, NodeClass baseNode,
                              NodeClass extentNode) =>
                               self -> Maybe baseNode -> Int -> Maybe extentNode -> Int -> IO ()
domSelectionSetBaseAndExtent self baseNode baseOffset extentNode
  extentOffset
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_dom_selection_set_base_and_extent #}
          (toDOMSelection self)
          (maybe (Node nullForeignPtr) toNode baseNode)
          (fromIntegral baseOffset)
          (maybe (Node nullForeignPtr) toNode extentNode)
          (fromIntegral extentOffset)
          errorPtr_
 
domSelectionSetPosition ::
                        (DOMSelectionClass self, NodeClass node) =>
                          self -> Maybe node -> Int -> IO ()
domSelectionSetPosition self node offset
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_dom_selection_set_position #}
          (toDOMSelection self)
          (maybe (Node nullForeignPtr) toNode node)
          (fromIntegral offset)
          errorPtr_
 
domSelectionEmpty :: (DOMSelectionClass self) => self -> IO ()
domSelectionEmpty self
  = {# call webkit_dom_dom_selection_empty #} (toDOMSelection self)
 
domSelectionGetAnchorNode ::
                          (DOMSelectionClass self) => self -> IO (Maybe Node)
domSelectionGetAnchorNode self
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_dom_selection_get_anchor_node #}
         (toDOMSelection self))
 
domSelectionGetAnchorOffset ::
                            (DOMSelectionClass self) => self -> IO Int
domSelectionGetAnchorOffset self
  = fromIntegral <$>
      ({# call webkit_dom_dom_selection_get_anchor_offset #}
         (toDOMSelection self))
 
domSelectionGetFocusNode ::
                         (DOMSelectionClass self) => self -> IO (Maybe Node)
domSelectionGetFocusNode self
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_dom_selection_get_focus_node #}
         (toDOMSelection self))
 
domSelectionGetFocusOffset ::
                           (DOMSelectionClass self) => self -> IO Int
domSelectionGetFocusOffset self
  = fromIntegral <$>
      ({# call webkit_dom_dom_selection_get_focus_offset #}
         (toDOMSelection self))
 
domSelectionGetIsCollapsed ::
                           (DOMSelectionClass self) => self -> IO Bool
domSelectionGetIsCollapsed self
  = toBool <$>
      ({# call webkit_dom_dom_selection_get_is_collapsed #}
         (toDOMSelection self))
 
domSelectionGetRangeCount ::
                          (DOMSelectionClass self) => self -> IO Int
domSelectionGetRangeCount self
  = fromIntegral <$>
      ({# call webkit_dom_dom_selection_get_range_count #}
         (toDOMSelection self))
 
domSelectionGetBaseNode ::
                        (DOMSelectionClass self) => self -> IO (Maybe Node)
domSelectionGetBaseNode self
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_dom_selection_get_base_node #}
         (toDOMSelection self))
 
domSelectionGetBaseOffset ::
                          (DOMSelectionClass self) => self -> IO Int
domSelectionGetBaseOffset self
  = fromIntegral <$>
      ({# call webkit_dom_dom_selection_get_base_offset #}
         (toDOMSelection self))
 
domSelectionGetExtentNode ::
                          (DOMSelectionClass self) => self -> IO (Maybe Node)
domSelectionGetExtentNode self
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_dom_selection_get_extent_node #}
         (toDOMSelection self))
 
domSelectionGetExtentOffset ::
                            (DOMSelectionClass self) => self -> IO Int
domSelectionGetExtentOffset self
  = fromIntegral <$>
      ({# call webkit_dom_dom_selection_get_extent_offset #}
         (toDOMSelection self))
