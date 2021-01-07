include("FBW_subcomponents/flight_ctl_subcomponents/lateral_ctl.lua")

local in_flight_mode_timer = 0

local VMAX_speeds = {
    0.82,
    350,
    280,
    230,
    215,
    215,
    195,
    190
}

local speedbrakes_effect = {
    25,
    25,
    7,
    10,
    10,
    8
}

local alpha0s = {
    -1.83,
    -1.88,
    -6.5,
    -7.45,
    -9.75,
    -10.75
}

local vsw_aprot_alphas = {
    8.5,
    13,
    13,
    12,
    12,
    11.5
}

local toga_prot_alphas = {
    9.5,
    14,
    14,
    13,
    13,
    12.5
}

local alpha_max_alphas = {
    10.5,
    16.5,
    16.5,
    16.5,
    16.0,
    17.5
}

--custom functions
function Extract_vs1g(gross_weight, config, gear_down)
    if config == 0 then--clean
        return 274.5826 + (79.54455 - 274.5826) / (1 + ((gross_weight / 1000) / 86.96515)^1.689565)
    elseif config == 1 then--1
        return 274.5653 + (43.15795 - 274.5653) / (1 + ((gross_weight / 1000) / 96.95092)^1.192485)
    elseif config == 2 then--1+f
        return 260.859 + (54.7645 - 260.859) / (1 + ((gross_weight / 1000) / 115.5867)^1.348778)
    elseif config == 3 then--2
        return 233.8 + (36.12623 - 233.8) / (1 + ((gross_weight / 1000) / 94.59888)^1.174251)
    elseif config == 4 then--3
        if gear_down == false then
            return 205941.1 + (0.3060642 - 205941.1) / (1 + ((gross_weight / 1000) / 295196500)^0.4922088)
        else
            return 3406261 + (31.05773 - 3406261) / (1 + ((gross_weight / 1000) / 434075700)^0.6790985)
        end
    elseif config == 5 then--full
        return 227.5873 + (39.04142 - 227.5873) / (1 + ((gross_weight / 1000) / 104.9039)^1.237619)
    end
end


