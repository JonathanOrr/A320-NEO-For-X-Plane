--example_array = {P_gain, I_time, D_gain, Proportional, Integral_sum, Integral, Derivative, Current_error, Min_error, Max_error}
AT_PID_arrays = {
    SSS_L_N1 = {Name = "FADEC L N1", Type = "AT_I_TIME", P_gain = 1.8, I_time = 1.45, D_gain = 0.65, Proportional = 0, Integral_sum = 0, Integral = 0, Derivative = 0, PV = 0, Min_out = 0, Max_out = 1.1, Error_margin = 100},
    SSS_R_N1 = {Name = "FADEC R N1", Type = "AT_I_TIME", P_gain = 1.8, I_time = 1.45, D_gain = 0.65, Proportional = 0, Integral_sum = 0, Integral = 0, Derivative = 0, PV = 0, Min_out = 0, Max_out = 1.1, Error_margin = 100},
}

FBW_PID_arrays = {
    SSS_FBW_roll_rate =        {Name = "ROLL RATE", Type = "FBW_I_time_d(e)",  P_gain = 2, I_time = 1, D_gain = 0.92, Proportional = 0, Integral_sum = 0, Integral = 0, Derivative = 0, PV = 0, Min_out = -1, Max_out = 1, Error_margin = 25, Smooth_PV = false, PV_curve_spd = nil , Smooth_derivative = true, Derivative_curve_spd = 2.5},
    SSS_FBW_roll_left_limit =  {Name = "LROLL LIM", Type = "FBW_I_time_d(e)",  P_gain = 1, I_time = 0, D_gain = 0.75, Proportional = 0, Integral_sum = 0, Integral = 0, Derivative = 0, Current_error = 0, Min_out = -1, Max_out = 1, Error_margin = 34, Smooth_error = false, Error_curve_spd = nil , Smooth_derivative = false, Derivative_curve_spd = nil},
    SSS_FBW_roll_right_limit = {Name = "RROLL LIM", Type = "FBW_I_time_d(e)",  P_gain = 1, I_time = 0, D_gain = 0.75, Proportional = 0, Integral_sum = 0, Integral = 0, Derivative = 0, Current_error = 0, Min_out = -1, Max_out = 1, Error_margin = 34, Smooth_error = false, Error_curve_spd = nil , Smooth_derivative = false, Derivative_curve_spd = nil},

    SSS_FBW_G_load_pitch =     {Name = "G CMMD", Type = "FBW_I_time_d(e)",  P_gain = 0.075, I_time = 10, D_gain = 0.035, Proportional = 0, Integral_sum = 0, Integral = 0, Derivative = 0, Current_error = 0, Min_out = -1, Max_out = 1, Error_margin = 0.15, Smooth_error = false, Error_curve_spd = nil , Smooth_derivative = false, Derivative_curve_spd = nil},
    SSS_FBW_pitch_up_limit =   {Name = "PITCH U LIM", Type = "FBW_I_time_d(e)",  P_gain = 1.2, I_time = 0, D_gain = 1, Proportional = 0, Integral_sum = 0, Integral = 0, Derivative = 0, Current_error = 0, Min_out = -1, Max_out = 1, Error_margin = 10, Smooth_error = false, Error_curve_spd = nil , Smooth_derivative = false, Derivative_curve_spd = nil},
    SSS_FBW_pitch_down_limit = {Name = "PITCH D LIM", Type = "FBW_I_time_d(e)",  P_gain = 1.2, I_time = 0, D_gain = 1, Proportional = 0, Integral_sum = 0, Integral = 0, Derivative = 0, Current_error = 0, Min_out = -1, Max_out = 1, Error_margin = 10, Smooth_error = false, Error_curve_spd = nil , Smooth_derivative = false, Derivative_curve_spd = nil},
    SSS_FBW_vmax_prot_pitch =  {Name = "VMAX PROT", Type = "FBW_I_time_d(e)",  P_gain = 1, I_time = 0, D_gain = 0.5, Proportional = 0, Integral_sum = 0, Integral = 0, Derivative = 0, Current_error = 0, Min_out = -1, Max_out = 1, Error_margin = 100, Smooth_error = false, Error_curve_spd = nil , Smooth_derivative = false, Derivative_curve_spd = nil},
    SSS_FBW_stall_prot_pitch = {Name = "APROT", Type = "FBW_I_time_d(e)",  P_gain = 2, I_time = 0, D_gain = 1.85, Proportional = 0, Integral_sum = 0, Integral = 0, Derivative = 0, Current_error = 0, Min_out = -1, Max_out = 1, Error_margin = 5, Smooth_error = false, Error_curve_spd = nil , Smooth_derivative = false, Derivative_curve_spd = nil},

    SSS_FBW_CWS_trim =         {Name = "CWS TRIM", Type = "FBW_I_time_d(e)",  P_gain = 0.4, I_time = 2, D_gain = 1, Proportional = 0, Integral_sum = 0, Integral = 0, Derivative = 0, Current_error = 0, Min_out = -1, Max_out = 1, Error_margin = 1, Smooth_error = false, Error_curve_spd = nil , Smooth_derivative = false, Derivative_curve_spd = nil},
}