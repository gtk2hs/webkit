module Graphics.UI.Gtk.WebKit.DOM.StyleSheetList
       (styleSheetListItem, styleSheetListGetLength) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
styleSheetListItem ::
                   (StyleSheetListClass self) => self -> Word -> IO (Maybe StyleSheet)
styleSheetListItem self index
  = maybeNull (makeNewGObject mkStyleSheet)
      ({# call webkit_dom_style_sheet_list_item #}
         (toStyleSheetList self)
         (fromIntegral index))
 
styleSheetListGetLength ::
                        (StyleSheetListClass self) => self -> IO Word
styleSheetListGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_style_sheet_list_get_length #}
         (toStyleSheetList self))
