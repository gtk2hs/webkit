module Graphics.UI.Gtk.WebKit.DOM.DOMWindowCSS
       (
#if WEBKIT_CHECK_VERSION(2,2,2)
       domWindowCSSSupports
#endif
       ) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
#if WEBKIT_CHECK_VERSION(2,2,2)
domWindowCSSSupports ::
                     (DOMWindowCSSClass self) => self -> String -> String -> IO Bool
domWindowCSSSupports self property value
  = toBool <$>
      (withUTFString value $
         \ valuePtr ->
           withUTFString property $
             \ propertyPtr ->
               {# call webkit_dom_dom_window_css_supports #} (toDOMWindowCSS self)
                 propertyPtr
             valuePtr)
#endif