--calculate flight characteristics values
function update()
    if get(PFD_Capt_Baro_Altitude) > 24600 then
        set(Capt_VMAX, get(PFD_Capt_IAS) * (VMAX_speeds[1] / get(Capt_Mach)))
        set(Capt_VMAX_prot, get(PFD_Capt_IAS) * (VMAX_speeds[1] + 0.006) / get(Capt_Mach))
    else
        set(Capt_VMAX, VMAX_speeds[2])
        set(Capt_VMAX_prot, VMAX_speeds[2] + 6)
    end
    if get(PFD_Fo_Baro_Altitude) > 24600 then
        set(Fo_VMAX, get(PFD_Fo_IAS) * (VMAX_speeds[1] / get(Fo_Mach)))
        set(Fo_VMAX_prot, get(PFD_Fo_IAS) * (VMAX_speeds[1] + 0.006) / get(Fo_Mach))
    else
        set(Fo_VMAX, VMAX_speeds[2])
        set(Fo_VMAX_prot, VMAX_speeds[2] + 6)
    end
    if get(Gear_handle) ~= 0 then
        if get(Front_gear_deployment) > 0.25 or get(Left_gear_deployment) > 0.25 or get(Right_gear_deployment) > 0.25 then
            set(Capt_VMAX, VMAX_speeds[3])
            set(Fo_VMAX, VMAX_speeds[3])
        end
    end
    if get(Flaps_internal_config) > 0 then
        set(Capt_VMAX, VMAX_speeds[get(Flaps_internal_config) + 3])
        set(Fo_VMAX, VMAX_speeds[get(Flaps_internal_config) + 3])
    end

    set(VFE_speed, VMAX_speeds[Math_clamp_higher(get(Flaps_internal_config), 4) + 1 + 3])

    set(VLS, Set_anim_value(get(VLS), (get(Flaps_internal_config) == 0 and 1.28 or 1.23) * Extract_vs1g(get(Aircraft_total_weight_kgs), get(Flaps_internal_config), get(Gear_handle) ~= 0) + Math_rescale(0, 0, Spoilers_obj.Get_cmded_spdbrk_def(1), speedbrakes_effect[get(Flaps_internal_config) + 1], Spoilers_obj.Get_curr_spdbrk_def()), 0, 350, 0.3))

    set(S_speed, 1.23 * Extract_vs1g(get(Aircraft_total_weight_kgs), 0, false))
    set(F_speed, 1.22 * Extract_vs1g(get(Aircraft_total_weight_kgs), 2, false))
    set(Capt_GD, (1.5 * get(Aircraft_total_weight_kgs) / 1000 + 110) + Math_clamp_lower((get(PFD_Capt_Baro_Altitude) - 20000) / 1000, 0))
    set(Fo_GD,   (1.5 * get(Aircraft_total_weight_kgs) / 1000 + 110) + Math_clamp_lower((get(PFD_Fo_Baro_Altitude)   - 20000) / 1000, 0))

    --update timer
    if get(FBW_in_flight_mode) == 0 then
        in_flight_mode_timer = 0
    end
    if in_flight_mode_timer < 10 and get(FBW_in_flight_mode) == 1 then
        in_flight_mode_timer = in_flight_mode_timer + get(DELTA_TIME)
    end

    --stall speeds(configuration dependent)
    --on liftoff for 5 seconds the Aprot value is the same as Amax(FCOM 1.27.20.P4 or DSC 27-20-10-20 P4/6)
    if in_flight_mode_timer >= 5 then
        set(Capt_Vaprot_vsw, Set_anim_value_no_lim(get(Capt_Vaprot_vsw), get(PFD_Capt_IAS) * math.sqrt(Math_clamp_lower((get(Alpha) - alpha0s[get(Flaps_internal_config) + 1]) / (vsw_aprot_alphas[get(Flaps_internal_config) + 1] - alpha0s[get(Flaps_internal_config) + 1]), 0)), 0.7))
        set(Fo_Vaprot_vsw,   Set_anim_value_no_lim(get(Fo_Vaprot_vsw),   get(PFD_Fo_IAS) *   math.sqrt(Math_clamp_lower((get(Alpha) - alpha0s[get(Flaps_internal_config) + 1]) / (vsw_aprot_alphas[get(Flaps_internal_config) + 1] - alpha0s[get(Flaps_internal_config) + 1]), 0)), 0.7))
    else
        set(Capt_Vaprot_vsw, Set_anim_value_no_lim(get(Capt_Vaprot_vsw), get(PFD_Capt_IAS) * math.sqrt(Math_clamp_lower((get(Alpha) - alpha0s[get(Flaps_internal_config) + 1]) / (alpha_max_alphas[get(Flaps_internal_config) + 1] - alpha0s[get(Flaps_internal_config) + 1]), 0)), 0.7))
        set(Fo_Vaprot_vsw,   Set_anim_value_no_lim(get(Fo_Vaprot_vsw),   get(PFD_Fo_IAS) *   math.sqrt(Math_clamp_lower((get(Alpha) - alpha0s[get(Flaps_internal_config) + 1]) / (alpha_max_alphas[get(Flaps_internal_config) + 1] - alpha0s[get(Flaps_internal_config) + 1]), 0)), 0.7))
    end
    set(Capt_Valpha_MAX, Set_anim_value_no_lim(get(Capt_Valpha_MAX), get(PFD_Capt_IAS) * math.sqrt(Math_clamp_lower((get(Alpha) - alpha0s[get(Flaps_internal_config) + 1]) / (alpha_max_alphas[get(Flaps_internal_config) + 1] - alpha0s[get(Flaps_internal_config) + 1]), 0)), 0.7))
    set(Fo_Valpha_MAX,   Set_anim_value_no_lim(get(Fo_Valpha_MAX),   get(PFD_Fo_IAS) *   math.sqrt(Math_clamp_lower((get(Alpha) - alpha0s[get(Flaps_internal_config) + 1]) / (alpha_max_alphas[get(Flaps_internal_config) + 1] - alpha0s[get(Flaps_internal_config) + 1]), 0)), 0.7))
end
