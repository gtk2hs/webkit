module Graphics.UI.Gtk.WebKit.DOM.HTMLTableElement
       (htmlTableElementCreateTHead, htmlTableElementDeleteTHead,
        htmlTableElementCreateTFoot, htmlTableElementDeleteTFoot,
#if WEBKIT_CHECK_VERSION(1,10,0)
        htmlTableElementCreateTBody,
#endif
        htmlTableElementCreateCaption,
        htmlTableElementDeleteCaption, htmlTableElementInsertRow,
        htmlTableElementDeleteRow, htmlTableElementSetCaption,
        htmlTableElementGetCaption, htmlTableElementSetTHead,
        htmlTableElementGetTHead, htmlTableElementSetTFoot,
        htmlTableElementGetTFoot, htmlTableElementGetRows,
        htmlTableElementGetTBodies, htmlTableElementSetAlign,
        htmlTableElementGetAlign, htmlTableElementSetBgColor,
        htmlTableElementGetBgColor, htmlTableElementSetBorder,
        htmlTableElementGetBorder, htmlTableElementSetCellPadding,
        htmlTableElementGetCellPadding, htmlTableElementSetCellSpacing,
        htmlTableElementGetCellSpacing, htmlTableElementSetFrame,
        htmlTableElementGetFrame, htmlTableElementSetRules,
        htmlTableElementGetRules, htmlTableElementSetSummary,
        htmlTableElementGetSummary, htmlTableElementSetWidth,
        htmlTableElementGetWidth)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlTableElementCreateTHead ::
                            (HTMLTableElementClass self) => self -> IO (Maybe HTMLElement)
