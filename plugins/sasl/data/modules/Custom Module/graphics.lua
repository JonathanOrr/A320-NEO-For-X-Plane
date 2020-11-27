-------------------------------------------------------------------------------
-- A32NX Freeware Project
-- Copyright (C) 2020
-------------------------------------------------------------------------------
-- LICENSE: GNU General Public License v3.0
--
--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.
--
--    Please check the LICENSE file in the root of the repository for further
--    details or check <https://www.gnu.org/licenses/>
-------------------------------------------------------------------------------
-- File: graphics.lua
-- Short description: Miscellanea related to graphics
-------------------------------------------------------------------------------

local guards = {
    {name = "IDG1"},             -- This creates a command and dataref with the same name, both `a321neo/cockpit/overhead/guards/IDG1`
    {name = "IDG2"},
    {name = "CARGO_DISCH_1"},
    {name = "CARGO_DISCH_2"},
    {name = "MASK_MAN_ON"},
    {name = "ELEC_RAT_MAN_ON"},
    {name = "EMER_GEN_TEST"},
    {name = "RAM_AIR"},
    {name = "DICTHING"},
    {name = "ENG_MAN_START_1"},
    {name = "ENG_MAN_START_2"},
    {name = "CALLS_EMER"},
    {name = "EVAC_COMMAND"},
    {name = "HYD_RAT_MAN_ON"},
    {name = "HYD_BLUE_PUMP"},
    {name = "HIGH_ALT_LANDING"},
    {name = "EMER"},
    {name = "MNTN_BLUE_PUMP"},
    {name = "MNTN_HYD_G"},
    {name = "MNTN_HYD_B"},
    {name = "MNTN_HYD_Y"},
    {name = "MNTN_FADEC_1"},
    {name = "MNTN_FADEC_2"}
}

local ann_lt_pos = 0

----------------------------------------------------------------------------------------------------
-- Command function
----------------------------------------------------------------------------------------------------
function guard_click_handler(phase, object)
    if phase == SASL_COMMAND_BEGIN then
        set(object.state_dataref, 1 - get(object.state_dataref))
    end
end

function knob_light_handler(phase, direction, dr)

end

sasl.registerCommandHandler (Cockpit_light_integral_cmd_up, 0,  function(phase) Knob_handler_up_float(phase, Cockpit_light_integral, 0, 1, 0.05) end)
sasl.registerCommandHandler (Cockpit_light_integral_cmd_dn, 0,  function(phase) Knob_handler_down_float(phase, Cockpit_light_integral, 0, 1, 0.05) end)
sasl.registerCommandHandler (Cockpit_light_flood_main_cmd_up, 0,  function(phase) Knob_handler_up_float(phase, Cockpit_light_flood_main, 0, 1, 0.05) end)
sasl.registerCommandHandler (Cockpit_light_flood_main_cmd_dn, 0,  function(phase) Knob_handler_down_float(phase, Cockpit_light_flood_main, 0, 1, 0.05) end)
sasl.registerCommandHandler (Cockpit_light_flood_ped_cmd_up, 0,  function(phase) Knob_handler_up_float(phase, Cockpit_light_flood_ped, 0, 1, 0.05) end)
sasl.registerCommandHandler (Cockpit_light_flood_ped_cmd_dn, 0,  function(phase) Knob_handler_down_float(phase, Cockpit_light_flood_ped, 0, 1, 0.05) end)
sasl.registerCommandHandler (Cockpit_light_ovhd_cmd_up, 0,  function(phase) Knob_handler_up_float(phase, Cockpit_light_ovhd, 0, 1, 0.05) end)
sasl.registerCommandHandler (Cockpit_light_ovhd_cmd_dn, 0,  function(phase) Knob_handler_down_float(phase, Cockpit_light_ovhd, 0, 1, 0.05) end)

function change_switch(phase, dr, direction)
     if phase == SASL_COMMAND_BEGIN then
        set(dr, Math_clamp(get(dr) + direction, 0, 2))
     end
end 

sasl.registerCommandHandler (Cockpit_light_Capt_console_floor_cmd_up, 0,  function(phase) change_switch(phase, Cockpit_light_Capt_console_floor, 1) end)
sasl.registerCommandHandler (Cockpit_light_Capt_console_floor_cmd_dn, 0,  function(phase) change_switch(phase, Cockpit_light_Capt_console_floor, -1) end)
sasl.registerCommandHandler (Cockpit_light_Fo_console_floor_cmd_up, 0,    function(phase) change_switch(phase, Cockpit_light_Fo_console_floor, 1) end)
sasl.registerCommandHandler (Cockpit_light_Fo_console_floor_cmd_dn, 0,    function(phase) change_switch(phase, Cockpit_light_Fo_console_floor, -1) end)

----------------------------------------------------------------------------------------------------
-- Lights
----------------------------------------------------------------------------------------------------
sasl.registerCommandHandler (Cockpit_ann_ovhd_cmd_up, 0,  function(phase)
    if phase == SASL_COMMAND_BEGIN then
        ann_lt_pos = math.min(ann_lt_pos + 1, 1)
    end
 end)
sasl.registerCommandHandler (Cockpit_ann_ovhd_cmd_dn, 0,  function(phase)
    if phase == SASL_COMMAND_BEGIN then
        ann_lt_pos = math.max(ann_lt_pos - 1, -1)
    end
 end)

----------------------------------------------------------------------------------------------------
-- Initialization function
----------------------------------------------------------------------------------------------------
local function create_drs(object)
    object.dataref = createGlobalPropertyf("a321neo/cockpit/overhead/guards/" .. object.name, 0, false, true, false)
    object.state_dataref = createGlobalPropertyi("a321neo/cockpit/overhead/guards/state/" .. object.name, 0, false, true, false)
    object.command = createCommand("a321neo/cockpit/overhead/guards/" .. object.name, "GUARD - " .. object.name .. " pushbutton")
    sasl.registerCommandHandler (object.command, 0,  function(phase) guard_click_handler(phase, object); return 1 end )
end

local function init_drs(array)
    for i,x in ipairs(guards) do
        create_drs(x)
    end
end

init_drs(guards)

local function anim_light_switches()
    Set_dataref_linear_anim(Cockpit_ann_ovhd_switch, ann_lt_pos, -1, 1, 1)
end

function update()
    perf_measure_start("graphics:update()")

    for i = 1, #guards do
        set(guards[i].dataref, Set_anim_value(get(guards[i].dataref), get(guards[i].state_dataref), 0, 1, 6))
    end
    
    anim_light_switches()
    
    perf_measure_stop("graphics:update()")
end
