--[[-----------------------------------------------------------------------------------------------
        DEPENDENCIES
-------------------------------------------------------------------------------------------------]]
require("scripts.data.prototypes")
local poles = require("scripts.data.poles")
local shortcuts = require("scripts.data.shortcuts")

--[[-----------------------------------------------------------------------------------------------
        POLE DEFINITIONS
-------------------------------------------------------------------------------------------------]]
poles.define("sp", "small-electric-pole", "lamp")
poles.define("mp", "medium-electric-pole", "electric-energy-distribution-1")
poles.define("bp", "big-electric-pole", "electric-energy-distribution-1")
poles.define("ss", "substation", "electric-energy-distribution-2")

--[[-----------------------------------------------------------------------------------------------
---- SHORTCUTS
-------------------------------------------------------------------------------------------------]]
shortcuts.define("green")
shortcuts.define("red")
