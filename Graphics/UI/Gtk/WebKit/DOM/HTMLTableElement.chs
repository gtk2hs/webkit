module Graphics.UI.Gtk.WebKit.DOM.HTMLTableElement(
createTHead,
deleteTHead,
createTFoot,
deleteTFoot,
createTBody,
createCaption,
deleteCaption,
insertRow,
deleteRow,
setCaption,
getCaption,
setTHead,
getTHead,
setTFoot,
getTFoot,
getRows,
getTBodies,
setAlign,
getAlign,
setBgColor,
getBgColor,
setBorder,
getBorder,
setCellPadding,
getCellPadding,
setCellSpacing,
getCellSpacing,
setFrame,
getFrame,
setRules,
getRules,
setSummary,
getSummary,
setWidth,
getWidth,
HTMLTableElement,
castToHTMLTableElement,
gTypeHTMLTableElement,
HTMLTableElementClass,
toHTMLTableElement,
) where
import Prelude hiding (drop, error, print)
import Data.Typeable (Typeable)
import Foreign.Marshal (maybePeek, maybeWith)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CLLong(..), CULLong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
{#import Graphics.UI.Gtk.WebKit.Types#}
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
createTHead ::
            (MonadIO m, HTMLTableElementClass self) =>
              self -> m (Maybe HTMLElement)
createTHead self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLElement)
         ({# call webkit_dom_html_table_element_create_t_head #}
            (toHTMLTableElement self)))
 
deleteTHead ::
            (MonadIO m, HTMLTableElementClass self) => self -> m ()
deleteTHead self
  = liftIO
      ({# call webkit_dom_html_table_element_delete_t_head #}
         (toHTMLTableElement self))
 
createTFoot ::
            (MonadIO m, HTMLTableElementClass self) =>
              self -> m (Maybe HTMLElement)
createTFoot self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLElement)
         ({# call webkit_dom_html_table_element_create_t_foot #}
            (toHTMLTableElement self)))
 
deleteTFoot ::
            (MonadIO m, HTMLTableElementClass self) => self -> m ()
deleteTFoot self
  = liftIO
      ({# call webkit_dom_html_table_element_delete_t_foot #}
         (toHTMLTableElement self))
 
createTBody ::
            (MonadIO m, HTMLTableElementClass self) =>
              self -> m (Maybe HTMLElement)
createTBody self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLElement)
         ({# call webkit_dom_html_table_element_create_t_body #}
            (toHTMLTableElement self)))
 
createCaption ::
              (MonadIO m, HTMLTableElementClass self) =>
                self -> m (Maybe HTMLElement)
createCaption self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLElement)
         ({# call webkit_dom_html_table_element_create_caption #}
            (toHTMLTableElement self)))
 
deleteCaption ::
              (MonadIO m, HTMLTableElementClass self) => self -> m ()
deleteCaption self
  = liftIO
      ({# call webkit_dom_html_table_element_delete_caption #}
         (toHTMLTableElement self))
 
insertRow ::
          (MonadIO m, HTMLTableElementClass self) =>
            self -> Int -> m (Maybe HTMLElement)
insertRow self index
  = liftIO
      (maybeNull (makeNewGObject mkHTMLElement)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_html_table_element_insert_row #}
                (toHTMLTableElement self)
                (fromIntegral index)
                errorPtr_))
 
deleteRow ::
          (MonadIO m, HTMLTableElementClass self) => self -> Int -> m ()
deleteRow self index
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_table_element_delete_row #}
             (toHTMLTableElement self)
             (fromIntegral index)
             errorPtr_)
 
setCaption ::
           (MonadIO m, HTMLTableCaptionElementClass val,
            HTMLTableElementClass self) =>
             self -> Maybe val -> m ()
setCaption self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_table_element_set_caption #}
             (toHTMLTableElement self)
             (maybe (HTMLTableCaptionElement nullForeignPtr)
                toHTMLTableCaptionElement
                val)
             errorPtr_)
 
getCaption ::
           (MonadIO m, HTMLTableElementClass self) =>
             self -> m (Maybe HTMLTableCaptionElement)
getCaption self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLTableCaptionElement)
         ({# call webkit_dom_html_table_element_get_caption #}
            (toHTMLTableElement self)))
 
setTHead ::
         (MonadIO m, HTMLTableSectionElementClass val,
          HTMLTableElementClass self) =>
           self -> Maybe val -> m ()
setTHead self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_table_element_set_t_head #}
             (toHTMLTableElement self)
             (maybe (HTMLTableSectionElement nullForeignPtr)
                toHTMLTableSectionElement
                val)
             errorPtr_)
 
getTHead ::
         (MonadIO m, HTMLTableElementClass self) =>
           self -> m (Maybe HTMLTableSectionElement)
getTHead self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLTableSectionElement)
         ({# call webkit_dom_html_table_element_get_t_head #}
            (toHTMLTableElement self)))
 
setTFoot ::
         (MonadIO m, HTMLTableSectionElementClass val,
          HTMLTableElementClass self) =>
           self -> Maybe val -> m ()
setTFoot self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_table_element_set_t_foot #}
             (toHTMLTableElement self)
             (maybe (HTMLTableSectionElement nullForeignPtr)
                toHTMLTableSectionElement
                val)
             errorPtr_)
 
