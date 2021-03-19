------------------------STUFF YOU CAN MESS WITH
local BUTTON_PRESS_TIME = 0.5
local weight_per_passenger = 90 --kg
local dry_operating_weight = 47777

local max_fwd_cargo = 5700
local max_aft_cargo = 7000

local max_values = {8, 80, 100, 5700, 7000, 40000 }

local default_cg = 25
local final_cg = 0
local predicted_cg = 0

local taxi_fuel = 500

local percent_cg_to_coordinates = {{-9999,471}, {14, 471}, {22, 676}, {30,882}, {38.2,1092}, {9999,1085}}
local tow_to_coordinates = {{-9999,78}, {45,78}, {102.6,440}, {9999,440}}

------------------------STUFF YOU CANNOT MESS WITH

include("libs/table.save.lua")

local keyboard_focus = 0 --0 nothing, 1 oa, 2 ob, 3 oc, 4 cf, 5 ca, 6 fuel
local keyboard_buffer = ""

local looper_1 = 10 -- so on startup, it is 10 then loops down to 0, sets the values before the user.

local load_button_begin = 0

local load_target = {0,0,0,0,0,0}
local load_actual = {0,0,0,0,0,0} -- not a live value! does not change in flight!!!!!!!
local total_load_target = 0

local tank_index_center = {
    {5000,   -1},
    {10000 , -1},
    {15000 , -2},
    {20000 , -3},
    {25000 , -4},
    {30000 , -4},
    {35000 , -5},
    {40000 , -6},
    {45000 , -7},
    {50000 , -7},
    {55000 , -8},
    {60000 , -9},
    {FUEL_C_MAX , -10},
}

local tank_index_wing = {
    {5000,   -1},
    {10000 , -1},
    {15000 , -2},
    {20000 , -2},
    {25000 , -2},
    {30000 , -3},
    {35000 , -3},
    {40000 , -3},
    {45000 , -3},
    {50000 , -3},
    {55000 , -2},
    {60000 , -2},
    {FUEL_LR_MAX, -1},
}

local tank_index_act = {
    {0,     0},
    {24500 , 0},
}

local tank_index_rct = {
    {0,     0},
    {24500 , 0},
}

local passenger_index_front = {
    {0, 0},
    {10200, -23}
}

local passenger_index_aft = {
    {0, 0},
    {10200, 24}
}

local cargo_index_front = {
    {0, 0},
    {5700, -15.7}
}

local cargo_index_aft = {
    {0, 0},
    {7000, 12.5}
}

----------------KEYOARD STUFF


function EFB_onKeyDown_page3_subpage_1(component, char, key, shiftDown, ctrlDown, altOptDown)
    if keyboard_focus == 0 then
        return false
    end
        if char == SASL_KEY_DELETE then --BACKSPACE
            keyboard_buffer = string.sub(keyboard_buffer, 1, -2)
        elseif char == SASL_VK_RETURN then --ENTER
            if string.len(keyboard_buffer) <= 0 then --IF THE LENGTH OF THE STRING IS 0, THEN REVERT TO THE PREVIOUS VALUE. ELSE, PLUG-IN THE NEW VALUE.
                keyboard_focus = 0
                keyboard_buffer = ""
            else
                load_target[keyboard_focus] = math.min(max_values[keyboard_focus], keyboard_buffer) --PLUG THE SCRATCHPAD INTO THE ACTUAL TARGET ARRAY
                keyboard_focus = 0
                keyboard_buffer = ""
            end
        elseif char == SASL_VK_ESCAPE then --REVERT TO THE PREVIOUS VALUE.
            keyboard_focus = 0
            keyboard_buffer = ""
        elseif char == SASL_KEY_DOWN then
            if string.len(keyboard_buffer) > 0 then
                load_target[keyboard_focus] = math.min(max_values[keyboard_focus], keyboard_buffer) --PLUG THE SCRATCHPAD INTO THE ACTUAL TARGET ARRAY
            end
            keyboard_buffer = ""
            keyboard_focus = math.min(6, keyboard_focus + 1)
        elseif char == SASL_KEY_UP then
            if string.len(keyboard_buffer) > 0 then
                load_target[keyboard_focus] = math.min(max_values[keyboard_focus], keyboard_buffer) --PLUG THE SCRATCHPAD INTO THE ACTUAL TARGET ARRAY
            end
            keyboard_buffer = ""
            keyboard_focus = math.max(1, keyboard_focus - 1)
        else
            local read_n = tonumber(string.char(char)) --JUST TO MAKE SURE WHAT YOU TYPE IS A NUMBER
            
            if read_n ~= nil and string.len(keyboard_buffer) < 7 then -- "tonumber()" RETURNS nil IF NOT A NUMBER, ALSO MAKES SURE STRING LENGTH IS <7
                keyboard_buffer = keyboard_buffer..string.char(char)
            end
        end
    --print(keyboard_buffer)
    --print(char)
    return true
