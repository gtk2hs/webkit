module Graphics.UI.Gtk.WebKit.DOM.HTMLOptGroupElement
       (htmlOptGroupElementSetDisabled, htmlOptGroupElementGetDisabled,
        htmlOptGroupElementSetLabel, htmlOptGroupElementGetLabel,
        HTMLOptGroupElement, HTMLOptGroupElementClass,
        castToHTMLOptGroupElement, gTypeHTMLOptGroupElement,
        toHTMLOptGroupElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlOptGroupElementSetDisabled ::
                               (HTMLOptGroupElementClass self) => self -> Bool -> IO ()
htmlOptGroupElementSetDisabled self val
  = {# call webkit_dom_html_opt_group_element_set_disabled #}
      (toHTMLOptGroupElement self)
      (fromBool val)
 
htmlOptGroupElementGetDisabled ::
                               (HTMLOptGroupElementClass self) => self -> IO Bool
htmlOptGroupElementGetDisabled self
  = toBool <$>
      ({# call webkit_dom_html_opt_group_element_get_disabled #}
         (toHTMLOptGroupElement self))
 
htmlOptGroupElementSetLabel ::
                            (HTMLOptGroupElementClass self) => self -> String -> IO ()
htmlOptGroupElementSetLabel self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_opt_group_element_set_label #}
          (toHTMLOptGroupElement self)
          valPtr
 
htmlOptGroupElementGetLabel ::
                            (HTMLOptGroupElementClass self) => self -> IO String
htmlOptGroupElementGetLabel self
  = ({# call webkit_dom_html_opt_group_element_get_label #}
       (toHTMLOptGroupElement self))
      >>=
      readUTFString
