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
        htmlTableElementGetWidth, HTMLTableElement, HTMLTableElementClass,
        castToHTMLTableElement, gTypeHTMLTableElement, toHTMLTableElement)
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
                         (HTMLTableElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlTableElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_element_set_align #}
          (toHTMLTableElement self)
          valPtr
 
htmlTableElementGetAlign ::
                         (HTMLTableElementClass self, GlibString string) =>
                           self -> IO string
htmlTableElementGetAlign self
  = ({# call webkit_dom_html_table_element_get_align #}
       (toHTMLTableElement self))
      >>=
      readUTFString
 
htmlTableElementSetBgColor ::
                           (HTMLTableElementClass self, GlibString string) =>
                             self -> string -> IO ()
htmlTableElementSetBgColor self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_element_set_bg_color #}
          (toHTMLTableElement self)
          valPtr
 
htmlTableElementGetBgColor ::
                           (HTMLTableElementClass self, GlibString string) =>
                             self -> IO string
htmlTableElementGetBgColor self
  = ({# call webkit_dom_html_table_element_get_bg_color #}
       (toHTMLTableElement self))
      >>=
      readUTFString
 
htmlTableElementSetBorder ::
                          (HTMLTableElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmlTableElementSetBorder self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_element_set_border #}
          (toHTMLTableElement self)
          valPtr
 
htmlTableElementGetBorder ::
                          (HTMLTableElementClass self, GlibString string) =>
                            self -> IO string
htmlTableElementGetBorder self
  = ({# call webkit_dom_html_table_element_get_border #}
       (toHTMLTableElement self))
      >>=
      readUTFString
 
htmlTableElementSetCellPadding ::
                               (HTMLTableElementClass self, GlibString string) =>
                                 self -> string -> IO ()
htmlTableElementSetCellPadding self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_element_set_cell_padding #}
          (toHTMLTableElement self)
          valPtr
 
htmlTableElementGetCellPadding ::
                               (HTMLTableElementClass self, GlibString string) =>
                                 self -> IO string
htmlTableElementGetCellPadding self
  = ({# call webkit_dom_html_table_element_get_cell_padding #}
       (toHTMLTableElement self))
      >>=
      readUTFString
 
htmlTableElementSetCellSpacing ::
                               (HTMLTableElementClass self, GlibString string) =>
                                 self -> string -> IO ()
htmlTableElementSetCellSpacing self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_element_set_cell_spacing #}
          (toHTMLTableElement self)
          valPtr
 
htmlTableElementGetCellSpacing ::
                               (HTMLTableElementClass self, GlibString string) =>
                                 self -> IO string
htmlTableElementGetCellSpacing self
  = ({# call webkit_dom_html_table_element_get_cell_spacing #}
       (toHTMLTableElement self))
      >>=
      readUTFString
 
htmlTableElementSetFrame ::
                         (HTMLTableElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlTableElementSetFrame self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_element_set_frame #}
          (toHTMLTableElement self)
          valPtr
 
htmlTableElementGetFrame ::
                         (HTMLTableElementClass self, GlibString string) =>
                           self -> IO string
htmlTableElementGetFrame self
  = ({# call webkit_dom_html_table_element_get_frame #}
       (toHTMLTableElement self))
      >>=
      readUTFString
 
htmlTableElementSetRules ::
                         (HTMLTableElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlTableElementSetRules self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_element_set_rules #}
          (toHTMLTableElement self)
          valPtr
 
htmlTableElementGetRules ::
                         (HTMLTableElementClass self, GlibString string) =>
                           self -> IO string
htmlTableElementGetRules self
  = ({# call webkit_dom_html_table_element_get_rules #}
       (toHTMLTableElement self))
      >>=
      readUTFString
 
htmlTableElementSetSummary ::
                           (HTMLTableElementClass self, GlibString string) =>
                             self -> string -> IO ()
htmlTableElementSetSummary self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_element_set_summary #}
          (toHTMLTableElement self)
          valPtr
 
htmlTableElementGetSummary ::
                           (HTMLTableElementClass self, GlibString string) =>
                             self -> IO string
htmlTableElementGetSummary self
  = ({# call webkit_dom_html_table_element_get_summary #}
       (toHTMLTableElement self))
      >>=
      readUTFString
 
htmlTableElementSetWidth ::
                         (HTMLTableElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlTableElementSetWidth self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_element_set_width #}
          (toHTMLTableElement self)
          valPtr
 
htmlTableElementGetWidth ::
                         (HTMLTableElementClass self, GlibString string) =>
                           self -> IO string
htmlTableElementGetWidth self
  = ({# call webkit_dom_html_table_element_get_width #}
       (toHTMLTableElement self))
      >>=
      readUTFString
