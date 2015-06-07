{-# LANGUAGE CPP #-}
-- -*-haskell-*-
-----------------------------------------------------------------------------
--  Module      :  Graphics.UI.Gtk.WebKit.WebSettings
--  Author      :  Cjacker Huang
--  Copyright   :  (c) 2009 Cjacker Huang <jzhuang@redflag-linux.com>
--
--  This library is free software; you can redistribute it and/or
--  modify it under the terms of the GNU Lesser General Public
--  License as published by the Free Software Foundation; either
--  version 2.1 of the License, or (at your option) any later version.
--
--  This library is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--  Lesser General Public License for more details.
--
-- |
-- Maintainer  : gtk2hs-users@lists.sourceforge.net
-- Stability   : provisional
-- Portability : portable (depends on GHC)
--
-- Control the behaviour of a 'WebView'
-----------------------------------------------------------------------------

module Graphics.UI.Gtk.WebKit.WebSettings (
-- * Desciption
-- | WebKitWebSettings can be applied to a WebKitWebView to control the to be used text encoding, color,
-- font sizes, printing mode, script support, loading of images and various other things.

-- * Types
  WebSettings,
  WebSettingsClass,
  EditingBehavior,

-- * Constructors
  webSettingsNew,

-- * Methods
  webSettingsCopy,
  webSettingsGetUserAgent,

-- * Attributes
-- ** Family
  webSettingsCursiveFontFamily,
  webSettingsDefaultFontFamily,
  webSettingsFantasyFontFamily,
  webSettingsMonospaceFontFamily,
  webSettingsSansFontFamily,
  webSettingsSerifFontFamily,
-- ** FontSize
  webSettingsDefaultFontSize,
  webSettingsDefaultMonospaceFontSize,
  webSettingsMinimumFontSize,
  webSettingsMinimumLogicalFontSize,
-- ** Image
  webSettingsAutoLoadImages,
  webSettingsAutoShrinkImages,
-- ** Encoding
  webSettingsDefaultEncoding,
-- ** Other
  webSettingsEditingBehavior,
  webSettingsEnableCaretBrowsing,
  webSettingsEnableDeveloperExtras,
  webSettingsEnableHtml5Database,
  webSettingsEnableHtml5LocalStorage,
  webSettingsEnableOfflineWebApplicationCache,
  webSettingsEnablePlugins,
  webSettingsEnablePrivateBrowsing,
  webSettingsEnableScripts,
  webSettingsEnableSpellChecking,
  webSettingsEnableUniversalAccessFromFileUris,
  webSettingsEnableXssAuditor,
  webSettingsEnableSiteSpecificQuirks,
#if WEBKIT_CHECK_VERSION (1,1,16)
  webSettingsEnableDomPaste,
#endif
#if WEBKIT_CHECK_VERSION (1,1,18)
  webSettingsEnableDefaultContextMenu,
  webSettingsEnablePageCache,
#endif
#if WEBKIT_CHECK_VERSION (1,1,23)
  webSettingsEnableSpatialNavigation,
#endif
  webSettingsEnforce96Dpi,
  webSettingsJSCanOpenWindowAuto,
  webSettingsPrintBackgrounds,
  webSettingsResizableTextAreas,
  webSettingsSpellCheckingLang,
#if WEBKIT_CHECK_VERSION (1,1,17)
  webSettingsTabKeyCyclesThroughElements,
#endif
  webSettingsUserAgent,
  webSettingsUserStylesheetUri,
  webSettingsZoomStep,
) where

import Control.Monad		(liftM)

import System.Glib.FFI
import System.Glib.UTFString
import System.Glib.GList
import System.Glib.GError
import System.Glib.Properties
import System.Glib.Attributes as G
import Graphics.UI.Gtk.Gdk.Events

{#import Graphics.UI.Gtk.Abstract.Object#}	(makeNewObject)
{#import Graphics.UI.Gtk.WebKit.Types#}
{#import System.Glib.GObject#}

{#context lib="webkit" prefix ="webkit"#}

{#enum EditingBehavior {underscoreToCase}#}
------------------
-- Constructors


-- | Create a new 'WebSettings' instance.
--
-- A 'WebSettings' can be applied to a 'WebView'
-- to control the to be used text encoding, color, font size,
-- printing mode,script support, loading of images and various other things.
webSettingsNew :: IO WebSettings
webSettingsNew =
    wrapNewGObject mkWebSettings $ {#call web_settings_new#}


-- | Copy an existing 'WebSettings' instance.
webSettingsCopy ::
    WebSettingsClass self => self
 -> IO WebSettings
webSettingsCopy websettings =
    constructNewGObject mkWebSettings $ {#call web_settings_copy#} (toWebSettings websettings)

-- | Return the User-Agent string currently used.
webSettingsGetUserAgent ::
    (WebSettingsClass self, GlibString string) => self
 -> IO (Maybe string) -- ^ User-Agent string or @Nothing@ in case failed.
webSettingsGetUserAgent websettings =
    {#call web_settings_get_user_agent#} (toWebSettings websettings) >>= maybePeek peekUTFString

-- | Load images automatically
--
-- Default value: True
webSettingsAutoLoadImages :: (WebSettingsClass self) => G.Attr self Bool
webSettingsAutoLoadImages = newAttrFromBoolProperty "auto-load-images"

-- | Automatically shrink standalone images to fit
--
-- Default value: True
webSettingsAutoShrinkImages :: (WebSettingsClass self) => G.Attr self Bool
webSettingsAutoShrinkImages = newAttrFromBoolProperty "auto-shrink-images"

-- | The default Cursive font family used to display text
--
-- Default value "serif"
webSettingsCursiveFontFamily :: (WebSettingsClass self, GlibString string) => G.Attr self string
webSettingsCursiveFontFamily = newAttrFromStringProperty "cursive-font-family"

-- | The default encoding used to display text
--
-- Default value "iso-8859-1"

webSettingsDefaultEncoding :: (WebSettingsClass self, GlibString string) => G.Attr self string
webSettingsDefaultEncoding = newAttrFromStringProperty "default-encoding"

-- | The default font family used to display text
--
-- Default value: "sans-serif"

webSettingsDefaultFontFamily :: (WebSettingsClass self, GlibString string) => G.Attr self string
webSettingsDefaultFontFamily = newAttrFromStringProperty "default-font-family"

-- | The default font size used to display text
--
-- Default value: >=5

webSettingsDefaultFontSize :: (WebSettingsClass self) => G.Attr self Int
webSettingsDefaultFontSize = newAttrFromIntProperty "default-font-size"

-- | The default font size used to display monospace text
--
-- Allowed values: >= 5
--
-- Default value: 10

webSettingsDefaultMonospaceFontSize :: (WebSettingsClass self) => G.Attr self Int
webSettingsDefaultMonospaceFontSize = newAttrFromIntProperty "default-monospace-font-size"

-- | This settings controls various editing behaviors
webSettingsEditingBehavior :: (WebSettingsClass self) => G.Attr self EditingBehavior
webSettingsEditingBehavior = newAttrFromEnumProperty "editing-behavior"
        {#call pure unsafe webkit_editing_behavior_get_type#}
-- | Whether to enable caret browsing mode.
webSettingsEnableCaretBrowsing :: (WebSettingsClass self) => G.Attr self Bool
webSettingsEnableCaretBrowsing = newAttrFromBoolProperty "enable-caret-browsing"

-- | Whether developer extensions should be enabled.
--
-- This enables, for now, the 'WebInspector'
webSettingsEnableDeveloperExtras :: (WebSettingsClass self) => G.Attr self Bool
webSettingsEnableDeveloperExtras = newAttrFromBoolProperty "enable-developer-extras"

#if WEBKIT_CHECK_VERSION (1,1,16)
-- | Whether to enable DOM paste. If set to 'True', document.execCommand("Paste") will correctly execute
-- and paste content of the clipboard.
--
-- Default value: 'False'
--
-- * Since 1.1.16
webSettingsEnableDomPaste :: (WebSettingsClass self) => G.Attr self Bool
webSettingsEnableDomPaste = newAttrFromBoolProperty "enable-dom-paste"
#endif

-- | Whether to enable HTML5 client-side SQL database support.
webSettingsEnableHtml5Database :: (WebSettingsClass self) => G.Attr self Bool
webSettingsEnableHtml5Database = newAttrFromBoolProperty "enable-html5-database"

-- | Whether to enable HTML5 localStorage support.
webSettingsEnableHtml5LocalStorage :: (WebSettingsClass self) => G.Attr self Bool
webSettingsEnableHtml5LocalStorage = newAttrFromBoolProperty "enable-html5-local-storage"

-- | Whether to enable HTML5 offline web application cache support.
webSettingsEnableOfflineWebApplicationCache :: (WebSettingsClass self) => G.Attr self Bool
webSettingsEnableOfflineWebApplicationCache = newAttrFromBoolProperty "enable-offline-web-application-cache"

-- | Enable embedded plugin objects.
webSettingsEnablePlugins :: (WebSettingsClass self) => G.Attr self Bool
webSettingsEnablePlugins = newAttrFromBoolProperty "enable-plugins"

-- | Whether to enable private browsing mode.
webSettingsEnablePrivateBrowsing :: (WebSettingsClass self) => G.Attr self Bool
webSettingsEnablePrivateBrowsing = newAttrFromBoolProperty "enable-private-browsing"

-- | Enable embedded scripting languages
webSettingsEnableScripts :: (WebSettingsClass self) => G.Attr self Bool
webSettingsEnableScripts = newAttrFromBoolProperty "enable-scripts"

-- | Whether to enable speel checking while typing.
webSettingsEnableSpellChecking :: (WebSettingsClass self) => G.Attr self Bool
webSettingsEnableSpellChecking = newAttrFromBoolProperty "enable-spell-checking"

-- | Whether to allow files loaded through file:// URLs universal access to all pages.
webSettingsEnableUniversalAccessFromFileUris :: (WebSettingsClass self) => G.Attr self Bool
webSettingsEnableUniversalAccessFromFileUris = newAttrFromBoolProperty "enable-universal-access-from-file-uris"

-- | Whether to enable the XSS Auditor.
--
-- This feature filters some kinds of reflective XSS attacks on vulnerable web sites.
webSettingsEnableXssAuditor :: (WebSettingsClass self) => G.Attr self Bool
webSettingsEnableXssAuditor = newAttrFromBoolProperty "enable-xss-auditor"

-- | Enforce a resolution of 96 DPI.
webSettingsEnforce96Dpi :: (WebSettingsClass self) => G.Attr self Bool
webSettingsEnforce96Dpi = newAttrFromBoolProperty "enforce-96-dpi"

-- | The default Fantasy font family used to display text
webSettingsFantasyFontFamily :: (WebSettingsClass self, GlibString string) => G.Attr self string
webSettingsFantasyFontFamily = newAttrFromStringProperty "fantasy-font-family"

-- | Whether JavaScript can open popup windows automatically without user intervention.
webSettingsJSCanOpenWindowAuto :: (WebSettingsClass self) => G.Attr self Bool
webSettingsJSCanOpenWindowAuto = newAttrFromBoolProperty "javascript-can-open-windows-automatically"

-- | The minimum font size used to display text.
--
-- Allowed values: >=1
--
-- Default value: 5
webSettingsMinimumFontSize :: (WebSettingsClass self) => G.Attr self Int
webSettingsMinimumFontSize = newAttrFromIntProperty "minimum-font-size"

-- | The minimum logical font size used to display text
--
-- Allowed values: >=1
--
-- Default value: 5
webSettingsMinimumLogicalFontSize :: (WebSettingsClass self) => G.Attr self Int
webSettingsMinimumLogicalFontSize = newAttrFromIntProperty "minimum-logical-font-size"


-- | The default font family used to display monospace text.
--
-- Default value: "monospace"
webSettingsMonospaceFontFamily :: (WebSettingsClass self, GlibString string) => G.Attr self string
webSettingsMonospaceFontFamily = newAttrFromStringProperty "monospace-font-family"

-- | Whether background images should be printed
--
-- Default value: True
webSettingsPrintBackgrounds :: (WebSettingsClass self) => G.Attr self Bool
webSettingsPrintBackgrounds = newAttrFromBoolProperty "print-backgrounds"

-- | Whether text areas are resizable
--
-- Default value : True
webSettingsResizableTextAreas :: (WebSettingsClass self) => G.Attr self Bool
webSettingsResizableTextAreas =  newAttrFromBoolProperty "resizable-text-areas"

-- | The default Sans Serif font family used to display text
--
-- Default value "sans-serif"
webSettingsSansFontFamily :: (WebSettingsClass self, GlibString string) => G.Attr self string
webSettingsSansFontFamily = newAttrFromStringProperty "sans-serif-font-family"


-- | The default Serif font family used to display text
--
-- Default value: "serif"
webSettingsSerifFontFamily :: (WebSettingsClass self, GlibString string) => G.Attr self string
webSettingsSerifFontFamily = newAttrFromStringProperty "serif-font-family"


-- | The languages to be used for spell checking, separated by commas
--
-- The locale string typically is in the form lang_COUNTRY,
-- where lang is an ISO-639 language code, and COUNTRY is an ISO-3166 country code.
-- For instance, sv_FI for Swedish as written in Finland or pt_BR for Portuguese as written in Brazil.
--
-- If no value is specified then the value returned by gtk_get_default_language will be used.
--
-- Default value: @Nothing@
webSettingsSpellCheckingLang :: (WebSettingsClass self, GlibString string) => G.Attr self (Maybe string)
webSettingsSpellCheckingLang = newAttrFromMaybeStringProperty "spell-checking-languages"

#if WEBKIT_CHECK_VERSION (1,1,17)
-- | Whether the tab key cycles through elements on the page.
--
-- If flag is 'True', pressing the tab key will focus the next element in the @webView@. If flag is 'False',
-- the @webView@ will interpret tab key presses as normal key presses. If the selected element is
-- editable, the tab key will cause the insertion of a tab character.
--
-- Default value: 'True'
--
-- * Since 1.1.17
webSettingsTabKeyCyclesThroughElements :: (WebSettingsClass self) => G.Attr self Bool
webSettingsTabKeyCyclesThroughElements = newAttrFromBoolProperty "tab-key-cycles-through-elements"
#endif

#if WEBKIT_CHECK_VERSION (1,1,18)
-- | Whether right-clicks should be handled automatically to create, and display the context
-- menu. Turning this off will make WebKitGTK+ not emit the populate-popup signal. Notice that the
-- default button press event handler may still handle right clicks for other reasons, such as in-page
-- context menus, or right-clicks that are handled by the page itself.
--
-- Default value: 'True'
--
-- * Since 1.1.18
webSettingsEnableDefaultContextMenu :: (WebSettingsClass self) => G.Attr self Bool
webSettingsEnableDefaultContextMenu = newAttrFromBoolProperty "enable-default-context-menu"

-- | Enable or disable the page cache. Disabling the page cache is generally only useful for special
-- circumstances like low-memory scenarios or special purpose applications like static HTML
-- viewers. This setting only controls the Page Cache, this cache is different than the disk-based or
-- memory-based traditional resource caches, its point is to make going back and forth between pages
-- much faster. For details about the different types of caches and their purposes see:
-- http://webkit.org/ blog/427/webkit-page-cache-i-the-basics/
--
-- Default value: 'False'
--
-- * Since 1.1.18
webSettingsEnablePageCache :: (WebSettingsClass self) => G.Attr self Bool
webSettingsEnablePageCache = newAttrFromBoolProperty "enable-page-cache"
#endif

-- | The User-Agent string used by WebKit
--
-- This will return a default User-Agent string if a custom string wasn't provided by the application.
-- Setting this property to a NULL value or an empty string will result in
-- the User-Agent string being reset to the default value.
--
-- Default value: \"Mozilla/5.0 (X11; U; Linux x86_64; c) AppleWebKit/531.2+ (KHTML, like Gecko) Safari/531.2+\"

webSettingsUserAgent :: (WebSettingsClass self, GlibString string) => G.Attr self string
webSettingsUserAgent = newAttrFromStringProperty "user-agent"

-- | The URI of a stylesheet that is applied to every page.
--
-- Default value: @Nothing@

webSettingsUserStylesheetUri :: (WebSettingsClass self, GlibString string) => G.Attr self (Maybe string)
webSettingsUserStylesheetUri = newAttrFromMaybeStringProperty "user-stylesheet-uri"

-- | The value by which the zoom level is changed when zooming in or out
--
-- Allowed values: >= 0
--
-- Default value: 0.1
webSettingsZoomStep :: (WebSettingsClass self) => G.Attr self Float
webSettingsZoomStep = newAttrFromFloatProperty "zoom-step"

-- | Enables the site-specific compatibility workarounds.
--
-- Default value: False
webSettingsEnableSiteSpecificQuirks :: WebSettingsClass self => G.Attr self Bool
webSettingsEnableSiteSpecificQuirks = newAttrFromBoolProperty "enable-site-specific-quirks"

#if WEBKIT_CHECK_VERSION (1,1,23)
-- | Whether to enable the Spatial Navigation. This feature consists in the ability to navigate between
-- focusable elements in a Web page, such as hyperlinks and form controls, by using Left, Right, Up and
-- Down arrow keys. For example, if an user presses the Right key, heuristics determine whether there
-- is an element he might be trying to reach towards the right, and if there are multiple elements,
-- which element he probably wants.
--
-- Default value: 'False'
--
-- * Since 1.1.23
webSettingsEnableSpatialNavigation :: WebSettingsClass self => G.Attr self Bool
webSettingsEnableSpatialNavigation = newAttrFromBoolProperty "enable-spatial-navigation"
#endif
