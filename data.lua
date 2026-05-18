-- Update vanilla small electric pole
local sp = data.raw["electric-pole"]["small-electric-pole"]
sp.supply_area_distance = settings.startup["plintorio_poles_sp_radius"].value
sp.maximum_wire_distance = settings.startup["plintorio_poles_sp_dist"].value

-- Update vanilla medium electric pole
local mp = data.raw["electric-pole"]["medium-electric-pole"]
mp.supply_area_distance = settings.startup["plintorio_poles_mp_radius"].value
mp.maximum_wire_distance = settings.startup["plintorio_poles_mp_dist"].value

-- Update vanilla big electric pole
local bp = data.raw["electric-pole"]["big-electric-pole"]
bp.supply_area_distance = settings.startup["plintorio_poles_bp_radius"].value
bp.maximum_wire_distance = settings.startup["plintorio_poles_bp_dist"].value

-- Update vanilla substation
local ss = data.raw["electric-pole"]["substation"]
ss.supply_area_distance = settings.startup["plintorio_poles_ss_radius"].value
ss.maximum_wire_distance = settings.startup["plintorio_poles_ss_dist"].value