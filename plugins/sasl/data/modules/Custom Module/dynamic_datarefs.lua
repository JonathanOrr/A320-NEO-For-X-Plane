--global variables--


--global dataref for the A32NX project--
DELTA_TIME = globalProperty("sim/operation/misc/frame_rate_period")
TIME = globalProperty("sim/time/total_running_time_sec")
Distance_traveled_mi = createGlobalPropertyf("a321neo/dynamics/distance_traveled_mi", 0, false, true, false)
Distance_traveled_km = createGlobalPropertyf("a321neo/dynamics/distance_traveled_km", 0, false, true, false)
Ground_speed_kmh = createGlobalPropertyf("a321neo/dynamics/groundspeed_kmh", 0, false, true, false)
Ground_speed_mph = createGlobalPropertyf("a321neo/dynamics/groundspeed_mph", 0, false, true, true)
Startup_running = globalProperty("sim/operation/prefs/startup_running") -- 1 if user asked to startup with engines running
--wheel
Aft_wheel_on_ground = createGlobalPropertyi("a321neo/dynamics/aft_wheels_on_ground", 0, false, true, false)
All_on_ground = createGlobalPropertyi("a321neo/dynamics/all_wheels_on_ground", 0, false, true, false)
Any_wheel_on_ground = createGlobalPropertyi("a321neo/dynamics/any_wheel_on_ground", 0, false, true, false)
Brakes_fan = createGlobalPropertyi("a321neo/dynamics/wheel/brakes_fan", 0, false, true, false)
Left_brakes_temp = createGlobalPropertyf("a321neo/dynamics/wheel/left_brakes_temp", 10, false, true, false) --left brakes temperature
Right_brakes_temp = createGlobalPropertyf("a321neo/dynamics/wheel/right_brakes_temp", 10, false, true, false) --right brakes temperature
Left_tire_psi = createGlobalPropertyf("a321neo/dynamics/wheel/left_tire_psi", 210, false, true, false) --left tire psi
Right_tire_psi = createGlobalPropertyf("a321neo/dynamics/wheel/right_tire_psi", 210, false, true, false) --right tire psi
--engines
Engine_option = createGlobalPropertyi("a321neo/customization/engine_option", 0, false, true, false) --0 CFM LEAP, 1 PW1000G
PW_engine_enabled = createGlobalPropertyi("a321neo/customization/pw_engine_enabled", 0, false, true, false)
Leap_engien_option = createGlobalPropertyi("a321neo/customization/leap_engine_enabled", 0, false, true, false)
--aircond
Cockpit_temp_req = createGlobalPropertyf("a321neo/dynamics/aircond/cockpit_temp_req", 21, false, true, false) --requested cockpit temperature
Front_cab_temp_req = createGlobalPropertyf("a321neo/dynamics/aircond/front_cab_temp_req", 21, false, true, false) --requested front cabin temperature
Aft_cab_temp_req = createGlobalPropertyf("a321neo/dynamics/aircond/aft_cab_temp_req", 21, false, true, false) --requested aft cabin temperature
Aft_cargo_temp_req = createGlobalPropertyf("a321neo/dynamics/aircond/aft_cargo_temp_req", 17, false, true, false) ---requested aft cargo temperature
Cockpit_temp = createGlobalPropertyf("a321neo/dynamics/aircond/cockpit_temp", 15, false, true, false) --actual cockpit temperature
Front_cab_temp = createGlobalPropertyf("a321neo/dynamics/aircond/front_cab_temp", 15, false, true, false) --actual front cabin temperature
Aft_cab_temp = createGlobalPropertyf("a321neo/dynamics/aircond/aft_cab_temp", 15, false, true, false) --actual aft cabin temperature
Aft_cargo_temp = createGlobalPropertyf("a321neo/dynamics/aircond/aft_cargo_temp", 17, false, true, false) ---requested aft cargo temperature

Ventilation_blower  = createGlobalPropertyi("a321neo/dynamics/aircond/vent_blower", 0, false, true, false)  -- 0 normal, 1 override
Ventilation_extract = createGlobalPropertyi("a321neo/dynamics/aircond/vent_extract", 0, false, true, false) -- 0 normal, 1 override

