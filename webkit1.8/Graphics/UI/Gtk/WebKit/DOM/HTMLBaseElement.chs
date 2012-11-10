module Graphics.UI.Gtk.WebKit.DOM.HTMLBaseElement
       (htmlBaseElementSetHref, htmlBaseElementGetHref,
        htmlBaseElementSetTarget, htmlBaseElementGetTarget)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlBaseElementSetHref ::
                       (HTMLBaseElementClass self) => self -> String -> IO ()
htmlBaseElementSetHref self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_base_element_set_href #}
          (toHTMLBaseElement self)
          valPtr
 
htmlBaseElementGetHref ::
                       (HTMLBaseElementClass self) => self -> IO String
htmlBaseElementGetHref self
  = ({# call webkit_dom_html_base_element_get_href #}
       (toHTMLBaseElement self))
      >>=
      readUTFString
 
htmlBaseElementSetTarget ::
                         (HTMLBaseElementClass self) => self -> String -> IO ()
htmlBaseElementSetTarget self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_base_element_set_target #}
          (toHTMLBaseElement self)
          valPtr
 
htmlBaseElementGetTarget ::
                         (HTMLBaseElementClass self) => self -> IO String
htmlBaseElementGetTarget self
  = ({# call webkit_dom_html_base_element_get_target #}
       (toHTMLBaseElement self))
      >>=
      readUTFString
