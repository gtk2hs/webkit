module Graphics.UI.Gtk.WebKit.DOM.HTMLLegendElement
       (htmlLegendElementGetForm, htmlLegendElementSetAlign,
        htmlLegendElementGetAlign)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlLegendElementGetForm ::
                         (HTMLLegendElementClass self) => self -> IO (Maybe HTMLFormElement)
htmlLegendElementGetForm self
  = maybeNull (makeNewGObject mkHTMLFormElement)
      ({# call webkit_dom_html_legend_element_get_form #}
         (toHTMLLegendElement self))
 
htmlLegendElementSetAlign ::
                          (HTMLLegendElementClass self) => self -> String -> IO ()
htmlLegendElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_legend_element_set_align #}
          (toHTMLLegendElement self)
          valPtr
 
htmlLegendElementGetAlign ::
                          (HTMLLegendElementClass self) => self -> IO String
htmlLegendElementGetAlign self
  = ({# call webkit_dom_html_legend_element_get_align #}
       (toHTMLLegendElement self))
      >>=
      readUTFString