--PACKS
L_pack_Flow = createGlobalPropertyi("a321neo/dynamics/packs/l_pack_flow", 0, false, true, false) --0low, 1norm, 2high
R_pack_Flow = createGlobalPropertyi("a321neo/dynamics/packs/r_pack_flow", 0, false, true, false) --0low, 1norm, 2high
L_HP_valve = createGlobalPropertyi("a321neo/dynamics/packs/l_hp_valve", 0, false, true, false)
R_HP_valve = createGlobalPropertyi("a321neo/dynamics/packs/r_hp_valve", 0, false, true, false)
X_bleed_valve = createGlobalPropertyi("a321neo/dynamics/packs/x_bleed_valve", 0, false, true, false) --0closed, 1open
X_bleed_bridge_state = createGlobalPropertyi("a321neo/dynamics/packs/x_bleed_bridge_state", 0, false, true, false) --0closed, 1bridged clsoed, 2bridged open
Packs_avail = createGlobalPropertyi("a321neo/dynamics/packs/packs_avail", 0, false, true, false)--if the pack actually has air going through it
L_bleed_state = createGlobalPropertyi("a321neo/dynamics/packs/l_bleed_state", 0, false, true, false)--0engine 1 not running bleed off, 1engine 1 running bleed off, 2engine 1 running bleed on
R_bleed_state = createGlobalPropertyi("a321neo/dynamics/packs/r_bleed_state", 0, false, true, false)--0engine 2 not running bleed off, 1engine 2 running bleed off, 2engine 2 running bleed on
L_bleed_press = createGlobalPropertyf("a321neo/dynamics/packs/l_bleed_press_psi", 0, false, true, false)
R_bleed_press = createGlobalPropertyf("a321neo/dynamics/packs/r_bleed_press_psi", 0, false, true, false)
L_bleed_temp = createGlobalPropertyf("a321neo/dynamics/packs/l_bleed_temp", 10, false, true, false)
R_bleed_temp = createGlobalPropertyf("a321neo/dynamics/packs/r_bleed_temp", 10, false, true, false)
L_compressor_temp = createGlobalPropertyf("a321neo/dynamics/packs/l_compressor_temp", 10, false, true, false)
R_compressor_temp = createGlobalPropertyf("a321neo/dynamics/packs/r_compressor_temp", 10, false, true, false)
L_pack_temp = createGlobalPropertyf("a321neo/dynamics/packs/l_pack_temp", 10, false, true, false)
R_pack_temp = createGlobalPropertyf("a321neo/dynamics/packs/r_pack_temp", 10, false, true, false)
--apu
Apu_start_position = globalProperty("sim/cockpit2/electrical/APU_starter_switch") --apu start button state 0: off, 1: on, 2: avail
Apu_avail = createGlobalPropertyi("a321neo/engine/apu_avil", 0, false, true, false)
Apu_gen_load = createGlobalPropertyf("a321neo/cockpit/apu/gen_load", 0, false, true, false)
Apu_gen_volts = createGlobalPropertyf("a321neo/cockpit/apu/gen_volts", 0, false, true, false)
Apu_gen_hz = createGlobalPropertyf("a321neo/cockpit/apu/gen_hz", 0, false, true, false)
Apu_bleed_psi = createGlobalPropertyf("a321neo/cockpit/apu/bleed_psi", 0, false, true, false)
Apu_bleed_state = createGlobalPropertyi("a321neo/apu/apu_bleed_state", 0, false, true, false)--0apu off bleed off, 1apu on bleed off, 2apu on bleed on(for ECAM!!!)
Apu_gen_state = createGlobalPropertyi("a321neo/cockpit/apu/apu_gen_state", 0, false, true, false)--0apu off gen off, 1apu on gen off, 2apu on gen on(for ECAM!!!)
--FBW
FBW_status = createGlobalPropertyi("a321neo/dynamics/FBW/FBW_status", 2, false, true, false)--2=NORMAL law, 1=ALT2 law, 0==DIRECT law
FBW_pitch_mode = createGlobalPropertyi("a321neo/dynamics/FBW/FBW_pitch_mode", 2, false, true, false)--0=holding pitch(stable), 1=holding vpath(unstable) 2=holding persec vpath(more stable) 3=holding 1G(most accurate)
FBW_ground_mode = createGlobalPropertyi("a321neo/dynamics/FBW/in_ground_mode", 0, false, true, false)--if the aircraft is on ground and FBW is in normal law
FBW_flare_mode = createGlobalPropertyi("a321neo/dynamics/FBW/in_flare_mode", 0, false, true, false)--if the aircraft is in flare mode
FBW_flaring = createGlobalPropertyi("a321neo/dynamics/FBW/in_flaring", 0, false, true, false)--if the FBW is synthesising a flare
Roll_l_lim = createGlobalPropertyf("a321neo/dynamics/FBW/roll_l_lim", 0, false, true, false)
Roll_r_lim = createGlobalPropertyf("a321neo/dynamics/FBW/roll_r_lim", 0, false, true, false)
Pitch_u_lim = createGlobalPropertyf("a321neo/dynamics/FBW/pitch_u_lim", 0, false, true, false)
Pitch_d_lim = createGlobalPropertyf("a321neo/dynamics/FBW/pitch_d_lim", 0, false, true, false)
AOA_lim = createGlobalPropertyf("a321neo/dynamics/FBW/AOA_lim", 0, false, true, false)
MAX_spd_lim = createGlobalPropertyf("a321neo/dynamics/FBW/MAX_spd_lim", 0, false, true, false)
Roll_rate_command = createGlobalPropertyf("a321neo/dynamics/FBW/roll_rate_command", 0, false, true, false)--15 degrees max for normal law, 30 degrees in ALT2 or DIRECT
Roll_rate_output = createGlobalPropertyf("a321neo/dynamics/FBW/roll_rate_output", 0, false, true, false)
G_load_command = createGlobalPropertyf("a321neo/dynamics/FBW/G_load_command", 1, false, true, false)--2.5G to -1G in normal flight, with flaps 2G to 0G
Neutral_G_output = createGlobalPropertyf("a321neo/dynamics/FBW/1_G_output", 0, false, true, false)
G_output = createGlobalPropertyf("a321neo/dynamics/FBW/G_output", 0, false, true, false)
Vpath_output = createGlobalPropertyf("a321neo/dynamics/FBW/vpath_output", 0, false, true, false)
Abs_pitch_rate = createGlobalPropertyf("a321neo/dynamics/FBW/abs_Q", 0, false, true, false)
Abs_vpath_pitch_rate = createGlobalPropertyf("a321neo/dynamics/FBW/abs_vpath_Q", 0, false, true, false)
ELAC_1 = createGlobalPropertyi("a321neo/dynamics/FBW/ELAC_1", 1, false, true, false)--elevator aileron computer 1
ELAC_2 = createGlobalPropertyi("a321neo/dynamics/FBW/ELAC_2", 1, false, true, false)--elevator aileron computer 2
FAC_1 = createGlobalPropertyi("a321neo/dynamics/FBW/FAC_1", 1, false, true, false)--flight augmentation computer 1
FAC_2 = createGlobalPropertyi("a321neo/dynamics/FBW/FAC_2", 1, false, true, false)--flight augmentation computer 2
SEC_1 = createGlobalPropertyi("a321neo/dynamics/FBW/SEC_1", 1, false, true, false)--spoiler elevator computer 1
SEC_2 = createGlobalPropertyi("a321neo/dynamics/FBW/SEC_2", 1, false, true, false)--spoiler elevator computer 2
SEC_3 = createGlobalPropertyi("a321neo/dynamics/FBW/SEC_3", 1, false, true, false)--spoiler elevator computer 3

