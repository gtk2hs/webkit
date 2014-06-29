module Graphics.UI.Gtk.WebKit.DOM.HTMLTableColElement
       (htmlTableColElementSetAlign, htmlTableColElementGetAlign,
        htmlTableColElementSetCh, htmlTableColElementGetCh,
        htmlTableColElementSetChOff, htmlTableColElementGetChOff,
        htmlTableColElementSetSpan, htmlTableColElementGetSpan,
        htmlTableColElementSetVAlign, htmlTableColElementGetVAlign,
        htmlTableColElementSetWidth, htmlTableColElementGetWidth,
        HTMLTableColElement, HTMLTableColElementClass,
        castToHTMLTableColElement, gTypeHTMLTableColElement,
        toHTMLTableColElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlTableColElementSetAlign ::
                            (HTMLTableColElementClass self, GlibString string) =>
                              self -> string -> IO ()
htmlTableColElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_col_element_set_align #}
          (toHTMLTableColElement self)
          valPtr
 
htmlTableColElementGetAlign ::
                            (HTMLTableColElementClass self, GlibString string) =>
                              self -> IO string
htmlTableColElementGetAlign self
  = ({# call webkit_dom_html_table_col_element_get_align #}
       (toHTMLTableColElement self))
      >>=
      readUTFString
 
htmlTableColElementSetCh ::
                         (HTMLTableColElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlTableColElementSetCh self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_col_element_set_ch #}
          (toHTMLTableColElement self)
          valPtr
 
htmlTableColElementGetCh ::
                         (HTMLTableColElementClass self, GlibString string) =>
                           self -> IO string
htmlTableColElementGetCh self
  = ({# call webkit_dom_html_table_col_element_get_ch #}
       (toHTMLTableColElement self))
      >>=
      readUTFString
 
htmlTableColElementSetChOff ::
                            (HTMLTableColElementClass self, GlibString string) =>
                              self -> string -> IO ()
htmlTableColElementSetChOff self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_col_element_set_ch_off #}
          (toHTMLTableColElement self)
          valPtr
 
htmlTableColElementGetChOff ::
                            (HTMLTableColElementClass self, GlibString string) =>
                              self -> IO string
htmlTableColElementGetChOff self
  = ({# call webkit_dom_html_table_col_element_get_ch_off #}
       (toHTMLTableColElement self))
      >>=
      readUTFString
 
htmlTableColElementSetSpan ::
                           (HTMLTableColElementClass self) => self -> Int -> IO ()
htmlTableColElementSetSpan self val
  = {# call webkit_dom_html_table_col_element_set_span #}
      (toHTMLTableColElement self)
      (fromIntegral val)
 
htmlTableColElementGetSpan ::
                           (HTMLTableColElementClass self) => self -> IO Int
htmlTableColElementGetSpan self
  = fromIntegral <$>
      ({# call webkit_dom_html_table_col_element_get_span #}
         (toHTMLTableColElement self))
 
htmlTableColElementSetVAlign ::
                             (HTMLTableColElementClass self, GlibString string) =>
                               self -> string -> IO ()
htmlTableColElementSetVAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_col_element_set_v_align #}
          (toHTMLTableColElement self)
          valPtr
 
htmlTableColElementGetVAlign ::
                             (HTMLTableColElementClass self, GlibString string) =>
                               self -> IO string
htmlTableColElementGetVAlign self
  = ({# call webkit_dom_html_table_col_element_get_v_align #}
       (toHTMLTableColElement self))
      >>=
      readUTFString
 
htmlTableColElementSetWidth ::
                            (HTMLTableColElementClass self, GlibString string) =>
                              self -> string -> IO ()
htmlTableColElementSetWidth self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_col_element_set_width #}
          (toHTMLTableColElement self)
          valPtr
 
htmlTableColElementGetWidth ::
                            (HTMLTableColElementClass self, GlibString string) =>
                              self -> IO string
htmlTableColElementGetWidth self
  = ({# call webkit_dom_html_table_col_element_get_width #}
       (toHTMLTableColElement self))
      >>=
      readUTFString
