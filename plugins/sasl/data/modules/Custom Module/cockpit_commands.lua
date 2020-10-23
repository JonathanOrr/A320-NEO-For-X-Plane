--ALL COMMANDS USED IN THE COCKPIT, e.g PUSHBUTTONS--

-- Buttons with light (check cockpit_datarefs.lua for light datarefs):
Ecam_btn_cmd_ENG   = createCommand("a321neo/cockpit/ecam/buttons/cmd_eng", "ENG pushbutton")
Ecam_btn_cmd_BLEED = createCommand("a321neo/cockpit/ecam/buttons/cmd_bleed", "BLEED pushbutton")
Ecam_btn_cmd_PRESS = createCommand("a321neo/cockpit/ecam/buttons/cmd_press", "PRESS pushbutton")
Ecam_btn_cmd_ELEC  = createCommand("a321neo/cockpit/ecam/buttons/cmd_elec", "ELEC pushbutton")
Ecam_btn_cmd_HYD   = createCommand("a321neo/cockpit/ecam/buttons/cmd_hyd", "HYD pushbutton")
Ecam_btn_cmd_FUEL  = createCommand("a321neo/cockpit/ecam/buttons/cmd_fuel", "FUEL pushbutton")
Ecam_btn_cmd_APU   = createCommand("a321neo/cockpit/ecam/buttons/cmd_apu", "APU pushbutton")
Ecam_btn_cmd_COND  = createCommand("a321neo/cockpit/ecam/buttons/cmd_cond", "COND pushbutton")
Ecam_btn_cmd_DOOR  = createCommand("a321neo/cockpit/ecam/buttons/cmd_door", "DOOR pushbutton")
Ecam_btn_cmd_WHEEL = createCommand("a321neo/cockpit/ecam/buttons/cmd_wheel", "WHEEL pushbutton")
Ecam_btn_cmd_FCTL  = createCommand("a321neo/cockpit/ecam/buttons/cmd_fctl", "FCTL pushbutton")
Ecam_btn_cmd_CLR   = createCommand("a321neo/cockpit/ecam/buttons/cmd_clr", "CLR pushbutton")
Ecam_btn_cmd_STS   = createCommand("a321neo/cockpit/ecam/buttons/cmd_sts", "STS pushbutton")

-- No light buttons:
Ecam_btn_cmd_TOCFG = createCommand("a321neo/cockpit/ecam/buttons/cmd_toconfig", "T.O CONFIG pushbutton")
Ecam_btn_cmd_EMERC = createCommand("a321neo/cockpit/ecam/buttons/cmd_emercanc", "EMER CANC pushbutton")
Ecam_btn_cmd_ALL   = createCommand("a321neo/cockpit/ecam/buttons/cmd_all", "ALL pushbutton")
Ecam_btn_cmd_RCL   = createCommand("a321neo/cockpit/ecam/buttons/cmd_rcl", "RCL pushbutton")

--wheels
Toggle_brake_fan = createCommand("a321neo/cockpit/wheel/toggle_brake_fan", "Toggle brake fan")
Toggle_lo_autobrake = createCommand("a321neo/cockpit/wheel/toggle_lo_autobrake", "Toggle LO autobrake")
Toggle_med_autobrake = createCommand("a321neo/cockpit/wheel/toggle_med_autobrake", "Toggle MED autobrake")
Toggle_max_autobrake = createCommand("a321neo/cockpit/wheel/toggle_max_autobrake", "Toggle MAX autobrake")