-- Electrical system
--- BUSES (0: not providing elec power, 1: providing elec power) - influenced by switches, faults, engine status etc.
Commercial_pwrd = createGlobalPropertyi("a321neo/dynamics/electrical/bus/commercial_powered", 0, false, true, false)
Gally_pwrd      = createGlobalPropertyi("a321neo/dynamics/electrical/bus/galley_powered", 0, false, true, false)
HOT_bus_1_pwrd  = createGlobalPropertyi("a321neo/dynamics/electrical/bus/hot_1_powered", 0, false, true, false)
HOT_bus_2_pwrd  = createGlobalPropertyi("a321neo/dynamics/electrical/bus/hot_2_powered", 0, false, true, false)
DC_ess_bus_pwrd = createGlobalPropertyi("a321neo/dynamics/electrical/bus/dc_ess_powered", 0, false, true, false)
DC_shed_ess_pwrd= createGlobalPropertyi("a321neo/dynamics/electrical/bus/dc_ess_shed_powered", 0, false, true, false)
DC_bat_bus_pwrd = createGlobalPropertyi("a321neo/dynamics/electrical/bus/dc_bat_powered", 0, false, true, false)
DC_bus_1_pwrd   = createGlobalPropertyi("a321neo/dynamics/electrical/bus/dc_1_powered", 0, false, true, false)
DC_bus_2_pwrd   = createGlobalPropertyi("a321neo/dynamics/electrical/bus/dc_2_powered", 0, false, true, false)
AC_ess_bus_pwrd = createGlobalPropertyi("a321neo/dynamics/electrical/bus/ac_ess_powered", 0, false, true, false)
AC_ess_shed_pwrd= createGlobalPropertyi("a321neo/dynamics/electrical/bus/ac_ess_shed_powered", 0, false, true, false)
AC_bus_1_pwrd   = createGlobalPropertyi("a321neo/dynamics/electrical/bus/ac_1_powered", 0, false, true, false)
AC_bus_2_pwrd   = createGlobalPropertyi("a321neo/dynamics/electrical/bus/ac_2_powered", 0, false, true, false)
AC_STAT_INV_pwrd= createGlobalPropertyi("a321neo/dynamics/electrical/bus/ac_stat_inv", 0, false, true, false) -- This is powered on ground when stat. inverter is active


--- TRS/INV (0: not working, 1: working) - influenced by switches, faults, etc.
TR_ESS_online = createGlobalPropertyi("a321neo/dynamics/electrical/trs/tr_ess_online", 0, false, true, false)
TR_1_online   = createGlobalPropertyi("a321neo/dynamics/electrical/trs/tr_1_online", 0, false, true, false)
TR_2_online   = createGlobalPropertyi("a321neo/dynamics/electrical/trs/tr_2_online", 0, false, true, false)
INV_online   = createGlobalPropertyi("a321neo/dynamics/electrical/trs/INV_online", 0, false, true, false)

--- ELEC sources (0: not providing elec power, 1: providing elec power) - influenced by switches, faults, etc.
Gen_1_pwr  = createGlobalPropertyi("a321neo/dynamics/electrical/sources/gen_1_pwr", 0, false, true, false)
Gen_2_pwr  = createGlobalPropertyi("a321neo/dynamics/electrical/sources/gen_2_pwr", 0, false, true, false)
Gen_APU_pwr = createGlobalPropertyi("a321neo/dynamics/electrical/sources/gen_APU_pwr", 0, false, true, false) -- See also Apu_gen_state
Gen_EXT_pwr = createGlobalPropertyi("a321neo/dynamics/electrical/sources/gen_EXT_pwr", 0, false, true, false)
Gen_EMER_pwr = createGlobalPropertyi("a321neo/dynamics/electrical/sources/gen_EMER_pwr", 0, false, true, false)
Gen_1_line_active = createGlobalPropertyi("a321neo/dynamics/electrical/gen_1_line_active", 0, false, true, false)   -- GEN 1 Line has been pressed, 0 normal 

IDG_1_temp = createGlobalPropertyf("a321neo/dynamics/electrical/IDG_1_temp", 0, false, true, false)
IDG_2_temp = createGlobalPropertyf("a321neo/dynamics/electrical/IDG_2_temp", 0, false, true, false)

--ADIRS
Adirs_adr_is_ok = {}
Adirs_adr_is_ok[1] = createGlobalPropertyf("a321neo/cockpit/ADIRS/adr_1_is_ok", 0, false, true, false)  -- 0: not working (failed or off), 1: working
Adirs_adr_is_ok[2] = createGlobalPropertyf("a321neo/cockpit/ADIRS/adr_2_is_ok", 0, false, true, false)  -- 0: not working (failed or off), 1: working
Adirs_adr_is_ok[3] = createGlobalPropertyf("a321neo/cockpit/ADIRS/adr_3_is_ok", 0, false, true, false)  -- 0: not working (failed or off), 1: working

Adirs_ir_is_ok = {}
Adirs_ir_is_ok[1] = createGlobalPropertyf("a321neo/cockpit/ADIRS/irs_1_is_ok", 0, false, true, false)  -- 0: not working (failed or off or not aligned), 1: working
Adirs_ir_is_ok[2] = createGlobalPropertyf("a321neo/cockpit/ADIRS/irs_2_is_ok", 0, false, true, false)  -- 0: not working (failed or off or not aligned), 1: working
Adirs_ir_is_ok[3] = createGlobalPropertyf("a321neo/cockpit/ADIRS/irs_3_is_ok", 0, false, true, false)  -- 0: not working (failed or off or not aligned), 1: working

Adirs_total_time_to_align = createGlobalPropertyf("a321neo/cockpit/ADIRS/total_time", 0, false, true, false)  -- Total time (depending on latitude, to align the IRS)
Adirs_irs_begin_time = {}
Adirs_irs_begin_time[1] = createGlobalPropertyf("a321neo/cockpit/ADIRS/irs_1_time_begin_align", 0, false, true, false)  -- Time from the begin of alignment of IRS1
Adirs_irs_begin_time[2] = createGlobalPropertyf("a321neo/cockpit/ADIRS/irs_2_time_begin_align", 0, false, true, false)  -- Time from the begin of alignment of IRS2
Adirs_irs_begin_time[3] = createGlobalPropertyf("a321neo/cockpit/ADIRS/irs_3_time_begin_align", 0, false, true, false)  -- Time from the begin of alignment of IRS3
--doors
Door_1_l_ratio = createGlobalPropertyf("a321neo/dynamics/door/door_1_l_rat", 0, false, true, false)
Door_1_r_ratio = createGlobalPropertyf("a321neo/dynamics/door/door_1_r_rat", 0, false, true, false)
Door_2_l_ratio = createGlobalPropertyf("a321neo/dynamics/door/door_2_l_rat", 0, false, true, false)
Door_2_r_ratio = createGlobalPropertyf("a321neo/dynamics/door/door_2_r_rat", 0, false, true, false)
Door_3_l_ratio = createGlobalPropertyf("a321neo/dynamics/door/door_3_l_rat", 0, false, true, false)
Door_3_r_ratio = createGlobalPropertyf("a321neo/dynamics/door/door_3_r_rat", 0, false, true, false)
Overwing_exit_1_l_ratio = createGlobalPropertyf("a321neo/dynamics/door/overwing_exit_1_l_rat", 0, false, true, false)
Overwing_exit_1_r_ratio = createGlobalPropertyf("a321neo/dynamics/door/overwing_exit_1_r_rat", 0, false, true, false)
Overwing_exit_2_l_ratio = createGlobalPropertyf("a321neo/dynamics/door/overwing_exit_2_l_rat", 0, false, true, false)
Overwing_exit_2_r_ratio = createGlobalPropertyf("a321neo/dynamics/door/overwing_exit_2_r_rat", 0, false, true, false)
Cargo_1_ratio = createGlobalPropertyf("a321neo/dynamics/door/cargo_1_rat", 0, false, true, false)
Cargo_2_ratio = createGlobalPropertyf("a321neo/dynamics/door/cargo_2_rat", 0, false, true, false)

