--[[-----------------------------------------------------------------------------------------------
---- COVERAGE & WIRE REACH
-------------------------------------------------------------------------------------------------]]

-- Update vanilla small electric pole's range and coverage.
local sp = data.raw["electric-pole"]["small-electric-pole"]
sp.supply_area_distance = settings.startup["plintorio_poles_sp_radius"].value
sp.maximum_wire_distance = settings.startup["plintorio_poles_sp_dist"].value

-- Update vanilla medium electric pole's range and coverage.
local mp = data.raw["electric-pole"]["medium-electric-pole"]
mp.supply_area_distance = settings.startup["plintorio_poles_mp_radius"].value
mp.maximum_wire_distance = settings.startup["plintorio_poles_mp_dist"].value

-- Update vanilla big electric pole's range and coverage.
local bp = data.raw["electric-pole"]["big-electric-pole"]
bp.supply_area_distance = settings.startup["plintorio_poles_bp_radius"].value
bp.maximum_wire_distance = settings.startup["plintorio_poles_bp_dist"].value

-- Update vanilla substation's range and coverage.
local ss = data.raw["electric-pole"]["substation"]
ss.supply_area_distance = settings.startup["plintorio_poles_ss_radius"].value
ss.maximum_wire_distance = settings.startup["plintorio_poles_ss_dist"].value

--[[-----------------------------------------------------------------------------------------------
---- LAMP ATTACHMENT
-------------------------------------------------------------------------------------------------]]

-- Prepare the pole lamp prototype.
local pl = table.deepcopy(data.raw["lamp"]["small-lamp"])
pl.collision_box = { { -0.1, -0.1}, { 0.1, 0.1}}
pl.collision_mask = { layers = {} }
pl.flags = {
    "placeable-off-grid",
    "not-deconstructable",
    "not-on-map",
    "not-blueprintable"
}
pl.minable = nil
pl.name = "pole-lamp"
pl.selection_box = { { -0.2, -0.2}, { 0.2, 0.2}}
pl.selectable_in_game = false

-- Prepare the small electric pole with lamp prototype.
local splp = table.deepcopy(sp)
splp.icon = "__plintorio_poles__/graphics/icons/small-electric-pole-with-lamp.png"
splp.name = "small-electric-pole-with-lamp"
splp.minable.result = "small-electric-pole-with-lamp"
-- Prepare the small electric pole with lamp item.
local spli = table.deepcopy(data.raw["item"]["small-electric-pole"])
spli.icon = "__plintorio_poles__/graphics/icons/small-electric-pole-with-lamp.png"
spli.name = "small-electric-pole-with-lamp"
spli.next_upgrade = "medium-electric-pole-with-lamp"
spli.order = "a[energy]-a[small-electric-pole]-a[with-lamp]"
spli.place_result = "small-electric-pole-with-lamp"
-- Prepare the small electric pole with lamp recipe.
local splr = {
    enabled = false,
    energy_required = 0.5,
    ingredients = {
        { amount=1, name="small-electric-pole", type="item" },
        { amount=1, name="small-lamp", type="item" }
    },
    name = "small-electric-pole-with-lamp",
    order = "a[energy]-a[small-electric-pole]-a[with-lamp]",
    results = { { amount=1, name="small-electric-pole-with-lamp", type="item" } },
    type = "recipe"
}
-- Unlock the recipe with the lamp technology.
table.insert(data.raw["technology"]["lamp"].effects, { type="unlock-recipe", recipe="small-electric-pole-with-lamp" })

-- Prepare the medium electric pole with lamp prototype.
local mplp = table.deepcopy(mp)
mplp.icon = "__plintorio_poles__/graphics/icons/medium-electric-pole-with-lamp.png"
mplp.name = "medium-electric-pole-with-lamp"
mplp.minable.result = "medium-electric-pole-with-lamp"
-- Prepare the medium electric pole with lamp item.
local mpli = table.deepcopy(data.raw["item"]["medium-electric-pole"])
mpli.icon = "__plintorio_poles__/graphics/icons/medium-electric-pole-with-lamp.png"
mpli.name = "medium-electric-pole-with-lamp"
mpli.order = "a[energy]-b[medium-electric-pole]-a[with-lamp]"
mpli.place_result = "medium-electric-pole-with-lamp"
-- Prepare the medium electric pole with lamp recipe.
local mplr = {
    enabled = false,
    energy_required = 0.5,
    ingredients = {
        { amount=1, name="medium-electric-pole", type="item" },
        { amount=1, name="small-lamp", type="item" }
    },
    name = "medium-electric-pole-with-lamp",
    order = "a[energy]-b[medium-electric-pole]-a[with-lamp]",
    results = { { amount=1, name="medium-electric-pole-with-lamp", type="item" } },
    type = "recipe"
}
-- Unlock the recipe with the electric energy distrubution 1 technology.
table.insert(data.raw["technology"]["electric-energy-distribution-1"].effects, { type="unlock-recipe", recipe="medium-electric-pole-with-lamp" })

