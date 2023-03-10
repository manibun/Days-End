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
		print ("[NecroForge] - Adding SFRelaxingTime to NecroForge");
		NecroList.Items.SFRelax3 = {"Mods", "SFRelax", nil, "SFRelax - Coloring Book", "filcher.ColoringBook", "media/textures/Item_ColoringBook.png", nil, nil, nil};
		NecroList.Items.SFRelax5 = {"Mods", "SFRelax", nil, "SFRelax - Gift Card", "filcher.GiftCard", "media/textures/Item_SFGiftCard.png", nil, nil, nil};
		NecroList.Items.SFRelax6 = {"Mods", "SFRelax", nil, "SFRelax - Green Pen", "filcher.GreenPen", "media/textures/Item_Pen.png", nil, nil, nil};
		NecroList.Items.SFRelax8 = {"Mods", "SFRelax", nil, "SFRelax - Magic 8-Ball", "filcher.Magic8Ball", "media/textures/Item_Poolball8.png", nil, nil, nil};
		NecroList.Items.SFRelax9 = {"Mods", "SFRelax", nil, "SFRelax - Multicolor Pen", "filcher.MulticolorPen", "media/textures/Item_MulticolorPen.png", nil, nil, nil};
		NecroList.Items.SFRelax10 = {"Mods", "SFRelax", nil, "SFRelax - Notes on Rhyming Jokes", "filcher.NotesJokes", "media/textures/Item_SFNotesJokes.png", nil, nil, nil};
		NecroList.Items.SFRelax11 = {"Mods", "SFRelax", nil, "SFRelax - Novel", "filcher.Novel", "media/textures/Item_Novel1.png", nil, nil, nil};
		NecroList.Items.SFRelax13 = {"Mods", "SFRelax", nil, "SFRelax - Postcard (Local)", "filcher.PostcardLocal", "media/textures/Item_Postcard.png", nil, nil, nil};
		NecroList.Items.SFRelax14 = {"Mods", "SFRelax", nil, "SFRelax - Postcard (Others)", "filcher.PostcardOthers", "media/textures/Item_Postcard.png", nil, nil, nil};
		NecroList.Items.SFRelax7 = {"Mods", "SFRelax", nil, "SFRelax - Ripped Pages", "filcher.RippedPages", "media/textures/Item_Paper.png", nil, nil, nil};
		NecroList.Items.SFRelax15 = {"Mods", "SFRelax", nil, "SFRelax - Letter", "filcher.SFLetter", "media/textures/Item_SFLetter.png", nil, nil, nil};
	end
end)