-- EWD
EWD_left_memo = {}
EWD_left_memo_group = {}
EWD_left_memo_colors = {}
EWD_left_memo_group_colors = {}
for i=0,6 do
	EWD_left_memo[i] = createGlobalPropertys("a321neo/cockpit/EWD/EWD_left_memo[".. i .. "]", "", false, true, false)
	EWD_left_memo_group[i] = createGlobalPropertys("a321neo/cockpit/EWD/EWD_left_memo_group[".. i .. "]", "", false, true, false)
	EWD_left_memo_colors[i] = createGlobalPropertyi("a321neo/cockpit/EWD/EWD_left_memo_colors[".. i .. "]", 0, false, true, false)
	EWD_left_memo_group_colors[i] = createGlobalPropertyi("a321neo/cockpit/EWD/EWD_left_memo_group_colors[".. i .. "]", 0, false, true, false)
end
EWD_right_memo = {}
EWD_right_memo_colors = {}
for i=0,6 do
	EWD_right_memo[i] = createGlobalPropertys("a321neo/cockpit/EWD/EWD_right_memo[".. i .. "]", "", false, true, false)
	EWD_right_memo_colors[i] = createGlobalPropertyi("a321neo/cockpit/EWD/EWD_right_memo_colors[".. i .. "]", 0, false, true, false)
end
EWD_flight_phase = createGlobalPropertyi("a321neo/cockpit/EWD/flight_phase", 0, false, true, false)
EWD_is_to_memo_showed  = createGlobalPropertyi("a321neo/cockpit/EWD/to_memo_showed", 0, false, true, false)
EWD_is_ldg_memo_showed = createGlobalPropertyi("a321neo/cockpit/EWD/ldg_memo_showed", 0, false, true, false)
EWD_box_adv         = createGlobalPropertyi("a321neo/cockpit/EWD/box_adv", 0, false, true, false) -- Advisory box: 1 displayed, 0 hidden
EWD_box_sts         = createGlobalPropertyi("a321neo/cockpit/EWD/box_sts", 0, false, true, false) -- STS box: 1 displayed, 0 hidden
EWD_arrow_overflow  = createGlobalPropertyi("a321neo/cockpit/EWD/arrow_overflow", 0, false, true, false) -- Overflow arrow: 1 displayed, 0 hidden
TO_Config_is_ready  = createGlobalPropertyi("a321neo/cockpit/EWD/to_config_ready", 0, false, true, false) -- TO Config: 1 executed OK, 0 not executed or error
TO_Config_is_pressed= createGlobalPropertyi("a321neo/cockpit/EWD/to_config_pressed", 0, false, true, false) -- TO Config: 1 pressed, 0 not pressed
EWD_show_normal     = createGlobalPropertyi("a321neo/cockpit/EWD/show_normal_msg", 0, false, true, false) -- Time value to trigger "NORMAL" message on EWD (set this to get(TIME) to show the message)
EWD_is_clerable     = createGlobalPropertyi("a321neo/cockpit/EWD/is_clearable", 0, false, true, false) -- used when a message is clearable but do not show a ECAM page

-- ECAM
Ecam_is_sts_clearable = createGlobalPropertyi("a321neo/cockpit/ecam/is_sts_clearable", 0, false, true, false) -- 0: NO, 1: YES, this is used to decide whether CLR clear the EDW or the STS page
Ecam_EDW_requested_page = createGlobalPropertyi("a321neo/cockpit/ecam/edw_requested_page", 0, false, true, false) -- Page requested by EDW (can be overriden by pilot action)
Ecam_current_status = createGlobalPropertyi("a321neo/cockpit/ecam/internal_status", 0, false, true, false) -- Internal status for ECAM, please check ECAM-automation.lua for values
Ecam_sts_scroll_page = createGlobalPropertyi("a321neo/cockpit/ecam/sts_scroll_page", 0, false, true, false) --Current scroll page for STS, 0 is the first page
Ecam_arrow_overflow = createGlobalPropertyi("a321neo/cockpit/ecam/arrow_overflow", 0, false, true, false) -- Overflow arrow: 1 displayed, 0 hidden

--global dataref variable from the Sim--
--camera
Head_x = globalProperty("sim/graphics/view/pilots_head_x")
Head_y = globalProperty("sim/graphics/view/pilots_head_y")
Head_z = globalProperty("sim/graphics/view/pilots_head_z")
Head_phi = globalProperty("sim/graphics/view/pilots_head_phi")--roll
Head_psi = globalProperty("sim/graphics/view/pilots_head_psi")--yaw
Head_the = globalProperty("sim/graphics/view/pilots_head_the")--pitch
--autopilot
Flight_director_1_mode = globalProperty("sim/cockpit2/autopilot/flight_director_mode")
Flight_director_2_mode = globalProperty("sim/cockpit2/autopilot/flight_director2_mode")

