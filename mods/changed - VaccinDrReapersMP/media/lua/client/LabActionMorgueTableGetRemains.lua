require "TimedActions/ISBaseTimedAction"

LabActionMorgueTableGetRemains = ISBaseTimedAction:derive("LabActionMorgueTableGetRemains");

function LabActionMorgueTableGetRemains:isValid()
	return true;
end--function

function ISPaintAction:waitToStart()
	self.character:faceThisObject(self.bottom);
	return self.character:shouldBeTurning();
end

function LabActionMorgueTableGetRemains:update()
	self.character:faceThisObject(self.bottom);
end--function

function LabActionMorgueTableGetRemains:start()
	self:setActionAnim("Loot");
	self.character:SetVariable("LootPosition", "Mid");
	self.character:setPrimaryHandItem(nil);
	self.character:setSecondaryHandItem(nil);
	self.character:playSound("PutItemInBag");
end--function

function LabActionMorgueTableGetRemains:stop()
	ISBaseTimedAction.stop(self);
end--function

function LabActionMorgueTableGetRemains:perform()
	local inv = self.character:getInventory();
	LabRecipes_TransformBed(self.top, self.bottom, self.bed);
	if self.target == "sack" then
		local sack = inv:getFirstTypeRecurse("Garbagebag") or inv:getFirstTypeRecurse("EmptySandbag") or inv:getFirstTypeRecurse("FertilizerEmpty"); 
		inv:RemoveOneOf(sack:getType());
		self.character:setPrimaryHandItem(self.character:getInventory():AddItem("LabItems.LabGarbageBagWithRemains"));
	elseif self.target == "bags" then
		for i = 0, 1 do
			inv:RemoveOneOf("Plasticbag");
		end--for
		self.character:setPrimaryHandItem(self.character:getInventory():AddItem("LabItems.LabPlasticBagWithRemains"));
		self.character:setSecondaryHandItem(self.character:getInventory():AddItem("LabItems.LabPlasticBagWithRemains"));
	end--if
	ISBaseTimedAction.perform(self);
end--function

function LabActionMorgueTableGetRemains:new(character, top, bottom, bed, target)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.top = top;
	o.bottom = bottom;
	o.bed = bed;
	o.target = target;
	o.maxTime = 180;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	return o;
end--function
