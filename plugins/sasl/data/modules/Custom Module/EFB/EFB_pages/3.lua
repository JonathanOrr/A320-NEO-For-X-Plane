------------------------STUFF YOU CAN MESS WITH
local BUTTON_PRESS_TIME = 0.5

--------------------INTERESTING STUFF
include("EFB/efb_systems.lua")



------------------------------LOCAL STUFF
local compute_vspeeds = 0
local refuel_button_begin = 0
local refuel_panel_button_begin = 0
local load_button_begin = 0
local compute_button_begin = 0
local ir_force_button_begin = 0
local day_in_month = globalProperty("sim/cockpit2/clock_timer/current_day")


local command_irs_align = sasl.findCommand ("a321neo/cockpit/ADIRS/instantaneous_align")



local month_in_numbers = globalProperty("sim/cockpit2/clock_timer/current_month")
local month_in_text = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"}

local fuel_target_amount = 0
local pax_target_amount = 0
local fwd_cargo_target = 0
local aft_cargo_target = 0


--MOUSE & BUTTONS--
function EFB_execute_page_3_buttons()
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 808,605,879,636, function ()
        set(LOAD_flapssetting, 1)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 886,605,954,636, function ()
        set(LOAD_flapssetting, 2)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 963,605,1031,636, function ()
        set(LOAD_flapssetting, 3)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 808,539,879,572, function ()
        set(LOAD_runwaycond, 0)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 886,539,954,572, function ()
        set(LOAD_runwaycond, 1)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 808,473,879,503, function ()
        set(LOAD_thrustto, 0)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 886,473,954,503, function ()
        set(LOAD_thrustto, 1)
    end)



    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 424,244,737,274, function () --force refuel
        refuel_button_begin = get(TIME)
        set_fuel(fuel_target_amount)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 424,200,737,230, function () --open fuel panel
        refuel_panel_button_begin = get(TIME)
        fuel_window:setIsVisible(true)
    end)

    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 88,426,353,458, function () --load aircraft
        load_button_begin = get(TIME)
    end)

    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 810,414,1080,440, function () --compute vspeeds
        compute_button_begin = get(TIME)
    end)

    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 421,91,741,121, function () -- force align ir
        ir_force_button_begin = get(TIME)
        sasl.commandOnce (command_irs_align)
    end)




    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 430,617,459,642, function () -- 
        fuel_target_amount = math.max(0, fuel_target_amount - 1000)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 464,617,493,642, function () -- 
        fuel_target_amount = math.max(0, fuel_target_amount - 100)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 594,617,623,642, function () -- 
        fuel_target_amount = math.min(40900, fuel_target_amount + 100)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 629,617,661,642, function () -- 
        fuel_target_amount = math.min(40900, fuel_target_amount + 1000)
    end)



    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 110,617,140,642, function () -- 
        pax_target_amount = math.max(0, pax_target_amount - 10)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 145,617,175,642, function () -- 
        pax_target_amount = math.max(0, pax_target_amount - 1)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 277,617,306,642, function () -- 
        pax_target_amount = math.min(244, pax_target_amount + 1)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 312,617,341,642, function () -- 
        pax_target_amount = math.min(244, pax_target_amount + 10)
    end)

    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 110,554,140,577, function () -- 
        fwd_cargo_target = math.max(0, fwd_cargo_target - 1000)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 145,554,175,577, function () -- 
        fwd_cargo_target = math.max(0, fwd_cargo_target - 100)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 277,554,306,577, function () -- 
        fwd_cargo_target = math.min(10000, fwd_cargo_target + 100)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 312,554,341,577, function () -- 
        fwd_cargo_target = math.min(10000, fwd_cargo_target + 1000)
    end)


    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 110,487,140,512, function () -- 
        aft_cargo_target = math.max(0, aft_cargo_target - 1000)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 145,487,175,512, function () -- 
        aft_cargo_target = math.max(0, aft_cargo_target - 100)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 277,487,306,512, function () -- 
        aft_cargo_target = math.min(10000, aft_cargo_target + 100)
    end)
    Button_check_and_action(EFB_CURSOR_X, EFB_CURSOR_Y, 312,487,341,512, function () -- 
        aft_cargo_target = math.min(10000, aft_cargo_target + 1000)
    end)
end



--UPDATE LOOPS--
function EFB_update_page_3()
    set(Nr_people_onboard, pax_target_amount)
end



