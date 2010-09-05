{-# LANGUAGE CPP #-}
-- -*-haskell-*-
-----------------------------------------------------------------------------
--  Module      :  Graphics.UI.Gtk.WebKit.WebInspector
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
-- Access to the WebKit Inspector
-----------------------------------------------------------------------------

module Graphics.UI.Gtk.WebKit.WebInspector (
-- * Description
-- | The WebKit Inspector is a graphical tool to inspect and change the content of a WebKitWebView. It
-- also includes an interactive JavaScriptDebugger. Using this class one can get a 'Widget' which can
-- be embedded into an application to show the inspector.
-- 
-- The inspector is available when the WebKitWebSettings of the WebKitWebView has set the
-- 'enableDeveloperExtras' to true otherwise no inspector is available.

-- * Types
  WebInspector,
  WebInspectorClass,

-- * Methods
  webInspectorGetInspectedUri,
  webInspectorGetWebView,
#if WEBKIT_CHECK_VERSION (1,1,17)
  webInspectorInspectCoordinates,
  webInspectorShow,
  webInspectorClose,
#endif

-- * Attribute  
  webInspectorInspectedUri,
  webInspectorJSProfilingEnable,
#if WEBKIT_CHECK_VERSION (1,1,17)
  webInspectorTimelineProfilingEnabled,
#endif
  webInspectorWebView,

-- * Signals
  attachWindow,
  detachWindow,
  closeWindow,
  showWindow,
  finished,
  inspectWebView,
) where

import Control.Monad		(liftM)

import System.Glib.FFI
import System.Glib.UTFString
import System.Glib.GList
import System.Glib.GError 
import System.Glib.Attributes
import System.Glib.Properties
import Graphics.UI.Gtk.Gdk.Events

{#import Graphics.UI.Gtk.Abstract.Object#}	(makeNewObject)
{#import Graphics.UI.Gtk.WebKit.Types#}
{#import Graphics.UI.Gtk.WebKit.Internal#}
{#import Graphics.UI.Gtk.WebKit.Signals#}
{#import System.Glib.GObject#}

{#context lib="webkit" prefix ="webkit"#}


------------------
-- |  Obtains the URI that is currently being inspected
webInspectorGetInspectedUri :: 
    WebInspectorClass self => self
 -> IO String
webInspectorGetInspectedUri inspector = 
    {#call web_inspector_get_inspected_uri#} (toWebInspector inspector) >>= peekCString

-- | Obtains the 'WebView' that is used to render the 'WebInspector'. 
-- 
-- The 'WebView' instance is created by the application,
-- by handling the "inspect-web-view" signal. 
-- This means that it may return @Nothing@ if the user hasn't inspected anything
webInspectorGetWebView :: 
    WebInspectorClass self => self
 -> IO (Maybe WebView)
webInspectorGetWebView inspector =
    maybeNull (makeNewObject mkWebView) $ liftM castPtr $
      {#call web_inspector_get_web_view#}
        (toWebInspector inspector)

#if WEBKIT_CHECK_VERSION (1,1,17)
-- | Causes the Web Inspector to inspect the node that is located at the given coordinates of the
-- widget. The coordinates should be relative to the WebKitWebView widget, not to the scrollable
-- content, and may be obtained from a 'Event' directly.
-- 
-- This means x, and y being zero doesn't guarantee you will hit the left-most top corner of the
-- content, since the contents may have been scrolled.
-- 
-- * Since 1.1.17
webInspectorInspectCoordinates :: WebInspectorClass self
  => self  -- ^ @webInspector@ the WebKitWebInspector that will do the inspection 
  -> Int  -- ^ @x@             the X coordinate of the node to be inspected       
  -> Int  -- ^ @y@             the Y coordinate of the node to be inspected       
  -> IO ()
webInspectorInspectCoordinates inspect x y =
  {#call web_inspector_inspect_coordinates#}
    (toWebInspector inspect)
    (fromIntegral x)
    (fromIntegral y)

-- | Causes the Web Inspector to be shown.
--
-- * Since 1.1.17
webInspectorShow :: WebInspectorClass self => self -> IO ()
webInspectorShow inspect =
  {#call webkit_web_inspector_show#} (toWebInspector inspect)

-- | Causes the Web Inspector to be closed.
--
-- * Since 1.1.17
webInspectorClose :: WebInspectorClass self => self -> IO ()
webInspectorClose inspect =
  {#call webkit_web_inspector_close#} (toWebInspector inspect)
#endif

-- * Attribute

-- | The URI that is currently being inspected.
webInspectorInspectedUri :: (WebInspectorClass self) => ReadAttr self String
webInspectorInspectedUri = readAttr webInspectorGetInspectedUri

-- | This is enabling JavaScript profiling in the Inspector. This means that Console.profiles will return the profiles.
webInspectorJSProfilingEnable :: (WebInspectorClass self) => Attr self Bool
webInspectorJSProfilingEnable = newAttrFromBoolProperty "javascript-profiling-enabled"

#if WEBKIT_CHECK_VERSION (1,1,17)
-- | This is enabling Timeline profiling in the Inspector.
-- 
-- Default value: 'False'
-- 
-- * Since 1.1.17
webInspectorTimelineProfilingEnabled :: (WebInspectorClass self) => Attr self Bool
webInspectorTimelineProfilingEnabled = newAttrFromBoolProperty "timeline-profiling-enabled"
#endif

-- | The Web View that renders the Web Inspector itself.
webInspectorWebView :: (WebInspectorClass self) => ReadAttr self WebView
webInspectorWebView = 
  readAttrFromObjectProperty "web-view"
  {#call pure webkit_web_view_get_type#}

-- * Signals

-- | Emitted when the inspector should appear in a separate window
--
-- return True if the signal is handled
attachWindow :: WebInspectorClass self => Signal self (IO Bool)
attachWindow = Signal (connect_NONE__BOOL "attach-window")

-- | Emitted when the inspector should appear in a separate window.
--
-- return True if the signal has been handled                  
detachWindow :: WebInspectorClass self => Signal self (IO Bool)
detachWindow = Signal (connect_NONE__BOOL "detach-window")

-- | Emitted when the inspector window should be closed. 
--
-- return True if the signal is handled.
closeWindow :: WebInspectorClass self => Signal self (IO Bool)
closeWindow = Signal (connect_NONE__BOOL "close-window")

-- | Emitted when the inspector window should be displayed. 
-- Notice that the window must have been created already by handling 'inspectWebView'.
--
-- return True if the signal has been handled                  
showWindow :: WebInspectorClass self => Signal self (IO Bool)
showWindow = Signal (connect_NONE__BOOL "show-window")

-- | Emitted when the inspection is done. You should release your references on the inspector at this time. 
-- The inspected 'WebView' may no longer exist when this signal is emitted.
finished :: WebInspectorClass self => Signal self (IO ())
finished = Signal (connect_NONE__NONE "finished")

-- | Emitted when the user activates the 'inspect' context menu item to inspect a web view. 
-- The application which is interested in the inspector should create a window, 
-- or otherwise add the 'WebView' it creates to an existing window.
--
-- You don't need to handle the reference count of the 'WebView' instance you create; 
-- the widget to which you add it will do that.
inspectWebView :: WebInspectorClass self => Signal self (WebView -> IO WebView)
inspectWebView = Signal (connect_OBJECT__OBJECTPTR "inspect-web-view")