getTFoot ::
         (MonadIO m, HTMLTableElementClass self) =>
           self -> m (Maybe HTMLTableSectionElement)
getTFoot self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLTableSectionElement)
         ({# call webkit_dom_html_table_element_get_t_foot #}
            (toHTMLTableElement self)))
 
getRows ::
        (MonadIO m, HTMLTableElementClass self) =>
          self -> m (Maybe HTMLCollection)
getRows self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLCollection)
         ({# call webkit_dom_html_table_element_get_rows #}
            (toHTMLTableElement self)))
 
getTBodies ::
           (MonadIO m, HTMLTableElementClass self) =>
             self -> m (Maybe HTMLCollection)
getTBodies self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLCollection)
         ({# call webkit_dom_html_table_element_get_t_bodies #}
            (toHTMLTableElement self)))
 
setAlign ::
         (MonadIO m, HTMLTableElementClass self, GlibString string) =>
           self -> string -> m ()
setAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_element_set_align #}
             (toHTMLTableElement self)
             valPtr)
 
getAlign ::
         (MonadIO m, HTMLTableElementClass self, GlibString string) =>
           self -> m string
getAlign self
  = liftIO
      (({# call webkit_dom_html_table_element_get_align #}
          (toHTMLTableElement self))
         >>=
         readUTFString)
 
setBgColor ::
           (MonadIO m, HTMLTableElementClass self, GlibString string) =>
             self -> string -> m ()
setBgColor self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_element_set_bg_color #}
             (toHTMLTableElement self)
             valPtr)
 
getBgColor ::
           (MonadIO m, HTMLTableElementClass self, GlibString string) =>
             self -> m string
getBgColor self
  = liftIO
      (({# call webkit_dom_html_table_element_get_bg_color #}
          (toHTMLTableElement self))
         >>=
         readUTFString)
 
setBorder ::
          (MonadIO m, HTMLTableElementClass self, GlibString string) =>
            self -> string -> m ()
setBorder self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_element_set_border #}
             (toHTMLTableElement self)
             valPtr)
 
getBorder ::
          (MonadIO m, HTMLTableElementClass self, GlibString string) =>
            self -> m string
getBorder self
  = liftIO
      (({# call webkit_dom_html_table_element_get_border #}
          (toHTMLTableElement self))
         >>=
         readUTFString)
 
setCellPadding ::
               (MonadIO m, HTMLTableElementClass self, GlibString string) =>
                 self -> string -> m ()
setCellPadding self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_element_set_cell_padding #}
             (toHTMLTableElement self)
             valPtr)
 
getCellPadding ::
               (MonadIO m, HTMLTableElementClass self, GlibString string) =>
                 self -> m string
getCellPadding self
  = liftIO
      (({# call webkit_dom_html_table_element_get_cell_padding #}
          (toHTMLTableElement self))
         >>=
         readUTFString)
 
setCellSpacing ::
               (MonadIO m, HTMLTableElementClass self, GlibString string) =>
                 self -> string -> m ()
setCellSpacing self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_element_set_cell_spacing #}
             (toHTMLTableElement self)
             valPtr)
 
getCellSpacing ::
               (MonadIO m, HTMLTableElementClass self, GlibString string) =>
                 self -> m string
getCellSpacing self
  = liftIO
      (({# call webkit_dom_html_table_element_get_cell_spacing #}
          (toHTMLTableElement self))
         >>=
         readUTFString)
 
setFrame ::
         (MonadIO m, HTMLTableElementClass self, GlibString string) =>
           self -> string -> m ()
setFrame self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_element_set_frame #}
             (toHTMLTableElement self)
             valPtr)
 
getFrame ::
         (MonadIO m, HTMLTableElementClass self, GlibString string) =>
           self -> m string
getFrame self
  = liftIO
      (({# call webkit_dom_html_table_element_get_frame #}
          (toHTMLTableElement self))
         >>=
         readUTFString)
 
setRules ::
         (MonadIO m, HTMLTableElementClass self, GlibString string) =>
           self -> string -> m ()
setRules self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_element_set_rules #}
             (toHTMLTableElement self)
             valPtr)
 
getRules ::
         (MonadIO m, HTMLTableElementClass self, GlibString string) =>
           self -> m string
getRules self
  = liftIO
      (({# call webkit_dom_html_table_element_get_rules #}
          (toHTMLTableElement self))
         >>=
         readUTFString)
 
setSummary ::
           (MonadIO m, HTMLTableElementClass self, GlibString string) =>
             self -> string -> m ()
setSummary self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_element_set_summary #}
             (toHTMLTableElement self)
             valPtr)
 
getSummary ::
           (MonadIO m, HTMLTableElementClass self, GlibString string) =>
             self -> m string
getSummary self
  = liftIO
      (({# call webkit_dom_html_table_element_get_summary #}
          (toHTMLTableElement self))
         >>=
         readUTFString)
 
setWidth ::
         (MonadIO m, HTMLTableElementClass self, GlibString string) =>
           self -> string -> m ()
setWidth self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_element_set_width #}
             (toHTMLTableElement self)
             valPtr)
 
getWidth ::
         (MonadIO m, HTMLTableElementClass self, GlibString string) =>
           self -> m string
getWidth self
  = liftIO
      (({# call webkit_dom_html_table_element_get_width #}
          (toHTMLTableElement self))
         >>=
         readUTFString)
