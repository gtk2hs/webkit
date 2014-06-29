module Graphics.UI.Gtk.WebKit.DOM.HTMLTableRowElement
       (htmlTableRowElementInsertCell, htmlTableRowElementDeleteCell,
        htmlTableRowElementGetRowIndex,
        htmlTableRowElementGetSectionRowIndex, htmlTableRowElementGetCells,
        htmlTableRowElementSetAlign, htmlTableRowElementGetAlign,
        htmlTableRowElementSetBgColor, htmlTableRowElementGetBgColor,
        htmlTableRowElementSetCh, htmlTableRowElementGetCh,
        htmlTableRowElementSetChOff, htmlTableRowElementGetChOff,
        htmlTableRowElementSetVAlign, htmlTableRowElementGetVAlign,
        HTMLTableRowElement, HTMLTableRowElementClass,
        castToHTMLTableRowElement, gTypeHTMLTableRowElement,
        toHTMLTableRowElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlTableRowElementInsertCell ::
                              (HTMLTableRowElementClass self) =>
                                self -> Int -> IO (Maybe HTMLElement)
htmlTableRowElementInsertCell self index
  = maybeNull (makeNewGObject mkHTMLElement)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_table_row_element_insert_cell #}
             (toHTMLTableRowElement self)
             (fromIntegral index)
             errorPtr_)
 
htmlTableRowElementDeleteCell ::
                              (HTMLTableRowElementClass self) => self -> Int -> IO ()
htmlTableRowElementDeleteCell self index
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_table_row_element_delete_cell #}
          (toHTMLTableRowElement self)
          (fromIntegral index)
          errorPtr_
 
htmlTableRowElementGetRowIndex ::
                               (HTMLTableRowElementClass self) => self -> IO Int
htmlTableRowElementGetRowIndex self
  = fromIntegral <$>
      ({# call webkit_dom_html_table_row_element_get_row_index #}
         (toHTMLTableRowElement self))
 
htmlTableRowElementGetSectionRowIndex ::
                                      (HTMLTableRowElementClass self) => self -> IO Int
htmlTableRowElementGetSectionRowIndex self
  = fromIntegral <$>
      ({# call webkit_dom_html_table_row_element_get_section_row_index #}
         (toHTMLTableRowElement self))
 
htmlTableRowElementGetCells ::
                            (HTMLTableRowElementClass self) =>
                              self -> IO (Maybe HTMLCollection)
htmlTableRowElementGetCells self
  = maybeNull (makeNewGObject mkHTMLCollection)
      ({# call webkit_dom_html_table_row_element_get_cells #}
         (toHTMLTableRowElement self))
 
htmlTableRowElementSetAlign ::
                            (HTMLTableRowElementClass self, GlibString string) =>
                              self -> string -> IO ()
htmlTableRowElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_row_element_set_align #}
          (toHTMLTableRowElement self)
          valPtr
 
htmlTableRowElementGetAlign ::
                            (HTMLTableRowElementClass self, GlibString string) =>
                              self -> IO string
htmlTableRowElementGetAlign self
  = ({# call webkit_dom_html_table_row_element_get_align #}
       (toHTMLTableRowElement self))
      >>=
      readUTFString
 
htmlTableRowElementSetBgColor ::
                              (HTMLTableRowElementClass self, GlibString string) =>
                                self -> string -> IO ()
htmlTableRowElementSetBgColor self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_row_element_set_bg_color #}
          (toHTMLTableRowElement self)
          valPtr
 
htmlTableRowElementGetBgColor ::
                              (HTMLTableRowElementClass self, GlibString string) =>
                                self -> IO string
htmlTableRowElementGetBgColor self
  = ({# call webkit_dom_html_table_row_element_get_bg_color #}
       (toHTMLTableRowElement self))
      >>=
      readUTFString
 
htmlTableRowElementSetCh ::
                         (HTMLTableRowElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlTableRowElementSetCh self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_row_element_set_ch #}
          (toHTMLTableRowElement self)
          valPtr
 
htmlTableRowElementGetCh ::
                         (HTMLTableRowElementClass self, GlibString string) =>
                           self -> IO string
htmlTableRowElementGetCh self
  = ({# call webkit_dom_html_table_row_element_get_ch #}
       (toHTMLTableRowElement self))
      >>=
      readUTFString
 
htmlTableRowElementSetChOff ::
                            (HTMLTableRowElementClass self, GlibString string) =>
                              self -> string -> IO ()
htmlTableRowElementSetChOff self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_row_element_set_ch_off #}
          (toHTMLTableRowElement self)
          valPtr
 
htmlTableRowElementGetChOff ::
                            (HTMLTableRowElementClass self, GlibString string) =>
                              self -> IO string
htmlTableRowElementGetChOff self
  = ({# call webkit_dom_html_table_row_element_get_ch_off #}
       (toHTMLTableRowElement self))
      >>=
      readUTFString
 
htmlTableRowElementSetVAlign ::
                             (HTMLTableRowElementClass self, GlibString string) =>
                               self -> string -> IO ()
htmlTableRowElementSetVAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_row_element_set_v_align #}
          (toHTMLTableRowElement self)
          valPtr
 
htmlTableRowElementGetVAlign ::
                             (HTMLTableRowElementClass self, GlibString string) =>
                               self -> IO string
htmlTableRowElementGetVAlign self
  = ({# call webkit_dom_html_table_row_element_get_v_align #}
       (toHTMLTableRowElement self))
      >>=
      readUTFString
