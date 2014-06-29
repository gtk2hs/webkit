module Graphics.UI.Gtk.WebKit.DOM.HTMLTableSectionElement
       (htmlTableSectionElementInsertRow,
        htmlTableSectionElementDeleteRow, htmlTableSectionElementSetAlign,
        htmlTableSectionElementGetAlign, htmlTableSectionElementSetCh,
        htmlTableSectionElementGetCh, htmlTableSectionElementSetChOff,
        htmlTableSectionElementGetChOff, htmlTableSectionElementSetVAlign,
        htmlTableSectionElementGetVAlign, htmlTableSectionElementGetRows,
        HTMLTableSectionElement, HTMLTableSectionElementClass,
        castToHTMLTableSectionElement, gTypeHTMLTableSectionElement,
        toHTMLTableSectionElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlTableSectionElementInsertRow ::
                                 (HTMLTableSectionElementClass self) =>
                                   self -> Int -> IO (Maybe HTMLElement)
htmlTableSectionElementInsertRow self index
  = maybeNull (makeNewGObject mkHTMLElement)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_table_section_element_insert_row #}
             (toHTMLTableSectionElement self)
             (fromIntegral index)
             errorPtr_)
 
htmlTableSectionElementDeleteRow ::
                                 (HTMLTableSectionElementClass self) => self -> Int -> IO ()
htmlTableSectionElementDeleteRow self index
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_table_section_element_delete_row #}
          (toHTMLTableSectionElement self)
          (fromIntegral index)
          errorPtr_
 
htmlTableSectionElementSetAlign ::
                                (HTMLTableSectionElementClass self, GlibString string) =>
                                  self -> string -> IO ()
htmlTableSectionElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_section_element_set_align #}
          (toHTMLTableSectionElement self)
          valPtr
 
htmlTableSectionElementGetAlign ::
                                (HTMLTableSectionElementClass self, GlibString string) =>
                                  self -> IO string
htmlTableSectionElementGetAlign self
  = ({# call webkit_dom_html_table_section_element_get_align #}
       (toHTMLTableSectionElement self))
      >>=
      readUTFString
 
htmlTableSectionElementSetCh ::
                             (HTMLTableSectionElementClass self, GlibString string) =>
                               self -> string -> IO ()
htmlTableSectionElementSetCh self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_section_element_set_ch #}
          (toHTMLTableSectionElement self)
          valPtr
 
htmlTableSectionElementGetCh ::
                             (HTMLTableSectionElementClass self, GlibString string) =>
                               self -> IO string
htmlTableSectionElementGetCh self
  = ({# call webkit_dom_html_table_section_element_get_ch #}
       (toHTMLTableSectionElement self))
      >>=
      readUTFString
 
htmlTableSectionElementSetChOff ::
                                (HTMLTableSectionElementClass self, GlibString string) =>
                                  self -> string -> IO ()
htmlTableSectionElementSetChOff self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_section_element_set_ch_off #}
          (toHTMLTableSectionElement self)
          valPtr
 
htmlTableSectionElementGetChOff ::
                                (HTMLTableSectionElementClass self, GlibString string) =>
                                  self -> IO string
htmlTableSectionElementGetChOff self
  = ({# call webkit_dom_html_table_section_element_get_ch_off #}
       (toHTMLTableSectionElement self))
      >>=
      readUTFString
 
htmlTableSectionElementSetVAlign ::
                                 (HTMLTableSectionElementClass self, GlibString string) =>
                                   self -> string -> IO ()
htmlTableSectionElementSetVAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_section_element_set_v_align #}
          (toHTMLTableSectionElement self)
          valPtr
 
htmlTableSectionElementGetVAlign ::
                                 (HTMLTableSectionElementClass self, GlibString string) =>
                                   self -> IO string
htmlTableSectionElementGetVAlign self
  = ({# call webkit_dom_html_table_section_element_get_v_align #}
       (toHTMLTableSectionElement self))
      >>=
      readUTFString
 
htmlTableSectionElementGetRows ::
                               (HTMLTableSectionElementClass self) =>
                                 self -> IO (Maybe HTMLCollection)
htmlTableSectionElementGetRows self
  = maybeNull (makeNewGObject mkHTMLCollection)
      ({# call webkit_dom_html_table_section_element_get_rows #}
         (toHTMLTableSectionElement self))
