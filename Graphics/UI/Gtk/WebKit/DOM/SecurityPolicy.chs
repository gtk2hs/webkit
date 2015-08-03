module Graphics.UI.Gtk.WebKit.DOM.SecurityPolicy(
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
SecurityPolicy,
castToSecurityPolicy,
gTypeSecurityPolicy,
SecurityPolicyClass,
toSecurityPolicy,
) where
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

 
allowsConnectionTo ::
                   (MonadIO m, SecurityPolicyClass self, GlibString string) =>
                     self -> string -> m Bool
allowsConnectionTo self url
  = liftIO
      (toBool <$>
         (withUTFString url $
            \ urlPtr ->
              {# call webkit_dom_dom_security_policy_allows_connection_to #}
                (toSecurityPolicy self)
                urlPtr))
 
allowsFontFrom ::
               (MonadIO m, SecurityPolicyClass self, GlibString string) =>
                 self -> string -> m Bool
allowsFontFrom self url
  = liftIO
      (toBool <$>
         (withUTFString url $
            \ urlPtr ->
              {# call webkit_dom_dom_security_policy_allows_font_from #}
                (toSecurityPolicy self)
                urlPtr))
 
allowsFormAction ::
                 (MonadIO m, SecurityPolicyClass self, GlibString string) =>
                   self -> string -> m Bool
allowsFormAction self url
  = liftIO
      (toBool <$>
         (withUTFString url $
            \ urlPtr ->
              {# call webkit_dom_dom_security_policy_allows_form_action #}
                (toSecurityPolicy self)
                urlPtr))
 
allowsFrameFrom ::
                (MonadIO m, SecurityPolicyClass self, GlibString string) =>
                  self -> string -> m Bool
allowsFrameFrom self url
  = liftIO
      (toBool <$>
         (withUTFString url $
            \ urlPtr ->
              {# call webkit_dom_dom_security_policy_allows_frame_from #}
                (toSecurityPolicy self)
                urlPtr))
 
allowsImageFrom ::
                (MonadIO m, SecurityPolicyClass self, GlibString string) =>
                  self -> string -> m Bool
allowsImageFrom self url
  = liftIO
      (toBool <$>
         (withUTFString url $
            \ urlPtr ->
              {# call webkit_dom_dom_security_policy_allows_image_from #}
                (toSecurityPolicy self)
                urlPtr))
 
allowsMediaFrom ::
                (MonadIO m, SecurityPolicyClass self, GlibString string) =>
                  self -> string -> m Bool
allowsMediaFrom self url
  = liftIO
      (toBool <$>
         (withUTFString url $
            \ urlPtr ->
              {# call webkit_dom_dom_security_policy_allows_media_from #}
                (toSecurityPolicy self)
                urlPtr))
 
allowsObjectFrom ::
                 (MonadIO m, SecurityPolicyClass self, GlibString string) =>
                   self -> string -> m Bool
allowsObjectFrom self url
  = liftIO
      (toBool <$>
         (withUTFString url $
            \ urlPtr ->
              {# call webkit_dom_dom_security_policy_allows_object_from #}
                (toSecurityPolicy self)
                urlPtr))
 
allowsPluginType ::
                 (MonadIO m, SecurityPolicyClass self, GlibString string) =>
                   self -> string -> m Bool
allowsPluginType self type'
  = liftIO
      (toBool <$>
         (withUTFString type' $
            \ typePtr ->
              {# call webkit_dom_dom_security_policy_allows_plugin_type #}
                (toSecurityPolicy self)
                typePtr))
 
allowsScriptFrom ::
                 (MonadIO m, SecurityPolicyClass self, GlibString string) =>
                   self -> string -> m Bool
allowsScriptFrom self url
  = liftIO
      (toBool <$>
         (withUTFString url $
            \ urlPtr ->
              {# call webkit_dom_dom_security_policy_allows_script_from #}
                (toSecurityPolicy self)
                urlPtr))
 
allowsStyleFrom ::
                (MonadIO m, SecurityPolicyClass self, GlibString string) =>
                  self -> string -> m Bool
allowsStyleFrom self url
  = liftIO
      (toBool <$>
         (withUTFString url $
            \ urlPtr ->
              {# call webkit_dom_dom_security_policy_allows_style_from #}
                (toSecurityPolicy self)
                urlPtr))
 
getAllowsEval ::
              (MonadIO m, SecurityPolicyClass self) => self -> m Bool
getAllowsEval self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_dom_security_policy_get_allows_eval #}
            (toSecurityPolicy self)))
 
getAllowsInlineScript ::
                      (MonadIO m, SecurityPolicyClass self) => self -> m Bool
getAllowsInlineScript self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_dom_security_policy_get_allows_inline_script #}
            (toSecurityPolicy self)))
 
getAllowsInlineStyle ::
                     (MonadIO m, SecurityPolicyClass self) => self -> m Bool
getAllowsInlineStyle self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_dom_security_policy_get_allows_inline_style #}
            (toSecurityPolicy self)))
 
getIsActive ::
            (MonadIO m, SecurityPolicyClass self) => self -> m Bool
getIsActive self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_dom_security_policy_get_is_active #}
            (toSecurityPolicy self)))
 
getReportURIs ::
              (MonadIO m, SecurityPolicyClass self) =>
                self -> m (Maybe DOMStringList)
getReportURIs self
  = liftIO
      (maybeNull (makeNewGObject mkDOMStringList)
         ({# call webkit_dom_dom_security_policy_get_report_ur_is #}
            (toSecurityPolicy self)))
