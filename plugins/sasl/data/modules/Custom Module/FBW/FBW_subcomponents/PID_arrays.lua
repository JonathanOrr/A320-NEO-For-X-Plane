--example_array = {P_gain, I_time, D_gain, Proportional, Integral_sum, Integral, Derivative, Current_error, Min_error, Max_error}
AT_PID_arrays = {
    SSS_L_N1 = {
        P_gain = 0.001,
        I_gain = 0.00425,
        D_gain = 0.0001,
        B_gain = 1,
        Actual_output = 0,
        Desired_output = 0,
        Integral_sum = 0,
        Current_error = 0,
        Min_out = 0.095,
        Max_out = 1
    },
    SSS_R_N1 = {
        P_gain = 0.001,
        I_gain = 0.00425,
        D_gain = 0.0001,
        B_gain = 1,
        Actual_output = 0,
        Desired_output = 0,
        Integral_sum = 0,
        Current_error = 0,
        Min_out = 0.095,
        Max_out = 1
    },
}

FBW_PID_arrays = {
    FBW_ROLL_RATE_PID_array = {
        P_gain = 0.032,
        I_gain = 0.055,
        D_gain = 0.0001,
        B_gain = 1,
        Schedule_gains = true,
        Schedule_table = {
            P = {
                {110, 0.064},
                {130, 0.044},
                {160, 0.040},
                {180, 0.032},
                {220, 0.029},
                {280, 0.025},
                {345, 0.020},
            },
            I = {
                {110, 0.088},
                {130, 0.088},
                {160, 0.065},
                {180, 0.055},
                {220, 0.050},
                {280, 0.050},
                {345, 0.050},
            },
            D = {
                {110, 0.0001},
                {130, 0.0001},
                {160, 0.0001},
                {180, 0.0001},
                {220, 0.0001},
                {280, 0.0001},
                {345, 0.0001},
            },
        },
        Limited_integral = false,
        min_integral = -1,
        max_integral = 1,
        Min_out = -1,
        Max_out = 1,
        PV = 0,
        Error = 0,
        Proportional = 0,
        Integral = 0,
        Derivative = 0,
        Backpropagation = 0,
        Desired_output = 0,
        Actual_output = 0,
    },

    FBW_ROTATION_APROT_PID_array = {
        P_gain = 1.100,
        I_gain = 0.450,
        D_gain = 0.000,
        B_gain = 1,
        Schedule_gains = false,
        Schedule_table = {
            P = {
                {000, 0.000},
            },
            I = {
                {000, 0.000},
            },
            D = {
                {000, 0.000},
            },
        },
        Limited_integral = true,
        min_integral = -4,
        max_integral = 4,
        Min_out = -4,
        Max_out = 4,
        PV = 0,
        Error = 0,
        Proportional = 0,
        Integral = 0,
        Derivative = 0,
        Backpropagation = 0,
        Desired_output = 0,
        Actual_output = 0,
    },
    FBW_FLARE_APROT_PID_array = {
        P_gain = 1.100,
        I_gain = 0.450,
        D_gain = 0.000,
        B_gain = 1,
        Schedule_gains = false,
        Schedule_table = {
            P = {
                {000, 0.000},
            },
            I = {
                {000, 0.000},
            },
            D = {
                {000, 0.000},
            },
        },
        Limited_integral = true,
        min_integral = -4,
        max_integral = 4,
        Min_out = -4,
        Max_out = 4,
        PV = 0,
        Error = 0,
        Proportional = 0,
        Integral = 0,
        Derivative = 0,
        Backpropagation = 0,
        Desired_output = 0,
        Actual_output = 0,
    },

    FBW_PITCH_RATE_PID_array = {
        P_gain = 0.055,
        I_gain = 0.150,
        D_gain = 0.000,
        B_gain = 3,
        Schedule_gains = true,
        Schedule_table = {
            P = {
                {150, 0.072},
                {180, 0.058},
                {250, 0.055},
                {350, 0.050},
                {410, 0.042},
            },
            I = {
                {150, 0.165},
                {180, 0.150},
                {250, 0.148},
                {350, 0.130},
                {410, 0.118},
            },
            D = {
                {160, 0.000},
                {180, 0.000},
                {250, 0.000},
                {350, 0.000},
                {410, 0.000},
            },
        },
        Limited_integral = true,
        min_integral = -1,
        max_integral = 1,
        Min_out = -1,
        Max_out = 1,
        PV = 0,
        Error = 0,
        Proportional = 0,
        Integral = 0,
        Derivative = 0,
        Backpropagation = 0,
        Desired_output = 0,
        Actual_output = 0,
    },

    FBW_CSTAR_PID_array = {
        P_gain = 0.060,
        I_gain = 0.185,
        D_gain = 0.002,
        B_gain = 1,
        Schedule_gains = true,
        Schedule_table = {
            P = {
                {135, 0.080},
                {150, 0.075},
                {180, 0.065},
                {200, 0.060},
                {250, 0.055},
                {300, 0.045},
                {340, 0.032},
                {410, 0.028},
            },
            I = {
                {135, 0.270},
                {150, 0.250},
                {180, 0.200},
                {200, 0.190},
                {250, 0.185},
                {300, 0.165},
                {340, 0.145},
                {410, 0.132},
            },
            D = {
                {135, 0.002},
                {150, 0.002},
                {180, 0.002},
                {200, 0.002},
                {250, 0.002},
                {300, 0.002},
                {340, 0.002},
                {410, 0.002},
            },
        },
        Limited_integral = true,
        min_integral = -1,
        max_integral = 1,
        Min_out = -1,
        Max_out = 1,
        PV = 0,
        Error = 0,
        Proportional = 0,
        Integral = 0,
        Derivative = 0,
        Backpropagation = 0,
        Desired_output = 0,
        Actual_output = 0,
    },

    FBW_YAW_DAMPER_PID_array = {
        P_gain = 0.055,
        I_gain = 0.000,
        D_gain = 0.000,
        B_gain = 0,
        Schedule_gains = false,
        Schedule_table = {
            P = {
                {0.00, 0.000},
            },
            I = {
                {0.00, 0.000},
            },
            D = {
                {0.00, 0.000},
            },
        },
        Limited_integral = false,
        min_integral = -1,
        max_integral = 1,
        Min_out = -1,
        Max_out = 1,
        PV = 0,
        Error = 0,
        Proportional = 0,
        Integral = 0,
        Derivative = 0,
        Backpropagation = 0,
        Desired_output = 0,
        Actual_output = 0,
    },
    FBW_NRM_YAW_PID_array = {
        P_gain = 0.006,
        I_gain = 0.013,
        D_gain = 0.0010,
        B_gain = 1,
        Schedule_gains = false,
        Schedule_table = {
            P = {
                {0.00, 0.012},
                {0.03, 0.010},
                {0.10, 0.008},
                {0.20, 0.006},
                {0.60, 0.003},
                {1.00, 0.002},
            },
            I = {
                {0.00, 0.020},
                {0.03, 0.015},
                {0.10, 0.014},
                {0.20, 0.012},
                {0.60, 0.010},
                {1.00, 0.008},
            },
            D = {
                {0.00, 0.0100},
                {0.03, 0.0025},
                {0.10, 0.0020},
                {0.20, 0.0012},
                {0.60, 0.0004},
                {1.00, 0.0002},
            },
        },
        Limited_integral = false,
        min_integral = -1,
        max_integral = 1,
        Min_out = -1,
        Max_out = 1,
        PV = 0,
        Error = 0,
        Proportional = 0,
        Integral = 0,
        Derivative = 0,
        Backpropagation = 0,
        Desired_output = 0,
        Actual_output = 0,
    },
}

