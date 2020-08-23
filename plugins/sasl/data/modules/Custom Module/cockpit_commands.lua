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

--draims
Draims_VHF_button = createCommand("a321neo/cockpit/draims/draims_vhf_button", "DRAIMS VHF button")
Draims_HF_button = createCommand("a321neo/cockpit/draims/draims_hf_button", "DRAIMS HF button")
Draims_NAV_button = createCommand("a321neo/cockpit/draims/draims_nav_button", "DRAIMS NAV button")
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
Draims_source_up_button = createCommand("a321neo/cockpit/draims/draims_source_up_button", "DRAIMS source up button")
Draims_source_dn_button = createCommand("a321neo/cockpit/draims/draims_source_dn_button", "DRAIMS source down button")
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