module Graphics.UI.Gtk.WebKit.DOM.DOMSettableTokenList
       (domSettableTokenListSetValue, domSettableTokenListGetValue,
        DOMSettableTokenList, DOMSettableTokenListClass,
        castToDOMSettableTokenList, gTypeDOMSettableTokenList,
        toDOMSettableTokenList)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
domSettableTokenListSetValue ::
                             (DOMSettableTokenListClass self, GlibString string) =>
                               self -> string -> IO ()
domSettableTokenListSetValue self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_dom_settable_token_list_set_value #}
          (toDOMSettableTokenList self)
          valPtr
 
domSettableTokenListGetValue ::
                             (DOMSettableTokenListClass self, GlibString string) =>
                               self -> IO string
domSettableTokenListGetValue self
  = ({# call webkit_dom_dom_settable_token_list_get_value #}
       (toDOMSettableTokenList self))
      >>=
      readUTFString
