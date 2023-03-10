require "recipecode"


function DeconstructSmallTool_OnCreate(items, result, player)
    player:getInventory():AddItem("MetalParts")
	player:getInventory():AddItem("Base.Screws")
	player:getInventory():AddItem("Base.Screws")
end

function DeconstructTool_OnCreate(items, result, player)
    player:getInventory():AddItem("Base.UnusableWood")
    player:getInventory():AddItem("Base.Screws")
	player:getInventory():AddItem("Base.Screws")
end

function DeconstructMetalTool_OnCreate(items, result, player)
    player:getInventory():AddItem("MetalBar")
	player:getInventory():AddItem("Base.Screws")
end

function DeconstructMotor_OnCreate(items, result, player)
    player:getInventory():AddItem("Base.ScrapMetal")
	player:getInventory():AddItem("Base.ScrapMetal")
	player:getInventory():AddItem("Base.ScrapMetal")
	player:getInventory():AddItem("Base.ScrapMetal")
	player:getInventory():AddItem("Base.ScrapMetal")
	player:getInventory():AddItem("Base.Screws")
	player:getInventory():AddItem("Base.Screws")
	player:getInventory():AddItem("Base.Screws")
	player:getInventory():AddItem("Base.Screws")
	player:getInventory():AddItem("Base.EngineParts")
	player:getInventory():AddItem("Base.EngineParts")
	player:getInventory():AddItem("Base.EngineParts")
	player:getInventory():AddItem("Base.EngineParts")
	player:getInventory():AddItem("Base.EngineParts")
	player:getInventory():AddItem("Base.EngineParts")
	player:getInventory():AddItem("Base.EngineParts")
	player:getInventory():AddItem("Base.EngineParts")
	player:getInventory():AddItem("Base.EngineParts")
	player:getInventory():AddItem("Base.EngineParts")
	player:getInventory():AddItem("Base.EngineParts")
	player:getInventory():AddItem("Base.EngineParts")
	player:getInventory():AddItem("Base.EngineParts")
	player:getInventory():AddItem("Base.EngineParts")
	player:getInventory():AddItem("Base.EngineParts")
end

function DeconstructGun_OnCreate(items, result, player)
    player:getInventory():AddItem("Base.LeadPipe")
	player:getInventory():AddItem("Base.ScrapMetal")
end

function DeconstructGunMag_OnCreate(items, result, player)
    player:getInventory():AddItem("Base.ScrapMetal")
	player:getInventory():AddItem("Base.MetalParts")
end