--electrical system
XP_Battery_1 = globalProperty("sim/cockpit2/electrical/battery_on[0]")
XP_Battery_2 = globalProperty("sim/cockpit2/electrical/battery_on[1]")
--fuel
Fuel_pump_1 = globalProperty("sim/cockpit2/engine/actuators/fuel_pump_on[0]")
Fuel_pump_2 = globalProperty("sim/cockpit2/engine/actuators/fuel_pump_on[1]")
Fuel_pump_3 = globalProperty("sim/cockpit2/engine/actuators/fuel_pump_on[2]")
Fuel_pump_4 = globalProperty("sim/cockpit2/engine/actuators/fuel_pump_on[3]")
Fuel_pump_5 = globalProperty("sim/cockpit2/engine/actuators/fuel_pump_on[4]")
Fuel_pump_6 = globalProperty("sim/cockpit2/engine/actuators/fuel_pump_on[5]")
Fuel_pump_7 = globalProperty("sim/cockpit2/engine/actuators/fuel_pump_on[6]")
Fuel_pump_8 = globalProperty("sim/cockpit2/engine/actuators/fuel_pump_on[7]")
--ENG and APU
Engine_1_avail = globalProperty("sim/flightmodel/engine/ENGN_running[0]")
Engine_2_avail = globalProperty("sim/flightmodel/engine/ENGN_running[1]")
Eng_1_N1 = globalProperty("sim/flightmodel2/engines/N1_percent[0]")
Eng_2_N1 = globalProperty("sim/flightmodel2/engines/N1_percent[1]")
Eng_1_EGT_c = globalProperty("sim/cockpit2/engine/indicators/EGT_deg_C[0]")
Eng_2_EGT_c = globalProperty("sim/cockpit2/engine/indicators/EGT_deg_C[1]")
Eng_1_N2 = globalProperty("sim/flightmodel2/engines/N2_percent[0]")
Eng_2_N2 = globalProperty("sim/flightmodel2/engines/N2_percent[1]")
Eng_1_FF_kgs = globalProperty("sim/cockpit2/engine/indicators/fuel_flow_kg_sec[0]")
Eng_2_FF_kgs = globalProperty("sim/cockpit2/engine/indicators/fuel_flow_kg_sec[1]")
Apu_N1 = globalProperty("sim/cockpit2/electrical/APU_N1_percent")
APU_EGT = globalProperty("sim/cockpit2/electrical/APU_EGT_c")
Eng_1_reverser_deployment = globalProperty("sim/flightmodel2/engines/thrust_reverser_deploy_ratio[0]")
Eng_2_reverser_deployment = globalProperty("sim/flightmodel2/engines/thrust_reverser_deploy_ratio[1]")

Eng_1_Fire_valve = createGlobalPropertyi("a321neo/dynamics/engines/fire_valve_1", 0, false, true, false) -- 0 open - normal, 1 - closed - fire pushbutton triggered
Eng_2_Fire_valve = createGlobalPropertyi("a321neo/dynamics/engines/fire_valve_2", 0, false, true, false) -- 0 open - normal, 1 - closed - fire pushbutton triggered

--PACKs system
Apu_bleed_switch = globalProperty("sim/cockpit2/bleedair/actuators/apu_bleed")
ENG_1_bleed_switch = globalProperty("sim/cockpit2/bleedair/actuators/engine_bleed_sov[0]")
ENG_2_bleed_switch = globalProperty("sim/cockpit2/bleedair/actuators/engine_bleed_sov[1]")
Left_bleed_avil = globalProperty("sim/cockpit2/bleedair/indicators/bleed_available_left")
Mid_bleed_avil = globalProperty("sim/cockpit2/bleedair/indicators/bleed_available_center")
Right_bleed_avil = globalProperty("sim/cockpit2/bleedair/indicators/bleed_available_right")
Pack_L = globalProperty("sim/cockpit2/bleedair/actuators/pack_left")
Pack_M = globalProperty("sim/cockpit2/bleedair/actuators/pack_center") --needs to be turned off as the A320 does not have one
Pack_R = globalProperty("sim/cockpit2/bleedair/actuators/pack_right")
Sim_pack_flow = globalProperty("sim/cockpit2/pressurization/actuators/fan_setting") --Electric fan (vent blower) setting, consuming 0.1 of rel_HVAVC amps when running. 0 = Auto (Runs whenever air_cond_on or heater_on is on), 1 = Low, 2 = High
Left_pack_iso_valve = globalProperty("sim/cockpit2/bleedair/actuators/isol_valve_left") --Isolation Valve for left duct, close or open. This separates all engines on the left side of the plane, the left wing, and the left pack from the rest of the system
Right_pack_iso_valve = globalProperty("sim/cockpit2/bleedair/actuators/isol_valve_right") --Isolation Valve for right duct, close or open. This separates all engines on the right side of the plane, the right wing, and the right pack from the rest of the system
Cabin_delta_psi = globalProperty("sim/cockpit2/pressurization/indicators/pressure_diffential_psi")
Set_cabin_alt_ft = globalProperty("sim/cockpit2/pressurization/actuators/cabin_altitude_ft")
Cabin_alt_ft = globalProperty("sim/cockpit2/pressurization/indicators/cabin_altitude_ft")
Set_cabin_vs = globalProperty("sim/cockpit2/pressurization/actuators/cabin_vvi_fpm")
Cabin_vs = globalProperty("sim/cockpit2/pressurization/indicators/cabin_vvi_fpm")
Out_flow_valve_ratio = globalProperty("sim/cockpit2/pressurization/indicators/outflow_valve")
--instruments
VVI = globalProperty("sim/cockpit2/gauges/indicators/vvi_fpm_pilot")
OTA = globalProperty("sim/cockpit2/temperature/outside_air_temp_degc")
TAT = globalProperty("sim/weather/temperature_le_c")
Gross_weight = globalProperty ("sim/flightmodel/weight/m_total")
Capt_ra_alt_ft = globalProperty("sim/cockpit2/gauges/indicators/radio_altimeter_height_ft_pilot")
Fo_ra_alt_ft = globalProperty("sim/cockpit2/gauges/indicators/radio_altimeter_height_ft_copilot")
Capt_baro_alt_ft = globalProperty("sim/cockpit2/gauges/indicators/altitude_ft_pilot")
IAS = globalProperty("sim/flightmodel/position/indicated_airspeed")
DH_alt_ft = globalProperty("sim/cockpit/misc/radio_altimeter_minimum")


