#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#

# /* @(#)US_UNIX5_Hobo.kt	35.1 09/01/94 SunSoft */
#ident "@(#)US_UNIX5_Hobo.kt	1.1 91/07/12 KEYTABLES SMI"
#
# Copyright (c) 1991, Sun Microsystems, Inc.  RESTRICTED RIGHTS LEGEND:
# Use, duplication, or disclosure by the Government is subject to
# restrictions as set forth in subparagraph (c)(1)(ii) of the Rights in
# Technical Data and Computer Software clause at DFARS 52.227-7013 and
# in similar clauses in the FAR and NASA FAR Supplement.
#
#       Copyright (c) 1991 Sun Microsystems, Inc.
#
# Keytable for a Sun Type-5 U.S. UNIX keyboard (US_UNIX5_Hobo.kt) 
######################################################################
# Important Note:
#
# If you would just like to remap some keys on your keyboard
# you should use xmodmap rather than building a new keytable.
#
######################################################################
# The current (default) column mappings are for standard X (see
# Section 5 of the X Window System Protocol):
#     
# -----------------------------------------------------------------------------------
# |     column 1     |     column 2     |     column 3     |    column 4      | col 5 
# ===================================================================================
# |      no mods     |      Shift       |    ModeSwitch    | ModeSwitch Shift |NumLck 
# -----------------------------------------------------------------------------------
#
# To build a keytable for a new keyboard layout, you will need the
# scancode map, i.e., a scancode for each hardware key, and a keysym
# map, i.e., the symbols on the keycap associated with each scancode.
# You may also want to include an LED map, i.e., a number (1 to 32)
# assigned to each existing LED (e.g., the CapsLock LED).
#
# You should probably start with a copy of an existing keytable and
# replace the existing scancodes with your new scancodes.  Then,
# incrementally modify entries as needed.  To test a new keytable,
# copy it to $HOME/.keytable and start Xsun.
#
# There are two maps that need to be constructed:
# 1. Modifier map
# 2. Keysym map
#
# and one optional map:
# 3. LED map
#
# To reduce loading time at startup, remove all comments and convert
# spaces to tabs.
######################################################################

#Keyword -- do not remove
MODMAP

#Keyword -- do not remove
MAXKEYSPERMODIFIER 2

#
# Modifier map
#
# The modifier map gets loaded according to the entries below.
# Scancodes generally range from 1 to 255.  Since X keycodes range
# from 8 to 255, the MAXSCANCODE must be less than or equal to the
# MINSCANCODE + 247.  Consult your keyboard documentation to obtain
# the scancode for each key.
#
# Note that you enter **scancodes** in the entries below, not keycodes.
# For example, if you wanted the "lock" modifier group to contain the
# keycode for XK_Caps_Lock, you would enter the scancode for the key
# that has "CapsLock" printed on it.
#
# Notes:
# The xmodmap utility can be used to verify the map during development.
# In the output from xmodmap, KEYCODE = SCANCODE + (8 - MINSCANCODE).
#
# Format of an entry:
# modifier_group_identifier scancode scancode ...
#
shift	 99	 110		# Left Shift, Right Shift
lock	119			# CapsLock
control	 76			# Control
mod1	120	 122		# Left Meta, Right Meta
mod2	 13			# Altgraph
mod3	 98			# NumLock
mod4	 19			# Alt
mod5	  0			# None

#Keyword -- do not remove
END

######################################################################

#Keyword -- do not remove
KEYSYMMAP

#Keyword -- do not remove
MINSCANCODE 1

#Keyword -- do not remove
MAXSCANCODE 125

#
# Keysym table
#
# The goal here is to specify all of the different keysyms that
# appear on each phyical key.
#
# If "R" appears as the first attribute after the scancode, the
# appropriate action will be taken to make this key REPEAT.
# The default is NOREPEAT so be sure to specify "R" for all keys
# you wish to be repeating keys (repeat keys generate multiple
# keystrokes when held down -- see man page for xset).
#
# If "P" appears as the second attribute after the scancode, the
# appropriate action will be taken to make the key a PSEUDOLOCK key.
# The default is NOPSEUDOLOCK.  Pseudolock keys are keys that do
# not physically lock in the down state.  The server simulates lock
# key action by setting and clearing the appropriate modifier bit
# in the modifier state mask on alternate KeyPress and KeyRelease
# events of KeyPress-KeyRelease pairs.  In other words, the first
# time you press (and release) the key, lock is turned ON, the
# next time you press (and release) the key, lock is turned OFF, etc.
#
# Format of an entry:
# scancode {N|R}{N|P} keysym keysym ...
#
# Entry template:
# 000	RN	XK_Keysym	XK_Keysym	XK_Keysym	XK_Keysym
#
# Notes:
# Entries may be in any order.	If there are duplicates, the
# last of the duplicate entries takes precedence.
# No space may appear between the attribute code letters.
#

#############################   First Row   ################################
#
#Scan  Atts     Col1            Col2            Col3		Col4	Col5
#

118	NN	XK_Help

29	NN	XK_Escape

5	RN	XK_F1
6	RN	XK_F2
8	RN	XK_F3
10	RN	XK_F4

12	RN	XK_F5
14	RN	XK_F6
16	RN	XK_F7
17	RN	XK_F8

18	RN	XK_F9
7	RN	XK_F10
9	RN	SunXK_F36
11	RN	SunXK_F37

45	NN	SunAudioMute		SunVideoDegauss
2	RN	SunAudioLowerVolume SunVideoLowerBrightness
4	RN	SunAudioRaiseVolume SunVideoRaiseBrightness
48	NN	SunPowerSwitch	SunPowerSwitchShift

22	NN	XK_Print	SunXK_Sys_Req
23	NN	XK_Scroll_Lock
21	NN	XK_Pause	XK_Break

