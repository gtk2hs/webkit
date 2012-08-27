module Graphics.UI.Gtk.WebKit.DOM.HTMLFrameSetElement
       (htmlFrameSetElementSetCols, htmlFrameSetElementGetCols,
        htmlFrameSetElementSetRows, htmlFrameSetElementGetRows,
        htmlFrameSetElementOnbeforeunload, htmlFrameSetElementOnhashchange,
        htmlFrameSetElementOnmessage, htmlFrameSetElementOnoffline,
        htmlFrameSetElementOnonline, htmlFrameSetElementOnpopstate,
        htmlFrameSetElementOnresize, htmlFrameSetElementOnstorage,
        htmlFrameSetElementOnunload,
        htmlFrameSetElementOnorientationchange, htmlFrameSetElementOnblur,
        htmlFrameSetElementOnerror, htmlFrameSetElementOnfocus,
        htmlFrameSetElementOnload)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlFrameSetElementSetCols ::
                           (HTMLFrameSetElementClass self) => self -> String -> IO ()
htmlFrameSetElementSetCols self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_frame_set_element_set_cols #}
          (toHTMLFrameSetElement self)
          valPtr
 
htmlFrameSetElementGetCols ::
                           (HTMLFrameSetElementClass self) => self -> IO String
htmlFrameSetElementGetCols self
  = ({# call webkit_dom_html_frame_set_element_get_cols #}
       (toHTMLFrameSetElement self))
      >>=
      readUTFString
 
htmlFrameSetElementSetRows ::
                           (HTMLFrameSetElementClass self) => self -> String -> IO ()
htmlFrameSetElementSetRows self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_frame_set_element_set_rows #}
          (toHTMLFrameSetElement self)
          valPtr
 
htmlFrameSetElementGetRows ::
                           (HTMLFrameSetElementClass self) => self -> IO String
htmlFrameSetElementGetRows self
  = ({# call webkit_dom_html_frame_set_element_get_rows #}
       (toHTMLFrameSetElement self))
      >>=
      readUTFString
 
htmlFrameSetElementOnbeforeunload ::
                                  (HTMLFrameSetElementClass self) =>
                                    Signal self (EventM UIEvent self ())
htmlFrameSetElementOnbeforeunload = (connect "beforeunload")
 
htmlFrameSetElementOnhashchange ::
                                (HTMLFrameSetElementClass self) =>
                                  Signal self (EventM UIEvent self ())
htmlFrameSetElementOnhashchange = (connect "hashchange")
 
htmlFrameSetElementOnmessage ::
                             (HTMLFrameSetElementClass self) =>
                               Signal self (EventM UIEvent self ())
htmlFrameSetElementOnmessage = (connect "message")
 
htmlFrameSetElementOnoffline ::
                             (HTMLFrameSetElementClass self) =>
                               Signal self (EventM UIEvent self ())
htmlFrameSetElementOnoffline = (connect "offline")
 
htmlFrameSetElementOnonline ::
                            (HTMLFrameSetElementClass self) =>
                              Signal self (EventM UIEvent self ())
htmlFrameSetElementOnonline = (connect "online")
 
htmlFrameSetElementOnpopstate ::
                              (HTMLFrameSetElementClass self) =>
                                Signal self (EventM UIEvent self ())
htmlFrameSetElementOnpopstate = (connect "popstate")
 
htmlFrameSetElementOnresize ::
                            (HTMLFrameSetElementClass self) =>
                              Signal self (EventM UIEvent self ())
htmlFrameSetElementOnresize = (connect "resize")
 
htmlFrameSetElementOnstorage ::
                             (HTMLFrameSetElementClass self) =>
                               Signal self (EventM UIEvent self ())
htmlFrameSetElementOnstorage = (connect "storage")
 
htmlFrameSetElementOnunload ::
                            (HTMLFrameSetElementClass self) =>
                              Signal self (EventM UIEvent self ())
htmlFrameSetElementOnunload = (connect "unload")
 
htmlFrameSetElementOnorientationchange ::
                                       (HTMLFrameSetElementClass self) =>
                                         Signal self (EventM UIEvent self ())
htmlFrameSetElementOnorientationchange
  = (connect "orientationchange")
 
htmlFrameSetElementOnblur ::
                          (HTMLFrameSetElementClass self) =>
                            Signal self (EventM UIEvent self ())
htmlFrameSetElementOnblur = (connect "blur")
 
htmlFrameSetElementOnerror ::
                           (HTMLFrameSetElementClass self) =>
                             Signal self (EventM UIEvent self ())
htmlFrameSetElementOnerror = (connect "error")
 
htmlFrameSetElementOnfocus ::
                           (HTMLFrameSetElementClass self) =>
                             Signal self (EventM UIEvent self ())
htmlFrameSetElementOnfocus = (connect "focus")
 
htmlFrameSetElementOnload ::
                          (HTMLFrameSetElementClass self) =>
                            Signal self (EventM UIEvent self ())
htmlFrameSetElementOnload = (connect "load")
