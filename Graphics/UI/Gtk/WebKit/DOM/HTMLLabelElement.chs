module Graphics.UI.Gtk.WebKit.DOM.HTMLLabelElement
       (htmlLabelElementGetForm, htmlLabelElementSetHtmlFor,
        htmlLabelElementGetHtmlFor, htmlLabelElementGetControl)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlLabelElementGetForm ::
                        (HTMLLabelElementClass self) => self -> IO (Maybe HTMLFormElement)
htmlLabelElementGetForm self
  = maybeNull (makeNewGObject mkHTMLFormElement)
      ({# call webkit_dom_html_label_element_get_form #}
         (toHTMLLabelElement self))
 
htmlLabelElementSetHtmlFor ::
                           (HTMLLabelElementClass self) => self -> String -> IO ()
htmlLabelElementSetHtmlFor self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_label_element_set_html_for #}
          (toHTMLLabelElement self)
          valPtr
 
htmlLabelElementGetHtmlFor ::
                           (HTMLLabelElementClass self) => self -> IO String
htmlLabelElementGetHtmlFor self
  = ({# call webkit_dom_html_label_element_get_html_for #}
       (toHTMLLabelElement self))
      >>=
      readUTFString
 
htmlLabelElementGetControl ::
                           (HTMLLabelElementClass self) => self -> IO (Maybe HTMLElement)
htmlLabelElementGetControl self
  = maybeNull (makeNewGObject mkHTMLElement)
      ({# call webkit_dom_html_label_element_get_control #}
         (toHTMLLabelElement self))
