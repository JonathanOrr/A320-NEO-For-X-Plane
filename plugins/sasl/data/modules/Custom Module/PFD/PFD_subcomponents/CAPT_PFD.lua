position = {get(Capt_pfd_position, 1), get(Capt_pfd_position, 2), get(Capt_pfd_position, 3), get(Capt_pfd_position, 4)}
size = {900, 900}
include('PFD/PFD_drawing_assets.lua')
include('PFD/PFD_main.lua')
include('PFD/PFD_sub_functions/PFD_att.lua')
include('PFD/PFD_sub_functions/PFD_alt_tape.lua')
include('PFD/PFD_sub_functions/PFD_spd_tape.lua')
include('PFD/PFD_sub_functions/PFD_hdg_tape.lua')
include('PFD/PFD_sub_functions/PFD_vs_needle.lua')
include('PFD/PFD_sub_functions/PFD_timers.lua')
fbo = true

local capt_PFD_table = {
    Screen_ID = PFD_CAPT,
    PFD_aircraft_in_air_timer = 0,
    ATT_blink_now = false,
    SPD_blink_now = false,
    ALT_blink_now = false,
    HDG_blink_now = false,
    VS_blink_now = false,
    ATT_blink_timer = 0,
    SPD_blink_timer = 0,
    ALT_blink_timer = 0,
    HDG_blink_timer = 0,
    VS_blink_timer = 0,
    PFD_brightness = Capt_PFD_brightness_act,
    RA_ALT = Capt_ra_alt_ft,
    VS = PFD_Capt_VS,
    Corresponding_FAC_status = FAC_1_status,
    Opposite_FAC_status = FAC_2_status,
    Vmax_prot_spd = Capt_VMAX_prot,
    Vmax_spd = Capt_VMAX,
    VFE = VFE_speed,
    VLS = VLS,
    F_spd = F_speed,
    S_spd = S_speed,
    GD_spd = Capt_GD,
    Aprot_SPD = Capt_Vaprot_vsw,
    Amax = Capt_Valpha_MAX,
}

function update()
    position = {get(Capt_pfd_position, 1), get(Capt_pfd_position, 2), get(Capt_pfd_position, 3), get(Capt_pfd_position, 4)}
    PFD_update_timers(capt_PFD_table)
end


function draw()

    PFD_draw_att(capt_PFD_table)
    PFD_draw_spd_tape(capt_PFD_table)
    PFD_draw_alt_tape(capt_PFD_table)
    PFD_draw_hdg_tape(capt_PFD_table)
    PFD_draw_vs_needle(capt_PFD_table)
end