-- Prepare the big electric pole with lamp prototype.
local bplp = table.deepcopy(bp)
bplp.icon = "__plintorio_poles__/graphics/icons/big-electric-pole-with-lamp.png"
bplp.name = "big-electric-pole-with-lamp"
bplp.minable.result = "big-electric-pole-with-lamp"
-- Prepare the big electric pole with lamp item.
local bpli = table.deepcopy(data.raw["item"]["big-electric-pole"])
bpli.icon = "__plintorio_poles__/graphics/icons/big-electric-pole-with-lamp.png"
bpli.name = "big-electric-pole-with-lamp"
bpli.order = "a[energy]-c[big-electric-pole]-a[with-lamp]"
bpli.place_result = "big-electric-pole-with-lamp"
-- Prepare the big electric pole with lamp recipe.
local bplr = {
    enabled = false,
    energy_required = 0.5,
    ingredients = {
        { amount=1, name="big-electric-pole", type="item" },
        { amount=1, name="small-lamp", type="item" }
    },
    name = "big-electric-pole-with-lamp",
    order = "a[energy]-c[big-electric-pole]-a[with-lamp]",
    results = { { amount=1, name="big-electric-pole-with-lamp", type="item" } },
    type = "recipe"
}
-- Unlock the recipe with the Electric energy distrubution 1 technology.
table.insert(data.raw["technology"]["electric-energy-distribution-1"].effects, { type="unlock-recipe", recipe="big-electric-pole-with-lamp" })

-- Prepare the substation with lamp prototype.
local sslp = table.deepcopy(ss)
sslp.icon = "__plintorio_poles__/graphics/icons/substation-with-lamp.png"
sslp.name = "substation-with-lamp"
sslp.minable.result = "substation-with-lamp"
-- Prepare the substation with lamp item.
local ssli = table.deepcopy(data.raw["item"]["substation"])
ssli.icon = "__plintorio_poles__/graphics/icons/substation-with-lamp.png"
ssli.name = "substation-with-lamp"
ssli.order = "a[energy]-d[substation]-a[with-lamp]"
ssli.place_result = "substation-with-lamp"
-- Prepare the substation with lamp recipe.
local sslr = {
    enabled = false,
    energy_required = 0.5,
    ingredients = {
        { amount=1, name="substation", type="item" },
        { amount=1, name="small-lamp", type="item" }
    },
    name = "substation-with-lamp",
    order = "a[energy]-d[substation]-a[with-lamp]",
    results = { { amount=1, name="substation-with-lamp", type="item" } },
    type = "recipe"
}
-- Unlock the recipe with the electric energy distrubution 2 technology.
table.insert(data.raw["technology"]["electric-energy-distribution-2"].effects, { type="unlock-recipe", recipe="substation-with-lamp" })

-- Add all new elements.
data:extend({ pl, splp, spli, splr, mplp, mpli, mplr, bplp, bpli, bplr, sslp, ssli, sslr })

--[[-----------------------------------------------------------------------------------------------
---- LOGISTICS WIRES
-------------------------------------------------------------------------------------------------]]

-- Add a shortcut buttons to toggle automatically adding red and green wire.
data:extend({ 
    {
        action = "lua",
        icon = "__plintorio_poles__/graphics/icons/shortcut-red-32.png",
        icon_size = 32,
        name = "auto-red-wire",
        order = "d[wires]-c[auto-wire]-a[red]",
        small_icon = "__plintorio_poles__/graphics/icons/shortcut-red-24.png",
        small_icon_size = 24,
        toggleable = true,
        type = "shortcut"
    },
    {
        action = "lua",
        icon = "__plintorio_poles__/graphics/icons/shortcut-green-32.png",
        icon_size = 32,
        name = "auto-green-wire",
        order = "d[wires]-c[auto-wire]-b[green]",
        small_icon = "__plintorio_poles__/graphics/icons/shortcut-green-24.png",
        small_icon_size = 24,
        toggleable = true,
        type = "shortcut"
    },
})