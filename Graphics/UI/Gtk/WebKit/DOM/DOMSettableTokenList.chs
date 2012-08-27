module Graphics.UI.Gtk.WebKit.DOM.DOMSettableTokenList
       (domSettableTokenListSetValue, domSettableTokenListGetValue) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
domSettableTokenListSetValue ::
                             (DOMSettableTokenListClass self) => self -> String -> IO ()
domSettableTokenListSetValue self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_dom_settable_token_list_set_value #}
          (toDOMSettableTokenList self)
          valPtr
 
domSettableTokenListGetValue ::
                             (DOMSettableTokenListClass self) => self -> IO String
domSettableTokenListGetValue self
  = ({# call webkit_dom_dom_settable_token_list_get_value #}
       (toDOMSettableTokenList self))
      >>=
      readUTFString
