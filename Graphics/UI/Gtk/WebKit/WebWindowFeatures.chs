{-# LANGUAGE CPP #-}
-- -*-haskell-*-
-----------------------------------------------------------------------------
--  Module      :  Graphics.UI.Gtk.WebKit.WebWindowFeatures
--  Author      :  Andy Stewart
--  Copyright   :  (c) 2010 Andy Stewart <lazycat.manatee@gmail.com>
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
-- Access to the WebKit Web WindowFeatures
-----------------------------------------------------------------------------

module Graphics.UI.Gtk.WebKit.WebWindowFeatures (
-- * Description
-- | The content of a WebKitWebView can request to change certain properties of a WebKitWebView. This can
-- include the x, y position of the window, the width and height but also if a toolbar, scrollbar,
-- statusbar, locationbar should be visible to the user, the request to show the WebKitWebView
-- fullscreen.
--
-- In the normal case one will use 'webViewGetWindowFeatures' to get the
-- WebKitWebWindowFeatures and then monitor the property changes. Be aware that the
-- WebKitWebWindowFeatures might change change before 'webViewReady' signal is emitted. To be safe
-- listen to the 'windowFeatures' signal of the WebKitWebView and reconnect the signals whenever
-- the WebKitWebWindowFeatures of a WebKitWebView changes.

-- * Types
  WebWindowFeatures,
  WebWindowFeaturesClass,

-- * Constructors
  webWindowFeaturesNew,

-- * Methods
  webWindowFeaturesEqual,

-- * Attributes
  webWindowFeaturesFullscreen,
  webWindowFeaturesHeight,
  webWindowFeaturesWidth,
  webWindowFeaturesX,
  webWindowFeaturesY,
  webWindowFeaturesLocationbarVisible,
  webWindowFeaturesMenubarVisible,
  webWindowFeaturesScrollbarVisible,
  webWindowFeaturesStatusbarVisible,
  webWindowFeaturesToolbarVisible,
) where

import Control.Monad		(liftM)

import System.Glib.FFI
import System.Glib.UTFString
import System.Glib.GList
import System.Glib.GError
import System.Glib.Attributes as G
import System.Glib.Properties
import Graphics.UI.Gtk.Gdk.Events

{#import Graphics.UI.Gtk.Abstract.Object#}	(makeNewObject)
{#import Graphics.UI.Gtk.WebKit.Types#}
{#import System.Glib.GObject#}

{#context lib="webkit" prefix ="webkit"#}

-- * Constructors

-- | Creates a new 'WebWindowFeatures' instance with default values.
-- It must be manually attached to a WebView.
webWindowFeaturesNew :: IO WebWindowFeatures
webWindowFeaturesNew =
    wrapNewGObject mkWebWindowFeatures $ {#call web_window_features_new#}

-- | Decides if a 'WebWindowFeatures' instance equals another, as in has the same values.
webWindowFeaturesEqual ::
   (WebWindowFeaturesClass winA, WebWindowFeaturesClass winB) => winA -> winB
 -> IO Bool
webWindowFeaturesEqual winA winB =
    liftM toBool $ {#call web_window_features_equal#} (toWebWindowFeatures winA) (toWebWindowFeatures winB)

-- * Attributes

-- | Controls whether window will be displayed fullscreen.
webWindowFeaturesFullscreen :: WebWindowFeaturesClass self => G.Attr self Bool
webWindowFeaturesFullscreen = newAttrFromBoolProperty "fullscreen"

-- | The height of the window on the screen.
webWindowFeaturesHeight :: WebWindowFeaturesClass self => G.Attr self Int
webWindowFeaturesHeight = newAttrFromIntProperty "height"

-- | The width of the window on the screen.
webWindowFeaturesWidth :: WebWindowFeaturesClass self => G.Attr self Int
webWindowFeaturesWidth = newAttrFromIntProperty "width"

-- | Controls whether the locationbar should be visible for the window.
webWindowFeaturesLocationbarVisible :: WebWindowFeaturesClass self => G.Attr self Bool
webWindowFeaturesLocationbarVisible = newAttrFromBoolProperty "locationbar-visible"

-- | Controls whether the menubar should be visible for the window.
webWindowFeaturesMenubarVisible :: WebWindowFeaturesClass self => G.Attr self Bool
webWindowFeaturesMenubarVisible = newAttrFromBoolProperty "menubar-visible"

-- | Controls whether the scrollbar should be visible for the window.
webWindowFeaturesScrollbarVisible :: WebWindowFeaturesClass self => G.Attr self Bool
webWindowFeaturesScrollbarVisible = newAttrFromBoolProperty "scrollbar-visible"

-- | Controls whether the statusbar should be visible for the window.
webWindowFeaturesStatusbarVisible :: WebWindowFeaturesClass self => G.Attr self Bool
webWindowFeaturesStatusbarVisible = newAttrFromBoolProperty "statusbar-visible"

-- | Controls whether the toolbar should be visible for the window.
webWindowFeaturesToolbarVisible :: WebWindowFeaturesClass self => G.Attr self Bool
webWindowFeaturesToolbarVisible = newAttrFromBoolProperty "toolbar-visible"

-- | The starting x position of the window on the screen.
webWindowFeaturesX :: WebWindowFeaturesClass self => G.Attr self Int
webWindowFeaturesX = newAttrFromIntProperty "x"

-- | The starting y position of the window on the screen.
webWindowFeaturesY :: WebWindowFeaturesClass self => G.Attr self Int
webWindowFeaturesY = newAttrFromIntProperty "y"