--brightness control
Capt_PFD_brightness_up = createCommand("a321neo/cockpit/brightness/capt_pfd_brightness_up", "Captain PFD brightness up")
Capt_PFD_brightness_dn = createCommand("a321neo/cockpit/brightness/capt_pfd_brightness_dn", "Captain PFD brightness down")
Capt_ND_brightness_up = createCommand("a321neo/cockpit/brightness/capt_nd_brightness_up", "Captain ND brightness up")
Capt_ND_brightness_dn = createCommand("a321neo/cockpit/brightness/capt_nd_brightness_dn", "Captain ND brightness down")
Fo_PFD_brightness_up = createCommand("a321neo/cockpit/brightness/fo_pfd_brightness_up", "First Officer PFD brightness up")
Fo_PFD_brightness_dn = createCommand("a321neo/cockpit/brightness/fo_pfd_brightness_dn", "First Officer PFD brightness down")
Fo_ND_brightness_up = createCommand("a321neo/cockpit/brightness/fo_nd_brightness_up", "First Officer ND brightness up")
Fo_ND_brightness_dn = createCommand("a321neo/cockpit/brightness/fo_nd_brightness_dn", "First Officer ND brightness down")
EWD_brightness_up = createCommand("a321neo/cockpit/brightness/ewd_brightness_up", "EWD brightness up")
EWD_brightness_dn = createCommand("a321neo/cockpit/brightness/ewd_brightness_dn", "EWD brightness down")
ECAM_brightness_up = createCommand("a321neo/cockpit/brightness/ecam_brightness_up", "ECAM brightness up")
ECAM_brightness_dn = createCommand("a321neo/cockpit/brightness/ecam_brightness_dn", "ECAM brightness down")
DCDU_1_brightness_up = createCommand("a321neo/cockpit/brightness/dcdu_1_brightness_up", "DCDU 1 brightness up")
DCDU_1_brightness_dn = createCommand("a321neo/cockpit/brightness/dcdu_1_brightness_dn", "DCDU 1 brightness down")
DCDU_2_brightness_up = createCommand("a321neo/cockpit/brightness/dcdu_2_brightness_up", "DCDU 2 brightness up")
DCDU_2_brightness_dn = createCommand("a321neo/cockpit/brightness/dcdu_2_brightness_dn", "DCDU 2 brightness down")
MCDU_1_brightness_up = createCommand("a321neo/cockpit/brightness/mcdu_1_brightness_up", "MCDU 1 brightness up")
MCDU_1_brightness_dn = createCommand("a321neo/cockpit/brightness/mcdu_1_brightness_dn", "MCDU 1 brightness down")
MCDU_2_brightness_up = createCommand("a321neo/cockpit/brightness/mcdu_2_brightness_up", "MCDU 2 brightness up")
MCDU_2_brightness_dn = createCommand("a321neo/cockpit/brightness/mcdu_2_brightness_dn", "MCDU 2 brightness down")
DRAIMS_1_brightness_up = createCommand("a321neo/cockpit/brightness/draims_1_brightness_up", "DRAIMS 1 brightness up")
DRAIMS_1_brightness_dn = createCommand("a321neo/cockpit/brightness/draims_1_brightness_dn", "DRAIMS 1 brightness down")
DRAIMS_2_brightness_up = createCommand("a321neo/cockpit/brightness/draims_2_brightness_up", "DRAIMS 2 brightness up")
DRAIMS_2_brightness_dn = createCommand("a321neo/cockpit/brightness/draims_2_brightness_dn", "DRAIMS 2 brightness down")
ISIS_brightness_up = createCommand("a321neo/cockpit/brightness/isis_brightness_up", "ISIS brightness up")
ISIS_brightness_dn = createCommand("a321neo/cockpit/brightness/isis_brightness_dn", "ISIS brightness down")

