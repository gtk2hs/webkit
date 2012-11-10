module Graphics.UI.Gtk.WebKit.DOM.HTMLLinkElement
       (htmlLinkElementSetDisabled, htmlLinkElementGetDisabled,
        htmlLinkElementSetCharset, htmlLinkElementGetCharset,
        htmlLinkElementSetHref, htmlLinkElementGetHref,
        htmlLinkElementSetHreflang, htmlLinkElementGetHreflang,
        htmlLinkElementSetMedia, htmlLinkElementGetMedia,
        htmlLinkElementSetRel, htmlLinkElementGetRel,
        htmlLinkElementSetRev, htmlLinkElementGetRev,
        htmlLinkElementSetTarget, htmlLinkElementGetTarget,
        htmlLinkElementGetSheet)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlLinkElementSetDisabled ::
                           (HTMLLinkElementClass self) => self -> Bool -> IO ()
htmlLinkElementSetDisabled self val
  = {# call webkit_dom_html_link_element_set_disabled #}
      (toHTMLLinkElement self)
      (fromBool val)
 
htmlLinkElementGetDisabled ::
                           (HTMLLinkElementClass self) => self -> IO Bool
htmlLinkElementGetDisabled self
  = toBool <$>
      ({# call webkit_dom_html_link_element_get_disabled #}
         (toHTMLLinkElement self))
 
htmlLinkElementSetCharset ::
                          (HTMLLinkElementClass self) => self -> String -> IO ()
htmlLinkElementSetCharset self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_link_element_set_charset #}
          (toHTMLLinkElement self)
          valPtr
 
htmlLinkElementGetCharset ::
                          (HTMLLinkElementClass self) => self -> IO String
htmlLinkElementGetCharset self
  = ({# call webkit_dom_html_link_element_get_charset #}
       (toHTMLLinkElement self))
      >>=
      readUTFString
 
htmlLinkElementSetHref ::
                       (HTMLLinkElementClass self) => self -> String -> IO ()
htmlLinkElementSetHref self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_link_element_set_href #}
          (toHTMLLinkElement self)
          valPtr
 
htmlLinkElementGetHref ::
                       (HTMLLinkElementClass self) => self -> IO String
htmlLinkElementGetHref self
  = ({# call webkit_dom_html_link_element_get_href #}
       (toHTMLLinkElement self))
      >>=
      readUTFString
 
htmlLinkElementSetHreflang ::
                           (HTMLLinkElementClass self) => self -> String -> IO ()
htmlLinkElementSetHreflang self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_link_element_set_hreflang #}
          (toHTMLLinkElement self)
          valPtr
 
htmlLinkElementGetHreflang ::
                           (HTMLLinkElementClass self) => self -> IO String
htmlLinkElementGetHreflang self
  = ({# call webkit_dom_html_link_element_get_hreflang #}
       (toHTMLLinkElement self))
      >>=
      readUTFString
 
htmlLinkElementSetMedia ::
                        (HTMLLinkElementClass self) => self -> String -> IO ()
htmlLinkElementSetMedia self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_link_element_set_media #}
          (toHTMLLinkElement self)
          valPtr
 
htmlLinkElementGetMedia ::
                        (HTMLLinkElementClass self) => self -> IO String
htmlLinkElementGetMedia self
  = ({# call webkit_dom_html_link_element_get_media #}
       (toHTMLLinkElement self))
      >>=
      readUTFString
 
htmlLinkElementSetRel ::
                      (HTMLLinkElementClass self) => self -> String -> IO ()
htmlLinkElementSetRel self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_link_element_set_rel #}
          (toHTMLLinkElement self)
          valPtr
 
htmlLinkElementGetRel ::
                      (HTMLLinkElementClass self) => self -> IO String
htmlLinkElementGetRel self
  = ({# call webkit_dom_html_link_element_get_rel #}
       (toHTMLLinkElement self))
      >>=
      readUTFString
 
htmlLinkElementSetRev ::
                      (HTMLLinkElementClass self) => self -> String -> IO ()
htmlLinkElementSetRev self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_link_element_set_rev #}
          (toHTMLLinkElement self)
          valPtr
 
htmlLinkElementGetRev ::
                      (HTMLLinkElementClass self) => self -> IO String
htmlLinkElementGetRev self
  = ({# call webkit_dom_html_link_element_get_rev #}
       (toHTMLLinkElement self))
      >>=
      readUTFString
 
htmlLinkElementSetTarget ::
                         (HTMLLinkElementClass self) => self -> String -> IO ()
htmlLinkElementSetTarget self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_link_element_set_target #}
          (toHTMLLinkElement self)
          valPtr
 
htmlLinkElementGetTarget ::
                         (HTMLLinkElementClass self) => self -> IO String
htmlLinkElementGetTarget self
  = ({# call webkit_dom_html_link_element_get_target #}
       (toHTMLLinkElement self))
      >>=
      readUTFString
 
htmlLinkElementGetSheet ::
                        (HTMLLinkElementClass self) => self -> IO (Maybe StyleSheet)
htmlLinkElementGetSheet self
  = maybeNull (makeNewGObject mkStyleSheet)
      ({# call webkit_dom_html_link_element_get_sheet #}
         (toHTMLLinkElement self))
