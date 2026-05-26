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
pl.selection_box = {{ -0.2, -0.2}, { 0.2, 0.2}}
pl.selectable_in_game = false

-- Add the prototype
data:extend({ pl })
