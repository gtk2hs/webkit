module Graphics.UI.Gtk.WebKit.DOM.HTMLHeadingElement
       (htmlHeadingElementSetAlign, htmlHeadingElementGetAlign,
        HTMLHeadingElement, HTMLHeadingElementClass,
        castToHTMLHeadingElement, gTypeHTMLHeadingElement,
        toHTMLHeadingElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlHeadingElementSetAlign ::
                           (HTMLHeadingElementClass self, GlibString string) =>
                             self -> string -> IO ()
htmlHeadingElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_heading_element_set_align #}
          (toHTMLHeadingElement self)
          valPtr
 
htmlHeadingElementGetAlign ::
                           (HTMLHeadingElementClass self, GlibString string) =>
                             self -> IO string
htmlHeadingElementGetAlign self
  = ({# call webkit_dom_html_heading_element_get_align #}
       (toHTMLHeadingElement self))
      >>=
      readUTFString
