require "Hotbar/ISHotbarAttachDefinition"
if not ISHotbarAttachDefinition then
    return
end

local ToolBeltBack = {
	type = "ToolBeltBack",
	name = "Belt Back",
	animset = "belt right",
	attachments = {
		Drilltool = "Drill tool",
		Nailgun = "Nail gun",
	},
}
table.insert(ISHotbarAttachDefinition, ToolBeltBack);

local ToolBeltFront = {
	type = "ToolBeltFront",
	name = "Belt Front",
	animset = "belt left",
	attachments = {
		Walkie = "Belt WalkieFL",
	},
}
table.insert(ISHotbarAttachDefinition, ToolBeltFront);

