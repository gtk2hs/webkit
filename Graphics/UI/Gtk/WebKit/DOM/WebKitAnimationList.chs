module Graphics.UI.Gtk.WebKit.DOM.WebKitAnimationList
       (webKitAnimationListItem, webKitAnimationListGetLength) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
webKitAnimationListItem ::
                        (WebKitAnimationListClass self) =>
                          self -> Word -> IO (Maybe WebKitAnimation)
webKitAnimationListItem self index
  = maybeNull (makeNewGObject mkWebKitAnimation)
      ({# call webkit_dom_webkit_animation_list_item #}
         (toWebKitAnimationList self)
         (fromIntegral index))
 
webKitAnimationListGetLength ::
                             (WebKitAnimationListClass self) => self -> IO Word
webKitAnimationListGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_webkit_animation_list_get_length #}
         (toWebKitAnimationList self))
