module Graphics.UI.Gtk.WebKit.DOM.HTMLCollection
       (htmlCollectionItem,
#if WEBKIT_CHECK_VERSION(2,2,2)
        htmlCollectionNamedItem,
#endif
        htmlCollectionGetLength, HTMLCollection, HTMLCollectionClass,
        castToHTMLCollection, gTypeHTMLCollection, toHTMLCollection)
       where
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
 
#if WEBKIT_CHECK_VERSION(2,2,2)
htmlCollectionNamedItem ::
                        (HTMLCollectionClass self, GlibString string) =>
                          self -> string -> IO (Maybe Node)
htmlCollectionNamedItem self name
  = maybeNull (makeNewGObject mkNode)
      (withUTFString name $
         \ namePtr ->
           {# call webkit_dom_html_collection_named_item #}
             (toHTMLCollection self)
             namePtr)
#endif

htmlCollectionGetLength ::
                        (HTMLCollectionClass self) => self -> IO Word
htmlCollectionGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_html_collection_get_length #}
         (toHTMLCollection self))
