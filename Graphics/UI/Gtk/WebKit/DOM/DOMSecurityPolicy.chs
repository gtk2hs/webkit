module Graphics.UI.Gtk.WebKit.DOM.DOMSecurityPolicy (
#if WEBKIT_CHECK_VERSION(1,10,0)
#if !WEBKIT_CHECK_VERSION(2,0,0)
    domSecurityPolicyIsActive,
#endif
    domSecurityPolicyAllowsConnectionTo,
    domSecurityPolicyAllowsFontFrom, domSecurityPolicyAllowsFormAction,
    domSecurityPolicyAllowsFrameFrom, domSecurityPolicyAllowsImageFrom,
    domSecurityPolicyAllowsMediaFrom,
    domSecurityPolicyAllowsObjectFrom,
    domSecurityPolicyAllowsPluginType,
    domSecurityPolicyAllowsScriptFrom,
    domSecurityPolicyAllowsStyleFrom, domSecurityPolicyAllowsEval,
    domSecurityPolicyAllowsInlineScript,
    domSecurityPolicyAllowsInlineStyle, domSecurityPolicyGetReportURIs,
    DOMSecurityPolicy, DOMSecurityPolicyClass, castToDOMSecurityPolicy,
    gTypeDOMSecurityPolicy, toDOMSecurityPolicy
#endif
) where

import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM

