module Graphics.UI.Gtk.WebKit.DOM.HTMLDirectoryElement
       (htmlDirectoryElementSetCompact, htmlDirectoryElementGetCompact,
        HTMLDirectoryElement, HTMLDirectoryElementClass,
        castToHTMLDirectoryElement, gTypeHTMLDirectoryElement,
        toHTMLDirectoryElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlDirectoryElementSetCompact ::
                               (HTMLDirectoryElementClass self) => self -> Bool -> IO ()
htmlDirectoryElementSetCompact self val
  = {# call webkit_dom_html_directory_element_set_compact #}
      (toHTMLDirectoryElement self)
      (fromBool val)
 
htmlDirectoryElementGetCompact ::
                               (HTMLDirectoryElementClass self) => self -> IO Bool
htmlDirectoryElementGetCompact self
  = toBool <$>
      ({# call webkit_dom_html_directory_element_get_compact #}
         (toHTMLDirectoryElement self))
