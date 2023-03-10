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
		print ("[NecroForge] - Adding SFExploringTime to NecroForge");
		NecroList.Items.SFExplore1 = {"Mods", "SFExplore", nil, "SFExplore - Bottle With Gas", "filcher.BottleWithGasPop", "media/textures/Item_BottleWithGasPop.png", nil, nil, nil};
		NecroList.Items.SFExplore2 = {"Mods", "SFExplore", nil, "SFExplore - Bottle With Gas", "filcher.BottleWithGasWater", "media/textures/Item_BottleWithGas.png", nil, nil, nil};
		NecroList.Items.SFExplore3 = {"Mods", "SFExplore", nil, "SFExplore - Flare", "filcher.Flare", "media/textures/Item_Flare.png", nil, nil, nil};
		NecroList.Items.SFExplore4 = {"Mods", "SFExplore", nil, "SFExplore - Gas Lantern", "filcher.GasLantern", "media/textures/Item_Lantern.png", nil, nil, nil};
		NecroList.Items.SFExplore5 = {"Mods", "SFExplore", nil, "SFExplore - Torch (Chair Leg)", "filcher.TorchChairLeg", "media/textures/Item_TorchChairLeg.png", nil, nil, nil};
		NecroList.Items.SFExplore6 = {"Mods", "SFExplore", nil, "SFExplore - Torch (Table Leg)", "filcher.TorchTableLeg", "media/textures/Item_TorchTableLeg.png", nil, nil, nil};
		NecroList.Items.SFExplore7 = {"Mods", "SFExplore", nil, "SFExplore - Torch (Branch)", "filcher.TorchBranch", "media/textures/Item_TorchBranch.png", nil, nil, nil};
		NecroList.Items.SFExplore8 = {"Mods", "SFExplore", nil, "SFExplore - Head Flashlight", "filcher.HeadTorch", "media/textures/Item_HeadTorch.png", nil, nil, nil};
	end
end)