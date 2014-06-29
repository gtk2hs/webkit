module Graphics.UI.Gtk.WebKit.DOM.HTMLAreaElement
       (htmlAreaElementSetAlt, htmlAreaElementGetAlt,
        htmlAreaElementSetCoords, htmlAreaElementGetCoords,
        htmlAreaElementSetHref, htmlAreaElementGetHref,
        htmlAreaElementSetNoHref, htmlAreaElementGetNoHref,
        htmlAreaElementSetPing, htmlAreaElementGetPing,
        htmlAreaElementSetShape, htmlAreaElementGetShape,
        htmlAreaElementSetTarget, htmlAreaElementGetTarget,
        htmlAreaElementGetHash, htmlAreaElementGetHost,
        htmlAreaElementGetHostname, htmlAreaElementGetPathname,
        htmlAreaElementGetPort, htmlAreaElementGetProtocol,
        htmlAreaElementGetSearch, HTMLAreaElement, HTMLAreaElementClass,
        castToHTMLAreaElement, gTypeHTMLAreaElement, toHTMLAreaElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlAreaElementSetAlt ::
                      (HTMLAreaElementClass self, GlibString string) =>
                        self -> string -> IO ()
htmlAreaElementSetAlt self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_area_element_set_alt #}
          (toHTMLAreaElement self)
          valPtr
 
htmlAreaElementGetAlt ::
                      (HTMLAreaElementClass self, GlibString string) => self -> IO string
htmlAreaElementGetAlt self
  = ({# call webkit_dom_html_area_element_get_alt #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementSetCoords ::
                         (HTMLAreaElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlAreaElementSetCoords self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_area_element_set_coords #}
          (toHTMLAreaElement self)
          valPtr
 
htmlAreaElementGetCoords ::
                         (HTMLAreaElementClass self, GlibString string) => self -> IO string
htmlAreaElementGetCoords self
  = ({# call webkit_dom_html_area_element_get_coords #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementSetHref ::
                       (HTMLAreaElementClass self, GlibString string) =>
                         self -> string -> IO ()
htmlAreaElementSetHref self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_area_element_set_href #}
          (toHTMLAreaElement self)
          valPtr
 
htmlAreaElementGetHref ::
                       (HTMLAreaElementClass self, GlibString string) => self -> IO string
htmlAreaElementGetHref self
  = ({# call webkit_dom_html_area_element_get_href #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementSetNoHref ::
                         (HTMLAreaElementClass self) => self -> Bool -> IO ()
htmlAreaElementSetNoHref self val
  = {# call webkit_dom_html_area_element_set_no_href #}
      (toHTMLAreaElement self)
      (fromBool val)
 
htmlAreaElementGetNoHref ::
                         (HTMLAreaElementClass self) => self -> IO Bool
htmlAreaElementGetNoHref self
  = toBool <$>
      ({# call webkit_dom_html_area_element_get_no_href #}
         (toHTMLAreaElement self))
 
htmlAreaElementSetPing ::
                       (HTMLAreaElementClass self, GlibString string) =>
                         self -> string -> IO ()
htmlAreaElementSetPing self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_area_element_set_ping #}
          (toHTMLAreaElement self)
          valPtr
 
htmlAreaElementGetPing ::
                       (HTMLAreaElementClass self, GlibString string) => self -> IO string
htmlAreaElementGetPing self
  = ({# call webkit_dom_html_area_element_get_ping #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementSetShape ::
                        (HTMLAreaElementClass self, GlibString string) =>
                          self -> string -> IO ()
htmlAreaElementSetShape self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_area_element_set_shape #}
          (toHTMLAreaElement self)
          valPtr
 
htmlAreaElementGetShape ::
                        (HTMLAreaElementClass self, GlibString string) => self -> IO string
htmlAreaElementGetShape self
  = ({# call webkit_dom_html_area_element_get_shape #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementSetTarget ::
                         (HTMLAreaElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlAreaElementSetTarget self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_area_element_set_target #}
          (toHTMLAreaElement self)
          valPtr
 
htmlAreaElementGetTarget ::
                         (HTMLAreaElementClass self, GlibString string) => self -> IO string
htmlAreaElementGetTarget self
  = ({# call webkit_dom_html_area_element_get_target #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementGetHash ::
                       (HTMLAreaElementClass self, GlibString string) => self -> IO string
htmlAreaElementGetHash self
  = ({# call webkit_dom_html_area_element_get_hash #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementGetHost ::
                       (HTMLAreaElementClass self, GlibString string) => self -> IO string
htmlAreaElementGetHost self
  = ({# call webkit_dom_html_area_element_get_host #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementGetHostname ::
                           (HTMLAreaElementClass self, GlibString string) => self -> IO string
htmlAreaElementGetHostname self
  = ({# call webkit_dom_html_area_element_get_hostname #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementGetPathname ::
                           (HTMLAreaElementClass self, GlibString string) => self -> IO string
htmlAreaElementGetPathname self
  = ({# call webkit_dom_html_area_element_get_pathname #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementGetPort ::
                       (HTMLAreaElementClass self, GlibString string) => self -> IO string
htmlAreaElementGetPort self
  = ({# call webkit_dom_html_area_element_get_port #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementGetProtocol ::
                           (HTMLAreaElementClass self, GlibString string) => self -> IO string
htmlAreaElementGetProtocol self
  = ({# call webkit_dom_html_area_element_get_protocol #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementGetSearch ::
                         (HTMLAreaElementClass self, GlibString string) => self -> IO string
htmlAreaElementGetSearch self
  = ({# call webkit_dom_html_area_element_get_search #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
