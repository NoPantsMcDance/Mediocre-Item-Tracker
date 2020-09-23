unit.setTimer("updateStuff",3)

local Iron = slot2.getItemsMass()
local IronWeight = 7.85

local Alum = slot3.getItemsMass()
local AlumWeight = 2.70

local Carbon = slot4.getItemsMass()
local CarbonWeight = 2.27

local Silicon = slot5.getItemsMass()
local SiliconWeight = 2.33

local Calcium = slot6.getItemsMass()
local CalciumWeight = 1.55

local Chromium = slot7.getItemsMass()
local ChromiumWeight = 7.19

local Copper = slot8.getItemsMass()
local CopperWeight = 8.96

local Sodium = slot9.getItemsMass()
local SodiumWeight = 0.97

local Lithium = slot10.getItemsMass()
local LithiumWeight = 0.53

local ContainerLiters = 10400

slots = {Iron, Alum, Carbon, Silicon, Calcium, Chromium, Copper, Sodium, Lithium}
weights = {IronWeight, AlumWeight, CarbonWeight, SiliconWeight, CalciumWeight, ChromiumWeight, CopperWeight, SodiumWeight, LithiumWeight}
for i, slot in ipairs(slots) do
    db.setFloatValue(i,slot/weights[i])
end

-- keys = {}
-- for _,key in ipairs(json.decode(db.getKeys())) do
--     table.insert(keys, key)
--   end
-- table.sort(keys)
-- for i, key in ipairs(keys) do
--     local amount = db.getFloatValue(key)
--     --system.print(amount)
-- end