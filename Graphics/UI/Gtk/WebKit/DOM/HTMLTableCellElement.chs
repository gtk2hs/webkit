module Graphics.UI.Gtk.WebKit.DOM.HTMLTableCellElement
       (htmlTableCellElementGetCellIndex, htmlTableCellElementSetAbbr,
        htmlTableCellElementGetAbbr, htmlTableCellElementSetAlign,
        htmlTableCellElementGetAlign, htmlTableCellElementSetAxis,
        htmlTableCellElementGetAxis, htmlTableCellElementSetBgColor,
        htmlTableCellElementGetBgColor, htmlTableCellElementSetCh,
        htmlTableCellElementGetCh, htmlTableCellElementSetChOff,
        htmlTableCellElementGetChOff, htmlTableCellElementSetColSpan,
        htmlTableCellElementGetColSpan, htmlTableCellElementSetHeaders,
        htmlTableCellElementGetHeaders, htmlTableCellElementSetHeight,
        htmlTableCellElementGetHeight, htmlTableCellElementSetNoWrap,
        htmlTableCellElementGetNoWrap, htmlTableCellElementSetRowSpan,
        htmlTableCellElementGetRowSpan, htmlTableCellElementSetScope,
        htmlTableCellElementGetScope, htmlTableCellElementSetVAlign,
        htmlTableCellElementGetVAlign, htmlTableCellElementSetWidth,
        htmlTableCellElementGetWidth, HTMLTableCellElement,
        HTMLTableCellElementClass, castToHTMLTableCellElement,
        gTypeHTMLTableCellElement, toHTMLTableCellElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlTableCellElementGetCellIndex ::
                                 (HTMLTableCellElementClass self) => self -> IO Int
htmlTableCellElementGetCellIndex self
  = fromIntegral <$>
      ({# call webkit_dom_html_table_cell_element_get_cell_index #}
         (toHTMLTableCellElement self))
 
htmlTableCellElementSetAbbr ::
                            (HTMLTableCellElementClass self) => self -> String -> IO ()
htmlTableCellElementSetAbbr self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_abbr #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetAbbr ::
                            (HTMLTableCellElementClass self) => self -> IO String
htmlTableCellElementGetAbbr self
  = ({# call webkit_dom_html_table_cell_element_get_abbr #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
 
htmlTableCellElementSetAlign ::
                             (HTMLTableCellElementClass self) => self -> String -> IO ()
htmlTableCellElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_align #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetAlign ::
                             (HTMLTableCellElementClass self) => self -> IO String
htmlTableCellElementGetAlign self
  = ({# call webkit_dom_html_table_cell_element_get_align #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
 
htmlTableCellElementSetAxis ::
                            (HTMLTableCellElementClass self) => self -> String -> IO ()
htmlTableCellElementSetAxis self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_axis #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetAxis ::
                            (HTMLTableCellElementClass self) => self -> IO String
htmlTableCellElementGetAxis self
  = ({# call webkit_dom_html_table_cell_element_get_axis #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
 
htmlTableCellElementSetBgColor ::
                               (HTMLTableCellElementClass self) => self -> String -> IO ()
htmlTableCellElementSetBgColor self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_bg_color #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetBgColor ::
                               (HTMLTableCellElementClass self) => self -> IO String
htmlTableCellElementGetBgColor self
  = ({# call webkit_dom_html_table_cell_element_get_bg_color #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
 
htmlTableCellElementSetCh ::
                          (HTMLTableCellElementClass self) => self -> String -> IO ()
htmlTableCellElementSetCh self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_ch #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetCh ::
                          (HTMLTableCellElementClass self) => self -> IO String
htmlTableCellElementGetCh self
  = ({# call webkit_dom_html_table_cell_element_get_ch #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
 
htmlTableCellElementSetChOff ::
                             (HTMLTableCellElementClass self) => self -> String -> IO ()
htmlTableCellElementSetChOff self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_ch_off #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetChOff ::
                             (HTMLTableCellElementClass self) => self -> IO String
htmlTableCellElementGetChOff self
  = ({# call webkit_dom_html_table_cell_element_get_ch_off #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
 
htmlTableCellElementSetColSpan ::
                               (HTMLTableCellElementClass self) => self -> Int -> IO ()
htmlTableCellElementSetColSpan self val
  = {# call webkit_dom_html_table_cell_element_set_col_span #}
      (toHTMLTableCellElement self)
      (fromIntegral val)
 
htmlTableCellElementGetColSpan ::
                               (HTMLTableCellElementClass self) => self -> IO Int
htmlTableCellElementGetColSpan self
  = fromIntegral <$>
      ({# call webkit_dom_html_table_cell_element_get_col_span #}
         (toHTMLTableCellElement self))
 
htmlTableCellElementSetHeaders ::
                               (HTMLTableCellElementClass self) => self -> String -> IO ()
htmlTableCellElementSetHeaders self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_headers #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetHeaders ::
                               (HTMLTableCellElementClass self) => self -> IO String
htmlTableCellElementGetHeaders self
  = ({# call webkit_dom_html_table_cell_element_get_headers #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
 
htmlTableCellElementSetHeight ::
                              (HTMLTableCellElementClass self) => self -> String -> IO ()
htmlTableCellElementSetHeight self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_height #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetHeight ::
                              (HTMLTableCellElementClass self) => self -> IO String
htmlTableCellElementGetHeight self
  = ({# call webkit_dom_html_table_cell_element_get_height #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
 
htmlTableCellElementSetNoWrap ::
                              (HTMLTableCellElementClass self) => self -> Bool -> IO ()
htmlTableCellElementSetNoWrap self val
  = {# call webkit_dom_html_table_cell_element_set_no_wrap #}
      (toHTMLTableCellElement self)
      (fromBool val)
 
htmlTableCellElementGetNoWrap ::
                              (HTMLTableCellElementClass self) => self -> IO Bool
htmlTableCellElementGetNoWrap self
  = toBool <$>
      ({# call webkit_dom_html_table_cell_element_get_no_wrap #}
         (toHTMLTableCellElement self))
 
htmlTableCellElementSetRowSpan ::
                               (HTMLTableCellElementClass self) => self -> Int -> IO ()
htmlTableCellElementSetRowSpan self val
  = {# call webkit_dom_html_table_cell_element_set_row_span #}
      (toHTMLTableCellElement self)
      (fromIntegral val)
 
htmlTableCellElementGetRowSpan ::
                               (HTMLTableCellElementClass self) => self -> IO Int
htmlTableCellElementGetRowSpan self
  = fromIntegral <$>
      ({# call webkit_dom_html_table_cell_element_get_row_span #}
         (toHTMLTableCellElement self))
 
htmlTableCellElementSetScope ::
                             (HTMLTableCellElementClass self) => self -> String -> IO ()
htmlTableCellElementSetScope self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_scope #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetScope ::
                             (HTMLTableCellElementClass self) => self -> IO String
htmlTableCellElementGetScope self
  = ({# call webkit_dom_html_table_cell_element_get_scope #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
 
htmlTableCellElementSetVAlign ::
                              (HTMLTableCellElementClass self) => self -> String -> IO ()
htmlTableCellElementSetVAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_v_align #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetVAlign ::
                              (HTMLTableCellElementClass self) => self -> IO String
htmlTableCellElementGetVAlign self
  = ({# call webkit_dom_html_table_cell_element_get_v_align #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
 
htmlTableCellElementSetWidth ::
                             (HTMLTableCellElementClass self) => self -> String -> IO ()
htmlTableCellElementSetWidth self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_width #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetWidth ::
                             (HTMLTableCellElementClass self) => self -> IO String
htmlTableCellElementGetWidth self
  = ({# call webkit_dom_html_table_cell_element_get_width #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