--draims
Draims_VHF_button = createCommand("a321neo/cockpit/draims/draims_vhf_button", "DRAIMS VHF button")
Draims_HF_button = createCommand("a321neo/cockpit/draims/draims_hf_button", "DRAIMS HF button")
Draims_NAV_button = createCommand("a321neo/cockpit/draims/draims_nav_button", "DRAIMS NAV button")
Draims_transmit_VHF1_button = createCommand("a321neo/cockpit/draims/draims_transmit_vhf_1_button", "DRAIMS transmit to VHF 1 button")
Draims_transmit_VHF2_button = createCommand("a321neo/cockpit/draims/draims_transmit_vhf_2_button", "DRAIMS transmit to VHF 2 button")
Draims_VHF1_volume_up = createCommand("a321neo/cockpit/draims/draims_vhf1_volume_up", "DRAIMS VHF 1 volume up")
Draims_VHF1_volume_dn = createCommand("a321neo/cockpit/draims/draims_vhf1_volume_dn", "DRAIMS VHF 1 volume down")
Draims_VHF2_volume_up = createCommand("a321neo/cockpit/draims/draims_vhf2_volume_up", "DRAIMS VHF 2 volume up")
Draims_VHF2_volume_dn = createCommand("a321neo/cockpit/draims/draims_vhf2_volume_dn", "DRAIMS VHF 2 volume down")
Draims_VHF3_monitor_toggle = createCommand("a321neo/cockpit/draims/draims_vhf3_monitor_toggle", "DRAIMS toggle VHF 3 monitoring")
Draims_dynamic_NAV_toggle = createCommand("a321neo/cockpit/draims/draims_dynamic_nav_toggle", "DRAIMS toggle dynamic audio navigation")
Draims_dynamic_NAV_volume_up = createCommand("a321neo/cockpit/draims/draims_dynamic_nav_volume_up", "DRAIMS dynamic audio navigation volume up")
Draims_dynamic_NAV_volume_dn = createCommand("a321neo/cockpit/draims/draims_dynamic_nav_volume_dn", "DRAIMS dynamic audio navigation volume down")
Draims_l_1_button = createCommand("a321neo/cockpit/draims/draims_l_1_button", "DRAIMS left 1 button")
Draims_l_2_button = createCommand("a321neo/cockpit/draims/draims_l_2_button", "DRAIMS left 2 button")
Draims_l_3_button = createCommand("a321neo/cockpit/draims/draims_l_3_button", "DRAIMS left 3 button")
Draims_l_4_button = createCommand("a321neo/cockpit/draims/draims_l_4_button", "DRAIMS left 4 button")
Draims_r_1_button = createCommand("a321neo/cockpit/draims/draims_r_1_button", "DRAIMS right 1 button")
Draims_r_2_button = createCommand("a321neo/cockpit/draims/draims_r_2_button", "DRAIMS right 2 button")
Draims_r_3_button = createCommand("a321neo/cockpit/draims/draims_r_3_button", "DRAIMS right 3 button")
Draims_r_4_button = createCommand("a321neo/cockpit/draims/draims_r_4_button", "DRAIMS right 4 button")
Draims_l_tcas_button = createCommand("a321neo/cockpit/draims/draims_l_tcas_button", "DRAIMS left TCAS button")
Draims_r_tcas_button = createCommand("a321neo/cockpit/draims/draims_r_tcas_button", "DRAIMS right TCAS button")
Draims_cursor_up_button = createCommand("a321neo/cockpit/draims/draims_cursor_up_button", "DRAIMS cursor up button")
Draims_cursor_dn_button = createCommand("a321neo/cockpit/draims/draims_cursor_dn_button", "DRAIMS cursor down button")
Draims_1_key = createCommand("a321neo/cockpit/draims/draims_1_key", "DRAIMS numbpad 1 key")
Draims_2_key = createCommand("a321neo/cockpit/draims/draims_2_key", "DRAIMS numbpad 2 key")
Draims_3_key = createCommand("a321neo/cockpit/draims/draims_3_key", "DRAIMS numbpad 3 key")
Draims_4_key = createCommand("a321neo/cockpit/draims/draims_4_key", "DRAIMS numbpad 4 key")
Draims_5_key = createCommand("a321neo/cockpit/draims/draims_5_key", "DRAIMS numbpad 5 key")
Draims_6_key = createCommand("a321neo/cockpit/draims/draims_6_key", "DRAIMS numbpad 6 key")
Draims_7_key = createCommand("a321neo/cockpit/draims/draims_7_key", "DRAIMS numbpad 7 key")
Draims_8_key = createCommand("a321neo/cockpit/draims/draims_8_key", "DRAIMS numbpad 8 key")
Draims_9_key = createCommand("a321neo/cockpit/draims/draims_9_key", "DRAIMS numbpad 9 key")
Draims_0_key = createCommand("a321neo/cockpit/draims/draims_0_key", "DRAIMS numbpad 0 key")
Draims_dot_key = createCommand("a321neo/cockpit/draims/draims_dot_key", "DRAIMS numbpad . key")
Draims_clr_key = createCommand("a321neo/cockpit/draims/draims_clr_key", "DRAIMS numbpad clr key")

