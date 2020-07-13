size = {340,500}

--colors--
local FBW_BLACK = {0,0,0}
local FBW_WHITE = {1.0, 1.0, 1.0}
local FBW_BLUE = {0.004, 1.0, 1.0}
local FBW_GREEN = {0.184, 0.733, 0.219}
local FBW_ORANGE = {0.725, 0.521, 0.18}
local FBW_RED = {1, 0.0, 0.0}

--fonts
local B612regular = sasl.gl.loadFont("fonts/B612-Regular.ttf")
local B612MONO_regular = sasl.gl.loadFont("fonts/B612Mono-Regular.ttf")

function update()
    --change menu item state
    if FBW_debug_window:isVisible() == true then
        sasl.setMenuItemState(Menu_main, ShowHideFBWDebug, MENU_CHECKED)
    else
        sasl.setMenuItemState(Menu_main, ShowHideFBWDebug, MENU_UNCHECKED)
    end
end

function draw()
    sasl.gl.drawRectangle(0,0,size[1],size[2], FBW_BLACK)
    sasl.gl.drawFrame (20, 20, 300, 300, FBW_WHITE)

    sasl.gl.drawText(B612MONO_regular, 20, 450, "YOU ARE IN:", 28, false, false, TEXT_ALIGN_LEFT, FBW_WHITE)
    if get(FBW_status) == 2 then
        if get(FBW_flaring) == 0 then
            sasl.gl.drawText(B612MONO_regular, 20, 410, "NORMAL LAW", 40, false, false, TEXT_ALIGN_LEFT, FBW_GREEN)
        else
            sasl.gl.drawText(B612MONO_regular, 20, 410, "FLARE NOW", 40, false, false, TEXT_ALIGN_LEFT, FBW_BLUE)
        end

        if get(FBW_ground_mode) == 1 then
            sasl.gl.drawText(B612regular, 78, 480, "GROUND MODE", 15, false, false, TEXT_ALIGN_CENTER, FBW_BLUE)
            sasl.gl.drawText(B612MONO_regular, 310, 483, "CWS", 15, false, false, TEXT_ALIGN_CENTER, FBW_RED)
            sasl.gl.drawText(B612MONO_regular, 20, 390, "AIRCRAFT ON GROUND", 15, false, false, TEXT_ALIGN_LEFT, FBW_BLUE)
            sasl.gl.drawText(B612MONO_regular, 20, 370, "UNTIL AIRBORNE", 15, false, false, TEXT_ALIGN_LEFT, FBW_BLUE)
            sasl.gl.drawText(B612MONO_regular, 20, 350, "ALL CONTROLS ARE LINEAR", 15, false, false, TEXT_ALIGN_LEFT, FBW_BLUE)
        else
            if get(FBW_flare_mode) == 1 then
                sasl.gl.drawText(B612regular, 185, 480, "FLARE MODE", 15, false, false, TEXT_ALIGN_CENTER, FBW_BLUE)
                sasl.gl.drawText(B612MONO_regular, 310, 483, "CWS", 15, false, false, TEXT_ALIGN_CENTER, FBW_GREEN)
                sasl.gl.drawText(B612MONO_regular, 20, 390, "AIRCRAFT IN FLARE MODE", 15, false, false, TEXT_ALIGN_LEFT, FBW_BLUE)
                sasl.gl.drawText(B612MONO_regular, 20, 370, "APPLYING DOWNWARDS TRIM", 15, false, false, TEXT_ALIGN_LEFT, FBW_BLUE)
                sasl.gl.drawText(B612MONO_regular, 20, 350, "PITCH UP INPUT REQUIRED", 15, false, false, TEXT_ALIGN_LEFT, FBW_BLUE)
            else
                sasl.gl.drawText(B612MONO_regular, 310, 483, "CWS", 15, false, false, TEXT_ALIGN_CENTER, FBW_GREEN)
                sasl.gl.drawText(B612MONO_regular, 20, 390, "YOU ARE COMMANDING: " .. Round(get(G_load_command), 1) .. "G", 15, false, false, TEXT_ALIGN_LEFT, FBW_GREEN)
                sasl.gl.drawText(B612MONO_regular, 20, 370, "PULLING: " .. Round(get(Total_vertical_g_load), 1) .. "G", 15, false, false, TEXT_ALIGN_LEFT, FBW_GREEN)
                sasl.gl.drawText(B612MONO_regular, 20, 350, "COMMANDING: " .. Round(get(Roll_rate_command), 1) .. " DEG/S", 15, false, false, TEXT_ALIGN_LEFT, FBW_GREEN)
                sasl.gl.drawText(B612MONO_regular, 20, 330, "ROLLING: " .. Round(get(Roll_rate), 1) .. " DEG/S", 15, false, false, TEXT_ALIGN_LEFT, FBW_GREEN)
            end
        end

        --artificial stability sum
        sasl.gl.drawRectangle(size[1]/2-10 + 150 * get(Roll_artstab), (size[2]/2-90) - 150 * get(Pitch_artstab), 20, 20, FBW_ORANGE)

        --flight envelops
        sasl.gl.drawCircle(size[1]/2 + 150 * 0, (size[2]/2-80) - 150 * get(Pitch_d_lim), 10, true, FBW_RED)
        sasl.gl.drawCircle(size[1]/2 + 150 * 0, (size[2]/2-80) - 150 * get(Pitch_u_lim), 10, true, FBW_RED)
        sasl.gl.drawCircle(size[1]/2 + 150 * get(Roll_l_lim), (size[2]/2-80) - 150 * 0, 10, true, FBW_RED)
        sasl.gl.drawCircle(size[1]/2 + 150 * get(Roll_r_lim), (size[2]/2-80) - 150 * 0, 10, true, FBW_RED)

        --pitch rate limits
        sasl.gl.drawArc(size[1]/2 + 150 * 0, (size[2]/2-80) - 150 * get(Pitch_rate_u_lim), 8, 10, 0, 360, FBW_RED)
        sasl.gl.drawArc(size[1]/2 + 150 * 0, (size[2]/2-80) - 150 * get(Pitch_rate_d_lim), 8,10, 0, 360, FBW_RED)

        --max speed and AOA protections
        sasl.gl.drawArc(size[1]/2 + 150 * 0, (size[2]/2-80) - 150 * get(AOA_lim), 8,10, 0, 360, FBW_ORANGE)
        sasl.gl.drawArc(size[1]/2 + 150 * 0, (size[2]/2-80) - 150 * get(MAX_spd_lim), 8,10, 0, 360, FBW_BLUE)

        --roll rate and G load command
        sasl.gl.drawCircle(size[1]/2 + 150 * get(Roll_rate_output), (size[2]/2-80) - 150 * 0, 10, true, FBW_BLUE)
        sasl.gl.drawCircle(size[1]/2 + 150 * 0, (size[2]/2-80) - 150 * get(G_output), 10, true, FBW_BLUE)

        --elevator trim
        sasl.gl.drawRectangle(300, 405, 20, 75 * get(Elev_trim_ratio), FBW_GREEN)
        sasl.gl.drawFrame (300, 330, 20, 150, FBW_WHITE)
    elseif get(FBW_status) == 1 then
        sasl.gl.drawText(B612MONO_regular, 20, 410, "ALT LAW", 40, false, false, TEXT_ALIGN_LEFT, FBW_ORANGE)
        sasl.gl.drawText(B612MONO_regular, 20, 390, "YOU ARE COMMANDING: " .. Round(get(G_load_command), 1) .. "G", 15, false, false, TEXT_ALIGN_LEFT, FBW_ORANGE)
        sasl.gl.drawText(B612MONO_regular, 20, 370, "PULLING: " .. Round(get(Total_vertical_g_load), 1) .. "G", 15, false, false, TEXT_ALIGN_LEFT, FBW_ORANGE)
        sasl.gl.drawText(B612MONO_regular, 20, 350, "ROLL CONTROL IS LINEAR", 15, false, false, TEXT_ALIGN_LEFT, FBW_ORANGE)

        --artificial stability sum
        sasl.gl.drawRectangle(size[1]/2-10 + 150 * get(Roll_artstab), (size[2]/2-90) - 150 * get(Pitch_artstab), 20, 20, FBW_ORANGE)

        --pitch rate limits
        sasl.gl.drawArc(size[1]/2 + 150 * 0, (size[2]/2-80) - 150 * get(Pitch_rate_u_lim), 8, 10, 0, 360, FBW_RED)
        sasl.gl.drawArc(size[1]/2 + 150 * 0, (size[2]/2-80) - 150 * get(Pitch_rate_d_lim), 8,10, 0, 360, FBW_RED)

        --G command
        sasl.gl.drawCircle(size[1]/2 + 150 * 0, (size[2]/2-80) - 150 * get(G_output), 10, true, FBW_BLUE)

        --elevator trim
        sasl.gl.drawText(B612MONO_regular, 310, 483, "CWS", 15, false, false, TEXT_ALIGN_CENTER, FBW_GREEN)
        sasl.gl.drawRectangle(300, 405, 20, 75 * get(Elev_trim_ratio), FBW_GREEN)
        sasl.gl.drawFrame (300, 330, 20, 150, FBW_WHITE)
    else
        sasl.gl.drawText(B612MONO_regular, 20, 410, "DIRECT LAW", 40, false, false, TEXT_ALIGN_LEFT, FBW_ORANGE)
        sasl.gl.drawText(B612MONO_regular, 20, 390, "INPUTS ARE LINEAR", 15, false, false, TEXT_ALIGN_LEFT, FBW_ORANGE)
        sasl.gl.drawText(B612MONO_regular, 20, 370, "NO LIMITATIONS", 15, false, false, TEXT_ALIGN_LEFT, FBW_ORANGE)
        sasl.gl.drawText(B612MONO_regular, 20, 350, "USE MANUAL TRIM", 15, false, false, TEXT_ALIGN_LEFT, FBW_ORANGE)

        --elevator trim
        sasl.gl.drawText(B612regular, 310, 485, "MAN TRIM", 12, false, false, TEXT_ALIGN_CENTER, FBW_ORANGE)
        sasl.gl.drawRectangle(300, 405, 20, 75 * get(Elev_trim_ratio), FBW_ORANGE)
        sasl.gl.drawFrame (300, 330, 20, 150, FBW_WHITE)
    end

    --player input
    sasl.gl.drawCircle(size[1]/2 + 150 * get(Roll), (size[2]/2-80) - 150 * get(Pitch), 10, true, FBW_GREEN)

    
end