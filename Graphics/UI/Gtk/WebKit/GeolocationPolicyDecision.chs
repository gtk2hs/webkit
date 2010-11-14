{-# LANGUAGE CPP #-}
-- -*-haskell-*-
-----------------------------------------------------------------------------
--  Module      :  Graphics.UI.Gtk.WebKit.GeolocationPolicyDecision
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
-- Object used to communicate with the application when downloading 
-----------------------------------------------------------------------------

module Graphics.UI.Gtk.WebKit.GeolocationPolicyDecision (
#if WEBKIT_CHECK_VERSION (1,1,23)
-- * Description
-- | WebKitGeolocationPolicyDecision objects are given to the application when
-- geolocation-policy-decision-requested signal is emitted. The application uses it to tell the engine
-- whether it wants to allow or deny geolocation for a given frame.
  
-- * Types
   GeolocationPolicyDecision,
   GeolocationPolicyDecisionClass,
   
-- * Methods  
   geolocationPolicyAllow,
   geolocationPolicyDeny,
#endif
) where
import Control.Monad		(liftM)

import System.Glib.FFI
import System.Glib.UTFString
import System.Glib.GList
import System.Glib.Attributes
import System.Glib.Properties
import System.Glib.GError 
import Graphics.UI.Gtk.Gdk.Events

{#import Graphics.UI.Gtk.Abstract.Object#}	(makeNewObject)
{#import Graphics.UI.Gtk.WebKit.Types#}
{#import Graphics.UI.Gtk.WebKit.Signals#}
{#import Graphics.UI.Gtk.WebKit.Internal#}
{#import System.Glib.GObject#}
{#import Graphics.UI.Gtk.General.Selection#} ( TargetList )
{#import Graphics.UI.Gtk.MenuComboToolbar.Menu#}
{#import Graphics.UI.Gtk.General.Enums#}

{#context lib="webkit" prefix ="webkit"#}

#if WEBKIT_CHECK_VERSION (1,1,23)
-- | Will send the allow decision to the policy implementer.
--
-- * Since 1.1.23
geolocationPolicyAllow :: GeolocationPolicyDecisionClass decision => decision -> IO ()
geolocationPolicyAllow decision =
  {#call webkit_geolocation_policy_allow #} (toGeolocationPolicyDecision decision)

-- | Will send the deny decision to the policy implementer.
--
-- * Since 1.1.23
geolocationPolicyDeny :: GeolocationPolicyDecisionClass decision => decision -> IO ()
geolocationPolicyDeny decision =
  {#call webkit_geolocation_policy_deny #} (toGeolocationPolicyDecision decision)
#endif