Capt_IAS     = globalProperty("sim/cockpit2/gauges/indicators/airspeed_kts_pilot")   -- Consider to use PFD_Capt_IAS instead (check cockpit_datarefs.lua)
Fo_IAS       = globalProperty("sim/cockpit2/gauges/indicators/airspeed_kts_copilot") -- Consider to use PFD_Fo_IAS instead (check cockpit_datarefs.lua)
Capt_Baro_Alt= globalProperty("sim/cockpit2/gauges/indicators/altitude_ft_pilot")    -- Consider to use PFD_Capt_Baro_Altitude instead (check cockpit_datarefs.lua)
Fo_Baro_Alt  = globalProperty("sim/cockpit2/gauges/indicators/altitude_ft_copilot")  -- Consider to use PFD_Fo_Baro_Altitude instead (check cockpit_datarefs.lua)
Capt_VVI     = globalProperty("sim/cockpit2/gauges/indicators/vvi_fpm_pilot")        -- Consider to use PFD_Capt_VS instead (check cockpit_datarefs.lua)
Fo_VVI       = globalProperty("sim/cockpit2/gauges/indicators/vvi_fpm_copilot")      -- Consider to use PFD_Fo_VS instead (check cockpit_datarefs.lua)
Capt_Mach    = globalProperty("sim/cockpit2/gauges/indicators/mach_pilot")
Fo_Mach    = globalProperty("sim/cockpit2/gauges/indicators/mach_copilot")

Stby_Alt     = globalProperty("sim/cockpit2/gauges/indicators/altitude_ft_stby")     -- Altitude in the stdby instrument
Stby_IAS     = globalProperty("sim/cockpit2/gauges/indicators/airspeed_kts_stby")    -- IAS in the stdby instrument
Stby_Baro    = globalProperty("sim/cockpit2/gauges/actuators/barometer_setting_in_hg_stby") -- Baro settings for STBY

--gear
Autobrakes_sim = globalProperty("sim/cockpit2/switches/auto_brake_level")--0RTO, 1off, 2, 3, 4, 5
Gear_handle = globalProperty("sim/cockpit2/controls/gear_handle_down")
Front_gear_deployment = globalProperty("sim/flightmodel2/gear/deploy_ratio[0]")
Left_gear_deployment = globalProperty("sim/flightmodel2/gear/deploy_ratio[1]")
Right_gear_deployment = globalProperty("sim/flightmodel2/gear/deploy_ratio[2]")
Ground_speed_ms = globalProperty("sim/flightmodel/position/groundspeed")
Actual_brake_ratio = globalProperty("sim/flightmodel/controls/parkbrake")
--position
Aircraft_lat = globalProperty("sim/flightmodel/position/latitude")
Aircraft_long = globalProperty("sim/flightmodel/position/longitude")
Elevation_m = globalProperty("sim/flightmodel/position/elevation")
Distance_traveled_m = globalProperty("sim/flightmodel/controls/dist")
--weights
FOB = globalProperty("sim/flightmodel/weight/m_fuel_total")
--time
ZULU_hours = globalProperty("sim/cockpit2/clock_timer/zulu_time_hours")
ZULU_mins = globalProperty("sim/cockpit2/clock_timer/zulu_time_minutes")
ZULU_secs = globalProperty("sim/cockpit2/clock_timer/zulu_time_seconds")

-- Misc
Sun_pitch  = globalProperty("sim/graphics/scenery/sun_pitch_degrees")
is_RAT_out = createGlobalPropertyi("a321neo/dynamics/is_RAT_out", 0, false, true, false)-- Is Ram Air Turbine out? 0: no, 1: yes (it does NOT mean that the generator is on)

