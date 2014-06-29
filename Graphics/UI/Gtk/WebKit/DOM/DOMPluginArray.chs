module Graphics.UI.Gtk.WebKit.DOM.DOMPluginArray
       (domPluginArrayItem, domPluginArrayNamedItem,
        domPluginArrayRefresh, domPluginArrayGetLength, DOMPluginArray,
        DOMPluginArrayClass, castToDOMPluginArray, gTypeDOMPluginArray,
        toDOMPluginArray)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
domPluginArrayItem ::
                   (DOMPluginArrayClass self) => self -> Word -> IO (Maybe DOMPlugin)
domPluginArrayItem self index
  = maybeNull (makeNewGObject mkDOMPlugin)
      ({# call webkit_dom_dom_plugin_array_item #}
         (toDOMPluginArray self)
         (fromIntegral index))
 
domPluginArrayNamedItem ::
                        (DOMPluginArrayClass self, GlibString string) =>
                          self -> string -> IO (Maybe DOMPlugin)
domPluginArrayNamedItem self name
  = maybeNull (makeNewGObject mkDOMPlugin)
      (withUTFString name $
         \ namePtr ->
           {# call webkit_dom_dom_plugin_array_named_item #}
             (toDOMPluginArray self)
             namePtr)
 
domPluginArrayRefresh ::
                      (DOMPluginArrayClass self) => self -> Bool -> IO ()
domPluginArrayRefresh self reload
  = {# call webkit_dom_dom_plugin_array_refresh #}
      (toDOMPluginArray self)
      (fromBool reload)
 
domPluginArrayGetLength ::
                        (DOMPluginArrayClass self) => self -> IO Word
domPluginArrayGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_dom_plugin_array_get_length #}
         (toDOMPluginArray self))
