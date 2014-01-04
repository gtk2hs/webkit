module Graphics.UI.Gtk.WebKit.DOM.Notation
       (notationGetPublicId, notationGetSystemId, Notation, NotationClass,
        castToNotation, gTypeNotation, toNotation)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
notationGetPublicId :: (NotationClass self) => self -> IO String
notationGetPublicId self
  = ({# call webkit_dom_notation_get_public_id #} (toNotation self))
      >>=
      readUTFString
 
notationGetSystemId :: (NotationClass self) => self -> IO String
notationGetSystemId self
  = ({# call webkit_dom_notation_get_system_id #} (toNotation self))
      >>=
      readUTFString
