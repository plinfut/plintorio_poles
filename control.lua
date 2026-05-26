--[[-----------------------------------------------------------------------------------------------
        DEPENDENCIES
-------------------------------------------------------------------------------------------------]]
local shortcuts = require("scripts.control.shortcuts")
local construction = require("scripts.control.construction")

--[[-----------------------------------------------------------------------------------------------
        HELPER FUNCTIONS
-------------------------------------------------------------------------------------------------]]

-- Attaches a lamp and circuit wires to poles upon creation
local function poleConstructed(event)
    local entity = event.entity
    if entity and entity.valid then
        construction.attachLamp(entity)
        construction.attachWires(event)
    end
end

-- Removes attached lamps upon pole deconstruction
local function poleDeconstructed(event)
    local entity = event.entity
    if entity and entity.valid then
        local lamps = entity.surface.find_entities_filtered { name = "pole-lamp", position = entity.position, radius=0.5 }
        for _, lamp in pairs(lamps) do
            lamp.destroy()
        end
    end
end

--[[-----------------------------------------------------------------------------------------------
        TRIGGERS
-------------------------------------------------------------------------------------------------]]

-- Detect various construction methods.
local poleFilter = { { filter = "type", type = "electric-pole" } }
script.on_event(defines.events.on_built_entity, poleConstructed, poleFilter)
script.on_event(defines.events.on_robot_built_entity, poleConstructed, poleFilter)

-- Detect verious deconstruction methods.
script.on_event(defines.events.on_pre_player_mined_item, poleDeconstructed, poleFilter)
script.on_event(defines.events.on_entity_died, poleDeconstructed, poleFilter)
script.on_event(defines.events.on_robot_pre_mined, poleDeconstructed, poleFilter)

-- Detect enable/disable shortcut changes.
script.on_event(defines.events.on_lua_shortcut, shortcuts.toggle)
