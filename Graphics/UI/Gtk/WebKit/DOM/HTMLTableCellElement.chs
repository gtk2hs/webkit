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
                            (HTMLTableCellElementClass self, GlibString string) =>
                              self -> string -> IO ()
htmlTableCellElementSetAbbr self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_abbr #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetAbbr ::
                            (HTMLTableCellElementClass self, GlibString string) =>
                              self -> IO string
htmlTableCellElementGetAbbr self
  = ({# call webkit_dom_html_table_cell_element_get_abbr #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
 
htmlTableCellElementSetAlign ::
                             (HTMLTableCellElementClass self, GlibString string) =>
                               self -> string -> IO ()
htmlTableCellElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_align #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetAlign ::
                             (HTMLTableCellElementClass self, GlibString string) =>
                               self -> IO string
htmlTableCellElementGetAlign self
  = ({# call webkit_dom_html_table_cell_element_get_align #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
 
htmlTableCellElementSetAxis ::
                            (HTMLTableCellElementClass self, GlibString string) =>
                              self -> string -> IO ()
htmlTableCellElementSetAxis self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_axis #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetAxis ::
                            (HTMLTableCellElementClass self, GlibString string) =>
                              self -> IO string
htmlTableCellElementGetAxis self
  = ({# call webkit_dom_html_table_cell_element_get_axis #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
 
htmlTableCellElementSetBgColor ::
                               (HTMLTableCellElementClass self, GlibString string) =>
                                 self -> string -> IO ()
htmlTableCellElementSetBgColor self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_bg_color #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetBgColor ::
                               (HTMLTableCellElementClass self, GlibString string) =>
                                 self -> IO string
htmlTableCellElementGetBgColor self
  = ({# call webkit_dom_html_table_cell_element_get_bg_color #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
 
htmlTableCellElementSetCh ::
                          (HTMLTableCellElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmlTableCellElementSetCh self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_ch #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetCh ::
                          (HTMLTableCellElementClass self, GlibString string) =>
                            self -> IO string
htmlTableCellElementGetCh self
  = ({# call webkit_dom_html_table_cell_element_get_ch #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
 
htmlTableCellElementSetChOff ::
                             (HTMLTableCellElementClass self, GlibString string) =>
                               self -> string -> IO ()
htmlTableCellElementSetChOff self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_ch_off #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetChOff ::
                             (HTMLTableCellElementClass self, GlibString string) =>
                               self -> IO string
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
                               (HTMLTableCellElementClass self, GlibString string) =>
                                 self -> string -> IO ()
htmlTableCellElementSetHeaders self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_headers #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetHeaders ::
                               (HTMLTableCellElementClass self, GlibString string) =>
                                 self -> IO string
htmlTableCellElementGetHeaders self
  = ({# call webkit_dom_html_table_cell_element_get_headers #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
 
htmlTableCellElementSetHeight ::
                              (HTMLTableCellElementClass self, GlibString string) =>
                                self -> string -> IO ()
htmlTableCellElementSetHeight self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_height #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetHeight ::
                              (HTMLTableCellElementClass self, GlibString string) =>
                                self -> IO string
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
                             (HTMLTableCellElementClass self, GlibString string) =>
                               self -> string -> IO ()
htmlTableCellElementSetScope self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_scope #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetScope ::
                             (HTMLTableCellElementClass self, GlibString string) =>
                               self -> IO string
htmlTableCellElementGetScope self
  = ({# call webkit_dom_html_table_cell_element_get_scope #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
 
htmlTableCellElementSetVAlign ::
                              (HTMLTableCellElementClass self, GlibString string) =>
                                self -> string -> IO ()
htmlTableCellElementSetVAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_v_align #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetVAlign ::
                              (HTMLTableCellElementClass self, GlibString string) =>
                                self -> IO string
htmlTableCellElementGetVAlign self
  = ({# call webkit_dom_html_table_cell_element_get_v_align #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
 
htmlTableCellElementSetWidth ::
                             (HTMLTableCellElementClass self, GlibString string) =>
                               self -> string -> IO ()
htmlTableCellElementSetWidth self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_cell_element_set_width #}
          (toHTMLTableCellElement self)
          valPtr
 
htmlTableCellElementGetWidth ::
                             (HTMLTableCellElementClass self, GlibString string) =>
                               self -> IO string
htmlTableCellElementGetWidth self
  = ({# call webkit_dom_html_table_cell_element_get_width #}
       (toHTMLTableCellElement self))
      >>=
      readUTFString
