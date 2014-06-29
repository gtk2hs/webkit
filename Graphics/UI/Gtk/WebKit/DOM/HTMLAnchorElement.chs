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
        htmlAnchorElementGetOrigin, htmlAnchorElementGetText,
        HTMLAnchorElement, HTMLAnchorElementClass, castToHTMLAnchorElement,
        gTypeHTMLAnchorElement, toHTMLAnchorElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlAnchorElementSetCharset ::
                            (HTMLAnchorElementClass self, GlibString string) =>
                              self -> string -> IO ()
htmlAnchorElementSetCharset self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_charset #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetCharset ::
                            (HTMLAnchorElementClass self, GlibString string) =>
                              self -> IO string
htmlAnchorElementGetCharset self
  = ({# call webkit_dom_html_anchor_element_get_charset #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetCoords ::
                           (HTMLAnchorElementClass self, GlibString string) =>
                             self -> string -> IO ()
htmlAnchorElementSetCoords self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_coords #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetCoords ::
                           (HTMLAnchorElementClass self, GlibString string) =>
                             self -> IO string
htmlAnchorElementGetCoords self
  = ({# call webkit_dom_html_anchor_element_get_coords #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetDownload ::
                             (HTMLAnchorElementClass self, GlibString string) =>
                               self -> string -> IO ()
htmlAnchorElementSetDownload self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_download #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetDownload ::
                             (HTMLAnchorElementClass self, GlibString string) =>
                               self -> IO string
htmlAnchorElementGetDownload self
  = ({# call webkit_dom_html_anchor_element_get_download #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetHref ::
                         (HTMLAnchorElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlAnchorElementSetHref self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_href #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetHref ::
                         (HTMLAnchorElementClass self, GlibString string) =>
                           self -> IO string
htmlAnchorElementGetHref self
  = ({# call webkit_dom_html_anchor_element_get_href #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetHreflang ::
                             (HTMLAnchorElementClass self, GlibString string) =>
                               self -> string -> IO ()
htmlAnchorElementSetHreflang self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_hreflang #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetHreflang ::
                             (HTMLAnchorElementClass self, GlibString string) =>
                               self -> IO string
htmlAnchorElementGetHreflang self
  = ({# call webkit_dom_html_anchor_element_get_hreflang #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetName ::
                         (HTMLAnchorElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlAnchorElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_name #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetName ::
                         (HTMLAnchorElementClass self, GlibString string) =>
                           self -> IO string
htmlAnchorElementGetName self
  = ({# call webkit_dom_html_anchor_element_get_name #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetPing ::
                         (HTMLAnchorElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlAnchorElementSetPing self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_ping #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetPing ::
                         (HTMLAnchorElementClass self, GlibString string) =>
                           self -> IO string
htmlAnchorElementGetPing self
  = ({# call webkit_dom_html_anchor_element_get_ping #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetRel ::
                        (HTMLAnchorElementClass self, GlibString string) =>
                          self -> string -> IO ()
htmlAnchorElementSetRel self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_rel #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetRel ::
                        (HTMLAnchorElementClass self, GlibString string) =>
                          self -> IO string
htmlAnchorElementGetRel self
  = ({# call webkit_dom_html_anchor_element_get_rel #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetRev ::
                        (HTMLAnchorElementClass self, GlibString string) =>
                          self -> string -> IO ()
htmlAnchorElementSetRev self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_rev #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetRev ::
                        (HTMLAnchorElementClass self, GlibString string) =>
                          self -> IO string
htmlAnchorElementGetRev self
  = ({# call webkit_dom_html_anchor_element_get_rev #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetShape ::
                          (HTMLAnchorElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmlAnchorElementSetShape self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_shape #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetShape ::
                          (HTMLAnchorElementClass self, GlibString string) =>
                            self -> IO string
htmlAnchorElementGetShape self
  = ({# call webkit_dom_html_anchor_element_get_shape #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetTarget ::
                           (HTMLAnchorElementClass self, GlibString string) =>
                             self -> string -> IO ()
htmlAnchorElementSetTarget self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_target #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetTarget ::
                           (HTMLAnchorElementClass self, GlibString string) =>
                             self -> IO string
htmlAnchorElementGetTarget self
  = ({# call webkit_dom_html_anchor_element_get_target #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetHash ::
                         (HTMLAnchorElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlAnchorElementSetHash self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_hash #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetHash ::
                         (HTMLAnchorElementClass self, GlibString string) =>
                           self -> IO string
htmlAnchorElementGetHash self
  = ({# call webkit_dom_html_anchor_element_get_hash #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetHost ::
                         (HTMLAnchorElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlAnchorElementSetHost self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_host #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetHost ::
                         (HTMLAnchorElementClass self, GlibString string) =>
                           self -> IO string
htmlAnchorElementGetHost self
  = ({# call webkit_dom_html_anchor_element_get_host #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetHostname ::
                             (HTMLAnchorElementClass self, GlibString string) =>
                               self -> string -> IO ()
htmlAnchorElementSetHostname self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_hostname #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetHostname ::
                             (HTMLAnchorElementClass self, GlibString string) =>
                               self -> IO string
htmlAnchorElementGetHostname self
  = ({# call webkit_dom_html_anchor_element_get_hostname #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetPathname ::
                             (HTMLAnchorElementClass self, GlibString string) =>
                               self -> string -> IO ()
htmlAnchorElementSetPathname self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_pathname #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetPathname ::
                             (HTMLAnchorElementClass self, GlibString string) =>
                               self -> IO string
htmlAnchorElementGetPathname self
  = ({# call webkit_dom_html_anchor_element_get_pathname #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetPort ::
                         (HTMLAnchorElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlAnchorElementSetPort self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_port #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetPort ::
                         (HTMLAnchorElementClass self, GlibString string) =>
                           self -> IO string
htmlAnchorElementGetPort self
  = ({# call webkit_dom_html_anchor_element_get_port #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetProtocol ::
                             (HTMLAnchorElementClass self, GlibString string) =>
                               self -> string -> IO ()
htmlAnchorElementSetProtocol self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_protocol #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetProtocol ::
                             (HTMLAnchorElementClass self, GlibString string) =>
                               self -> IO string
htmlAnchorElementGetProtocol self
  = ({# call webkit_dom_html_anchor_element_get_protocol #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementSetSearch ::
                           (HTMLAnchorElementClass self, GlibString string) =>
                             self -> string -> IO ()
htmlAnchorElementSetSearch self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_anchor_element_set_search #}
          (toHTMLAnchorElement self)
          valPtr
 
htmlAnchorElementGetSearch ::
                           (HTMLAnchorElementClass self, GlibString string) =>
                             self -> IO string
htmlAnchorElementGetSearch self
  = ({# call webkit_dom_html_anchor_element_get_search #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementGetOrigin ::
                           (HTMLAnchorElementClass self, GlibString string) =>
                             self -> IO string
htmlAnchorElementGetOrigin self
  = ({# call webkit_dom_html_anchor_element_get_origin #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
 
htmlAnchorElementGetText ::
                         (HTMLAnchorElementClass self, GlibString string) =>
                           self -> IO string
htmlAnchorElementGetText self
  = ({# call webkit_dom_html_anchor_element_get_text #}
       (toHTMLAnchorElement self))
      >>=
      readUTFString
