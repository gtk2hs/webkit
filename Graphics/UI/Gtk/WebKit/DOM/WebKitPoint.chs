module Graphics.UI.Gtk.WebKit.DOM.WebKitPoint
       (webKitPointSetX, webKitPointGetX, webKitPointSetY,
        webKitPointGetY, WebKitPoint, WebKitPointClass, castToWebKitPoint,
        gTypeWebKitPoint, toWebKitPoint)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
webKitPointSetX ::
                (WebKitPointClass self) => self -> Float -> IO ()
webKitPointSetX self val
  = {# call webkit_dom_webkit_point_set_x #} (toWebKitPoint self)
      (realToFrac val)
 
webKitPointGetX :: (WebKitPointClass self) => self -> IO Float
webKitPointGetX self
  = realToFrac <$>
      ({# call webkit_dom_webkit_point_get_x #} (toWebKitPoint self))
 
webKitPointSetY ::
                (WebKitPointClass self) => self -> Float -> IO ()
webKitPointSetY self val
  = {# call webkit_dom_webkit_point_set_y #} (toWebKitPoint self)
      (realToFrac val)
 
webKitPointGetY :: (WebKitPointClass self) => self -> IO Float
webKitPointGetY self
  = realToFrac <$>
      ({# call webkit_dom_webkit_point_get_y #} (toWebKitPoint self))
