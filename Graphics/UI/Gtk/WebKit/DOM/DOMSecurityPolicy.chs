module Graphics.UI.Gtk.WebKit.DOM.DOMSecurityPolicy(
allowsConnectionTo,
allowsFontFrom,
allowsFormAction,
allowsFrameFrom,
allowsImageFrom,
allowsMediaFrom,
allowsObjectFrom,
allowsPluginType,
allowsScriptFrom,
allowsStyleFrom,
getAllowsEval,
getAllowsInlineScript,
getAllowsInlineStyle,
getIsActive,
getReportURIs,
DOMSecurityPolicy,
castToDOMSecurityPolicy,
gTypeDOMSecurityPolicy,
DOMSecurityPolicyClass,
toDOMSecurityPolicy,
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

 
allowsConnectionTo ::
                   (MonadIO m, DOMSecurityPolicyClass self, GlibString string) =>
                     self -> string -> m Bool
allowsConnectionTo self url
  = liftIO
      (toBool <$>
         (withUTFString url $
            \ urlPtr ->
              {# call webkit_dom_dom_security_policy_allows_connection_to #}
                (toDOMSecurityPolicy self)
                urlPtr))
 
allowsFontFrom ::
               (MonadIO m, DOMSecurityPolicyClass self, GlibString string) =>
                 self -> string -> m Bool
allowsFontFrom self url
  = liftIO
      (toBool <$>
         (withUTFString url $
            \ urlPtr ->
              {# call webkit_dom_dom_security_policy_allows_font_from #}
                (toDOMSecurityPolicy self)
                urlPtr))
 
allowsFormAction ::
                 (MonadIO m, DOMSecurityPolicyClass self, GlibString string) =>
                   self -> string -> m Bool
allowsFormAction self url
  = liftIO
      (toBool <$>
         (withUTFString url $
            \ urlPtr ->
              {# call webkit_dom_dom_security_policy_allows_form_action #}
                (toDOMSecurityPolicy self)
                urlPtr))
 
allowsFrameFrom ::
                (MonadIO m, DOMSecurityPolicyClass self, GlibString string) =>
                  self -> string -> m Bool
allowsFrameFrom self url
  = liftIO
      (toBool <$>
         (withUTFString url $
            \ urlPtr ->
              {# call webkit_dom_dom_security_policy_allows_frame_from #}
                (toDOMSecurityPolicy self)
                urlPtr))
 
allowsImageFrom ::
                (MonadIO m, DOMSecurityPolicyClass self, GlibString string) =>
                  self -> string -> m Bool
allowsImageFrom self url
  = liftIO
      (toBool <$>
         (withUTFString url $
            \ urlPtr ->
              {# call webkit_dom_dom_security_policy_allows_image_from #}
                (toDOMSecurityPolicy self)
                urlPtr))
 
allowsMediaFrom ::
                (MonadIO m, DOMSecurityPolicyClass self, GlibString string) =>
                  self -> string -> m Bool
allowsMediaFrom self url
  = liftIO
      (toBool <$>
         (withUTFString url $
            \ urlPtr ->
              {# call webkit_dom_dom_security_policy_allows_media_from #}
                (toDOMSecurityPolicy self)
                urlPtr))
 
allowsObjectFrom ::
                 (MonadIO m, DOMSecurityPolicyClass self, GlibString string) =>
                   self -> string -> m Bool
allowsObjectFrom self url
  = liftIO
      (toBool <$>
         (withUTFString url $
            \ urlPtr ->
              {# call webkit_dom_dom_security_policy_allows_object_from #}
                (toDOMSecurityPolicy self)
                urlPtr))
 
allowsPluginType ::
                 (MonadIO m, DOMSecurityPolicyClass self, GlibString string) =>
                   self -> string -> m Bool
allowsPluginType self type'
  = liftIO
      (toBool <$>
         (withUTFString type' $
            \ typePtr ->
              {# call webkit_dom_dom_security_policy_allows_plugin_type #}
                (toDOMSecurityPolicy self)
                typePtr))
 
allowsScriptFrom ::
                 (MonadIO m, DOMSecurityPolicyClass self, GlibString string) =>
                   self -> string -> m Bool
allowsScriptFrom self url
  = liftIO
      (toBool <$>
         (withUTFString url $
            \ urlPtr ->
              {# call webkit_dom_dom_security_policy_allows_script_from #}
                (toDOMSecurityPolicy self)
                urlPtr))
 
allowsStyleFrom ::
                (MonadIO m, DOMSecurityPolicyClass self, GlibString string) =>
                  self -> string -> m Bool
allowsStyleFrom self url
  = liftIO
      (toBool <$>
         (withUTFString url $
            \ urlPtr ->
              {# call webkit_dom_dom_security_policy_allows_style_from #}
                (toDOMSecurityPolicy self)
                urlPtr))
 
getAllowsEval ::
              (MonadIO m, DOMSecurityPolicyClass self) => self -> m Bool
getAllowsEval self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_dom_security_policy_get_allows_eval #}
            (toDOMSecurityPolicy self)))
 
getAllowsInlineScript ::
                      (MonadIO m, DOMSecurityPolicyClass self) => self -> m Bool
getAllowsInlineScript self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_dom_security_policy_get_allows_inline_script #}
            (toDOMSecurityPolicy self)))
 
getAllowsInlineStyle ::
                     (MonadIO m, DOMSecurityPolicyClass self) => self -> m Bool
getAllowsInlineStyle self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_dom_security_policy_get_allows_inline_style #}
            (toDOMSecurityPolicy self)))
 
getIsActive ::
            (MonadIO m, DOMSecurityPolicyClass self) => self -> m Bool
getIsActive self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_dom_security_policy_get_is_active #}
            (toDOMSecurityPolicy self)))
 
getReportURIs ::
              (MonadIO m, DOMSecurityPolicyClass self) =>
                self -> m (Maybe DOMStringList)
getReportURIs self
  = liftIO
      (maybeNull (makeNewGObject mkDOMStringList)
         ({# call webkit_dom_dom_security_policy_get_report_ur_is #}
            (toDOMSecurityPolicy self)))
