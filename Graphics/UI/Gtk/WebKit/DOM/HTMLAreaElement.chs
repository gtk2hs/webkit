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
                      (HTMLAreaElementClass self) => self -> String -> IO ()
htmlAreaElementSetAlt self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_area_element_set_alt #}
          (toHTMLAreaElement self)
          valPtr
 
htmlAreaElementGetAlt ::
                      (HTMLAreaElementClass self) => self -> IO String
htmlAreaElementGetAlt self
  = ({# call webkit_dom_html_area_element_get_alt #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementSetCoords ::
                         (HTMLAreaElementClass self) => self -> String -> IO ()
htmlAreaElementSetCoords self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_area_element_set_coords #}
          (toHTMLAreaElement self)
          valPtr
 
htmlAreaElementGetCoords ::
                         (HTMLAreaElementClass self) => self -> IO String
htmlAreaElementGetCoords self
  = ({# call webkit_dom_html_area_element_get_coords #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementSetHref ::
                       (HTMLAreaElementClass self) => self -> String -> IO ()
htmlAreaElementSetHref self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_area_element_set_href #}
          (toHTMLAreaElement self)
          valPtr
 
htmlAreaElementGetHref ::
                       (HTMLAreaElementClass self) => self -> IO String
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
                       (HTMLAreaElementClass self) => self -> String -> IO ()
htmlAreaElementSetPing self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_area_element_set_ping #}
          (toHTMLAreaElement self)
          valPtr
 
htmlAreaElementGetPing ::
                       (HTMLAreaElementClass self) => self -> IO String
htmlAreaElementGetPing self
  = ({# call webkit_dom_html_area_element_get_ping #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementSetShape ::
                        (HTMLAreaElementClass self) => self -> String -> IO ()
htmlAreaElementSetShape self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_area_element_set_shape #}
          (toHTMLAreaElement self)
          valPtr
 
htmlAreaElementGetShape ::
                        (HTMLAreaElementClass self) => self -> IO String
htmlAreaElementGetShape self
  = ({# call webkit_dom_html_area_element_get_shape #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementSetTarget ::
                         (HTMLAreaElementClass self) => self -> String -> IO ()
htmlAreaElementSetTarget self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_area_element_set_target #}
          (toHTMLAreaElement self)
          valPtr
 
htmlAreaElementGetTarget ::
                         (HTMLAreaElementClass self) => self -> IO String
htmlAreaElementGetTarget self
  = ({# call webkit_dom_html_area_element_get_target #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementGetHash ::
                       (HTMLAreaElementClass self) => self -> IO String
htmlAreaElementGetHash self
  = ({# call webkit_dom_html_area_element_get_hash #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementGetHost ::
                       (HTMLAreaElementClass self) => self -> IO String
htmlAreaElementGetHost self
  = ({# call webkit_dom_html_area_element_get_host #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementGetHostname ::
                           (HTMLAreaElementClass self) => self -> IO String
htmlAreaElementGetHostname self
  = ({# call webkit_dom_html_area_element_get_hostname #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementGetPathname ::
                           (HTMLAreaElementClass self) => self -> IO String
htmlAreaElementGetPathname self
  = ({# call webkit_dom_html_area_element_get_pathname #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementGetPort ::
                       (HTMLAreaElementClass self) => self -> IO String
htmlAreaElementGetPort self
  = ({# call webkit_dom_html_area_element_get_port #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementGetProtocol ::
                           (HTMLAreaElementClass self) => self -> IO String
htmlAreaElementGetProtocol self
  = ({# call webkit_dom_html_area_element_get_protocol #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
 
htmlAreaElementGetSearch ::
                         (HTMLAreaElementClass self) => self -> IO String
htmlAreaElementGetSearch self
  = ({# call webkit_dom_html_area_element_get_search #}
       (toHTMLAreaElement self))
      >>=
      readUTFString
