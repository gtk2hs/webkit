module Graphics.UI.Gtk.WebKit.DOM.HTMLHRElement(
setAlign,
getAlign,
setNoShade,
getNoShade,
setSize,
getSize,
setWidth,
getWidth,
HTMLHRElement,
castToHTMLHRElement,
gTypeHTMLHRElement,
HTMLHRElementClass,
toHTMLHRElement,
) where
import Prelude hiding (drop, error, print)
import Data.Typeable (Typeable)
import Foreign.Marshal (maybePeek, maybeWith)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
{#import Graphics.UI.Gtk.WebKit.Types#}
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
setAlign ::
         (MonadIO m, HTMLHRElementClass self, GlibString string) =>
           self -> string -> m ()
setAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_htmlhr_element_set_align #}
             (toHTMLHRElement self)
             valPtr)
 
getAlign ::
         (MonadIO m, HTMLHRElementClass self, GlibString string) =>
           self -> m string
getAlign self
  = liftIO
      (({# call webkit_dom_htmlhr_element_get_align #}
          (toHTMLHRElement self))
         >>=
         readUTFString)
 
setNoShade ::
           (MonadIO m, HTMLHRElementClass self) => self -> Bool -> m ()
setNoShade self val
  = liftIO
      ({# call webkit_dom_htmlhr_element_set_no_shade #}
         (toHTMLHRElement self)
         (fromBool val))
 
getNoShade ::
           (MonadIO m, HTMLHRElementClass self) => self -> m Bool
getNoShade self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_htmlhr_element_get_no_shade #}
            (toHTMLHRElement self)))
 
setSize ::
        (MonadIO m, HTMLHRElementClass self, GlibString string) =>
          self -> string -> m ()
setSize self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_htmlhr_element_set_size #}
             (toHTMLHRElement self)
             valPtr)
 
getSize ::
        (MonadIO m, HTMLHRElementClass self, GlibString string) =>
          self -> m string
getSize self
  = liftIO
      (({# call webkit_dom_htmlhr_element_get_size #}
          (toHTMLHRElement self))
         >>=
         readUTFString)
 
setWidth ::
         (MonadIO m, HTMLHRElementClass self, GlibString string) =>
           self -> string -> m ()
setWidth self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_htmlhr_element_set_width #}
             (toHTMLHRElement self)
             valPtr)
 
getWidth ::
         (MonadIO m, HTMLHRElementClass self, GlibString string) =>
           self -> m string
getWidth self
  = liftIO
      (({# call webkit_dom_htmlhr_element_get_width #}
          (toHTMLHRElement self))
         >>=
         readUTFString)
