module Graphics.UI.Gtk.WebKit.DOM.NodeList
       (nodeListItem, nodeListGetLength, NodeList, NodeListClass,
        castToNodeList, gTypeNodeList, toNodeList)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
nodeListItem ::
             (NodeListClass self) => self -> Word -> IO (Maybe Node)
nodeListItem self index
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_node_list_item #} (toNodeList self)
         (fromIntegral index))
 
nodeListGetLength :: (NodeListClass self) => self -> IO Word
nodeListGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_node_list_get_length #} (toNodeList self))