#############################   Second Row   ###############################
#
#Scan  Atts     Col1            Col2            Col3		Col4	Col5
#

1	NN	XK_L1		XK_L1		SunXK_Stop
3	NN	XK_L2		XK_L2		SunXK_Again

42	RN	XK_quoteleft	XK_asciitilde
30	RN	XK_1		XK_exclam
31	RN	XK_2		XK_at
32	RN	XK_3		XK_numbersign
33	RN	XK_4		XK_dollar	XK_EuroSign
34	RN	XK_5		XK_percent	XK_EuroSign
35	RN	XK_6		XK_asciicircum
36	RN	XK_7		XK_ampersand	NoSymbol	NoSymbol XK_KP_7
37	RN	XK_8		XK_asterisk	NoSymbol	NoSymbol XK_KP_8
38	RN	XK_9		XK_parenleft	NoSymbol        NoSymbol XK_KP_9
39	RN	XK_0		XK_parenright	NoSymbol        NoSymbol XK_KP_Multiply
40	RN	XK_minus	XK_underscore
41	RN	XK_equal	XK_plus
43	RN	XK_BackSpace

44	NN	XK_Insert
52	NN	XK_Home
96	NN	XK_Prior

98	NP	XK_Num_Lock

#############################   Third Row   ################################
#
#Scan  Atts     Col1            Col2            Col3		Col4	Col5
#

25	NN	XK_L3		XK_L3		SunXK_Props
26	NN	XK_L4		XK_L4		SunXK_Undo

53	RN	XK_Tab
54	RN	XK_Q
55	RN	XK_W
56	RN	XK_e		XK_E		XK_EuroSign
57	RN	XK_R
58	RN	XK_T
59	RN	XK_Y
60	RN	XK_U		NoSymbol	NoSymbol        NoSymbol XK_KP_4
61	RN	XK_I		NoSymbol	NoSymbol        NoSymbol XK_KP_5
62	RN	XK_O		NoSymbol	NoSymbol        NoSymbol XK_KP_6
63	RN	XK_P		NoSymbol	NoSymbol        NoSymbol XK_KP_Subtract
64	RN	XK_bracketleft	XK_braceleft
65	RN	XK_bracketright	XK_braceright
88	RN	XK_backslash	XK_bar		XK_brokenbar

66	RN	XK_Delete
74	NN	XK_End
123	NN	XK_Next


#############################   Fourth Row  ################################
#
#Scan  Atts     Col1            Col2            Col3		Col4	Col5
#

49	NN	XK_L5		XK_L5		SunXK_Front
51	NN	XK_L6		XK_L6		SunXK_Copy	

119	NP	XK_Caps_Lock
77	RN	XK_A
78	RN	XK_S
79	RN	XK_D
80	RN	XK_F
81	RN	XK_G
82	RN	XK_H
83	RN	XK_J		NoSymbol	NoSymbol        NoSymbol XK_KP_1
84	RN	XK_K		NoSymbol	NoSymbol        NoSymbol XK_KP_2
85	RN	XK_L		NoSymbol	NoSymbol        NoSymbol XK_KP_3
86	RN	XK_semicolon	XK_colon	NoSymbol        NoSymbol XK_KP_Add
87	RN	XK_quoteright	XK_quotedbl
89	RN	XK_Return	NoSymbol	NoSymbol	NoSymbol XK_KP_Enter


#############################   Fifth Row   ################################
#
#Scan  Atts     Col1            Col2            Col3		Col4	Col5
#

72	NN	XK_L7		XK_L7		SunXK_Open
73	NN	XK_L8		XK_L8		SunXK_Paste

99	NN	XK_Shift_L
100	RN	XK_Z
101	RN	XK_X
102	RN	XK_C
103	RN	XK_V
104	RN	XK_B
105	RN	XK_N
106	RN	XK_M		NoSymbol	NoSymbol        NoSymbol XK_KP_0
107	RN	XK_comma	XK_less		
108	RN	XK_period	XK_greater	NoSymbol        NoSymbol XK_KP_Decimal
109	RN	XK_slash	XK_question	NoSymbol        NoSymbol XK_KP_Divide
110	NN	XK_Shift_R

20	RN	XK_Up

#############################   Sixth Row   ################################
#
#Scan  Atts     Col1            Col2            Col3		Col4	Col5
#

95	NN	XK_L9		XK_L9		SunXK_Find
97	NN	XK_L10		XK_L10		SunXK_Cut

76	NN	XK_Control_L
19	NN	XK_Alt_L
120	NN	XK_Meta_L
121	RN	XK_space
122	NN	XK_Meta_R
67	NN	SunXK_Compose
13	NN	SunXK_AltGraph

24	RN	XK_Left
27	RN	XK_Down
28	RN	XK_Right

#Keyword -- do not remove
END

######################################################################

#Keyword -- do not remove
LEDMAP

# LED map
#
# The LED map gets placed in a property on the root window.
#
# Format of an entry:
# keysym number
#

# Type 5 keyboard has 4 LEDs.

#Keyword -- do not remove
MAXLED 4

XK_Num_Lock	1	# NumLock
XK_Multi_key	2	# Compose
XK_Scroll_Lock	3	# ScrollLock
XK_Caps_Lock	4	# CapsLock

#Keyword -- do not remove
END

######################################################################

#Keyword -- do not remove
ESCSEQUENCE

# Escape Sequence
#
# The Escape Sequence is stored in the server.
#
# Format of an entry:
# scancode
#
# Notes: Entries appear in the order they must be held down to trigger an
# escape from the server. The maximum length of an escape sequence is 5 keys.
#

1		# XK_L1
19		# XK_Alt_L
66		# XK_Delete

#Keyword -- do not remove
END

######################################################################