Sqwk_ident = sasl.findCommand("sim/transponder/transponder_ident")

--aircond
Toggle_cab_hotair = createCommand("a321neo/cockpit/aircond/toggle_cab_hotair", "Toggle cabin hot air")
Toggle_cargo_hotair = createCommand("a321neo/cockpit/aircond/toggle_cargo_hotair", "Toggle cargo hot air")
Toggle_aft_cargo_iso_valve = createCommand("a321neo/cockpit/aircond/toggle_aft_cargo_iso_valve", "Toggle aft cargo iso valve")
Cockpit_temp_dial_up = createCommand("a321neo/cockpit/aircond/cockpit_temp_dial_up", "Cockpit temp dial up")
Cockpit_temp_dial_dn = createCommand("a321neo/cockpit/aircond/cockpit_temp_dial_dn", "Cockpit temp dial down")
Front_cab_temp_dial_up = createCommand("a321neo/cockpit/aircond/front_cab_temp_dial_up", "Front cab temp dia up")
Front_cab_temp_dial_dn = createCommand("a321neo/cockpit/aircond/front_cab_temp_dial_dn", "Front cab temp dial down")
Aft_cab_temp_dial_up = createCommand("a321neo/cockpit/aircond/aft_cab_temp_dial_up", "Aft cab temp dial up")
Aft_cab_temp_dial_dn = createCommand("a321neo/cockpit/aircond/aft_cab_temp_dial_dn", "Aft cab temp dial down")
Aft_cargo_temp_dial_up = createCommand("a321neo/cockpit/aircond/aft_cargo_temp_dial_up", "Aft cargo temp dial up")
Aft_cargo_temp_dial_dn = createCommand("a321neo/cockpit/aircond/aft_cargo_temp_dial_dn", "Aft cargo temp dial down")

--packs & bleed
Toggle_eng1_bleed = createCommand("a321neo/cockpit/bleed/toggle_eng1_bleed", "Toggle ENG 1 bleed")
Toggle_eng2_bleed = createCommand("a321neo/cockpit/bleed/toggle_eng2_bleed", "Toggle ENG 2 bleed")
Pack_flow_dial_up = createCommand("a321neo/cockpit/packs/pack_flow_dial_up", "Pack flow dial up")
Pack_flow_dial_dn = createCommand("a321neo/cockpit/packs/pack_flow_dial_dn", "Pack flow dial down")
X_bleed_dial_up = createCommand("a321neo/cockpit/packs/x_bleed_dial_up", "x bleed dial up")
X_bleed_dial_dn = createCommand("a321neo/cockpit/packs/x_bleed_dial_dn", "x bleed dial down")

-- DCDU
DCDU_cmd_msg_plus = createCommand("a321neo/cockpit/DCDU/msg_plus", "Next Message")
DCDU_cmd_msg_minus = createCommand("a321neo/cockpit/DCDU/msg_minus", "Previous Message")
DCDU_cmd_page_plus = createCommand("a321neo/cockpit/DCDU/page_plus", "Next Page")
DCDU_cmd_page_minus = createCommand("a321neo/cockpit/DCDU/page_minus", "Previous Page")
DCDU_cmd_left_btm = createCommand("a321neo/cockpit/DCDU/left_btm", "Button Bottom-Left")
DCDU_cmd_left_top = createCommand("a321neo/cockpit/DCDU/left_top", "Button Top-Left")
DCDU_cmd_right_btm = createCommand("a321neo/cockpit/DCDU/right_btm", "Button Bottom-Right")
DCDU_cmd_right_top = createCommand("a321neo/cockpit/DCDU/right_top", "Button Top-Right")

