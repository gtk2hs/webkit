module Graphics.UI.Gtk.WebKit.DOM.MediaQueryList
       (mediaQueryListGetMedia, mediaQueryListGetMatches, MediaQueryList,
        MediaQueryListClass, castToMediaQueryList, gTypeMediaQueryList,
        toMediaQueryList)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
mediaQueryListGetMedia ::
                       (MediaQueryListClass self) => self -> IO String
mediaQueryListGetMedia self
  = ({# call webkit_dom_media_query_list_get_media #}
       (toMediaQueryList self))
      >>=
      readUTFString
 
mediaQueryListGetMatches ::
                         (MediaQueryListClass self) => self -> IO Bool
mediaQueryListGetMatches self
  = toBool <$>
      ({# call webkit_dom_media_query_list_get_matches #}
         (toMediaQueryList self))
