unit.setTimer("updateStuff",3)

local Nickel = slot1.getItemsMass()
local NickelWeight = 8.91

local Silver = slot2.getItemsMass()
local SilverWeight = 10.49

local Sulfur = slot3.getItemsMass()
local SulfurWeight = 1.82

slots = {Nickel, Silver, Sulfur}
weights = {NickelWeight, SilverWeight, SulfurWeight}
nkey = {10, 11, 12}
for i, slot in ipairs(slots) do
    db.setFloatValue(nkey[i],slot/weights[i])
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