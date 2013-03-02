module Graphics.UI.Gtk.WebKit.DOM.DOMSecurityPolicy
       (
#if WEBKIT_CHECK_VERSION(1,10,0)
        domSecurityPolicyIsActive, domSecurityPolicyAllowsConnectionTo,
        domSecurityPolicyAllowsFontFrom, domSecurityPolicyAllowsFormAction,
        domSecurityPolicyAllowsFrameFrom, domSecurityPolicyAllowsImageFrom,
        domSecurityPolicyAllowsMediaFrom,
        domSecurityPolicyAllowsObjectFrom,
        domSecurityPolicyAllowsPluginType,
        domSecurityPolicyAllowsScriptFrom,
        domSecurityPolicyAllowsStyleFrom, domSecurityPolicyAllowsEval,
        domSecurityPolicyAllowsInlineScript,
        domSecurityPolicyAllowsInlineStyle, domSecurityPolicyGetReportURIs
#endif
        )
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
#if WEBKIT_CHECK_VERSION(1,10,0)
domSecurityPolicyIsActive ::
                          (DOMSecurityPolicyClass self) => self -> IO Bool
domSecurityPolicyIsActive self
  = toBool <$>
      ({# call webkit_dom_dom_security_policy_is_active #}
         (toDOMSecurityPolicy self))
 
domSecurityPolicyAllowsConnectionTo ::
                                    (DOMSecurityPolicyClass self) => self -> String -> IO Bool
domSecurityPolicyAllowsConnectionTo self url
  = toBool <$>
      (withUTFString url $
         \ urlPtr ->
           {# call webkit_dom_dom_security_policy_allows_connection_to #}
             (toDOMSecurityPolicy self)
             urlPtr)
 
domSecurityPolicyAllowsFontFrom ::
                                (DOMSecurityPolicyClass self) => self -> String -> IO Bool
domSecurityPolicyAllowsFontFrom self url
  = toBool <$>
      (withUTFString url $
         \ urlPtr ->
           {# call webkit_dom_dom_security_policy_allows_font_from #}
             (toDOMSecurityPolicy self)
             urlPtr)
 
domSecurityPolicyAllowsFormAction ::
                                  (DOMSecurityPolicyClass self) => self -> String -> IO Bool
domSecurityPolicyAllowsFormAction self url
  = toBool <$>
      (withUTFString url $
         \ urlPtr ->
           {# call webkit_dom_dom_security_policy_allows_form_action #}
             (toDOMSecurityPolicy self)
             urlPtr)
 
domSecurityPolicyAllowsFrameFrom ::
                                 (DOMSecurityPolicyClass self) => self -> String -> IO Bool
domSecurityPolicyAllowsFrameFrom self url
  = toBool <$>
      (withUTFString url $
         \ urlPtr ->
           {# call webkit_dom_dom_security_policy_allows_frame_from #}
             (toDOMSecurityPolicy self)
             urlPtr)
 
domSecurityPolicyAllowsImageFrom ::
                                 (DOMSecurityPolicyClass self) => self -> String -> IO Bool
domSecurityPolicyAllowsImageFrom self url
  = toBool <$>
      (withUTFString url $
         \ urlPtr ->
           {# call webkit_dom_dom_security_policy_allows_image_from #}
             (toDOMSecurityPolicy self)
             urlPtr)
 
domSecurityPolicyAllowsMediaFrom ::
                                 (DOMSecurityPolicyClass self) => self -> String -> IO Bool
domSecurityPolicyAllowsMediaFrom self url
  = toBool <$>
      (withUTFString url $
         \ urlPtr ->
           {# call webkit_dom_dom_security_policy_allows_media_from #}
             (toDOMSecurityPolicy self)
             urlPtr)
 
domSecurityPolicyAllowsObjectFrom ::
                                  (DOMSecurityPolicyClass self) => self -> String -> IO Bool
domSecurityPolicyAllowsObjectFrom self url
  = toBool <$>
      (withUTFString url $
         \ urlPtr ->
           {# call webkit_dom_dom_security_policy_allows_object_from #}
             (toDOMSecurityPolicy self)
             urlPtr)
 
domSecurityPolicyAllowsPluginType ::
                                  (DOMSecurityPolicyClass self) => self -> String -> IO Bool
domSecurityPolicyAllowsPluginType self type'
  = toBool <$>
      (withUTFString type' $
         \ typePtr ->
           {# call webkit_dom_dom_security_policy_allows_plugin_type #}
             (toDOMSecurityPolicy self)
             typePtr)
 
domSecurityPolicyAllowsScriptFrom ::
                                  (DOMSecurityPolicyClass self) => self -> String -> IO Bool
domSecurityPolicyAllowsScriptFrom self url
  = toBool <$>
      (withUTFString url $
         \ urlPtr ->
           {# call webkit_dom_dom_security_policy_allows_script_from #}
             (toDOMSecurityPolicy self)
             urlPtr)
 
domSecurityPolicyAllowsStyleFrom ::
                                 (DOMSecurityPolicyClass self) => self -> String -> IO Bool
domSecurityPolicyAllowsStyleFrom self url
  = toBool <$>
      (withUTFString url $
         \ urlPtr ->
           {# call webkit_dom_dom_security_policy_allows_style_from #}
             (toDOMSecurityPolicy self)
             urlPtr)
 
domSecurityPolicyAllowsEval ::
                            (DOMSecurityPolicyClass self) => self -> IO Bool
domSecurityPolicyAllowsEval self
  = toBool <$>
      ({# call webkit_dom_dom_security_policy_allows_eval #}
         (toDOMSecurityPolicy self))
 
domSecurityPolicyAllowsInlineScript ::
                                    (DOMSecurityPolicyClass self) => self -> IO Bool
domSecurityPolicyAllowsInlineScript self
  = toBool <$>
      ({# call webkit_dom_dom_security_policy_allows_inline_script #}
         (toDOMSecurityPolicy self))
 
domSecurityPolicyAllowsInlineStyle ::
                                   (DOMSecurityPolicyClass self) => self -> IO Bool
domSecurityPolicyAllowsInlineStyle self
  = toBool <$>
      ({# call webkit_dom_dom_security_policy_allows_inline_style #}
         (toDOMSecurityPolicy self))
 
domSecurityPolicyGetReportURIs ::
                               (DOMSecurityPolicyClass self) => self -> IO (Maybe DOMStringList)
domSecurityPolicyGetReportURIs self
  = maybeNull (makeNewGObject mkDOMStringList)
      ({# call webkit_dom_dom_security_policy_get_report_ur_is #}
         (toDOMSecurityPolicy self))
#endif
