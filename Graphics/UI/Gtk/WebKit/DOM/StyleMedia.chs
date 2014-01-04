module Graphics.UI.Gtk.WebKit.DOM.StyleMedia
       (styleMediaMatchMedium, StyleMedia, StyleMediaClass,
        castToStyleMedia, gTypeStyleMedia, toStyleMedia)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
styleMediaMatchMedium ::
                      (StyleMediaClass self) => self -> String -> IO Bool
styleMediaMatchMedium self mediaquery
  = toBool <$>
      (withUTFString mediaquery $
         \ mediaqueryPtr ->
           {# call webkit_dom_style_media_match_medium #} (toStyleMedia self)
             mediaqueryPtr)