local function EFB_draw_takeoff_data()
  	if get(LOAD_flapssetting) == 1 then
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 843,592,192,58,2,1)
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 920,592,192,58,2,2)
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 996,592,192,58,2,2)
    elseif get(LOAD_flapssetting) == 2 then
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 843,592,192,58,2,2)
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 920,592,192,58,2,1)
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 996,592,192,58,2,2)
    elseif get(LOAD_flapssetting) then
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 843,592,192,58,2,2)
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 920,592,192,58,2,2)
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 996,592,192,58,2,1)
    end

    if get(LOAD_runwaycond) == 1 then
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 843,526,192,58,2,2)
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 920,526,192,58,2,1)
    else
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 843,526,192,58,2,1)
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 920,526,192,58,2,2)
    end

    if get(LOAD_thrustto) == 1 then
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 843,458,192,58,2,2)
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 920,458,192,58,2,1)
    else
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 843,458,192,58,2,1)
        SASL_drawSegmentedImg_xcenter_aligned (EFB_highlighter, 920,458,192,58,2,2)
    end
end


local function EFB_draw_press_buttons()
    if get(TIME) - refuel_button_begin < BUTTON_PRESS_TIME then
        SASL_drawSegmentedImg_xcenter_aligned (EFB_LOAD_refuel_button, 580,244,634,32,2,2)
    else
        SASL_drawSegmentedImg_xcenter_aligned (EFB_LOAD_refuel_button, 580,244,634,32,2,1)
        refuel_button_begin = 0 --reset timer
    end

    if get(TIME) - refuel_panel_button_begin < BUTTON_PRESS_TIME then
        SASL_drawSegmentedImg_xcenter_aligned (EFB_LOAD_refuel_button, 580,195,634,32,2,2)
    else
        SASL_drawSegmentedImg_xcenter_aligned (EFB_LOAD_refuel_button, 580,195,634,32,2,1)
        refuel_panel_button_begin = 0
    end

    
    if get(TIME) - load_button_begin < BUTTON_PRESS_TIME then
        SASL_drawSegmentedImg_xcenter_aligned (EFB_LOAD_load_button, 222,427,542,32,2,2)
    else
        SASL_drawSegmentedImg_xcenter_aligned (EFB_LOAD_load_button, 222,427,542,32,2,1)
        load_button_begin = 0
    end

    if get(TIME) - compute_button_begin < BUTTON_PRESS_TIME then
        SASL_drawSegmentedImg_xcenter_aligned (EFB_LOAD_compute_button, 943,412,544,32,2,2)
    else
        SASL_drawSegmentedImg_xcenter_aligned (EFB_LOAD_compute_button, 943,412,544,32,2,1)
        compute_button_begin = 0
    end


    if get(TIME) - ir_force_button_begin < BUTTON_PRESS_TIME then
        SASL_drawSegmentedImg_xcenter_aligned (EFB_LOAD_refuel_button, 580,90,634,32,2,2)
    else
        SASL_drawSegmentedImg_xcenter_aligned (EFB_LOAD_refuel_button, 580,90,634,32,2,1)
        ir_force_button_begin = 0
    end
end


local function EFB_draw_overlay_text()  ---THIS IS THE OVERLAY IMAGE-----------------------------
  	sasl.gl.drawTexture ( EFB_LOAD_bgd, 0 , 0 , 1143 , 800 , ECAM_WHITE )

    sasl.gl.drawText ( Airbus_panel_font , 535 , 531, math.floor(get(FOB)).."KG" , 20 ,false , false , TEXT_ALIGN_LEFT , EFB_WHITE )

    sasl.gl.drawText ( Airbus_panel_font , 581 ,253 , "FORCE REFUEL" , 20 ,false , false , TEXT_ALIGN_CENTER , EFB_BACKGROUND_COLOUR )

    sasl.gl.drawText ( Airbus_panel_font , 581 ,204 , "REALISTIC REFUEL PANEL" , 20 ,false , false , TEXT_ALIGN_CENTER , EFB_BACKGROUND_COLOUR )


    sasl.gl.drawText ( Airbus_panel_font , 226 ,436 , "LOAD PAYLOAD" , 20 ,false , false , TEXT_ALIGN_CENTER , EFB_BACKGROUND_COLOUR )
    sasl.gl.drawText ( Airbus_panel_font , 942 ,421 , "COMPUTE" , 20 ,false , false , TEXT_ALIGN_CENTER , EFB_BACKGROUND_COLOUR )
    sasl.gl.drawText ( Airbus_panel_font , 580 ,99 , "IRS FORCE ALIGN" , 20 ,false , false , TEXT_ALIGN_CENTER , EFB_BACKGROUND_COLOUR )
end


