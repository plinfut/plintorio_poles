-- Initialize the shortcuts module
local shortcuts = {}

-- Toggles an auto-wire shortcut from an on_lua_shortcut event
function shortcuts.toggle(event)
    local player = game.get_player(event.player_index)
    local color = string.match(event.prototype_name, "^auto%-(.*)%-wire$")
    if color then
        if player.is_shortcut_toggled("auto-"..color.."-wire") then
            player.set_shortcut_toggled("auto-"..color.."-wire", false)
        else
          player.set_shortcut_toggled("auto-"..color.."-wire", true)
        end
    end
end

-- Return the shortcuts module
return shortcuts
