module Graphics.UI.Gtk.WebKit.DOM.HTMLOptionsCollection
       (
#if WEBKIT_CHECK_VERSION(2,2,2)
        htmlOptionsCollectionNamedItem,
#endif
        htmlOptionsCollectionSetSelectedIndex,
        htmlOptionsCollectionGetSelectedIndex, HTMLOptionsCollection,
        HTMLOptionsCollectionClass, castToHTMLOptionsCollection,
        gTypeHTMLOptionsCollection, toHTMLOptionsCollection)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
#if WEBKIT_CHECK_VERSION(2,2,2)
htmlOptionsCollectionNamedItem ::
                               (HTMLOptionsCollectionClass self) =>
                                 self -> String -> IO (Maybe Node)
htmlOptionsCollectionNamedItem self name
  = maybeNull (makeNewGObject mkNode)
      (withUTFString name $
         \ namePtr ->
           {# call webkit_dom_html_options_collection_named_item #}
             (toHTMLOptionsCollection self)
             namePtr)
#endif

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
