module Graphics.UI.Gtk.WebKit.DOM.ValidityState
       (validityStateGetValueMissing, validityStateGetTypeMismatch,
        validityStateGetPatternMismatch, validityStateGetTooLong,
        validityStateGetRangeUnderflow, validityStateGetRangeOverflow,
        validityStateGetStepMismatch,
#if WEBKIT_CHECK_VERSION(2,2,2)
        validityStateGetBadInput,
#endif
        validityStateGetCustomError, validityStateGetValid)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
validityStateGetValueMissing ::
                             (ValidityStateClass self) => self -> IO Bool
validityStateGetValueMissing self
  = toBool <$>
      ({# call webkit_dom_validity_state_get_value_missing #}
         (toValidityState self))
 
validityStateGetTypeMismatch ::
                             (ValidityStateClass self) => self -> IO Bool
validityStateGetTypeMismatch self
  = toBool <$>
      ({# call webkit_dom_validity_state_get_type_mismatch #}
         (toValidityState self))
 
validityStateGetPatternMismatch ::
                                (ValidityStateClass self) => self -> IO Bool
validityStateGetPatternMismatch self
  = toBool <$>
      ({# call webkit_dom_validity_state_get_pattern_mismatch #}
         (toValidityState self))
 
validityStateGetTooLong ::
                        (ValidityStateClass self) => self -> IO Bool
validityStateGetTooLong self
  = toBool <$>
      ({# call webkit_dom_validity_state_get_too_long #}
         (toValidityState self))
 
validityStateGetRangeUnderflow ::
                               (ValidityStateClass self) => self -> IO Bool
validityStateGetRangeUnderflow self
  = toBool <$>
      ({# call webkit_dom_validity_state_get_range_underflow #}
         (toValidityState self))
 
validityStateGetRangeOverflow ::
                              (ValidityStateClass self) => self -> IO Bool
validityStateGetRangeOverflow self
  = toBool <$>
      ({# call webkit_dom_validity_state_get_range_overflow #}
         (toValidityState self))
 
validityStateGetStepMismatch ::
                             (ValidityStateClass self) => self -> IO Bool
validityStateGetStepMismatch self
  = toBool <$>
      ({# call webkit_dom_validity_state_get_step_mismatch #}
         (toValidityState self))
 
#if WEBKIT_CHECK_VERSION(2,2,2)
validityStateGetBadInput ::
                         (ValidityStateClass self) => self -> IO Bool
validityStateGetBadInput self
  = toBool <$>
      ({# call webkit_dom_validity_state_get_bad_input #}
         (toValidityState self))
#endif
 
validityStateGetCustomError ::
                            (ValidityStateClass self) => self -> IO Bool
validityStateGetCustomError self
  = toBool <$>
      ({# call webkit_dom_validity_state_get_custom_error #}
         (toValidityState self))
 
validityStateGetValid ::
                      (ValidityStateClass self) => self -> IO Bool
validityStateGetValid self
  = toBool <$>
      ({# call webkit_dom_validity_state_get_valid #}
         (toValidityState self))