-- ACARS & DCDU
Acars_status = createGlobalPropertyi("a321neo/dynamics/ACARS/comm_status", 0, false, true, false) -- 0 no connection, 1 - SATCOM only, 2 - VHF only, 3 - Both
Acars_incoming_message = createGlobalPropertys("a321neo/dynamics/ACARS/incoming_msg", "", false, true, false) -- Message that is currently receiving
Acars_incoming_message_type = createGlobalPropertyi("a321neo/dynamics/ACARS/incoming_msg_type", 0, false, true, false) -- Type of message that is currently receiving, 0 - no message
Acars_incoming_message_length = createGlobalPropertyi("a321neo/dynamics/ACARS/incoming_msg_len", 0, false, true, false) -- Length of the message (do not use string.len, it doesn't work)

-- HYD
Hydraulic_G_press    = createGlobalPropertyi("a321neo/dynamics/HYD/G_press", 0, false, true, false)
Hydraulic_B_press    = createGlobalPropertyi("a321neo/dynamics/HYD/B_press", 0, false, true, false)
Hydraulic_Y_press    = createGlobalPropertyi("a321neo/dynamics/HYD/Y_press", 0, false, true, false)
Hydraulic_G_qty      = createGlobalPropertyf("a321neo/dynamics/HYD/G_qty", 0, false, true, false) -- In percentage 0;1
Hydraulic_B_qty      = createGlobalPropertyf("a321neo/dynamics/HYD/B_qty", 0, false, true, false) -- In percentage 0;1
Hydraulic_Y_qty      = createGlobalPropertyf("a321neo/dynamics/HYD/Y_qty", 0, false, true, false) -- In percentage 0;1
Hydraulic_PTU_status = createGlobalPropertyi("a321neo/dynamics/HYD/PTU_status", 0, false, true, false) -- 0: OFF, 1: ON idle, 2: ON Y->G, 3: G->Y
Hydraulic_RAT_status = createGlobalPropertyi("a321neo/dynamics/HYD/RAT_status", 0, false, true, false) -- 0: OFF ready, 1: Running OK, 2: FAULT or low speed

--aircraft limits
Capt_VMAX_prot =   createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/capt_vmax_prot_speed", 0, false, true, false)--uses different pilot's mach
Fo_VMAX_prot =	   createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/fo_vmax_prot_speed", 0, false, true, false)
Capt_VMAX =		   createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/capt_vmax_speed", 0, false, true, false)--uses different pilot's mach
Fo_VMAX =		   createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/fo_vmax_speed", 0, false, true, false)
S_speed = 		   createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/s_speed", 0, false, true, false)
F_speed = 		   createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/f_speed", 0, false, true, false)
VLS = 			   createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/vls_speed", 0, false, true, false)
Capt_GD =		   createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/capt_green_dot_speed", 0, false, true, false)--uses different pilot's baro alt
Fo_GD = 		   createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/fo_green_dot_speed", 0, false, true, false)
Capt_VSW = 		   createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/capt_stall_warning_speed", 0, false, true, false)--uses different pilot's alpha
Fo_VSW = 		   createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/fo_stall_warning_speed", 0, false, true, false)
Capt_Valpha_prot = createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/capt_alpha_prot_speed", 0, false, true, false)--uses different pilot's alpha
Fo_Valpha_prot =   createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/fo_alpha_prot_speed", 0, false, true, false)
Capt_Vtoga_prot =  createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/capt_toga_prot_speed", 0, false, true, false)--uses different pilot's alpha
Fo_Vtoga_prot =    createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/fo_toga_prot_speed", 0, false, true, false)
Capt_Valpha_MAX =  createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/capt_alpha_max_speed", 0, false, true, false)--uses different pilot's alpha
Fo_Valpha_MAX =    createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/fo_alpha_max_speed", 0, false, true, false)
--value deltas
Capt_VMAX_prot_delta =	 createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/capt_vmax_prot", 0, false, true, false)--uses different pilot's mach
Fo_VMAX_prot_delta =	 createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/fo_vmax_prot", 0, false, true, false)
Capt_VMAX_delta =		 createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/capt_vmax", 0, false, true, false)--uses different pilot's mach
Fo_VMAX_delta =		   	 createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/fo_vmax", 0, false, true, false)
Capt_S_speed_delta = 	 createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/capt_s", 0, false, true, false)--uses different pilot's IAS
Fo_S_speed_delta = 		 createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/fo_s", 0, false, true, false)
Capt_F_speed_delta = 	 createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/capt_f", 0, false, true, false)--uses different pilot's IAS
Fo_F_speed_delta = 		 createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/fo_f", 0, false, true, false)
Capt_VLS_delta = 		 createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/capt_vls", 0, false, true, false)--uses different pilot's IAS
Fo_VLS_delta = 			 createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/fo_vls", 0, false, true, false)
Capt_GD_delta =		   	 createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/capt_green_dot", 0, false, true, false)--uses different pilot's baro alt
Fo_GD_delta = 		     createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/fo_green_dot", 0, false, true, false)
Capt_VSW_delta = 		 createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/capt_stall_warning", 0, false, true, false)--uses different pilot's alpha
Fo_VSW_delta = 		   	 createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/fo_stall_warning", 0, false, true, false)
Capt_Valpha_prot_delta = createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/capt_alpha_prot", 0, false, true, false)--uses different pilot's alpha
Fo_Valpha_prot_delta =   createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/fo_alpha_prot", 0, false, true, false)
Capt_Vtoga_prot_delta =  createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/capt_toga_prot", 0, false, true, false)--uses different pilot's alpha
Fo_Vtoga_prot_delta =    createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/fo_toga_prot", 0, false, true, false)
Capt_Valpha_MAX_delta =  createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/capt_alpha_max", 0, false, true, false)--uses different pilot's alpha
Fo_Valpha_MAX_delta =    createGlobalPropertyf("a321neo/dynamics/FBW/limit_speeds/delta/fo_alpha_max", 0, false, true, false)

Aircraft_total_weight_kgs = globalProperty("sim/flightmodel/weight/m_total")

--flight controls
Roll = globalProperty("sim/joystick/yoke_roll_ratio")
Pitch = globalProperty("sim/joystick/yoke_pitch_ratio")
Yaw = globalProperty("sim/joystick/yoke_heading_ratio")
Roll_artstab = globalProperty("sim/joystick/artstab_roll_ratio")
Pitch_artstab = globalProperty("sim/joystick/artstab_pitch_ratio")
Yaw_artstab = globalProperty("sim/joystick/artstab_heading_ratio")
Servo_roll = globalProperty("sim/joystick/servo_roll_ratio")
Servo_pitch = globalProperty("sim/joystick/servo_pitch_ratio")
Servo_yaw = globalProperty("sim/joystick/servo_heading_ratio")
Speedbrake_handle_ratio = globalProperty("sim/cockpit2/controls/speedbrake_ratio")
Flightmodel_roll = globalProperty("sim/flightmodel/position/true_phi")
Flightmodel_pitch = globalProperty("sim/flightmodel/position/true_theta")
Elev_trim_ratio = globalProperty("sim/cockpit2/controls/elevator_trim")
Rudder_trim_ratio = globalProperty("sim/cockpit2/controls/rudder_trim")
Horizontal_stabilizer_pitch = globalProperty("sim/flightmodel2/controls/stabilizer_deflection_degrees")
Override_artstab = globalProperty("sim/operation/override/override_artstab")
Override_control_surfaces = globalProperty("sim/operation/override/override_control_surfaces")
Total_vertical_g_load = globalProperty("sim/flightmodel/forces/g_nrml")
Roll_rate = globalProperty("sim/flightmodel/position/P")
Pitch_rate = globalProperty("sim/flightmodel/position/Q")
Vpath = globalProperty("sim/flightmodel/position/vpath")
Alpha = globalProperty("sim/flightmodel/position/alpha")

--surfaces
--dev & debuging
FBW_kill_switch = createGlobalPropertyi("a321neo/dynamics/FBW/debug/kill_switch", 1, false, true, false)
--animations
Trim_wheel_smoothing_on = createGlobalPropertyi("a321neo/dynamics/FBW/animation/trim_wheel_smoothing_on", 1, false, true, false)--is the trim wheel is smoothed
--flight envelope "sensors"
Vpath_pitch_rate = createGlobalPropertyf("a321neo/dynamics/FBW/aerodynamics/vpath_Q", 0, false, true, false)
True_roll_rate = createGlobalPropertyf("a321neo/dynamics/FBW/aerodynamics/true_P", 0, false, true, false)--true roll rate(in relation to the previous reference frame instead of the flight path)
--flight computers status
ELAC_1_status = createGlobalPropertyi("a321neo/dynamics/FBW/flight_computers/elac_1_status", 1, false, true, false)--elevator aileron computer(protection outputs)
ELAC_2_status = createGlobalPropertyi("a321neo/dynamics/FBW/flight_computers/elac_2_status", 1, false, true, false)
FAC_1_status = 	createGlobalPropertyi("a321neo/dynamics/FBW/flight_computers/fac_1_status",  1, false, true, false)--flight augmentation computer(speeds calculations)
FAC_2_status = 	createGlobalPropertyi("a321neo/dynamics/FBW/flight_computers/fac_2_status",  1, false, true, false)
SEC_1_status = 	createGlobalPropertyi("a321neo/dynamics/FBW/flight_computers/sec_1_status",  1, false, true, false)--spolier and elevator computer
SEC_2_status = 	createGlobalPropertyi("a321neo/dynamics/FBW/flight_computers/sec_2_status",  1, false, true, false)
SEC_3_status = 	createGlobalPropertyi("a321neo/dynamics/FBW/flight_computers/sec_3_status",  1, false, true, false)
--ailerons
Left_aileron =  globalProperty("sim/flightmodel/controls/wing4l_ail1def") -- -25 deg up 25 deg down
Right_aileron = globalProperty("sim/flightmodel/controls/wing4r_ail1def") -- -25 deg up 25 deg down
--spoilers
Speedbrakes_ratio = globalProperty("sim/flightmodel2/controls/speedbrake_ratio")--used to enable the rotation of spoiler 2 & 3 feed the sum of sidestick input & speedbrake handle in
Left_spoiler_1 =  globalProperty("sim/flightmodel/controls/wing2l_spo1def")
Left_spoiler_2 =  globalProperty("sim/flightmodel2/wing/speedbrake1_deg[4]")
Left_spoiler_3 =  globalProperty("sim/flightmodel2/wing/speedbrake2_deg[4]")
Left_spoiler_4 =  globalProperty("sim/flightmodel/controls/wing3l_spo1def")
Left_spoiler_5 =  globalProperty("sim/flightmodel/controls/wing3l_spo2def")
Right_spoiler_1 = globalProperty("sim/flightmodel/controls/wing2r_spo1def")
Right_spoiler_2 = globalProperty("sim/flightmodel2/wing/speedbrake1_deg[5]")
Right_spoiler_3 = globalProperty("sim/flightmodel2/wing/speedbrake2_deg[5]")
Right_spoiler_4 = globalProperty("sim/flightmodel/controls/wing3r_spo1def")
Right_spoiler_5 = globalProperty("sim/flightmodel/controls/wing3r_spo2def")
--high lift devices
Flaps_handle_ratio = globalProperty("sim/cockpit2/controls/flap_ratio")
Flaps_handle_position = createGlobalPropertyf("a321neo/dynamics/surfaces/flaps_handle_position", 0, false, true, false)--0, 1, 2, 3, full
Flaps_internal_config = createGlobalPropertyf("a321neo/dynamics/surfaces/flaps_internal_config", 0, false, true, false)--0 = clean, 1 = 1, 2 = 1+f, 3 = 2, 4 = 3, 5 = full
Slats =                globalProperty("sim/flightmodel2/controls/slat1_deploy_ratio") --deploys with flaps 0 = 0, 1 = 0.7, 2 = 0.8, 3 = 0.8, 4 = 1
Left_outboard_flaps =  globalProperty("sim/flightmodel/controls/wing3l_fla2def") -- flap detents 0 = 0, 1 = 10, 2 = 15, 3 = 20, 4 = 40
Left_inboard_flaps =   globalProperty("sim/flightmodel/controls/wing2l_fla1def")
Right_inboard_flaps =  globalProperty("sim/flightmodel/controls/wing2r_fla1def")
Right_outboard_flaps = globalProperty("sim/flightmodel/controls/wing3r_fla2def")
SFCC_1_status = 	   createGlobalPropertyi("a321neo/dynamics/FBW/slats_and_flaps/sfcc_1_status", 1, false, true, false)--slats flaps control computer 1
SFCC_2_status = 	   createGlobalPropertyi("a321neo/dynamics/FBW/slats_and_flaps/sfcc_2_status", 1, false, true, false)--slats flaps control computer 2
Slats_ecam_amber = 	   createGlobalPropertyi("a321neo/dynamics/FBW/slats_and_flaps/slats_ecam_amber", 0, false, true, false)--slats indication on the ecam is amber
Slats_in_transit = 	   createGlobalPropertyi("a321neo/dynamics/FBW/slats_and_flaps/slats_in_transit", 0, false, true, false)--slats moving
Flaps_ecam_amber = 	   createGlobalPropertyi("a321neo/dynamics/FBW/slats_and_flaps/flaps_ecam_amber", 0, false, true, false)--flaps indication on the ecam is amber
Flaps_in_transit = 	   createGlobalPropertyi("a321neo/dynamics/FBW/slats_and_flaps/flaps_in_transit", 0, false, true, false)--flaps moving
Flaps_deployed_angle = createGlobalPropertyf("a321neo/dynamics/FBW/slats_and_flaps/flaps_deployed_angle", 0, false, true, false)--0, 0, 10, 15, 20, 40
--stabilizers
Horizontal_stabilizer_deflection = globalProperty("sim/flightmodel2/controls/stabilizer_deflection_degrees")
Elevators_hstab_1 = globalProperty("sim/flightmodel/controls/hstab1_elv1def") --elevators -17 deg down 30 deg up
Elevators_hstab_2 = globalProperty("sim/flightmodel/controls/hstab2_elv1def") --elevators -17 deg down 30 deg up
Rudder = globalProperty("sim/flightmodel/controls/vstab1_rud1def") --rudder 30 deg left -30 deg right
Yaw_lim = createGlobalPropertyf("a321neo/dynamics/FBW/yaw_lim", 30, false, true, false)

-- Fuel
Fuel_quantity = {}
Fuel_quantity[0] =   globalProperty("sim/flightmodel/weight/m_fuel[0]")
Fuel_quantity[1] =   globalProperty("sim/flightmodel/weight/m_fuel[1]")
Fuel_quantity[2] =   globalProperty("sim/flightmodel/weight/m_fuel[2]")
Fuel_quantity[3] =   globalProperty("sim/flightmodel/weight/m_fuel[3]")
Fuel_quantity[4] =   globalProperty("sim/flightmodel/weight/m_fuel[4]")
Fuel_pump_on = {}
Fuel_pump_on[0]  = globalProperty("sim/cockpit2/fuel/fuel_tank_pump_on[0]")
Fuel_pump_on[1]  = globalProperty("sim/cockpit2/fuel/fuel_tank_pump_on[1]")
Fuel_pump_on[2]  = globalProperty("sim/cockpit2/fuel/fuel_tank_pump_on[2]")
Fuel_pump_on[3]  = globalProperty("sim/cockpit2/fuel/fuel_tank_pump_on[3]")
Fuel_pump_on[4]  = globalProperty("sim/cockpit2/fuel/fuel_tank_pump_on[4]")

Fuel_tank_selector_eng_1 = globalProperty("sim/cockpit2/fuel/fuel_tank_selector_left")  -- 0=none,1=left,2=center,3=right,4=all
Fuel_tank_selector_eng_2 = globalProperty("sim/cockpit2/fuel/fuel_tank_selector_right") -- 0=none,1=left,2=center,3=right,4=all

