module Graphics.UI.Gtk.WebKit.DOM.HTMLTableCellElement(
getCellIndex,
setAbbr,
getAbbr,
setAlign,
getAlign,
setAxis,
getAxis,
setBgColor,
getBgColor,
setCh,
getCh,
setChOff,
getChOff,
setColSpan,
getColSpan,
setHeaders,
getHeaders,
setHeight,
getHeight,
setNoWrap,
getNoWrap,
setRowSpan,
getRowSpan,
setScope,
getScope,
setVAlign,
getVAlign,
setWidth,
getWidth,
HTMLTableCellElement,
castToHTMLTableCellElement,
gTypeHTMLTableCellElement,
HTMLTableCellElementClass,
toHTMLTableCellElement,
) where
import Prelude hiding (drop, error, print)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
getCellIndex ::
             (MonadIO m, HTMLTableCellElementClass self) => self -> m Int
getCellIndex self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_table_cell_element_get_cell_index #}
            (toHTMLTableCellElement self)))
 
setAbbr ::
        (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
          self -> string -> m ()
setAbbr self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_cell_element_set_abbr #}
             (toHTMLTableCellElement self)
             valPtr)
 
getAbbr ::
        (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
          self -> m string
getAbbr self
  = liftIO
      (({# call webkit_dom_html_table_cell_element_get_abbr #}
          (toHTMLTableCellElement self))
         >>=
         readUTFString)
 
setAlign ::
         (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
           self -> string -> m ()
setAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_cell_element_set_align #}
             (toHTMLTableCellElement self)
             valPtr)
 
getAlign ::
         (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
           self -> m string
getAlign self
  = liftIO
      (({# call webkit_dom_html_table_cell_element_get_align #}
          (toHTMLTableCellElement self))
         >>=
         readUTFString)
 
setAxis ::
        (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
          self -> string -> m ()
setAxis self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_cell_element_set_axis #}
             (toHTMLTableCellElement self)
             valPtr)
 
getAxis ::
        (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
          self -> m string
getAxis self
  = liftIO
      (({# call webkit_dom_html_table_cell_element_get_axis #}
          (toHTMLTableCellElement self))
         >>=
         readUTFString)
 
setBgColor ::
           (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
             self -> string -> m ()
setBgColor self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_cell_element_set_bg_color #}
             (toHTMLTableCellElement self)
             valPtr)
 
getBgColor ::
           (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
             self -> m string
getBgColor self
  = liftIO
      (({# call webkit_dom_html_table_cell_element_get_bg_color #}
          (toHTMLTableCellElement self))
         >>=
         readUTFString)
 
setCh ::
      (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
        self -> string -> m ()
setCh self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_cell_element_set_ch #}
             (toHTMLTableCellElement self)
             valPtr)
 
getCh ::
      (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
        self -> m string
getCh self
  = liftIO
      (({# call webkit_dom_html_table_cell_element_get_ch #}
          (toHTMLTableCellElement self))
         >>=
         readUTFString)
 
setChOff ::
         (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
           self -> string -> m ()
setChOff self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_cell_element_set_ch_off #}
             (toHTMLTableCellElement self)
             valPtr)
 
getChOff ::
         (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
           self -> m string
getChOff self
  = liftIO
      (({# call webkit_dom_html_table_cell_element_get_ch_off #}
          (toHTMLTableCellElement self))
         >>=
         readUTFString)
 
setColSpan ::
           (MonadIO m, HTMLTableCellElementClass self) => self -> Int -> m ()
setColSpan self val
  = liftIO
      ({# call webkit_dom_html_table_cell_element_set_col_span #}
         (toHTMLTableCellElement self)
         (fromIntegral val))
 
getColSpan ::
           (MonadIO m, HTMLTableCellElementClass self) => self -> m Int
getColSpan self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_table_cell_element_get_col_span #}
            (toHTMLTableCellElement self)))
 
setHeaders ::
           (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
             self -> string -> m ()
setHeaders self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_cell_element_set_headers #}
             (toHTMLTableCellElement self)
             valPtr)
 
getHeaders ::
           (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
             self -> m string
getHeaders self
  = liftIO
      (({# call webkit_dom_html_table_cell_element_get_headers #}
          (toHTMLTableCellElement self))
         >>=
         readUTFString)
 
setHeight ::
          (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
            self -> string -> m ()
setHeight self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_cell_element_set_height #}
             (toHTMLTableCellElement self)
             valPtr)
 
getHeight ::
          (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
            self -> m string
getHeight self
  = liftIO
      (({# call webkit_dom_html_table_cell_element_get_height #}
          (toHTMLTableCellElement self))
         >>=
         readUTFString)
 
setNoWrap ::
          (MonadIO m, HTMLTableCellElementClass self) => self -> Bool -> m ()
setNoWrap self val
  = liftIO
      ({# call webkit_dom_html_table_cell_element_set_no_wrap #}
         (toHTMLTableCellElement self)
         (fromBool val))
 
getNoWrap ::
          (MonadIO m, HTMLTableCellElementClass self) => self -> m Bool
getNoWrap self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_table_cell_element_get_no_wrap #}
            (toHTMLTableCellElement self)))
 
setRowSpan ::
           (MonadIO m, HTMLTableCellElementClass self) => self -> Int -> m ()
setRowSpan self val
  = liftIO
      ({# call webkit_dom_html_table_cell_element_set_row_span #}
         (toHTMLTableCellElement self)
         (fromIntegral val))
 
getRowSpan ::
           (MonadIO m, HTMLTableCellElementClass self) => self -> m Int
getRowSpan self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_table_cell_element_get_row_span #}
            (toHTMLTableCellElement self)))
 
setScope ::
         (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
           self -> string -> m ()
setScope self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_cell_element_set_scope #}
             (toHTMLTableCellElement self)
             valPtr)
 
getScope ::
         (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
           self -> m string
getScope self
  = liftIO
      (({# call webkit_dom_html_table_cell_element_get_scope #}
          (toHTMLTableCellElement self))
         >>=
         readUTFString)
 
setVAlign ::
          (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
            self -> string -> m ()
setVAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_cell_element_set_v_align #}
             (toHTMLTableCellElement self)
             valPtr)
 
getVAlign ::
          (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
            self -> m string
getVAlign self
  = liftIO
      (({# call webkit_dom_html_table_cell_element_get_v_align #}
          (toHTMLTableCellElement self))
         >>=
         readUTFString)
 
setWidth ::
         (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
           self -> string -> m ()
setWidth self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_cell_element_set_width #}
             (toHTMLTableCellElement self)
             valPtr)
 
getWidth ::
         (MonadIO m, HTMLTableCellElementClass self, GlibString string) =>
           self -> m string
getWidth self
  = liftIO
      (({# call webkit_dom_html_table_cell_element_get_width #}
          (toHTMLTableCellElement self))
         >>=
         readUTFString)
