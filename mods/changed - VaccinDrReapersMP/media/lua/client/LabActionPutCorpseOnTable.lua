require "TimedActions/ISBaseTimedAction"

LabActionPutCorpseOnTable = ISBaseTimedAction:derive("LabActionPutCorpseOnTable");

function LabActionPutCorpseOnTable:isValid()
	return true;
end--function

function ISPaintAction:waitToStart()
	self.character:faceThisObject(self.bottom);
	return self.character:shouldBeTurning();
end

function LabActionPutCorpseOnTable:update()
	self.character:faceThisObject(self.bottom);
end--function

function LabActionPutCorpseOnTable:start()
	self:setActionAnim("Loot");
	self.character:SetVariable("LootPosition", "Mid");
	self.character:playSound("PutItemInBag");
end--function

function LabActionPutCorpseOnTable:stop()
	ISBaseTimedAction.stop(self);
end--function

function LabActionPutCorpseOnTable:perform()
	local items = self.character:getInventory():getItems();
	for i = 0, items:size()-1 do	
		local obj = items:get(i);
		if obj:getType() == "CorpseMale" or obj:getType() == "CorpseFemale" then
			self.character:getCurrentSquare():AddWorldInventoryItem(obj, 0.5, 0.5, 0);
			local objs = self.character:getCurrentSquare():getStaticMovingObjects();
			local zom = objs:get(objs:size()-1);
			self.top:getModData().Zombie = zom:isZombie();
			self.top:getModData().Skeleton = zom:isSkeleton();
			self.top:getModData().Autopsy = zom:getModData().Autopsy;
			self.top:getModData().DeathTime = LabRecipes_GetObjValue(zom, "deathTime");
			zom:removeFromWorld();
			zom:removeFromSquare();
			self.character:setPrimaryHandItem(nil);
			self.character:setSecondaryHandItem(nil);
			self.character:getInventory():Remove(obj);
			break;
		end--if
	end--for
	LabRecipes_TransformBed(self.top, self.bottom, self.bed);
	LabRecipes_PrintTestInfo(self.character, self.top);
	ISBaseTimedAction.perform(self);
end--function

function LabActionPutCorpseOnTable:new(character, top, bottom, bed)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.top = top;
	o.bottom = bottom;
	o.bed = bed;
	o.maxTime = 120;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	return o;
end--function