-- ADIRS
ADIRS_cmd_ADR1 = createCommand("a321neo/cockpit/ADIRS/ADR1_cmd", "Toggle ADR 1")
ADIRS_cmd_ADR2 = createCommand("a321neo/cockpit/ADIRS/ADR2_cmd", "Toggle ADR 2")
ADIRS_cmd_ADR3 = createCommand("a321neo/cockpit/ADIRS/ADR3_cmd", "Toggle ADR 3")
ADIRS_cmd_IR1 = createCommand("a321neo/cockpit/ADIRS/IR1_cmd", "Toggle IR 1")
ADIRS_cmd_IR2 = createCommand("a321neo/cockpit/ADIRS/IR2_cmd", "Toggle IR 2")
ADIRS_cmd_IR3 = createCommand("a321neo/cockpit/ADIRS/IR3_cmd", "Toggle IR 3")

ADIRS_cmd_knob_1_up   = createCommand("a321neo/cockpit/ADIRS/knob_1_up", "Move right the knob")
ADIRS_cmd_knob_2_up   = createCommand("a321neo/cockpit/ADIRS/knob_2_up", "Move right the knob")
ADIRS_cmd_knob_3_up   = createCommand("a321neo/cockpit/ADIRS/knob_3_up", "Move right the knob")
ADIRS_cmd_knob_1_down = createCommand("a321neo/cockpit/ADIRS/knob_1_down", "Move left the knob")
ADIRS_cmd_knob_2_down = createCommand("a321neo/cockpit/ADIRS/knob_2_down", "Move left the knob")
ADIRS_cmd_knob_3_down = createCommand("a321neo/cockpit/ADIRS/knob_3_down", "Move left the knob")

ADIRS_cmd_source_ATHDG_up     = createCommand("a321neo/cockpit/ADIRS/ATHDG_up", "Move right the knob")
ADIRS_cmd_source_AIRDATA_up   = createCommand("a321neo/cockpit/ADIRS/AIRDATA_up", "Move right the knob")
ADIRS_cmd_source_ATHDG_down   = createCommand("a321neo/cockpit/ADIRS/ATHDG_down", "Move left the knob")
ADIRS_cmd_source_AIRDATA_down = createCommand("a321neo/cockpit/ADIRS/AIRDATA_down", "Move left the knob")

--doors
Door_1_l_toggle = createCommand("a321neo/cockpit/door/toggle_door_1_l", "Open/Close door 1 L")
Door_1_r_toggle = createCommand("a321neo/cockpit/door/toggle_door_1_r", "Open/Close door 1 R")
Door_2_l_toggle = createCommand("a321neo/cockpit/door/toggle_door_2_l", "Open/Close door 2 L")
Door_2_r_toggle = createCommand("a321neo/cockpit/door/toggle_door_2_r", "Open/Close door 2 R")
Door_3_l_toggle = createCommand("a321neo/cockpit/door/toggle_door_3_l", "Open/Close door 3 L")
Door_3_r_toggle = createCommand("a321neo/cockpit/door/toggle_door_3_r", "Open/Close door 3 R")
Overwing_exit_1_l_toggle = createCommand("a321neo/cockpit/door/toggle_overwing_exit_1_l", "Open/Close overwing exit 1 L")
Overwing_exit_1_r_toggle = createCommand("a321neo/cockpit/door/toggle_overwing_exit_1_r", "Open/Close overwing exit 1 R")
Overwing_exit_2_l_toggle = createCommand("a321neo/cockpit/door/toggle_overwing_exit_2_l", "Open/Close overwing exit 2 L")
Overwing_exit_2_r_toggle = createCommand("a321neo/cockpit/door/toggle_overwing_exit_2_r", "Open/Close overwing exit 2 R")
Cargo_1_toggle = createCommand("a321neo/cockpit/door/toggle_cargo_1", "Open/Close cargo 1")
Cargo_2_toggle = createCommand("a321neo/cockpit/door/toggle_cargo_2", "Open/Close cargo 2")

