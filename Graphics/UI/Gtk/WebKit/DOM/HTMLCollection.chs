module Graphics.UI.Gtk.WebKit.DOM.HTMLCollection
       (htmlCollectionItem, htmlCollectionGetLength) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlCollectionItem ::
                   (HTMLCollectionClass self) => self -> Word -> IO (Maybe Node)
htmlCollectionItem self index
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_html_collection_item #} (toHTMLCollection self)
         (fromIntegral index))
 
htmlCollectionGetLength ::
                        (HTMLCollectionClass self) => self -> IO Word
htmlCollectionGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_html_collection_get_length #}
         (toHTMLCollection self))
