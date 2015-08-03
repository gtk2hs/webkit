module Graphics.UI.Gtk.WebKit.DOM.BatteryManager(
#if WEBKIT_CHECK_VERSION(2,2,2)
getCharging,
getChargingTime,
getDischargingTime,
getLevel,
chargingChange,
chargingTimeChange,
dischargingTimeChange,
levelChange,
BatteryManager,
castToBatteryManager,
gTypeBatteryManager,
BatteryManagerClass,
toBatteryManager,
#endif
) where
#if WEBKIT_CHECK_VERSION(2,2,2)
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

 
getCharging ::
            (MonadIO m, BatteryManagerClass self) => self -> m Bool
getCharging self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_battery_manager_get_charging #}
            (toBatteryManager self)))
 
getChargingTime ::
                (MonadIO m, BatteryManagerClass self) => self -> m Double
getChargingTime self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_battery_manager_get_charging_time #}
            (toBatteryManager self)))
 
getDischargingTime ::
                   (MonadIO m, BatteryManagerClass self) => self -> m Double
getDischargingTime self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_battery_manager_get_discharging_time #}
            (toBatteryManager self)))
 
getLevel ::
         (MonadIO m, BatteryManagerClass self) => self -> m Double
getLevel self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_battery_manager_get_level #}
            (toBatteryManager self)))
 
chargingChange ::
               (BatteryManagerClass self) => EventName self Event
chargingChange = EventName "chargingchange"
 
chargingTimeChange ::
                   (BatteryManagerClass self) => EventName self Event
chargingTimeChange = EventName "chargingtimechange"
 
dischargingTimeChange ::
                      (BatteryManagerClass self) => EventName self Event
dischargingTimeChange = EventName "dischargingtimechange"
 
levelChange :: (BatteryManagerClass self) => EventName self Event
levelChange = EventName "levelchange"
#endif
