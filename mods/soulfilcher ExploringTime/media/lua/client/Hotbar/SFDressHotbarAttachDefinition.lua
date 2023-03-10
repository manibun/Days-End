require "ISHotbarAttachDefinition"

local Head = {
	type = "Head",
	name = "Head", -- Name shown in the slot icon
	animset = "back",
	attachments = { -- list of possible item category and their modelAttachement group, the item category is defined in the item script
		Headtorch = "JawStab", -- defined in AttachedLocations.lua
	},
}
table.insert(ISHotbarAttachDefinition, Head);