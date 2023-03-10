require "Hotbar/ISHotbarAttachDefinition"
if not ISHotbarAttachDefinition then
    return
end

local SwordSheath = {
	type = "SwordSheath",
	name = "SwordSheath",
	animset = "back",
	attachments = {
		BigBlade = "Sword On Back69",
	},
}
table.insert(ISHotbarAttachDefinition, SwordSheath);
local ShieldSlot = {
	type = "ShieldSlot",
	name = "ShieldSlot",
	animset = "back",
	attachments = {
		ShieldSlot = "Shield Slot 69",
	},
}
table.insert(ISHotbarAttachDefinition, ShieldSlot);

