module Graphics.UI.Gtk.WebKit.DOM.Navigator
       (navigatorJavaEnabled, navigatorGetStorageUpdates,
        navigatorGetAppCodeName, navigatorGetAppName,
        navigatorGetAppVersion, navigatorGetLanguage,
        navigatorGetUserAgent, navigatorGetPlatform, navigatorGetPlugins,
        navigatorGetMimeTypes, navigatorGetProduct, navigatorGetProductSub,
        navigatorGetVendor, navigatorGetVendorSub,
        navigatorGetCookieEnabled, navigatorGetOnLine, Navigator,
        NavigatorClass, castToNavigator, gTypeNavigator, toNavigator)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
navigatorJavaEnabled :: (NavigatorClass self) => self -> IO Bool
navigatorJavaEnabled self
  = toBool <$>
      ({# call webkit_dom_navigator_java_enabled #} (toNavigator self))
 
navigatorGetStorageUpdates ::
                           (NavigatorClass self) => self -> IO ()
navigatorGetStorageUpdates self
  = {# call webkit_dom_navigator_get_storage_updates #}
      (toNavigator self)
 
navigatorGetAppCodeName ::
                        (NavigatorClass self, GlibString string) => self -> IO string
navigatorGetAppCodeName self
  = ({# call webkit_dom_navigator_get_app_code_name #}
       (toNavigator self))
      >>=
      readUTFString
 
navigatorGetAppName ::
                    (NavigatorClass self, GlibString string) => self -> IO string
navigatorGetAppName self
  = ({# call webkit_dom_navigator_get_app_name #} (toNavigator self))
      >>=
      readUTFString
 
navigatorGetAppVersion ::
                       (NavigatorClass self, GlibString string) => self -> IO string
navigatorGetAppVersion self
  = ({# call webkit_dom_navigator_get_app_version #}
       (toNavigator self))
      >>=
      readUTFString
 
navigatorGetLanguage ::
                     (NavigatorClass self, GlibString string) => self -> IO string
navigatorGetLanguage self
  = ({# call webkit_dom_navigator_get_language #} (toNavigator self))
      >>=
      readUTFString
 
navigatorGetUserAgent ::
                      (NavigatorClass self, GlibString string) => self -> IO string
navigatorGetUserAgent self
  = ({# call webkit_dom_navigator_get_user_agent #}
       (toNavigator self))
      >>=
      readUTFString
 
navigatorGetPlatform ::
                     (NavigatorClass self, GlibString string) => self -> IO string
navigatorGetPlatform self
  = ({# call webkit_dom_navigator_get_platform #} (toNavigator self))
      >>=
      readUTFString
 
navigatorGetPlugins ::
                    (NavigatorClass self) => self -> IO (Maybe DOMPluginArray)
navigatorGetPlugins self
  = maybeNull (makeNewGObject mkDOMPluginArray)
      ({# call webkit_dom_navigator_get_plugins #} (toNavigator self))
 
navigatorGetMimeTypes ::
                      (NavigatorClass self) => self -> IO (Maybe DOMMimeTypeArray)
navigatorGetMimeTypes self
  = maybeNull (makeNewGObject mkDOMMimeTypeArray)
      ({# call webkit_dom_navigator_get_mime_types #} (toNavigator self))
 
navigatorGetProduct ::
                    (NavigatorClass self, GlibString string) => self -> IO string
navigatorGetProduct self
  = ({# call webkit_dom_navigator_get_product #} (toNavigator self))
      >>=
      readUTFString
 
navigatorGetProductSub ::
                       (NavigatorClass self, GlibString string) => self -> IO string
navigatorGetProductSub self
  = ({# call webkit_dom_navigator_get_product_sub #}
       (toNavigator self))
      >>=
      readUTFString
 
navigatorGetVendor ::
                   (NavigatorClass self, GlibString string) => self -> IO string
navigatorGetVendor self
  = ({# call webkit_dom_navigator_get_vendor #} (toNavigator self))
      >>=
      readUTFString
 
navigatorGetVendorSub ::
                      (NavigatorClass self, GlibString string) => self -> IO string
navigatorGetVendorSub self
  = ({# call webkit_dom_navigator_get_vendor_sub #}
       (toNavigator self))
      >>=
      readUTFString
 
navigatorGetCookieEnabled ::
                          (NavigatorClass self) => self -> IO Bool
navigatorGetCookieEnabled self
  = toBool <$>
      ({# call webkit_dom_navigator_get_cookie_enabled #}
         (toNavigator self))
 
navigatorGetOnLine :: (NavigatorClass self) => self -> IO Bool
navigatorGetOnLine self
  = toBool <$>
      ({# call webkit_dom_navigator_get_on_line #} (toNavigator self))
