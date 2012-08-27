module Graphics.UI.Gtk.WebKit.DOM.HTMLMapElement
       (htmlMapElementGetAreas, htmlMapElementSetName,
        htmlMapElementGetName)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlMapElementGetAreas ::
                       (HTMLMapElementClass self) => self -> IO (Maybe HTMLCollection)
htmlMapElementGetAreas self
  = maybeNull (makeNewGObject mkHTMLCollection)
      ({# call webkit_dom_html_map_element_get_areas #}
         (toHTMLMapElement self))
 
htmlMapElementSetName ::
                      (HTMLMapElementClass self) => self -> String -> IO ()
htmlMapElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_map_element_set_name #}
          (toHTMLMapElement self)
          valPtr
 
htmlMapElementGetName ::
                      (HTMLMapElementClass self) => self -> IO String
htmlMapElementGetName self
  = ({# call webkit_dom_html_map_element_get_name #}
       (toHTMLMapElement self))
      >>=
      readUTFString
