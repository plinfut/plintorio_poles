-- Initialize the poles module
local poles = {}

-- Adjusts the coverage area and wire reach of a vanilla pole and adds a variant with lamp
-- Arguments: settings prefix, name of the vanilla pole, and name of technology that unlocks the recipe
function poles.define(prefix, name, tech)

    -- Adjust original prototype
    local oPt = data.raw["electric-pole"][name]
    oPt.maximum_wire_distance = settings.startup["plintorio_poles_" .. prefix .. "_dist"].value
    oPt.supply_area_distance = settings.startup["plintorio_poles_" .. prefix .. "_radius"].value

    -- Add the item with lamp
    local item = table.deepcopy(data.raw["item"][name])
    item.icons = {
        { icon = "__base__/graphics/icons/" .. name .. ".png" },
        { icon = "__base__/graphics/icons/small-lamp.png", scale = 0.25, shift={8,0} }
    }
    item.name = name .. "-with-lamp"
    item.order = item.order .. "-with-lamp"
    item.place_result = name .. "-with-lamp"
    data:extend({ item })

    -- Add the prototype with lamp
    local pt = table.deepcopy(oPt)
    pt.icons = {
        { icon = "__base__/graphics/icons/" .. name .. ".png" },
        { icon = "__base__/graphics/icons/small-lamp.png", scale = 0.25, shift={8,0} }
    }
    pt.minable.result = name .. "-with-lamp"
    pt.name = name .. "-with-lamp"
    pt.placeable_by = { item=name .. "-with-lamp", count=1 }
    data:extend({ pt })

    -- Prepare the recipe with lamp
    data:extend({
        {
            enabled = false,
            ingredients = {
                { amount=1, name=name, type="item" },
                { amount=1, name="small-lamp", type="item" }
            },
            name = name .. "-with-lamp",
            results = {{ amount=1, name=name.."-with-lamp", type="item" }},
            type = "recipe"
        }
    })

    -- Add unlock to technology
    table.insert(data.raw["technology"][tech].effects, { type="unlock-recipe", recipe=name.."-with-lamp" })

end

-- Return the poles module
return poles
