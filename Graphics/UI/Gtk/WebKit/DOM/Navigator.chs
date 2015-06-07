module Graphics.UI.Gtk.WebKit.DOM.Navigator(
registerProtocolHandler,
isProtocolHandlerRegistered,
unregisterProtocolHandler,
javaEnabled,
getStorageUpdates,
getWebkitBattery,
getGeolocation,
getWebkitTemporaryStorage,
getWebkitPersistentStorage,
getAppCodeName,
getAppName,
getAppVersion,
getLanguage,
getUserAgent,
getPlatform,
getPlugins,
getMimeTypes,
getProduct,
getProductSub,
getVendor,
getVendorSub,
getCookieEnabled,
getOnLine,
Navigator,
castToNavigator,
gTypeNavigator,
NavigatorClass,
toNavigator,
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

 
registerProtocolHandler ::
                        (MonadIO m, NavigatorClass self, GlibString string) =>
                          self -> string -> string -> string -> m ()
registerProtocolHandler self scheme url title
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString title $
             \ titlePtr ->
               withUTFString url $
                 \ urlPtr ->
                   withUTFString scheme $
                     \ schemePtr ->
                       {# call webkit_dom_navigator_register_protocol_handler #}
                         (toNavigator self)
                         schemePtr
                     urlPtr
                 titlePtr
             errorPtr_)
 
isProtocolHandlerRegistered ::
                            (MonadIO m, NavigatorClass self, GlibString string) =>
                              self -> string -> string -> m string
isProtocolHandlerRegistered self scheme url
  = liftIO
      ((propagateGError $
          \ errorPtr_ ->
            withUTFString url $
              \ urlPtr ->
                withUTFString scheme $
                  \ schemePtr ->
                    {# call webkit_dom_navigator_is_protocol_handler_registered #}
                      (toNavigator self)
                      schemePtr
                  urlPtr
              errorPtr_)
         >>=
         readUTFString)
 
unregisterProtocolHandler ::
                          (MonadIO m, NavigatorClass self, GlibString string) =>
                            self -> string -> string -> m ()
unregisterProtocolHandler self scheme url
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString url $
             \ urlPtr ->
               withUTFString scheme $
                 \ schemePtr ->
                   {# call webkit_dom_navigator_unregister_protocol_handler #}
                     (toNavigator self)
                     schemePtr
                 urlPtr
             errorPtr_)
 
javaEnabled :: (MonadIO m, NavigatorClass self) => self -> m Bool
javaEnabled self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_navigator_java_enabled #} (toNavigator self)))
 
getStorageUpdates ::
                  (MonadIO m, NavigatorClass self) => self -> m ()
getStorageUpdates self
  = liftIO
      ({# call webkit_dom_navigator_get_storage_updates #}
         (toNavigator self))
 
getWebkitBattery ::
                 (MonadIO m, NavigatorClass self) =>
                   self -> m (Maybe BatteryManager)
getWebkitBattery self
  = liftIO
      (maybeNull (makeNewGObject mkBatteryManager)
         ({# call webkit_dom_navigator_get_webkit_battery #}
            (toNavigator self)))
 
getGeolocation ::
               (MonadIO m, NavigatorClass self) => self -> m (Maybe Geolocation)
getGeolocation self
  = liftIO
      (maybeNull (makeNewGObject mkGeolocation)
         ({# call webkit_dom_navigator_get_geolocation #}
            (toNavigator self)))
 
getWebkitTemporaryStorage ::
                          (MonadIO m, NavigatorClass self) => self -> m (Maybe StorageQuota)
getWebkitTemporaryStorage self
  = liftIO
      (maybeNull (makeNewGObject mkStorageQuota)
         ({# call webkit_dom_navigator_get_webkit_temporary_storage #}
            (toNavigator self)))
 
getWebkitPersistentStorage ::
                           (MonadIO m, NavigatorClass self) => self -> m (Maybe StorageQuota)
getWebkitPersistentStorage self
  = liftIO
      (maybeNull (makeNewGObject mkStorageQuota)
         ({# call webkit_dom_navigator_get_webkit_persistent_storage #}
            (toNavigator self)))
 
getAppCodeName ::
               (MonadIO m, NavigatorClass self, GlibString string) =>
                 self -> m string
getAppCodeName self
  = liftIO
      (({# call webkit_dom_navigator_get_app_code_name #}
          (toNavigator self))
         >>=
         readUTFString)
 
getAppName ::
           (MonadIO m, NavigatorClass self, GlibString string) =>
             self -> m string
getAppName self
  = liftIO
      (({# call webkit_dom_navigator_get_app_name #} (toNavigator self))
         >>=
         readUTFString)
 
getAppVersion ::
              (MonadIO m, NavigatorClass self, GlibString string) =>
                self -> m string
getAppVersion self
  = liftIO
      (({# call webkit_dom_navigator_get_app_version #}
          (toNavigator self))
         >>=
         readUTFString)
 
getLanguage ::
            (MonadIO m, NavigatorClass self, GlibString string) =>
              self -> m string
getLanguage self
  = liftIO
      (({# call webkit_dom_navigator_get_language #} (toNavigator self))
         >>=
         readUTFString)
 
getUserAgent ::
             (MonadIO m, NavigatorClass self, GlibString string) =>
               self -> m string
getUserAgent self
  = liftIO
      (({# call webkit_dom_navigator_get_user_agent #}
          (toNavigator self))
         >>=
         readUTFString)
 
getPlatform ::
            (MonadIO m, NavigatorClass self, GlibString string) =>
              self -> m string
getPlatform self
  = liftIO
      (({# call webkit_dom_navigator_get_platform #} (toNavigator self))
         >>=
         readUTFString)
 
getPlugins ::
           (MonadIO m, NavigatorClass self) => self -> m (Maybe PluginArray)
getPlugins self
  = liftIO
      (maybeNull (makeNewGObject mkPluginArray)
         ({# call webkit_dom_navigator_get_plugins #} (toNavigator self)))
 
getMimeTypes ::
             (MonadIO m, NavigatorClass self) => self -> m (Maybe MimeTypeArray)
getMimeTypes self
  = liftIO
      (maybeNull (makeNewGObject mkMimeTypeArray)
         ({# call webkit_dom_navigator_get_mime_types #}
            (toNavigator self)))
 
getProduct ::
           (MonadIO m, NavigatorClass self, GlibString string) =>
             self -> m string
getProduct self
  = liftIO
      (({# call webkit_dom_navigator_get_product #} (toNavigator self))
         >>=
         readUTFString)
 
getProductSub ::
              (MonadIO m, NavigatorClass self, GlibString string) =>
                self -> m string
getProductSub self
  = liftIO
      (({# call webkit_dom_navigator_get_product_sub #}
          (toNavigator self))
         >>=
         readUTFString)
 
getVendor ::
          (MonadIO m, NavigatorClass self, GlibString string) =>
            self -> m string
getVendor self
  = liftIO
      (({# call webkit_dom_navigator_get_vendor #} (toNavigator self))
         >>=
         readUTFString)
 
getVendorSub ::
             (MonadIO m, NavigatorClass self, GlibString string) =>
               self -> m string
getVendorSub self
  = liftIO
      (({# call webkit_dom_navigator_get_vendor_sub #}
          (toNavigator self))
         >>=
         readUTFString)
 
getCookieEnabled ::
                 (MonadIO m, NavigatorClass self) => self -> m Bool
getCookieEnabled self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_navigator_get_cookie_enabled #}
            (toNavigator self)))
 
getOnLine :: (MonadIO m, NavigatorClass self) => self -> m Bool
getOnLine self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_navigator_get_on_line #} (toNavigator self)))