end


--------------------INTERESTING STUFF
include("EFB/efb_systems.lua")
include("EFB/efb_topcat.lua")

efb_subpage_number = 1



-------------------EFB

local function drawTextCentered(font, x, y, string, size, isbold, isitalic, alignment, colour)
    sasl.gl.drawText (font, x, y - (size/3),string, size, isbold, isitalic, alignment, colour)
end

local function performance_data()
end

--------------------------------------------------------------------------------------------------------------------------------SUBPAGE 1

local function load_table_from_file()
    load_target = table.load(moduleDirectory .. "/Custom Module/saved_configs/previous_load_target")
end

local function save_to_file()
    --os.remove(moduleDirectory .. "/Custom Module/saved_configs/previous_load_target")
    table.save(load_target, moduleDirectory .. "/Custom Module/saved_configs/previous_load_target")
end

local function draw_focus_frame()
    if keyboard_focus == 1 then
        sasl.gl.drawTexture (EFB_LOAD_selected_oa, 0 , 0 , 1143 , 800 , EFB_WHITE )
    elseif keyboard_focus == 2 then
        sasl.gl.drawTexture (EFB_LOAD_selected_ob, 0 , 0 , 1143 , 800 , EFB_WHITE )
    elseif keyboard_focus == 3 then
        sasl.gl.drawTexture (EFB_LOAD_selected_oc, 0 , 0 , 1143 , 800 , EFB_WHITE )
    elseif keyboard_focus == 4 then
        sasl.gl.drawTexture (EFB_LOAD_selected_cf, 0 , 0 , 1143 , 800 , EFB_WHITE )
    elseif keyboard_focus == 5 then
        sasl.gl.drawTexture (EFB_LOAD_selected_ca, 0 , 0 , 1143 , 800 , EFB_WHITE )
    elseif keyboard_focus == 6 then
        sasl.gl.drawTexture (EFB_LOAD_selected_fuel, 0 , 0 , 1143 , 800 , EFB_WHITE )
    end
end



local function sum_weights_up()
    total_load_target = ((load_target[1]+load_target[2]+load_target[3]) * weight_per_passenger) -- passenger weight
    + (load_target[4] + load_target[1]) --cargo weight
    + load_target[6] --fuel weight
    + dry_operating_weight -- aircraft base weight
end



local function calculate_cg()
    final_cg = default_cg
    -- + Table_extrapolate(tank_index_center, get(Fuel_quantity[tank_CENTER])) --coefficient of the center tank
    -- + Table_extrapolate(tank_index_wing, get(Fuel_quantity[tank_LEFT])) --coefficient of the left tank
    -- + Table_extrapolate(tank_index_wing, get(Fuel_quantity[tank_RIGHT])) --coefficient of the right tank
    -- + Table_extrapolate(tank_index_act, get(Fuel_quantity[tank_ACT])) --coefficient of the act
    -- + Table_extrapolate(tank_index_rct, get(Fuel_quantity[tank_RCT])) --coefficient of the rct
    + Table_extrapolate(passenger_index_front, (load_actual[1] + load_actual[2]) * weight_per_passenger) --coefficient of the zone a and b passenger
    + Table_extrapolate(passenger_index_aft, load_actual[3] * weight_per_passenger) --coefficient of the zone c passenger
    + Table_extrapolate(cargo_index_front, load_actual[4]) --coefficient of the forward cargo hold
    + Table_extrapolate(cargo_index_aft, load_actual[5]) --coefficient of the after cargo hold
end