-- Failures
Failures_cancel_master_caution   = createCommand("a321neo/cockpit/cancel_master_caution", "Move left the knob")
Failures_cancel_master_warning   = createCommand("a321neo/cockpit/cancel_master_warning", "Move left the knob")

-- HYD
HYD_cmd_Eng1Pump   = createCommand("a321neo/cockpit/HYD/toggle_eng_pump_1", "Toggle HYD Engine 1 pump")
HYD_cmd_Eng2Pump   = createCommand("a321neo/cockpit/HYD/toggle_eng_pump_2", "Toggle HYD Engine 2 pump")
HYD_cmd_PTU        = createCommand("a321neo/cockpit/HYD/toggle_PTU", "Toggle HYD PTU pump")
HYD_cmd_B_ElecPump = createCommand("a321neo/cockpit/HYD/toggle_elec_pump_B", "Toggle HYD Elec Blue pump")
HYD_cmd_Y_ElecPump = createCommand("a321neo/cockpit/HYD/toggle_elec_pump_Y", "Toggle HYD Elec Yellow pump")
HYD_cmd_RAT_man_on = createCommand("a321neo/cockpit/HYD/RAT_manual", "Force RAT out")

HYD_reset_systems  = createCommand("a321neo/internals/HYD/reset_systems", "Reset HYD quantity systems")

-- ELEC
ELEC_cmd_Commercial   = createCommand("a321neo/cockpit/electrical/commercial", "Toggle commercial power")
ELEC_cmd_Galley       = createCommand("a321neo/cockpit/electrical/galley", "Toggle galley")
ELEC_cmd_AC_ess_feed  = createCommand("a321neo/cockpit/electrical/AC_ESS_FEED", "Press AC ESS FEED button")
ELEC_cmd_BUS_tie      = createCommand("a321neo/cockpit/electrical/BUS_tie", "Press BUS TIE button")
ELEC_cmd_IDG1         = createCommand("a321neo/cockpit/electrical/IDG_1", "Press IDG1 button")
ELEC_cmd_IDG2         = createCommand("a321neo/cockpit/electrical/IDG_2", "Press IDG2 button")
ELEC_cmd_GEN1         = createCommand("a321neo/cockpit/electrical/GEN_1", "Press GEN1 button")
ELEC_cmd_GEN2         = createCommand("a321neo/cockpit/electrical/GEN_2", "Press GEN2 button")
ELEC_cmd_APU_GEN      = createCommand("a321neo/cockpit/electrical/APU_GEN", "Press APU GEN button")
ELEC_cmd_EXT_PWR      = createCommand("a321neo/cockpit/electrical/EXT_PWR", "Press EXT PWR button")

ELEC_cmd_EMER_GEN_TEST   = createCommand("a321neo/cockpit/electrical/EMER_GEN_TEST", "Press EMER_GEN_TEST on the EMER ELEC PWR panel")
ELEC_cmd_EMER_GEN1_LINE  = createCommand("a321neo/cockpit/electrical/EMER_GEN_1_LINE", "Press GEN 1 LINE button on the EMER ELEC PWR panel")
ELEC_cmd_EMER_RAT        = createCommand("a321neo/cockpit/electrical/EMER_GEN_RAT", "Press RAT MAN ON button on the EMER ELEC PWR panel")

ELEC_vent_blower      = createCommand("a321neo/cockpit/electrical/toggle_vent_blower", "Press BLOWER in the VENTILATION panel")
ELEC_vent_extract     = createCommand("a321neo/cockpit/electrical/toggle_vent_extract", "Press EXTRACT in the VENTILATION panel")

