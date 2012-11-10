module Graphics.UI.Gtk.WebKit.DOM.HTMLTableColElement
       (htmlTableColElementSetAlign, htmlTableColElementGetAlign,
        htmlTableColElementSetCh, htmlTableColElementGetCh,
        htmlTableColElementSetChOff, htmlTableColElementGetChOff,
        htmlTableColElementSetSpan, htmlTableColElementGetSpan,
        htmlTableColElementSetVAlign, htmlTableColElementGetVAlign,
        htmlTableColElementSetWidth, htmlTableColElementGetWidth)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlTableColElementSetAlign ::
                            (HTMLTableColElementClass self) => self -> String -> IO ()
htmlTableColElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_col_element_set_align #}
          (toHTMLTableColElement self)
          valPtr
 
htmlTableColElementGetAlign ::
                            (HTMLTableColElementClass self) => self -> IO String
htmlTableColElementGetAlign self
  = ({# call webkit_dom_html_table_col_element_get_align #}
       (toHTMLTableColElement self))
      >>=
      readUTFString
 
htmlTableColElementSetCh ::
                         (HTMLTableColElementClass self) => self -> String -> IO ()
htmlTableColElementSetCh self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_col_element_set_ch #}
          (toHTMLTableColElement self)
          valPtr
 
htmlTableColElementGetCh ::
                         (HTMLTableColElementClass self) => self -> IO String
htmlTableColElementGetCh self
  = ({# call webkit_dom_html_table_col_element_get_ch #}
       (toHTMLTableColElement self))
      >>=
      readUTFString
 
htmlTableColElementSetChOff ::
                            (HTMLTableColElementClass self) => self -> String -> IO ()
htmlTableColElementSetChOff self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_col_element_set_ch_off #}
          (toHTMLTableColElement self)
          valPtr
 
htmlTableColElementGetChOff ::
                            (HTMLTableColElementClass self) => self -> IO String
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
                             (HTMLTableColElementClass self) => self -> String -> IO ()
htmlTableColElementSetVAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_col_element_set_v_align #}
          (toHTMLTableColElement self)
          valPtr
 
htmlTableColElementGetVAlign ::
                             (HTMLTableColElementClass self) => self -> IO String
htmlTableColElementGetVAlign self
  = ({# call webkit_dom_html_table_col_element_get_v_align #}
       (toHTMLTableColElement self))
      >>=
      readUTFString
 
htmlTableColElementSetWidth ::
                            (HTMLTableColElementClass self) => self -> String -> IO ()
htmlTableColElementSetWidth self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_col_element_set_width #}
          (toHTMLTableColElement self)
          valPtr
 
htmlTableColElementGetWidth ::
                            (HTMLTableColElementClass self) => self -> IO String
htmlTableColElementGetWidth self
  = ({# call webkit_dom_html_table_col_element_get_width #}
       (toHTMLTableColElement self))
      >>=
      readUTFString
