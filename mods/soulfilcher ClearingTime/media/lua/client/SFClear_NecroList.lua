------------------------------------------------------------------------------------------------------------------
-- Notes:
-- All Mod Items should appear in "Mods" Category. 
-- Until they get their own Buttons, they get a Prefix in name.
-- Mod Item Icons - keep the "media/textures/Item_IconName.png" format, it's good for performance.
------------------------------------------------------------------------------------------------------------------
-- {"Category Name" x 3, "Display Name", "Module.ItemID", "Item_(Icon)", R, G, B, Function, State, Extra, X, Y, Z}
------------------------------------------------------------------------------------------------------------------
-- Plug-In Code based on NF Plug-In code by blindcoder.
------------------------------------------------------------------------------------------------------------------
-- Supported Mods: By Mod ID
--
------------------------------------------------------------------------------------------------------------------

Events.OnGameStart.Add( function ()
	if NecroList then
		print ("[NecroForge] - Adding SFClearingTime to NecroForge");
		NecroList.Items.SFClear1 = {"Mods", "SFClear", nil, "SFClear - Chainsaw", "Base.Chainsaw", "media/textures/Item_Chainsaw.png", nil, nil, nil};
		NecroList.Items.SFClear2 = {"Mods", "SFClear", nil, "SFClear - Nail Gun", "filcher.NailGun", "media/textures/Item_NailGun.png", nil, nil, nil};
		NecroList.Items.SFClear3 = {"Mods", "SFClear", nil, "SFClear - Umbrella (Pink)", "filcher.UmbrellaPink", "media/textures/Item_Umbrella.png", nil, nil, nil};
		NecroList.Items.SFClear4 = {"Mods", "SFClear", nil, "SFClear - Walking Cane", "filcher.WalkingCane", "media/textures/Item_WalkingCane.png", nil, nil, nil};
		NecroList.Items.SFClear5 = {"Mods", "SFClear", nil, "SFClear - Wooden Cross", "filcher.WoodenCross", "media/textures/Item_WoodenCross.png", nil, nil, nil};
	end
end)