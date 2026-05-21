--[[-----------------------------------------------------------------------------------------------
---- STARTUP SETTINGS
-------------------------------------------------------------------------------------------------]]
data:extend({
    {
        name = "plintorio_poles_sp_radius",
        type = "double-setting",
        default_value = 2.5,
        minimum_value = 1,
        maximum_value = 64,
        order = "aa",
        setting_type = "startup"
    },
    {
        name = "plintorio_poles_sp_dist",
        type = "int-setting",
        default_value = 7,
        minimum_value = 2,
        maximum_value = 64,
        order = "ab",
        setting_type = "startup"
    },
    {
        name = "plintorio_poles_mp_radius",
        type = "double-setting",
        default_value = 3.5,
        minimum_value = 1,
        maximum_value = 64,
        order = "ba",
        setting_type = "startup"
    },
    {
        name = "plintorio_poles_mp_dist",
        type = "int-setting",
        default_value = 9,
        minimum_value = 2,
        maximum_value = 64,
        order = "bb",
        setting_type = "startup"
    },
    {
        name = "plintorio_poles_bp_radius",
        type = "double-setting",
        default_value = 2,
        minimum_value = 1.5,
        maximum_value = 64,
        order = "ca",
        setting_type = "startup"
    },
    {
        name = "plintorio_poles_bp_dist",
        type = "int-setting",
        default_value = 32,
        minimum_value = 3,
        maximum_value = 64,
        order = "cb",
        setting_type = "startup"
    },
    {
        name = "plintorio_poles_ss_radius",
        type = "double-setting",
        default_value = 9,
        minimum_value = 1.5,
        maximum_value = 64,
        order = "da",
        setting_type = "startup"
    },
    {
        name = "plintorio_poles_ss_dist",
        type = "int-setting",
        default_value = 18,
        minimum_value = 3,
        maximum_value = 64,
        order = "db",
        setting_type = "startup"
    },
})