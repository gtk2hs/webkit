module Graphics.UI.Gtk.WebKit.DOM.HTMLTableRowElement
       (htmlTableRowElementInsertCell, htmlTableRowElementDeleteCell,
        htmlTableRowElementGetRowIndex,
        htmlTableRowElementGetSectionRowIndex, htmlTableRowElementGetCells,
        htmlTableRowElementSetAlign, htmlTableRowElementGetAlign,
        htmlTableRowElementSetBgColor, htmlTableRowElementGetBgColor,
        htmlTableRowElementSetCh, htmlTableRowElementGetCh,
        htmlTableRowElementSetChOff, htmlTableRowElementGetChOff,
        htmlTableRowElementSetVAlign, htmlTableRowElementGetVAlign)
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
                            (HTMLTableRowElementClass self) => self -> String -> IO ()
htmlTableRowElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_row_element_set_align #}
          (toHTMLTableRowElement self)
          valPtr
 
htmlTableRowElementGetAlign ::
                            (HTMLTableRowElementClass self) => self -> IO String
htmlTableRowElementGetAlign self
  = ({# call webkit_dom_html_table_row_element_get_align #}
       (toHTMLTableRowElement self))
      >>=
      readUTFString
 
htmlTableRowElementSetBgColor ::
                              (HTMLTableRowElementClass self) => self -> String -> IO ()
htmlTableRowElementSetBgColor self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_row_element_set_bg_color #}
          (toHTMLTableRowElement self)
          valPtr
 
htmlTableRowElementGetBgColor ::
                              (HTMLTableRowElementClass self) => self -> IO String
htmlTableRowElementGetBgColor self
  = ({# call webkit_dom_html_table_row_element_get_bg_color #}
       (toHTMLTableRowElement self))
      >>=
      readUTFString
 
htmlTableRowElementSetCh ::
                         (HTMLTableRowElementClass self) => self -> String -> IO ()
htmlTableRowElementSetCh self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_row_element_set_ch #}
          (toHTMLTableRowElement self)
          valPtr
 
htmlTableRowElementGetCh ::
                         (HTMLTableRowElementClass self) => self -> IO String
htmlTableRowElementGetCh self
  = ({# call webkit_dom_html_table_row_element_get_ch #}
       (toHTMLTableRowElement self))
      >>=
      readUTFString
 
htmlTableRowElementSetChOff ::
                            (HTMLTableRowElementClass self) => self -> String -> IO ()
htmlTableRowElementSetChOff self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_row_element_set_ch_off #}
          (toHTMLTableRowElement self)
          valPtr
 
htmlTableRowElementGetChOff ::
                            (HTMLTableRowElementClass self) => self -> IO String
htmlTableRowElementGetChOff self
  = ({# call webkit_dom_html_table_row_element_get_ch_off #}
       (toHTMLTableRowElement self))
      >>=
      readUTFString
 
htmlTableRowElementSetVAlign ::
                             (HTMLTableRowElementClass self) => self -> String -> IO ()
htmlTableRowElementSetVAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_row_element_set_v_align #}
          (toHTMLTableRowElement self)
          valPtr
 
htmlTableRowElementGetVAlign ::
                             (HTMLTableRowElementClass self) => self -> IO String
htmlTableRowElementGetVAlign self
  = ({# call webkit_dom_html_table_row_element_get_v_align #}
       (toHTMLTableRowElement self))
      >>=
      readUTFString
