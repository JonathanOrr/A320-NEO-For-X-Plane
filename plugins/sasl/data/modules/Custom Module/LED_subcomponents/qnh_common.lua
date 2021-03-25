MODE_QNH = 1
MODE_QFE = 2
MODE_STD = 3

UNIT_INHG = 1
UNIT_HPA  = 2


local LED_cl = {235/255, 200/255, 135/255}
local MIN_VALUE = 22.00
local MAX_VALUE = 32.49


qnh_data_fo = {
    mode = MODE_QNH,
    unit = UNIT_INHG,
    value = 29.92,
    
    dr = {
        baro_setting = Fo_Baro,
        cmd_value_dn = FCU_Fo_knob_qnh_dn,
        cmd_value_up = FCU_Fo_knob_qnh_up,
        cmd_knob_push = FCU_Fo_knob_qnh_push,
        cmd_knob_pull = FCU_Fo_knob_qnh_pull
    }
}

qnh_data_capt = {
    mode = MODE_QNH,
    unit = UNIT_INHG,
    value = 29.92,
    
    dr = {
        baro_setting = Capt_Baro,
        cmd_value_dn = FCU_Capt_knob_qnh_dn,
        cmd_value_up = FCU_Capt_knob_qnh_up,
        cmd_knob_push = FCU_Capt_knob_qnh_push,
        cmd_knob_pull = FCU_Capt_knob_qnh_pull
    }
}



local function Draw_green_LED_num_and_letter_lc(x, y, string, max_digits, size, alignment, min_brightness_for_backlight, max_brightness_for_backlight, brightness)
    local LED_cl = {235/255, 200/255, 135/255, brightness}
    local LED_backlight_cl = {15/255, 20/255, 15/255}

    local backlight_string = ""

    for i = 1, max_digits do
        backlight_string = backlight_string .. 8
    end

    --calculate backlight
    local blacklight_R = Math_rescale(min_brightness_for_backlight, 0, max_brightness_for_backlight, LED_backlight_cl[1], brightness)
    local blacklight_G = Math_rescale(min_brightness_for_backlight, 0, max_brightness_for_backlight, LED_backlight_cl[2], brightness)
    local blacklight_B = Math_rescale(min_brightness_for_backlight, 0, max_brightness_for_backlight, LED_backlight_cl[3], brightness)

    sasl.gl.drawText(Font_7segment_led, x, y, backlight_string, size, false, false, alignment, {blacklight_R, blacklight_G, blacklight_B})
    sasl.gl.drawText(Font_7segment_led, x, y, string, size, false, false, alignment, LED_cl)
end

local function inhg_to_hpa(x)
    return 3386.39 * x
end

function handler_update_value(phase, data, direction)
    if phase == SASL_COMMAND_BEGIN then
        if data.mode ~= MODE_STD then
            if direction == -1 then
                data.value = math.max(MIN_VALUE, data.value - 0.01)
            else
                data.value = math.min(MAX_VALUE, data.value + 0.01) 
            end
        end
        
        if EFB.preferences["syncqnh"] then
            -- If the option is active in the EFB, let's sync the values. One of these istructions has
            -- no effect because it's the same entity.
            ADIRS_sys.qnh_capt.value = data.value
            ADIRS_sys.qnh_fo.value = data.value
        end
        
    end
end

function handler_knob_push(phase, data)
    if phase == SASL_COMMAND_BEGIN then
        if data.mode == MODE_STD then
            data.mode = data.mode_last
        else
            data.mode = data.mode == MODE_QNH and MODE_QFE or MODE_QNH
            data.mode_last = data.mode
        end
        
        if EFB.preferences["syncqnh"] then
            -- If the option is active in the EFB, let's sync the values. Two of these istructions have
            -- no effect because they are the same entity.
            ADIRS_sys.qnh_capt.mode = data.mode
            ADIRS_sys.qnh_fo.mode = data.mode
            ADIRS_sys.qnh_capt.mode_last = data.mode_last
            ADIRS_sys.qnh_fo.mode_last = data.mode_last
        end
    end
end


function handler_knob_pull(phase, data)
    if phase == SASL_COMMAND_BEGIN then
        data.mode = MODE_STD
        if EFB.preferences["syncqnh"] then
            -- If the option is active in the EFB, let's sync the values. One of these istructions has
            -- no effect because it's the same entity.
            ADIRS_sys.qnh_capt.mode = data.mode
            ADIRS_sys.qnh_fo.mode = data.mode
        end
    end
end

function setup_cmd_handlers(data)
    sasl.registerCommandHandler (data.dr.cmd_knob_push, 0, function(phase) handler_knob_push(phase, data) end)
    sasl.registerCommandHandler (data.dr.cmd_knob_pull, 0, function(phase) handler_knob_pull(phase, data) end )

    sasl.registerCommandHandler (data.dr.cmd_value_dn, 0, function(phase) handler_update_value(phase, data, -1) end )
    sasl.registerCommandHandler (data.dr.cmd_value_up, 0, function(phase) handler_update_value(phase, data, 1) end )

end

function draw_lcd(data)
    if data.mode == MODE_QNH then
        sasl.gl.drawText(Font_AirbusDUL, 120, 63, "QNH", 26, false, false, TEXT_ALIGN_CENTER, LED_cl)
    elseif data.mode == MODE_QFE then
        sasl.gl.drawText(Font_AirbusDUL, 60, 63, "QFE", 26, false, false, TEXT_ALIGN_CENTER, LED_cl)
    else
        Draw_green_LED_num_and_letter_lc(20, 10, "Std ", 4, 60, TEXT_ALIGN_LEFT, 0.2, 1, 1)
    end
    
    if data.mode == MODE_QNH or data.mode == MODE_QFE then
        if data.unit == UNIT_INHG then
            Draw_green_LED_num_and_letter_lc(20, 10, math.floor(data.value * 100), 4, 60, TEXT_ALIGN_LEFT, 0.2, 1, 1)
            sasl.gl.drawText(Font_7segment_led, 73, 10, ".", 60, false, false, TEXT_ALIGN_CENTER, LED_cl)
        else
            local hpa = math.floor(inhg_to_hpa(data.value)/100)
            Draw_green_LED_num_and_letter_lc(20, 10, hpa, 4, 60, TEXT_ALIGN_LEFT, 0.2, 1, 1)
        end
    end
end