local function predict_cg()
    predicted_cg = default_cg
    -- + Table_extrapolate(tank_index_center, get(Fuel_quantity[tank_CENTER])) --coefficient of the center tank
    -- + Table_extrapolate(tank_index_wing, get(Fuel_quantity[tank_LEFT])) --coefficient of the left tank
    -- + Table_extrapolate(tank_index_wing, get(Fuel_quantity[tank_RIGHT])) --coefficient of the right tank
    -- + Table_extrapolate(tank_index_act, get(Fuel_quantity[tank_ACT])) --coefficient of the act
    -- + Table_extrapolate(tank_index_rct, get(Fuel_quantity[tank_RCT])) --coefficient of the rct
    + Table_extrapolate(passenger_index_front, (load_target[1] + load_target[2]) * weight_per_passenger) --coefficient of the zone a and b passenger
    + Table_extrapolate(passenger_index_aft, load_target[3] * weight_per_passenger) --coefficient of the zone c passenger
    + Table_extrapolate(cargo_index_front, load_target[4]) --coefficient of the forward cargo hold
    + Table_extrapolate(cargo_index_aft, load_target[5]) --coefficient of the after cargo hold
end

local function set_cg()
    set(CG_Pos, 0.04232395*(final_cg) - 1.06312)
end

local function set_values()
    calculate_cg()
    load_button_begin = get(TIME) --the button animation
    load_actual = load_target -- set the load actual array for the next line
    set(Payload_weight, (load_actual[1] + load_actual[2] + load_actual[3])*weight_per_passenger + load_actual[4] + load_actual[5])
    set_fuel(load_actual[6])
    sum_weights_up()
    set_cg()
end

local function Subpage_1_buttons()
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 348, 386, 378, 409,  function () -- OA SELECTOR
        load_target[1] = math.min(max_values[1], load_target[1] + 10)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 313, 385, 344, 409, function ()
        load_target[1] = math.min(max_values[1], load_target[1] + 1)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 182, 385, 212, 409,function ()
        load_target[1] = math.max(0, load_target[1] - 1)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 147, 385, 177, 409,function ()
        load_target[1] = math.max(0, load_target[1] - 10)
    end)

    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 348, 346, 378, 370,  function () -- OB SELECTOR
        load_target[2] = math.min(max_values[2], load_target[2] + 10)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 313, 346, 344, 370, function ()
        load_target[2] = math.min(max_values[2], load_target[2] + 1)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 182, 346, 212, 370,function ()
        load_target[2] = math.max(0, load_target[2] - 1)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 147, 346, 177, 370,function ()
        load_target[2] = math.max(0, load_target[2] - 10)
    end)


    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 348, 307, 378, 332,  function () -- OC SELECTOR
        load_target[3] = math.min(max_values[3], load_target[3] + 10)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 313, 307, 344, 332, function ()
        load_target[3] = math.min(max_values[3], load_target[3] + 1)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 182, 307, 212, 332,function ()
        load_target[3] = math.max(0, load_target[3] - 1)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 147, 307, 177, 332,function ()
        load_target[3] = math.max(0, load_target[3] - 10)
    end)
    
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 348, 229, 378, 254,  function () -- Cargo 1-2 SELECTOR
        load_target[4] = math.min(max_values[4], load_target[4] + 1000)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 313, 229, 344, 254, function ()
        load_target[4] = math.min(max_values[4], load_target[4] + 100)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 182, 229, 212, 254,function ()
        load_target[4] = math.max(0, load_target[4] - 100)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 147, 229, 177, 254,function ()
        load_target[4] = math.max(0, load_target[4] - 1000)
    end)

    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 348, 190, 378, 214,  function () -- Cargo 3-5 SELECTOR
        load_target[5] = math.min(max_values[5], load_target[5] + 1000)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 313, 190, 344, 214, function ()
        load_target[5] = math.min(max_values[5], load_target[5] + 100)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 182, 190, 212, 214,function ()
        load_target[5] = math.max(0, load_target[5] - 100)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 147, 190, 177, 214,function ()
        load_target[5] = math.max(0, load_target[5] - 1000)
    end)

    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 348, 112, 378, 136,  function () -- Fuel SELECTOR
        load_target[6] = math.min(max_values[6], load_target[6] + 1000)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 313, 112, 344, 136, function ()
        load_target[6] = math.min(max_values[6], load_target[6] + 100)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 182, 112, 212, 136,function ()
        load_target[6] = math.max(0, load_target[6] - 100)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 147, 112, 177, 136,function ()
        load_target[6] = math.max(0, load_target[6] - 1000)
    end)
