module Graphics.UI.Gtk.WebKit.DOM.HTMLAnchorElement
       (htmlAnchorElementSetCharset, htmlAnchorElementGetCharset,
        htmlAnchorElementSetCoords, htmlAnchorElementGetCoords,
        htmlAnchorElementSetDownload, htmlAnchorElementGetDownload,
        htmlAnchorElementSetHref, htmlAnchorElementGetHref,
        htmlAnchorElementSetHreflang, htmlAnchorElementGetHreflang,
        htmlAnchorElementSetName, htmlAnchorElementGetName,
        htmlAnchorElementSetPing, htmlAnchorElementGetPing,
        htmlAnchorElementSetRel, htmlAnchorElementGetRel,
        htmlAnchorElementSetRev, htmlAnchorElementGetRev,
        htmlAnchorElementSetShape, htmlAnchorElementGetShape,
        htmlAnchorElementSetTarget, htmlAnchorElementGetTarget,
        htmlAnchorElementSetHash, htmlAnchorElementGetHash,
        htmlAnchorElementSetHost, htmlAnchorElementGetHost,
        htmlAnchorElementSetHostname, htmlAnchorElementGetHostname,
        htmlAnchorElementSetPathname, htmlAnchorElementGetPathname,
        htmlAnchorElementSetPort, htmlAnchorElementGetPort,
        htmlAnchorElementSetProtocol, htmlAnchorElementGetProtocol,
        htmlAnchorElementSetSearch, htmlAnchorElementGetSearch,
        htmlAnchorElementGetOrigin, htmlAnchorElementGetText)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlAnchorElementSetCharset ::
                            (HTMLAnchorElementClass self) => self -> String -> IO ()
htmlAnchorElementSetCharset self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_charset #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetCharset ::
                            (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetCharset self
  = ({# call webkit_dom_html_anchor_element_get_charset #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetCoords ::
                           (HTMLAnchorElementClass self) => self -> String -> IO ()
htmlAnchorElementSetCoords self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_coords #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetCoords ::
                           (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetCoords self
  = ({# call webkit_dom_html_anchor_element_get_coords #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetDownload ::
                             (HTMLAnchorElementClass self) => self -> String -> IO ()
htmlAnchorElementSetDownload self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_download #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetDownload ::
                             (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetDownload self
  = ({# call webkit_dom_html_anchor_element_get_download #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetHref ::
                         (HTMLAnchorElementClass self) => self -> String -> IO ()
htmlAnchorElementSetHref self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_href #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetHref ::
                         (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetHref self
  = ({# call webkit_dom_html_anchor_element_get_href #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetHreflang ::
                             (HTMLAnchorElementClass self) => self -> String -> IO ()
htmlAnchorElementSetHreflang self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_hreflang #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetHreflang ::
                             (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetHreflang self
  = ({# call webkit_dom_html_anchor_element_get_hreflang #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetName ::
                         (HTMLAnchorElementClass self) => self -> String -> IO ()
htmlAnchorElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_name #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetName ::
                         (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetName self
  = ({# call webkit_dom_html_anchor_element_get_name #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetPing ::
                         (HTMLAnchorElementClass self) => self -> String -> IO ()
htmlAnchorElementSetPing self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_ping #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetPing ::
                         (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetPing self
  = ({# call webkit_dom_html_anchor_element_get_ping #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetRel ::
                        (HTMLAnchorElementClass self) => self -> String -> IO ()
htmlAnchorElementSetRel self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_rel #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetRel ::
                        (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetRel self
  = ({# call webkit_dom_html_anchor_element_get_rel #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetRev ::
                        (HTMLAnchorElementClass self) => self -> String -> IO ()
htmlAnchorElementSetRev self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_rev #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetRev ::
                        (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetRev self
  = ({# call webkit_dom_html_anchor_element_get_rev #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetShape ::
                          (HTMLAnchorElementClass self) => self -> String -> IO ()
htmlAnchorElementSetShape self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_shape #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetShape ::
                          (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetShape self
  = ({# call webkit_dom_html_anchor_element_get_shape #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetTarget ::
                           (HTMLAnchorElementClass self) => self -> String -> IO ()
htmlAnchorElementSetTarget self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_target #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetTarget ::
                           (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetTarget self
  = ({# call webkit_dom_html_anchor_element_get_target #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetHash ::
                         (HTMLAnchorElementClass self) => self -> String -> IO ()
htmlAnchorElementSetHash self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_hash #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetHash ::
                         (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetHash self
  = ({# call webkit_dom_html_anchor_element_get_hash #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetHost ::
                         (HTMLAnchorElementClass self) => self -> String -> IO ()
htmlAnchorElementSetHost self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_host #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetHost ::
                         (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetHost self
  = ({# call webkit_dom_html_anchor_element_get_host #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetHostname ::
                             (HTMLAnchorElementClass self) => self -> String -> IO ()
htmlAnchorElementSetHostname self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_hostname #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetHostname ::
                             (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetHostname self
  = ({# call webkit_dom_html_anchor_element_get_hostname #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetPathname ::
                             (HTMLAnchorElementClass self) => self -> String -> IO ()
htmlAnchorElementSetPathname self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_pathname #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetPathname ::
                             (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetPathname self
  = ({# call webkit_dom_html_anchor_element_get_pathname #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetPort ::
                         (HTMLAnchorElementClass self) => self -> String -> IO ()
htmlAnchorElementSetPort self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_port #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetPort ::
                         (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetPort self
  = ({# call webkit_dom_html_anchor_element_get_port #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetProtocol ::
                             (HTMLAnchorElementClass self) => self -> String -> IO ()
htmlAnchorElementSetProtocol self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_protocol #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetProtocol ::
                             (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetProtocol self
  = ({# call webkit_dom_html_anchor_element_get_protocol #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetSearch ::
                           (HTMLAnchorElementClass self) => self -> String -> IO ()
htmlAnchorElementSetSearch self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_search #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetSearch ::
                           (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetSearch self
  = ({# call webkit_dom_html_anchor_element_get_search #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementGetOrigin ::
                           (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetOrigin self
  = ({# call webkit_dom_html_anchor_element_get_origin #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementGetText ::
                         (HTMLAnchorElementClass self) => self -> IO String
htmlAnchorElementGetText self
  = ({# call webkit_dom_html_anchor_element_get_text #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
