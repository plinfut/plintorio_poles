-- Initialize the construction module
local construction = {}

-- Attaches a lamp to entities who's name end in "-with-lamp"
function construction.attachLamp(entity)
    if string.match(entity.name, "^.*%-with%-lamp$") then
        local lamp = entity.surface.create_entity{ name="pole-lamp", position=entity.position, force=entity.force }
        lamp.destructible = false
        lamp.minable = false
    end
end

-- Attaches red and/or green wires between the given entity and neighoring poles within reach if enabled
function construction.attachWires(event)
    local entity = event.entity
    local neighbors = entity.surface.find_entities_filtered{
        type="electric-pole",
        position=entity.position,
        radius=entity.prototype.get_max_circuit_wire_distance()
    }
    local player = game.get_player(event.player_index or 1)
    local red = player.is_shortcut_toggled("auto-red-wire")
    local green = player.is_shortcut_toggled("auto-green-wire")
    for _,neighbor in pairs(neighbors) do
        if neighbor.can_wires_reach(entity) then
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

-- Return the construction module
return construction
