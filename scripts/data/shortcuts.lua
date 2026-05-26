-- Initialize the shortcuts module
local shortcuts = {}

-- Add a shortcut button to toggle automatically adding circuit wire
function shortcuts.define(color)
    data:extend({
        {
            action = "lua",
            icons = {
                { icon="__base__/graphics/icons/medium-electric-pole.png", scale=1, shift={-32, 0} },
                { icon="__base__/graphics/icons/medium-electric-pole.png", scale=1, shift={32, 0} },
                { icon="__base__/graphics/icons/"..color.."-wire.png",  scale=0.75 }
            },
            name = "auto-" .. color .. "-wire",
            small_icons = {
                { icon="__base__/graphics/icons/medium-electric-pole.png",  scale=1, shift={-24, 0} },
                { icon="__base__/graphics/icons/medium-electric-pole.png",  scale=1, shift={24, 0} },
                { icon="__base__/graphics/icons/"..color.."-wire.png",  scale=0.75 }
            },
            technology_to_unlock = "circuit-network",
            toggleable = true,
            type = "shortcut"
        }
    })
end

-- Return the shortcuts module
return shortcuts