--------------------------------------------------------------------------------------------------------

    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 216, 385, 308, 409,function () --THE SCRATCHPAD FOCUS BUTTONS
        keyboard_focus = keyboard_focus == 1 and 0 or 1
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 216, 346, 308, 370,function ()
        keyboard_focus = keyboard_focus == 2 and 0 or 2
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 216, 307, 308, 332,function ()
        keyboard_focus = keyboard_focus == 3 and 0 or 3
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 216, 229, 308, 254,function ()
        keyboard_focus = keyboard_focus == 4 and 0 or 4
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 216, 190, 308, 214,function ()
        keyboard_focus = keyboard_focus == 5 and 0 or 5
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 216, 112, 308, 136,function ()
        keyboard_focus = keyboard_focus == 6 and 0 or 6
    end)

--------------------------------------------------------------------------------------------------------

    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 108, 50, 378, 80,function ()
        set_values()
        save_to_file()
    end)
end

local function EFB_update_page_3_subpage_1() --UPDATE LOOP
    predict_cg()
    print(predicted_cg)
end

local function EFB_draw_page_3_subpage_1() -- DRAW LOOP

    sasl.gl.drawTexture (EFB_LOAD_bgd, 0 , 0 , 1143 , 800 , EFB_WHITE )
    sasl.gl.drawTexture (EFB_LOAD_bound_takeoff, 0 , 0 , 1143 , 800 , EFB_WHITE )
    sasl.gl.drawTexture (EFB_LOAD_chart, 0 , 0 , 1143 , 800 , EFB_WHITE )
    sasl.gl.drawText ( Font_Airbus_panel , 97 , 582, dry_operating_weight , 17 ,false , false , TEXT_ALIGN_LEFT , EFB_LIGHTBLUE )

    if string.len(keyboard_buffer) > 0 then --THE PURPOSE OF THIS IFELSE IS TO PREVENT THE CURSOR FROM COVERING UP THE PREVIOUS VALUE, WHEN THE SCRATCHPAD IS EMPTY.
        drawTextCentered( Font_Airbus_panel , 263 , 397, keyboard_focus == 1 and keyboard_buffer or load_target[1] , 17 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
        drawTextCentered( Font_Airbus_panel , 263 , 358, keyboard_focus == 2 and keyboard_buffer or load_target[2] , 17 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
        drawTextCentered( Font_Airbus_panel , 263 , 319, keyboard_focus == 3 and keyboard_buffer or load_target[3] , 17 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
        drawTextCentered( Font_Airbus_panel , 263 , 242, keyboard_focus == 4 and keyboard_buffer or load_target[4] , 17 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
        drawTextCentered( Font_Airbus_panel , 263 , 203, keyboard_focus == 5 and keyboard_buffer or load_target[5] , 17 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
        drawTextCentered( Font_Airbus_panel , 263 , 124, keyboard_focus == 6 and keyboard_buffer or load_target[6] , 17 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
    else
        drawTextCentered( Font_Airbus_panel , 263 , 397, load_target[1] , 17 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
        drawTextCentered( Font_Airbus_panel , 263 , 358, load_target[2] , 17 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
        drawTextCentered( Font_Airbus_panel , 263 , 319, load_target[3] , 17 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
        drawTextCentered( Font_Airbus_panel , 263 , 242, load_target[4] , 17 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
        drawTextCentered( Font_Airbus_panel , 263 , 203, load_target[5] , 17 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
        drawTextCentered( Font_Airbus_panel , 263 , 124, load_target[6] , 17 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
    end
--------------------------------------------------------------------------

    if math.floor(final_cg) ~= math.floor(predicted_cg) then
        sasl.gl.drawWideLine ( 470 , Table_extrapolate(tow_to_coordinates, get(Gross_weight)/1000) , 1093 , Table_extrapolate(tow_to_coordinates, get(Gross_weight)/1000) , 3, EFB_FULL_YELLOW )
        sasl.gl.drawWideLine ( Table_extrapolate(percent_cg_to_coordinates, predicted_cg ) ,77, Table_extrapolate(percent_cg_to_coordinates, predicted_cg ),440, 3, EFB_FULL_YELLOW )
    else
        sasl.gl.drawWideLine ( 470 , Table_extrapolate(tow_to_coordinates, get(Gross_weight)/1000) , 1093 , Table_extrapolate(tow_to_coordinates, get(Gross_weight)/1000) , 3, EFB_WHITE )
        sasl.gl.drawWideLine ( Table_extrapolate(percent_cg_to_coordinates, final_cg ) ,77, Table_extrapolate(percent_cg_to_coordinates, final_cg ),440, 3, EFB_WHITE )
    end

--------------------------------------------------------------------------

    if get(TIME) -  load_button_begin > BUTTON_PRESS_TIME then
        SASL_drawSegmentedImg_xcenter_aligned (EFB_LOAD_compute_button, 244,48,544,32,2,1)
    else
        SASL_drawSegmentedImg_xcenter_aligned (EFB_LOAD_compute_button, 244,48,544,32,2,2)
    end
--------------------------------------------------------------------------

    drawTextCentered( Font_Airbus_panel , 1038 , 682, dry_operating_weight      , 16 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
    drawTextCentered( Font_Airbus_panel , 1038 , 660, 0                         , 16 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
    drawTextCentered( Font_Airbus_panel , 1038 , 637, dry_operating_weight      , 16 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
    drawTextCentered( Font_Airbus_panel , 1038 , 615, load_actual[4] + load_actual[5]      , 16 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
    drawTextCentered( Font_Airbus_panel , 1038 , 593, ((load_actual[1]+load_actual[2]+load_actual[3]) * weight_per_passenger)      , 16 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
    drawTextCentered( Font_Airbus_panel , 1038 , 571, ((load_actual[1]+load_actual[2]+load_actual[3]) * weight_per_passenger) 
                                                        + load_actual[4] + load_actual[5] 
                                                        + dry_operating_weight     
                                                        , 16 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
    drawTextCentered( Font_Airbus_panel , 1038 , 551, load_actual[6]    , 16 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
    drawTextCentered( Font_Airbus_panel , 1038 , 528, math.min(taxi_fuel, load_actual[6])     , 16 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )
    drawTextCentered( Font_Airbus_panel , 1038 , 506, ((load_actual[1]+load_actual[2]+load_actual[3]) * weight_per_passenger) 
                                                        + load_actual[4] + load_actual[5] 
                                                        + load_actual[6] 
                                                        - math.min(taxi_fuel, load_actual[6])
                                                        + dry_operating_weight   
                                                        , 16 ,false , false , TEXT_ALIGN_CENTER , EFB_LIGHTBLUE )

    drawTextCentered( Font_Airbus_panel , 243 , 63, "LOAD AIRCRAFT" , 17 ,false , false , TEXT_ALIGN_CENTER , EFB_BACKGROUND_COLOUR )

    draw_focus_frame()

end


-------DONT ASK ME WHY I PUT IT OUTSIDE, IT EXECUTES ON START
load_table_from_file()
set_values()
set_values()
set_values()

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------SUBPAGE 2

local function EFB_draw_page_3_subpage_2()
end

local function EFB_update_page_3_subpage_2()
end

local function Subpage_2_buttons()
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------MUTUAL LOOPS

local function mutual_button_loop()
    --Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 1031,18,1099,48, function () --SELECTOR BUTTONS WORK AT ALL TIMES
    --    efb_subpage_number = 2
    --    keyboard_focus = 0
    --    keyboard_buffer = ""
    --end)
    --Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 954,18,1021,48, function ()
    --    efb_subpage_number = 1
    --end)
end

local function mutual_update_loop()
    --print(EFB_CURSOR_X, EFB_CURSOR_Y)
end

local function mutual_draw_loop()
    --SASL_draw_img_center_aligned (EFB_INFO_selector, 1026,33, 147, 32, EFB_WHITE) -- THIS IS THE SELECTOR, IT DRAWS ON ALL PAGES
end

--------------------------------------------------------------------------------------------------------------------------------

function EFB_execute_page_3_buttons()

    if  efb_subpage_number == 1 then
        Subpage_1_buttons()
    elseif efb_subpage_number == 2 then
        Subpage_2_buttons()
    end

    mutual_button_loop()
end

--UPDATE LOOPS--
function EFB_update_page_3()

    if efb_subpage_number == 1 then
        EFB_update_page_3_subpage_1()
    elseif efb_subpage_number == 2 then
        EFB_update_page_3_subpage_2()
    end
    mutual_update_loop()
end

--DRAW LOOPS--
function EFB_draw_page_3()
    if efb_subpage_number == 1 then
        EFB_draw_page_3_subpage_1()
    elseif efb_subpage_number == 2 then
        EFB_draw_page_3_subpage_2()
    end
    mutual_draw_loop()
end

