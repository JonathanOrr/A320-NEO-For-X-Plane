--example_array = {P_gain, I_time, D_gain, Proportional, Integral_sum, Integral, Derivative, Current_error, Min_error, Max_error}
AT_PID_arrays = {
    SSS_L_N1 = {Name = "FADEC L N1", Type = "AT_I_TIME", P_gain = 1.8, I_time = 1.45, D_gain = 0.65, Proportional = 0, Integral_sum = 0, Integral = 0, Derivative = 0, PV = 0, Output = 0, Min_out = 0, Max_out = 1.1, Error_margin = 100},
    SSS_R_N1 = {Name = "FADEC R N1", Type = "AT_I_TIME", P_gain = 1.8, I_time = 1.45, D_gain = 0.65, Proportional = 0, Integral_sum = 0, Integral = 0, Derivative = 0, PV = 0, Output = 0, Min_out = 0, Max_out = 1.1, Error_margin = 100},
}

FBW_PID_arrays = {
    SSS_FBW_roll_rate = {
        Name = "ROLL RATE",
        Type = "FBW_I_time_dpv",
        P_gain = 0.22,
        I_time = 1.65,
        D_gain = 0.06,
        derivative_in_integral = true,
        Iimit_integration_spd = true,
        Proportional = 0,
        Integral = 0,
        Derivative = 0,
        PV = 0,
        Output = 0,
        Min_out = -1,
        Max_out = 1,
        Error_margin = 2.5,
        Smooth_PV = false,
        PV_curve_spd = nil ,
        Smooth_derivative = true,
        Derivative_curve_spd = 2.8,
    },
    SSS_FBW_roll_left_limit = {
        Name = "LROLL LIM",
        Type = "FBW_I_time_d(e)",
        P_gain = 1,
        I_time = 0,
        D_gain = 0.75,
        derivative_in_integral = false,
        Iimit_integration_spd = false,
        Proportional = 0,
        Integral = 0,
        Derivative = 0,
        Current_error = 0,
        Output = 0,
        Min_out = -1,
        Max_out = 1,
        Error_margin = 34,
        Smooth_error = false,
        Error_curve_spd = nil,
        Smooth_derivative = false,
        Derivative_curve_spd = nil,
    },
    SSS_FBW_roll_right_limit = {
        Name = "RROLL LIM",
        Type = "FBW_I_time_d(e)",
        P_gain = 1,
        I_time = 0,
        D_gain = 0.75,
        derivative_in_integral = false,
        Iimit_integration_spd = false,
        Proportional = 0,
        Integral = 0,
        Derivative = 0,
        Current_error = 0,
        Output = 0,
        Min_out = -1,
        Max_out = 1,
        Error_margin = 34,
        Smooth_error = false,
        Error_curve_spd = nil,
        Smooth_derivative = false,
        Derivative_curve_spd = nil,
    },

    SSS_FBW_G_load_pitch = {
        Name = "G CMMD",
        Type = "FBW_I_time_dpv",
        P_gain = 1,
        I_time = 2.5,
        D_gain = 0.32,
        derivative_in_integral = true,
        Iimit_integration_spd = true,
        Proportional = 0,
        Integral = 0,
        Derivative = 0,
        PV = 0,
        Output = 0,
        Min_out = -1,
        Max_out = 1,
        Error_margin = 2.5,
        Smooth_PV = false,
        PV_curve_spd = nil ,
        Smooth_derivative = true,
        Derivative_curve_spd = 4,
    },
    SSS_FBW_pitch_rate = {
        Name = "pitch rate CMMD",
        Type = "FBW_I_time_dpv",
        P_gain = 0.2,
        I_time = 2.2,
        D_gain = 0.1,
        derivative_in_integral = true,
        Iimit_integration_spd = true,
        Proportional = 0,
        Integral = 0,
        Derivative = 0,
        PV = 0,
        Output = 0,
        Min_out = -1,
        Max_out = 1,
        Error_margin = 5,
        Smooth_PV = false,
        PV_curve_spd = nil ,
        Smooth_derivative = true,
        Derivative_curve_spd = 3,
    },
    SSS_FBW_pitch_up_limit = {
        Name = "PITCH U LIM",
        Type = "FBW_I_time_d(e)",
        P_gain = 1.2,
        I_time = 0,
        D_gain = 1,
        derivative_in_integral = false,
        Iimit_integration_spd = false,
        Proportional = 0,
        Integral = 0,
        Derivative = 0,
        Current_error = 0,
        Output = 0,
        Min_out = -1,
        Max_out = 1,
        Error_margin = 10,
        Smooth_error = false,
        Error_curve_spd = nil,
        Smooth_derivative = false,
        Derivative_curve_spd = nil,
    },
    SSS_FBW_pitch_down_limit = {
        Name = "PITCH D LIM", 
        Type = "FBW_I_time_d(e)", 
        P_gain = 1.2,
        I_time = 0,
        D_gain = 1,
        derivative_in_integral = false,
        Iimit_integration_spd = false,
        Proportional = 0,
        Integral = 0,
        Derivative = 0,
        Current_error = 0,
        Output = 0,
        Min_out = -1,
        Max_out = 1,
        Error_margin = 10,
        Smooth_error = false,
        Error_curve_spd = nil,
        Smooth_derivative = false,
        Derivative_curve_spd = nil,
    },
    SSS_FBW_vmax_prot_pitch = {
        Name = "VMAX PROT",
        Type = "FBW_I_time_d(e)",
        P_gain = 1,
        I_time = 0,
        D_gain = 0.5,
        derivative_in_integral = false,
        Iimit_integration_spd = false,
        Proportional = 0,
        Integral = 0,
        Derivative = 0,
        Current_error = 0,
        Output = 0,
        Min_out = -1,
        Max_out = 1,
        Error_margin = 100,
        Smooth_error = false,
        Error_curve_spd = nil ,
        Smooth_derivative = false,
        Derivative_curve_spd = nil,
    },
    SSS_FBW_stall_prot_pitch = {
        Name = "APROT",
        Type = "FBW_I_time_d(e)",
        P_gain = 0.65,
        I_time = 0,
        D_gain = 0.65,
        derivative_in_integral = true,
        Iimit_integration_spd = true,
        Proportional = 0,
        Integral = 0,
        Derivative = 0,
        PV = 0,
        Output = 0,
        Min_out = -1,
        Max_out = 1,
        Error_margin = 5,
        Smooth_PV = false,
        PV_curve_spd = nil,
        Smooth_derivative = false,
        Derivative_curve_spd = nil,
    },

    SSS_FBW_CWS_trim = {
        Name = "CWS TRIM",
        Type = "FBW_I_time_dpv",
        P_gain = 0.1,
        I_time = 5,
        D_gain = 0.05,
        derivative_in_integral = true,
        Iimit_integration_spd = true,
        Proportional = 0,
        Integral = 0,
        Derivative = 0,
        PV = 0,
        Output = 0,
        Min_out = -1,
        Max_out = 1,
        Error_margin = 1,
        Smooth_PV = false,
        PV_curve_spd = nil,
        Smooth_derivative = true,
        Derivative_curve_spd = 3,
    },
}

