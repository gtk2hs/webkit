module Graphics.UI.Gtk.WebKit.DOM.ValidityState(
getValueMissing,
getTypeMismatch,
getPatternMismatch,
getTooLong,
getRangeUnderflow,
getRangeOverflow,
getStepMismatch,
getBadInput,
getCustomError,
getValid,
ValidityState,
castToValidityState,
gTypeValidityState,
ValidityStateClass,
toValidityState,
) where
import Prelude hiding (drop, error, print)
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

 
getValueMissing ::
                (MonadIO m, ValidityStateClass self) => self -> m Bool
getValueMissing self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_validity_state_get_value_missing #}
            (toValidityState self)))
 
getTypeMismatch ::
                (MonadIO m, ValidityStateClass self) => self -> m Bool
getTypeMismatch self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_validity_state_get_type_mismatch #}
            (toValidityState self)))
 
getPatternMismatch ::
                   (MonadIO m, ValidityStateClass self) => self -> m Bool
getPatternMismatch self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_validity_state_get_pattern_mismatch #}
            (toValidityState self)))
 
getTooLong ::
           (MonadIO m, ValidityStateClass self) => self -> m Bool
getTooLong self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_validity_state_get_too_long #}
            (toValidityState self)))
 
getRangeUnderflow ::
                  (MonadIO m, ValidityStateClass self) => self -> m Bool
getRangeUnderflow self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_validity_state_get_range_underflow #}
            (toValidityState self)))
 
getRangeOverflow ::
                 (MonadIO m, ValidityStateClass self) => self -> m Bool
getRangeOverflow self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_validity_state_get_range_overflow #}
            (toValidityState self)))
 
getStepMismatch ::
                (MonadIO m, ValidityStateClass self) => self -> m Bool
getStepMismatch self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_validity_state_get_step_mismatch #}
            (toValidityState self)))
 
getBadInput ::
            (MonadIO m, ValidityStateClass self) => self -> m Bool
getBadInput self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_validity_state_get_bad_input #}
            (toValidityState self)))
 
getCustomError ::
               (MonadIO m, ValidityStateClass self) => self -> m Bool
getCustomError self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_validity_state_get_custom_error #}
            (toValidityState self)))
 
getValid :: (MonadIO m, ValidityStateClass self) => self -> m Bool
getValid self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_validity_state_get_valid #}
            (toValidityState self)))
