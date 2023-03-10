require 'Foraging/forageSystem'

Events.onAddForageDefs.Add(function()

--New items

	-- junk chances are 100 for normal, 50 for common, 33 for uncommon, 20 for unlikely, 15 for rare and 1 for legendary
	local ColoringBook = {
	type = "filcher.ColoringBook",
	xp = 2,
        categories = { "Junk" },
	zones={ Forest=50, DeepForest=50, Vegitation=50, FarmLand=50, Farm=50, TrailerPark=50, TownZone=50, Nav=50 },
	};

	local Novel = {
	type = "filcher.Novel",
	xp = 5,
        categories = { "Junk" },
	zones={ Forest=33, DeepForest=33, Vegitation=33, FarmLand=33, Farm=33, TrailerPark=33, TownZone=33, Nav=33 },
	};

	local Magic8Ball = {
	type = "filcher.Magic8Ball",
	xp = 50,
        categories = { "Junk" },
	zones={ Forest=1, DeepForest=1, Vegitation=1, FarmLand=1, Farm=1, TrailerPark=1, TownZone=1, Nav=1 },
	};

--Adding them to the foraging system
forageSystem.addItemDef(ColoringBook);
forageSystem.addItemDef(Magic8Ball);
forageSystem.addItemDef(Novel);

end)