local function EFB_draw_fuel_tanks()
    sasl.gl.drawRectangle ( 560, 370 , 40 , ((get(Fuel_quantity[tank_CENTER]))/8940)*67 , EFB_DARKBLUE ) -- center tank
    sasl.gl.drawRectangle ( 560, 450 , 40 , ((get(Fuel_quantity[tank_ACT]))/5030)*28 , EFB_DARKBLUE ) -- act
    sasl.gl.drawRectangle ( 560, 329 , 40 , ((get(Fuel_quantity[tank_RCT]))/10080)*29 , EFB_DARKBLUE ) -- rct
    sasl.gl.drawConvexPolygon ({447 , 344 + (get(Fuel_quantity[tank_LEFT])/8450)*35, 447 , 344 , 544 , 370 , 544 , 370 + (get(Fuel_quantity[tank_LEFT])/8450)*65} , true , 1 , EFB_DARKBLUE ) --left tank
    sasl.gl.drawConvexPolygon ({712 , 344 + (get(Fuel_quantity[tank_RIGHT])/8450)*35, 712 , 344 , 615 , 370 , 615 , 370 + (get(Fuel_quantity[tank_RIGHT])/8450)*65} , true , 1 , EFB_DARKBLUE )	--right tank
end
  
local function EFB_draw_loadsheet_text()
    local YEAR = tonumber(os.date("%y"))
    sasl.gl.drawText ( Airbus_panel_font, 104 , 377 , "Aircraft: A321-271NX" , 15, false , false , TEXT_ALIGN_LEFT , EFB_BLACK )
    sasl.gl.drawText ( Airbus_panel_font, 346 , 377 , get(day_in_month)..month_in_text[get(month_in_numbers)]..(YEAR-2000) , 15, false , false , TEXT_ALIGN_RIGHT , EFB_BLACK )
    sasl.gl.drawText ( Airbus_panel_font, 225 , 337 , "LOADSHEET" , 15, false , false , TEXT_ALIGN_CENTER , EFB_BLACK )
    sasl.gl.drawText ( Airbus_panel_font, 225 , 317 , "------------------------------" , 15, false , false , TEXT_ALIGN_CENTER , EFB_BLACK )
    sasl.gl.drawText ( Airbus_panel_font, 104 , 297 , "Passengers Weight", 15, false , false , TEXT_ALIGN_LEFT , EFB_BLACK )
    sasl.gl.drawText ( Airbus_panel_font, 104 , 277 , "Cargo Containers", 15, false , false , TEXT_ALIGN_LEFT , EFB_BLACK )
    sasl.gl.drawText ( Airbus_panel_font, 104 , 257 , "Block Fuel:" , 15, false , false , TEXT_ALIGN_LEFT , EFB_BLACK )
    sasl.gl.drawText ( Airbus_panel_font, 104 , 237 , "Zero Fuel Weight:" , 15, false , false , TEXT_ALIGN_LEFT , EFB_BLACK )
    sasl.gl.drawText ( Airbus_panel_font, 104 , 217 , "ZFW Center of Gravity:" , 15, false , false , TEXT_ALIGN_LEFT , EFB_BLACK )
    sasl.gl.drawText ( Airbus_panel_font, 104 , 197 , "------------------------------" , 15, false , false , TEXT_ALIGN_LEFT , EFB_BLACK )
    sasl.gl.drawText ( Airbus_panel_font, 104 , 177 , "Takeoff Weight:" , 15, false , false , TEXT_ALIGN_LEFT , EFB_BLACK )
    sasl.gl.drawText ( Airbus_panel_font, 225 , 137 , "END OF REPORT" , 15, false , false , TEXT_ALIGN_CENTER , EFB_BLACK )
end


local function EFB_draw_target_values()
    sasl.gl.drawText ( Airbus_panel_font, 545 , 623 , fuel_target_amount , 20, false , false , TEXT_ALIGN_CENTER , EFB_WHITE )
    sasl.gl.drawText ( Airbus_panel_font, 223 , 623 , pax_target_amount , 20, false , false , TEXT_ALIGN_CENTER , EFB_WHITE )
    sasl.gl.drawText ( Airbus_panel_font, 223 , 557 , fwd_cargo_target , 20, false , false , TEXT_ALIGN_CENTER , EFB_WHITE )
    sasl.gl.drawText ( Airbus_panel_font, 223 , 492 , aft_cargo_target , 20, false , false , TEXT_ALIGN_CENTER , EFB_WHITE )
end


--DRAW LOOPS--
function EFB_draw_page_3()
    EFB_draw_takeoff_data()
    EFB_draw_press_buttons()
    EFB_draw_overlay_text()
    EFB_draw_fuel_tanks()
    EFB_draw_loadsheet_text()
    EFB_draw_target_values()

end
