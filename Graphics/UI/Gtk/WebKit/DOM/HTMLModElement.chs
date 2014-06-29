module Graphics.UI.Gtk.WebKit.DOM.HTMLModElement
       (htmlModElementSetCite, htmlModElementGetCite,
        htmlModElementSetDateTime, htmlModElementGetDateTime,
        HTMLModElement, HTMLModElementClass, castToHTMLModElement,
        gTypeHTMLModElement, toHTMLModElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlModElementSetCite ::
                      (HTMLModElementClass self, GlibString string) =>
                        self -> string -> IO ()
htmlModElementSetCite self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_mod_element_set_cite #}
          (toHTMLModElement self)
          valPtr
 
htmlModElementGetCite ::
                      (HTMLModElementClass self, GlibString string) => self -> IO string
htmlModElementGetCite self
  = ({# call webkit_dom_html_mod_element_get_cite #}
       (toHTMLModElement self))
      >>=
      readUTFString
 
htmlModElementSetDateTime ::
                          (HTMLModElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmlModElementSetDateTime self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_mod_element_set_date_time #}
          (toHTMLModElement self)
          valPtr
 
htmlModElementGetDateTime ::
                          (HTMLModElementClass self, GlibString string) => self -> IO string
htmlModElementGetDateTime self
  = ({# call webkit_dom_html_mod_element_get_date_time #}
       (toHTMLModElement self))
      >>=
      readUTFString