htmlTableElementCreateTHead self
  = maybeNull (makeNewGObject mkHTMLElement)
      ({# call webkit_dom_html_table_element_create_t_head #}
         (toHTMLTableElement self))
 
htmlTableElementDeleteTHead ::
                            (HTMLTableElementClass self) => self -> IO ()
htmlTableElementDeleteTHead self
  = {# call webkit_dom_html_table_element_delete_t_head #}
      (toHTMLTableElement self)
 
htmlTableElementCreateTFoot ::
                            (HTMLTableElementClass self) => self -> IO (Maybe HTMLElement)
htmlTableElementCreateTFoot self
  = maybeNull (makeNewGObject mkHTMLElement)
      ({# call webkit_dom_html_table_element_create_t_foot #}
         (toHTMLTableElement self))
 
htmlTableElementDeleteTFoot ::
                            (HTMLTableElementClass self) => self -> IO ()
htmlTableElementDeleteTFoot self
  = {# call webkit_dom_html_table_element_delete_t_foot #}
      (toHTMLTableElement self)
 
#if WEBKIT_CHECK_VERSION(1,10,0)
htmlTableElementCreateTBody ::
                            (HTMLTableElementClass self) => self -> IO (Maybe HTMLElement)
htmlTableElementCreateTBody self
  = maybeNull (makeNewGObject mkHTMLElement)
      ({# call webkit_dom_html_table_element_create_t_body #}
         (toHTMLTableElement self))
#endif
 
htmlTableElementCreateCaption ::
                              (HTMLTableElementClass self) => self -> IO (Maybe HTMLElement)
htmlTableElementCreateCaption self
  = maybeNull (makeNewGObject mkHTMLElement)
      ({# call webkit_dom_html_table_element_create_caption #}
         (toHTMLTableElement self))
 
htmlTableElementDeleteCaption ::
                              (HTMLTableElementClass self) => self -> IO ()
htmlTableElementDeleteCaption self
  = {# call webkit_dom_html_table_element_delete_caption #}
      (toHTMLTableElement self)
 
htmlTableElementInsertRow ::
                          (HTMLTableElementClass self) =>
                            self -> Int -> IO (Maybe HTMLElement)
htmlTableElementInsertRow self index
  = maybeNull (makeNewGObject mkHTMLElement)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_table_element_insert_row #}
             (toHTMLTableElement self)
             (fromIntegral index)
             errorPtr_)
 
htmlTableElementDeleteRow ::
                          (HTMLTableElementClass self) => self -> Int -> IO ()
htmlTableElementDeleteRow self index
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_table_element_delete_row #}
          (toHTMLTableElement self)
          (fromIntegral index)
          errorPtr_
 
htmlTableElementSetCaption ::
                           (HTMLTableCaptionElementClass val, HTMLTableElementClass self) =>
                             self -> Maybe val -> IO ()
htmlTableElementSetCaption self val
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_table_element_set_caption #}
          (toHTMLTableElement self)
          (maybe (HTMLTableCaptionElement nullForeignPtr)
             toHTMLTableCaptionElement
             val)
          errorPtr_
 
htmlTableElementGetCaption ::
                           (HTMLTableElementClass self) =>
                             self -> IO (Maybe HTMLTableCaptionElement)
htmlTableElementGetCaption self
  = maybeNull (makeNewGObject mkHTMLTableCaptionElement)
      ({# call webkit_dom_html_table_element_get_caption #}
         (toHTMLTableElement self))
 
htmlTableElementSetTHead ::
                         (HTMLTableSectionElementClass val, HTMLTableElementClass self) =>
                           self -> Maybe val -> IO ()
htmlTableElementSetTHead self val
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_table_element_set_t_head #}
          (toHTMLTableElement self)
          (maybe (HTMLTableSectionElement nullForeignPtr)
             toHTMLTableSectionElement
             val)
          errorPtr_
 
htmlTableElementGetTHead ::
                         (HTMLTableElementClass self) =>
                           self -> IO (Maybe HTMLTableSectionElement)
htmlTableElementGetTHead self
  = maybeNull (makeNewGObject mkHTMLTableSectionElement)
      ({# call webkit_dom_html_table_element_get_t_head #}
         (toHTMLTableElement self))
 
htmlTableElementSetTFoot ::
                         (HTMLTableSectionElementClass val, HTMLTableElementClass self) =>
                           self -> Maybe val -> IO ()
htmlTableElementSetTFoot self val
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_table_element_set_t_foot #}
          (toHTMLTableElement self)
          (maybe (HTMLTableSectionElement nullForeignPtr)
             toHTMLTableSectionElement
             val)
          errorPtr_
 
htmlTableElementGetTFoot ::
                         (HTMLTableElementClass self) =>
                           self -> IO (Maybe HTMLTableSectionElement)
htmlTableElementGetTFoot self
  = maybeNull (makeNewGObject mkHTMLTableSectionElement)
      ({# call webkit_dom_html_table_element_get_t_foot #}
         (toHTMLTableElement self))
 
htmlTableElementGetRows ::
                        (HTMLTableElementClass self) => self -> IO (Maybe HTMLCollection)
htmlTableElementGetRows self
  = maybeNull (makeNewGObject mkHTMLCollection)
      ({# call webkit_dom_html_table_element_get_rows #}
         (toHTMLTableElement self))
 
htmlTableElementGetTBodies ::
                           (HTMLTableElementClass self) => self -> IO (Maybe HTMLCollection)
htmlTableElementGetTBodies self
  = maybeNull (makeNewGObject mkHTMLCollection)
      ({# call webkit_dom_html_table_element_get_t_bodies #}
         (toHTMLTableElement self))
 
htmlTableElementSetAlign ::
                         (HTMLTableElementClass self) => self -> String -> IO ()
htmlTableElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_element_set_align #}
          (toHTMLTableElement self)
          valPtr
 
htmlTableElementGetAlign ::
                         (HTMLTableElementClass self) => self -> IO String
htmlTableElementGetAlign self
  = ({# call webkit_dom_html_table_element_get_align #}
       (toHTMLTableElement self))
      >>=
      readUTFString
 
htmlTableElementSetBgColor ::
                           (HTMLTableElementClass self) => self -> String -> IO ()
htmlTableElementSetBgColor self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_element_set_bg_color #}
          (toHTMLTableElement self)
          valPtr
 
htmlTableElementGetBgColor ::
                           (HTMLTableElementClass self) => self -> IO String
htmlTableElementGetBgColor self
  = ({# call webkit_dom_html_table_element_get_bg_color #}
       (toHTMLTableElement self))
      >>=
      readUTFString
 
htmlTableElementSetBorder ::
                          (HTMLTableElementClass self) => self -> String -> IO ()
htmlTableElementSetBorder self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_element_set_border #}
          (toHTMLTableElement self)
          valPtr
 
htmlTableElementGetBorder ::
                          (HTMLTableElementClass self) => self -> IO String
htmlTableElementGetBorder self
  = ({# call webkit_dom_html_table_element_get_border #}
       (toHTMLTableElement self))
      >>=
      readUTFString
 
htmlTableElementSetCellPadding ::
                               (HTMLTableElementClass self) => self -> String -> IO ()
htmlTableElementSetCellPadding self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_element_set_cell_padding #}
          (toHTMLTableElement self)
          valPtr
 
htmlTableElementGetCellPadding ::
                               (HTMLTableElementClass self) => self -> IO String
htmlTableElementGetCellPadding self
  = ({# call webkit_dom_html_table_element_get_cell_padding #}
       (toHTMLTableElement self))
      >>=
      readUTFString
 
htmlTableElementSetCellSpacing ::
                               (HTMLTableElementClass self) => self -> String -> IO ()
htmlTableElementSetCellSpacing self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_element_set_cell_spacing #}
          (toHTMLTableElement self)
          valPtr
 
htmlTableElementGetCellSpacing ::
                               (HTMLTableElementClass self) => self -> IO String
htmlTableElementGetCellSpacing self
  = ({# call webkit_dom_html_table_element_get_cell_spacing #}
       (toHTMLTableElement self))
      >>=
      readUTFString
 
htmlTableElementSetFrame ::
                         (HTMLTableElementClass self) => self -> String -> IO ()
htmlTableElementSetFrame self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_element_set_frame #}
          (toHTMLTableElement self)
          valPtr
 
htmlTableElementGetFrame ::
                         (HTMLTableElementClass self) => self -> IO String
htmlTableElementGetFrame self
  = ({# call webkit_dom_html_table_element_get_frame #}
       (toHTMLTableElement self))
      >>=
      readUTFString
 
htmlTableElementSetRules ::
                         (HTMLTableElementClass self) => self -> String -> IO ()
htmlTableElementSetRules self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_element_set_rules #}
          (toHTMLTableElement self)
          valPtr
 
htmlTableElementGetRules ::
                         (HTMLTableElementClass self) => self -> IO String
htmlTableElementGetRules self
  = ({# call webkit_dom_html_table_element_get_rules #}
       (toHTMLTableElement self))
      >>=
      readUTFString
 
htmlTableElementSetSummary ::
                           (HTMLTableElementClass self) => self -> String -> IO ()
htmlTableElementSetSummary self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_element_set_summary #}
          (toHTMLTableElement self)
          valPtr
 
htmlTableElementGetSummary ::
                           (HTMLTableElementClass self) => self -> IO String
htmlTableElementGetSummary self
  = ({# call webkit_dom_html_table_element_get_summary #}
       (toHTMLTableElement self))
      >>=
      readUTFString
 
htmlTableElementSetWidth ::
                         (HTMLTableElementClass self) => self -> String -> IO ()
htmlTableElementSetWidth self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_element_set_width #}
          (toHTMLTableElement self)
          valPtr
 
htmlTableElementGetWidth ::
                         (HTMLTableElementClass self) => self -> IO String
htmlTableElementGetWidth self
  = ({# call webkit_dom_html_table_element_get_width #}
       (toHTMLTableElement self))
      >>=
      readUTFString
