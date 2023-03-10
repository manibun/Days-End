require "TimedActions/ISBaseTimedAction"

LabActionMorgueTableClear = ISBaseTimedAction:derive("LabActionMorgueTableClear");

function LabActionMorgueTableClear:isValid()
	return true;
end--function

function ISPaintAction:waitToStart()
	self.character:faceThisObject(self.bottom);
	return self.character:shouldBeTurning();
end

function LabActionMorgueTableClear:update()
	self.character:faceThisObject(self.bottom);
	self.character:setMetabolicTarget(Metabolics.MediumWork);
end--function

function LabActionMorgueTableClear:start()
	self:setActionAnim("Loot");
	self.character:SetVariable("LootPosition", "Mid");
	self:setOverrideHandModels(nil, "BleachBottle");
	self.character:playSound("Cleaning_A");
end--function

function LabActionMorgueTableClear:stop()
	ISBaseTimedAction.stop(self);
end--function

function LabActionMorgueTableClear:perform()
	LabRecipes_TransformBed(self.top, self.bottom, self.bed);
	local bleach = self.character:getInventory():getItemFromType("Bleach");
	if bleach:getThirstChange() > -0.2 then
		bleach:Use();
	else
		bleach:setThirstChange(bleach:getThirstChange() + 0.2);
	end--if
	ISBaseTimedAction.perform(self);
end--function

function LabActionMorgueTableClear:new(character, top, bottom, bed)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.top = top;
	o.bottom = bottom;
	o.bed = bed;
	o.maxTime = 150;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	return o;
end--function
