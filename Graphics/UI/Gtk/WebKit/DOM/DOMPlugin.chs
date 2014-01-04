module Graphics.UI.Gtk.WebKit.DOM.DOMPlugin
       (domPluginItem, domPluginNamedItem, domPluginGetName,
        domPluginGetFilename, domPluginGetDescription, domPluginGetLength,
        DOMPlugin, DOMPluginClass, castToDOMPlugin, gTypeDOMPlugin,
        toDOMPlugin)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
domPluginItem ::
              (DOMPluginClass self) => self -> Word -> IO (Maybe DOMMimeType)
domPluginItem self index
  = maybeNull (makeNewGObject mkDOMMimeType)
      ({# call webkit_dom_dom_plugin_item #} (toDOMPlugin self)
         (fromIntegral index))
 
domPluginNamedItem ::
                   (DOMPluginClass self) => self -> String -> IO (Maybe DOMMimeType)
domPluginNamedItem self name
  = maybeNull (makeNewGObject mkDOMMimeType)
      (withUTFString name $
         \ namePtr ->
           {# call webkit_dom_dom_plugin_named_item #} (toDOMPlugin self)
             namePtr)
 
domPluginGetName :: (DOMPluginClass self) => self -> IO String
domPluginGetName self
  = ({# call webkit_dom_dom_plugin_get_name #} (toDOMPlugin self))
      >>=
      readUTFString
 
domPluginGetFilename :: (DOMPluginClass self) => self -> IO String
domPluginGetFilename self
  = ({# call webkit_dom_dom_plugin_get_filename #}
       (toDOMPlugin self))
      >>=
      readUTFString
 
domPluginGetDescription ::
                        (DOMPluginClass self) => self -> IO String
domPluginGetDescription self
  = ({# call webkit_dom_dom_plugin_get_description #}
       (toDOMPlugin self))
      >>=
      readUTFString
 
domPluginGetLength :: (DOMPluginClass self) => self -> IO Word
domPluginGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_dom_plugin_get_length #} (toDOMPlugin self))
