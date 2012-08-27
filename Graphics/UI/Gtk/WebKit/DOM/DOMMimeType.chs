module Graphics.UI.Gtk.WebKit.DOM.DOMMimeType
       (domMimeTypeGetSuffixes, domMimeTypeGetDescription,
        domMimeTypeGetEnabledPlugin)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
domMimeTypeGetSuffixes ::
                       (DOMMimeTypeClass self) => self -> IO String
domMimeTypeGetSuffixes self
  = ({# call webkit_dom_dom_mime_type_get_suffixes #}
       (toDOMMimeType self))
      >>=
      readUTFString
 
domMimeTypeGetDescription ::
                          (DOMMimeTypeClass self) => self -> IO String
domMimeTypeGetDescription self
  = ({# call webkit_dom_dom_mime_type_get_description #}
       (toDOMMimeType self))
      >>=
      readUTFString
 
domMimeTypeGetEnabledPlugin ::
                            (DOMMimeTypeClass self) => self -> IO (Maybe DOMPlugin)
domMimeTypeGetEnabledPlugin self
  = maybeNull (makeNewGObject mkDOMPlugin)
      ({# call webkit_dom_dom_mime_type_get_enabled_plugin #}
         (toDOMMimeType self))
