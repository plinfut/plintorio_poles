--[[-----------------------------------------------------------------------------------------------
---- HELPER FUNCTIONS
-------------------------------------------------------------------------------------------------]]

-- Attaches a lamp to newly placed poles.
local function polePlaced(event)
    local entity = event.created_entity or event.entity
    if entity and entity.valid and entity.type == "electric-pole" and string.match(entity.name, "^.*%-with%-lamp$") then
        local lamp = entity.surface.create_entity { name = "pole-lamp", position = entity.position, force = entity.force }
        lamp.destructible = false
        lamp.minable = false
    end
end

-- Removes attached lamps when poles are removed.
local function poleRemoved(event)
    local entity = event.entity
    if entity and entity.valid then
        local lamps = entity.surface.find_entities_filtered { name = "pole-lamp", position = entity.position }
        for _, lamp in pairs(lamps) do
            lamp.destroy()
        end
    end
end

--[[-----------------------------------------------------------------------------------------------
---- TRIGGERS
-------------------------------------------------------------------------------------------------]]

local poleFilter = { { filter = "type", type = "electric-pole" } }

script.on_event(defines.events.on_built_entity, polePlaced, poleFilter)
script.on_event(defines.events.on_robot_built_entity, polePlaced, poleFilter)
script.on_event({ defines.events.script_raised_built, defines.events.script_raised_revive }, polePlaced)

script.on_event(defines.events.on_pre_player_mined_item, poleRemoved, poleFilter)
script.on_event(defines.events.on_entity_died, poleRemoved, poleFilter)
script.on_event(defines.events.on_robot_pre_mined, poleRemoved, poleFilter)
script.on_event(defines.events.script_raised_destroy, poleRemoved)