-- FUEL
FUEL_cmd_L_TK_pump_1      = createCommand("a321neo/cockpit/fuel/L_TK_pump_1", "Press L TK 1 pump button in the FUEL panel")
FUEL_cmd_L_TK_pump_2      = createCommand("a321neo/cockpit/fuel/L_TK_pump_2", "Press L TK 2 pump button in the FUEL panel")
FUEL_cmd_R_TK_pump_1      = createCommand("a321neo/cockpit/fuel/R_TK_pump_1", "Press R TK 1 pump button in the FUEL panel")
FUEL_cmd_R_TK_pump_2      = createCommand("a321neo/cockpit/fuel/R_TK_pump_2", "Press R TK 2 pump button in the FUEL panel")
FUEL_cmd_C_TK_XFR_1       = createCommand("a321neo/cockpit/fuel/C_TK_XFR_1", "Press C TK 1 XFR button in the FUEL panel")
FUEL_cmd_C_TK_XFR_2       = createCommand("a321neo/cockpit/fuel/C_TK_XFR_2", "Press C TK 2 XFR button in the FUEL panel")
FUEL_cmd_ACT_TK_XFR       = createCommand("a321neo/cockpit/fuel/ACT_TK_FWD", "Press ACT TK FWD button in the FUEL panel")
FUEL_cmd_RCT_TK_XFR       = createCommand("a321neo/cockpit/fuel/RCT_TK_FWD", "Press RCT TK FWD button in the FUEL panel")
FUEL_cmd_C_TK_mode        = createCommand("a321neo/cockpit/fuel/C_TK_mode", "Press MODE SEL button in the FUEL panel")
FUEL_cmd_X_FEED           = createCommand("a321neo/cockpit/fuel/X_FEED", "Press X FEED button in the FUEL panel")
FUEL_cmd_internal_qs      = sasl.createCommand("a321neo/internals/fuel/quick_start", "Used during quick start") -- This is used only for sasl internals

-- Standby instrument
ISIS_cmd_LS          = createCommand("a321neo/cockpit/ISIS/LS", "Press LS button on ISIS")
ISIS_cmd_Knob_c      = createCommand("a321neo/cockpit/ISIS/Knob_C", "Rotate ISIS knob clockwise")  -- Knob clockwise
ISIS_cmd_Knob_cc     = createCommand("a321neo/cockpit/ISIS/Knob_CC", "Rotate ISIS knob counter-clockwise") -- Knob counter-clockwise


--FBW
Toggle_ELAC_1 = sasl.createCommand("a321neo/cockpit/FBW/toggle_elac_1", "toggle ELAC 1")
Toggle_ELAC_2 = sasl.createCommand("a321neo/cockpit/FBW/toggle_elac_2", "toggle ELAC 2")
Toggle_FAC_1 = sasl.createCommand("a321neo/cockpit/FBW/toggle_fac_1", "toggle FAC 1")
Toggle_FAC_2 = sasl.createCommand("a321neo/cockpit/FBW/toggle_fac_2", "toggle FAC 2")
Toggle_SEC_1 = sasl.createCommand("a321neo/cockpit/FBW/toggle_sec_1", "toggle SEC 1")
Toggle_SEC_2 = sasl.createCommand("a321neo/cockpit/FBW/toggle_sec_2", "toggle SEC 2")
Toggle_SEC_3 = sasl.createCommand("a321neo/cockpit/FBW/toggle_sec_3", "toggle SEC 3")

-- ENG
ENG_cmd_manual_start_1 = createCommand("a321neo/cockpit/engine/manual_start_1", "Press Manual Start ENG1 pushbutton")
ENG_cmd_manual_start_2 = createCommand("a321neo/cockpit/engine/manual_start_2", "Press Manual Start ENG1 pushbutton")
ENG_cmd_dual_cooling   = createCommand("a321neo/cockpit/engine/dual_cooling", "Press Dual Cooling pushbutton")
ENG_cmd_mode_up        = sasl.createCommand("a321neo/cockpit/engine/mode_up", "engine mode selector up")
ENG_cmd_mode_down      = sasl.createCommand("a321neo/cockpit/engine/mode_dn", "engine mode selector down")

-- APU
APU_cmd_master = sasl.createCommand("a321neo/cockpit/engine/apu_master_toggle", "toggle APU master button")
APU_cmd_start  = sasl.createCommand("a321neo/cockpit/engine/apu_start_toggle", "toggle APU start button")


