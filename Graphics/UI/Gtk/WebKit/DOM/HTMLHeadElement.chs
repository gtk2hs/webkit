module Graphics.UI.Gtk.WebKit.DOM.HTMLHeadElement
       (htmlHeadElementSetProfile, htmlHeadElementGetProfile,
        HTMLHeadElement, HTMLHeadElementClass, castToHTMLHeadElement,
        gTypeHTMLHeadElement, toHTMLHeadElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlHeadElementSetProfile ::
                          (HTMLHeadElementClass self) => self -> String -> IO ()
htmlHeadElementSetProfile self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_head_element_set_profile #}
          (toHTMLHeadElement self)
          valPtr
 
htmlHeadElementGetProfile ::
                          (HTMLHeadElementClass self) => self -> IO String
htmlHeadElementGetProfile self
  = ({# call webkit_dom_html_head_element_get_profile #}
       (toHTMLHeadElement self))
      >>=
      readUTFString
