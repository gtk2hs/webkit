module Graphics.UI.Gtk.WebKit.DOM.DOMMimeTypeArray
       (domMimeTypeArrayItem, domMimeTypeArrayNamedItem,
        domMimeTypeArrayGetLength)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
domMimeTypeArrayItem ::
                     (DOMMimeTypeArrayClass self) =>
                       self -> Word -> IO (Maybe DOMMimeType)
domMimeTypeArrayItem self index
  = maybeNull (makeNewGObject mkDOMMimeType)
      ({# call webkit_dom_dom_mime_type_array_item #}
         (toDOMMimeTypeArray self)
         (fromIntegral index))
 
domMimeTypeArrayNamedItem ::
                          (DOMMimeTypeArrayClass self) =>
                            self -> String -> IO (Maybe DOMMimeType)
domMimeTypeArrayNamedItem self name
  = maybeNull (makeNewGObject mkDOMMimeType)
      (withUTFString name $
         \ namePtr ->
           {# call webkit_dom_dom_mime_type_array_named_item #}
             (toDOMMimeTypeArray self)
             namePtr)
 
domMimeTypeArrayGetLength ::
                          (DOMMimeTypeArrayClass self) => self -> IO Word
domMimeTypeArrayGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_dom_mime_type_array_get_length #}
         (toDOMMimeTypeArray self))
