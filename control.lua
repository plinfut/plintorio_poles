local MAX_WIRE_REACH = 64

--[[-----------------------------------------------------------------------------------------------
---- HELPER FUNCTIONS
-------------------------------------------------------------------------------------------------]]

-- Toggles an auto-wire shortcut.
local function toggleEnabled(event)
    local player = game.get_player(1)
    if event.prototype_name == "auto-red-wire" then
        if player.is_shortcut_toggled("auto-red-wire") then
            player.set_shortcut_toggled("auto-red-wire", false)
        else
          player.set_shortcut_toggled("auto-red-wire", true)
        end
    elseif event.prototype_name == "auto-green-wire" then
        if player.is_shortcut_toggled("auto-green-wire") then
            player.set_shortcut_toggled("auto-green-wire", false)
        else
          player.set_shortcut_toggled("auto-green-wire", true)
        end
    end
end

-- Attaches a lamp to an entity if the entity's name ends with "-with-lamp".
local function attachLamp(entity)
    if string.match(entity.name, "^.*%-with%-lamp$") then
        local lamp = entity.surface.create_entity { name="pole-lamp", position=entity.position, force=entity.force }
        lamp.destructible = false
        lamp.minable = false
    end
end

-- Attaches red and/or green wires between the given entity and neighoring poles within reach if enabled.
local function attachWires(entity, red, green)
    local neighbors = entity.surface.find_entities_filtered { type="electric-pole", radius=MAX_WIRE_REACH }
    local red = game.get_player(1).is_shortcut_toggled("auto-red-wire")
    local green = game.get_player(1).is_shortcut_toggled("auto-green-wire")
    for _,neighbor in pairs(neighbors) do
        if entity.can_wires_reach(neighbor) then
              if red then
                local source = entity.get_wire_connector(defines.wire_connector_id.circuit_red, true)
                local target = neighbor.get_wire_connector(defines.wire_connector_id.circuit_red, true)
                source.connect_to(target)
            end
            if green then
                local source = entity.get_wire_connector(defines.wire_connector_id.circuit_green, true)
                local target = neighbor.get_wire_connector(defines.wire_connector_id.circuit_green, true)
                source.connect_to(target)
            end
        end
    end
end

-- Attaches a lamp and red wires to newly placed poles.
local function polePlaced(event)
    local entity = event.created_entity or event.entity
    if entity and entity.valid then
        attachLamp(entity)
        attachWires(entity)
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

-- Detect various construction methods.
local poleFilter = { { filter = "type", type = "electric-pole" } }
script.on_event(defines.events.on_built_entity, polePlaced, poleFilter)
script.on_event(defines.events.on_robot_built_entity, polePlaced, poleFilter)
script.on_event({ defines.events.script_raised_built, defines.events.script_raised_revive }, polePlaced)

-- Detect verious deconstruction methods.
script.on_event(defines.events.on_pre_player_mined_item, poleRemoved, poleFilter)
script.on_event(defines.events.on_entity_died, poleRemoved, poleFilter)
script.on_event(defines.events.on_robot_pre_mined, poleRemoved, poleFilter)
script.on_event(defines.events.script_raised_destroy, poleRemoved)

-- Detect enable/disable shortcut changes.
script.on_event(defines.events.on_lua_shortcut, toggleEnabled)