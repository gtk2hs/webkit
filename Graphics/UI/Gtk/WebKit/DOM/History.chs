module Graphics.UI.Gtk.WebKit.DOM.History
       (historyGetLength, History, HistoryClass, castToHistory,
        gTypeHistory, toHistory)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
historyGetLength :: (HistoryClass self) => self -> IO Word
historyGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_history_get_length #} (toHistory self))
