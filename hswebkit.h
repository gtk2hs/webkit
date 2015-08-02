/*
 * Copyright (C) 2009 Cjacker Huang <jzhuang@redflag-linux.com>.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

#ifdef __BLOCKS__
#undef __BLOCKS__
#endif

#ifndef HS_WEBKIT_H
#define HS_WEBKIT_H
/* to avoid stdbool.h error in JavaScriptCore/JSBase.h*/
#define _Bool int

#define WINAPI
#define CALLBACK

/* include webkit headers*/
#include <webkit/webkit.h>
#include <webkit/webkitdom.h>
#endif

#include "events.h"

#undef Bool
#undef True
#undef False
#undef true
#undef false
#undef Button1 
#undef Button2
#undef Button3
#undef Button4
#undef Button5
#undef Button1Mask 
#undef Button2Mask
#undef Button3Mask
#undef Button4Mask
#undef Button5Mask

#undef ShiftMask
#undef LockMask
#undef ControlMask
#undef Mod1Mask
#undef Mod2Mask
#undef Mod3Mask
#undef Mod4Mask
#undef Mod5Mask

#undef None
#undef ParentRelative
#undef CopyFromParent
#undef PointerWindow
#undef InputFocus
#undef PointerRoot
#undef AnyPropertyType
#undef AnyKey
#undef AnyButton
#undef AllTemporary
#undef CurrentTime
#undef NoSymbol

#undef NoEventMask
#undef KeyPressMask
#undef KeyReleaseMask
#undef ButtonPressMask
#undef ButtonReleaseMask
#undef EnterWindowMask
#undef LeaveWindowMask
#undef PointerMotionMask
#undef PointerMotionHintMask
#undef Button1MotionMask
#undef Button2MotionMask
#undef Button3MotionMask
#undef Button4MotionMask
#undef Button5MotionMask
#undef ButtonMotionMask
#undef KeymapStateMask
#undef ExposureMask
#undef VisibilityChangeMask
#undef StructureNotifyMask
#undef ResizeRedirectMask
#undef SubstructureNotifyMask
#undef SubstructureRedirectMask
#undef FocusChangeMask
#undef PropertyChangeMask
#undef ColormapChangeMask
#undef OwnerGrabButtonMask
#undef Status
#undef Expose
#undef Below
#undef GrabSuccess
#undef GrabAlreadyGrabbed
#undef GrabInvalidTime
#undef GrabNotViewable
#undef GrabFrozen
#undef OwnerChangeNewOwner
#undef OwnerChangeDestroy
#undef OwnerChangeClose
#undef NULL

#if !WEBKIT_CHECK_VERSION(2,4,0)
#define webkit_dom_event_target_add_event_listener_with_closure webkit_dom_event_target_add_event_listener_closure
#define webkit_dom_event_target_remove_event_listener_with_closure webkit_dom_event_target_remove_event_listener_closure
#endif

