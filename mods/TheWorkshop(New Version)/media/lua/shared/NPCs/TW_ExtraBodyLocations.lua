--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

-- Locations must be declared in render-order.
-- Location IDs must match BodyLocation= and CanBeEquipped= values in items.txt.
local group = BodyLocations.getGroup("Human")



group:getOrCreateLocation("SpecialBelt")

group:setExclusive("Belt", "SpecialBelt")



group:getOrCreateLocation("SpecialMask")
