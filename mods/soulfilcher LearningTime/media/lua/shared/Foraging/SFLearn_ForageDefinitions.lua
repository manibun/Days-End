require 'Foraging/forageSystem'

Events.onAddForageDefs.Add(function()

--New items

	-- junk chances are 100 for normal, 30 for uncommon, 15 for rare, 5 for epic and 1 for legendary
	-- junk xp values are 1 for normal, 3 for uncommon, 5 for rare, 10 for epic, 25 for legendary
	local EngineerNotes3 = {
	type = "filcher.EngineerNotes3",
	xp = 10,
        categories = { "Junk" },
	zones={ Forest=5, DeepForest=5, Vegitation=5, FarmLand=5, Farm=5, TrailerPark=5, TownZone=5, Nav=5 },
	};

	local EngineerNotes4 = {
	type = "filcher.EngineerNotes4",
	xp = 10,
        categories = { "Junk" },
	zones={ Forest=5, DeepForest=5, Vegitation=5, FarmLand=5, Farm=5, TrailerPark=5, TownZone=5, Nav=5 },
	};

	local EngineerNotes5 = {
	type = "filcher.EngineerNotes5",
	xp = 10,
        categories = { "Junk" },
	zones={ Forest=5, DeepForest=5, Vegitation=5, FarmLand=5, Farm=5, TrailerPark=5, TownZone=5, Nav=5 },
	};

	local SFGuideCooking = {
	type = "filcher.SFGuideCooking",
	xp = 5,
        categories = { "Junk" },
	zones={ Forest=15, DeepForest=15, Vegitation=15, FarmLand=15, Farm=15, TrailerPark=15, TownZone=15, Nav=15 },
	};

	local SFGuideEletronics = {
	type = "filcher.SFGuideEletronics",
	xp = 5,
        categories = { "Junk" },
	zones={ Forest=15, DeepForest=15, Vegitation=15, FarmLand=15, Farm=15, TrailerPark=15, TownZone=15, Nav=15 },
	};

	local SFGuideEngineering = {
	type = "filcher.SFGuideEngineering",
	xp = 5,
        categories = { "Junk" },
	zones={ Forest=15, DeepForest=15, Vegitation=15, FarmLand=15, Farm=15, TrailerPark=15, TownZone=15, Nav=15 },
	};

	local SFGuideFishing = {
	type = "filcher.SFGuideFishing",
	xp = 5,
        categories = { "Junk" },
	zones={ Forest=15, DeepForest=15, Vegitation=15, FarmLand=15, Farm=15, TrailerPark=15, TownZone=15, Nav=15 },
	};

	local SFGuideMechanics = {
	type = "filcher.SFGuideMechanics",
	xp = 5,
        categories = { "Junk" },
	zones={ Forest=15, DeepForest=15, Vegitation=15, FarmLand=15, Farm=15, TrailerPark=15, TownZone=15, Nav=15 },
	};

	local SFGuideMetalworking = {
	type = "filcher.SFGuideMetalworking",
	xp = 5,
        categories = { "Junk" },
	zones={ Forest=15, DeepForest=15, Vegitation=15, FarmLand=15, Farm=15, TrailerPark=15, TownZone=15, Nav=15 },
	};

	local SFGuideRadio = {
	type = "filcher.SFGuideRadio",
	xp = 5,
        categories = { "Junk" },
	zones={ Forest=15, DeepForest=15, Vegitation=15, FarmLand=15, Farm=15, TrailerPark=15, TownZone=15, Nav=15 },
	};

	local SFGuideTrapping = {
	type = "filcher.SFGuideTrapping",
	xp = 5,
        categories = { "Junk" },
	zones={ Forest=15, DeepForest=15, Vegitation=15, FarmLand=15, Farm=15, TrailerPark=15, TownZone=15, Nav=15 },
	};

--Adding them to the foraging system
forageSystem.addItemDef(EngineerNotes3);
forageSystem.addItemDef(EngineerNotes4);
forageSystem.addItemDef(EngineerNotes5);
forageSystem.addItemDef(SFGuideCooking);
forageSystem.addItemDef(SFGuideEletronics);
forageSystem.addItemDef(SFGuideEngineering);
forageSystem.addItemDef(SFGuideFishing);
forageSystem.addItemDef(SFGuideMechanics);
forageSystem.addItemDef(SFGuideMetalworking);
forageSystem.addItemDef(SFGuideRadio);
forageSystem.addItemDef(SFGuideTrapping);

end)