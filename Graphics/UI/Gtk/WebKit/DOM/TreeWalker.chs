module Graphics.UI.Gtk.WebKit.DOM.TreeWalker
       (treeWalkerGetRoot, treeWalkerGetWhatToShow, treeWalkerGetFilter,
        treeWalkerGetExpandEntityReferences, treeWalkerSetCurrentNode,
        treeWalkerGetCurrentNode, TreeWalker(..), TreeWalkerClass(..),
        castToTreeWalker, gTypeTreeWalker, toTreeWalker)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
treeWalkerGetRoot ::
                  (TreeWalkerClass self) => self -> IO (Maybe Node)
treeWalkerGetRoot self
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_tree_walker_get_root #} (toTreeWalker self))
 
treeWalkerGetWhatToShow ::
                        (TreeWalkerClass self) => self -> IO Word
treeWalkerGetWhatToShow self
  = fromIntegral <$>
      ({# call webkit_dom_tree_walker_get_what_to_show #}
         (toTreeWalker self))
 
treeWalkerGetFilter ::
                    (TreeWalkerClass self) => self -> IO (Maybe NodeFilter)
treeWalkerGetFilter self
  = maybeNull (makeNewGObject mkNodeFilter)
      ({# call webkit_dom_tree_walker_get_filter #} (toTreeWalker self))
 
treeWalkerGetExpandEntityReferences ::
                                    (TreeWalkerClass self) => self -> IO Bool
treeWalkerGetExpandEntityReferences self
  = toBool <$>
      ({# call webkit_dom_tree_walker_get_expand_entity_references #}
         (toTreeWalker self))
 
treeWalkerSetCurrentNode ::
                         (NodeClass val, TreeWalkerClass self) => self -> Maybe val -> IO ()
treeWalkerSetCurrentNode self val
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_tree_walker_set_current_node #}
          (toTreeWalker self)
          (maybe (Node nullForeignPtr) toNode val)
          errorPtr_
 
treeWalkerGetCurrentNode ::
                         (TreeWalkerClass self) => self -> IO (Maybe Node)
treeWalkerGetCurrentNode self
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_tree_walker_get_current_node #}
         (toTreeWalker self))
