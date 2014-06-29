module Graphics.UI.Gtk.WebKit.DOM.DOMStringList
       (domStringListItem, domStringListContains, domStringListGetLength,
        DOMStringList, DOMStringListClass, castToDOMStringList,
        gTypeDOMStringList, toDOMStringList)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
domStringListItem ::
                  (DOMStringListClass self, GlibString string) =>
                    self -> Word -> IO string
domStringListItem self index
  = ({# call webkit_dom_dom_string_list_item #}
       (toDOMStringList self)
       (fromIntegral index))
      >>=
      readUTFString
 
domStringListContains ::
                      (DOMStringListClass self, GlibString string) =>
                        self -> string -> IO Bool
domStringListContains self string
  = toBool <$>
      (withUTFString string $
         \ stringPtr ->
           {# call webkit_dom_dom_string_list_contains #}
             (toDOMStringList self)
             stringPtr)
 
domStringListGetLength ::
                       (DOMStringListClass self) => self -> IO Word
domStringListGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_dom_string_list_get_length #}
         (toDOMStringList self))