#if WEBKIT_CHECK_VERSION(1,10,0)
#if !WEBKIT_CHECK_VERSION(2,0,0)
domSecurityPolicyIsActive :: (DOMSecurityPolicyClass self) => self -> IO Bool
domSecurityPolicyIsActive self = toBool <$>
  ({# call webkit_dom_dom_security_policy_is_active #} (toDOMSecurityPolicy self))
#endif

domSecurityPolicyAllowsConnectionTo ::
                                    (DOMSecurityPolicyClass self, GlibString string) =>
                                      self -> string -> IO Bool
domSecurityPolicyAllowsConnectionTo self url
  = toBool <$>
      (withUTFString url $
         \ urlPtr ->
           {# call webkit_dom_dom_security_policy_allows_connection_to #}
             (toDOMSecurityPolicy self)
             urlPtr)

domSecurityPolicyAllowsFontFrom ::
                                (DOMSecurityPolicyClass self, GlibString string) =>
                                  self -> string -> IO Bool
domSecurityPolicyAllowsFontFrom self url
  = toBool <$>
      (withUTFString url $
         \ urlPtr ->
           {# call webkit_dom_dom_security_policy_allows_font_from #}
             (toDOMSecurityPolicy self)
             urlPtr)

domSecurityPolicyAllowsFormAction ::
                                  (DOMSecurityPolicyClass self, GlibString string) =>
                                    self -> string -> IO Bool
domSecurityPolicyAllowsFormAction self url
  = toBool <$>
      (withUTFString url $
         \ urlPtr ->
           {# call webkit_dom_dom_security_policy_allows_form_action #}
             (toDOMSecurityPolicy self)
             urlPtr)

domSecurityPolicyAllowsFrameFrom ::
                                 (DOMSecurityPolicyClass self, GlibString string) =>
                                   self -> string -> IO Bool
domSecurityPolicyAllowsFrameFrom self url
  = toBool <$>
      (withUTFString url $
         \ urlPtr ->
           {# call webkit_dom_dom_security_policy_allows_frame_from #}
             (toDOMSecurityPolicy self)
             urlPtr)

domSecurityPolicyAllowsImageFrom ::
                                 (DOMSecurityPolicyClass self, GlibString string) =>
                                   self -> string -> IO Bool
domSecurityPolicyAllowsImageFrom self url
  = toBool <$>
      (withUTFString url $
         \ urlPtr ->
           {# call webkit_dom_dom_security_policy_allows_image_from #}
             (toDOMSecurityPolicy self)
             urlPtr)

domSecurityPolicyAllowsMediaFrom ::
                                 (DOMSecurityPolicyClass self, GlibString string) =>
                                   self -> string -> IO Bool
domSecurityPolicyAllowsMediaFrom self url
  = toBool <$>
      (withUTFString url $
         \ urlPtr ->
           {# call webkit_dom_dom_security_policy_allows_media_from #}
             (toDOMSecurityPolicy self)
             urlPtr)

domSecurityPolicyAllowsObjectFrom ::
                                  (DOMSecurityPolicyClass self, GlibString string) =>
                                    self -> string -> IO Bool
domSecurityPolicyAllowsObjectFrom self url
  = toBool <$>
      (withUTFString url $
         \ urlPtr ->
           {# call webkit_dom_dom_security_policy_allows_object_from #}
             (toDOMSecurityPolicy self)
             urlPtr)

domSecurityPolicyAllowsPluginType ::
                                  (DOMSecurityPolicyClass self, GlibString string) =>
                                    self -> string -> IO Bool
domSecurityPolicyAllowsPluginType self type'
  = toBool <$>
      (withUTFString type' $
         \ typePtr ->
           {# call webkit_dom_dom_security_policy_allows_plugin_type #}
             (toDOMSecurityPolicy self)
             typePtr)

domSecurityPolicyAllowsScriptFrom ::
                                  (DOMSecurityPolicyClass self, GlibString string) =>
                                    self -> string -> IO Bool
domSecurityPolicyAllowsScriptFrom self url
  = toBool <$>
      (withUTFString url $
         \ urlPtr ->
           {# call webkit_dom_dom_security_policy_allows_script_from #}
             (toDOMSecurityPolicy self)
             urlPtr)

domSecurityPolicyAllowsStyleFrom ::
                                 (DOMSecurityPolicyClass self, GlibString string) =>
                                   self -> string -> IO Bool
domSecurityPolicyAllowsStyleFrom self url
  = toBool <$>
      (withUTFString url $
         \ urlPtr ->
           {# call webkit_dom_dom_security_policy_allows_style_from #}
             (toDOMSecurityPolicy self)
             urlPtr)


domSecurityPolicyAllowsEval :: (DOMSecurityPolicyClass self) => self -> IO Bool
domSecurityPolicyAllowsEval self = toBool <$>
#if WEBKIT_CHECK_VERSION(2,0,0)
    ({# call webkit_dom_dom_security_policy_get_allows_eval #}
#else
    ({# call webkit_dom_dom_security_policy_allows_eval #}
#endif
      (toDOMSecurityPolicy self))


domSecurityPolicyAllowsInlineScript :: (DOMSecurityPolicyClass self) => self -> IO Bool
domSecurityPolicyAllowsInlineScript self = toBool <$>
#if WEBKIT_CHECK_VERSION(2,0,0)
  ({# call webkit_dom_dom_security_policy_get_allows_inline_script #}
#else
  ({# call webkit_dom_dom_security_policy_allows_inline_script #}
#endif
    (toDOMSecurityPolicy self))


domSecurityPolicyAllowsInlineStyle :: (DOMSecurityPolicyClass self) => self -> IO Bool
domSecurityPolicyAllowsInlineStyle self = toBool <$>
#if WEBKIT_CHECK_VERSION(2,0,0)
  ({# call webkit_dom_dom_security_policy_get_allows_inline_style #}
#else
  ({# call webkit_dom_dom_security_policy_allows_inline_style #}
#endif
     (toDOMSecurityPolicy self))

domSecurityPolicyGetReportURIs ::
                               (DOMSecurityPolicyClass self) => self -> IO (Maybe DOMStringList)
domSecurityPolicyGetReportURIs self
  = maybeNull (makeNewGObject mkDOMStringList)
      ({# call webkit_dom_dom_security_policy_get_report_ur_is #}
         (toDOMSecurityPolicy self))
#endif
