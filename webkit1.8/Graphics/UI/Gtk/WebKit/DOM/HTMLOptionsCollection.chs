module Graphics.UI.Gtk.WebKit.DOM.HTMLOptionsCollection
       (htmlOptionsCollectionSetSelectedIndex,
        htmlOptionsCollectionGetSelectedIndex)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlOptionsCollectionSetSelectedIndex ::
                                      (HTMLOptionsCollectionClass self) => self -> Int -> IO ()
htmlOptionsCollectionSetSelectedIndex self val
  = {# call webkit_dom_html_options_collection_set_selected_index #}
      (toHTMLOptionsCollection self)
      (fromIntegral val)
 
htmlOptionsCollectionGetSelectedIndex ::
                                      (HTMLOptionsCollectionClass self) => self -> IO Int
htmlOptionsCollectionGetSelectedIndex self
  = fromIntegral <$>
      ({# call webkit_dom_html_options_collection_get_selected_index #}
         (toHTMLOptionsCollection self))
