require "TimedActions/ISBaseTimedAction"

LabActionMakeAutopsy = ISBaseTimedAction:derive("LabActionMakeAutopsy");

function LabActionMakeAutopsy:isValid()
	return true;
end--function

function ISPaintAction:waitToStart()
	self.character:faceThisObject(self.corpse or self.bottom);
	return self.character:shouldBeTurning();
end

function LabActionMakeAutopsy:update()
	self.character:faceThisObject(self.corpse or self.bottom);
	self.character:setMetabolicTarget(Metabolics.MediumWork);
end--function

function LabActionMakeAutopsy:start()
	self:setActionAnim("Loot");
	self.character:SetVariable("LootPosition", not(self.corpse) and "Mid" or "Low");
	self.character:playSound("Meat_A");
end--function

function LabActionMakeAutopsy:stop()
	ISBaseTimedAction.stop(self);
end--function

function LabActionMakeAutopsy:perform()	
    self.character:removeFromHands(self.character:getSecondaryHandItem());
	local inv = self.character:getInventory();
	self.character:getXp():AddXP(Perks.Doctor, self.top and 15 or 3);
	if self.corpse then
		self.corpse:getModData().Autopsy = true;
	end--if
	if self.top then
		self.top:getModData().Autopsy = true;
		LabRecipes_TransformBed(self.top, self.bottom, self.bed);
	end--if
	if ZombRand(100) < (self.top and 65 or 40) then
		inv:AddItem("LabItems.MatInfectedBlood");
	elseif ZombRand(100) < 60 then
		inv:AddItem("LabItems.MatTaintedBlood");
	end--if
	if self.character:HasTrait("Hemophobic") then
		self.character:getStats():setPanic(self.character:getStats():getPanic()+20);
	end--if
	addBloodSplat(self.character:getCurrentSquare(), ZombRand(20));
	if self.corpse then
		LabRecipes_PrintTestInfo(self.character, self.corpse);
	else
		LabRecipes_PrintTestInfo(self.character, self.top);
	end--if
	ISBaseTimedAction.perform(self);
end--function

function LabActionMakeAutopsy:new(character, corpse, square, top, bottom, bed)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.corpse = corpse;
	o.square = square;
	o.top = top;
	o.bottom = bottom;
	o.bed = bed;
	o.isDoctor = character:getDescriptor():getProfession() == "profession_doctor2";
	o.maxTime = 1200-(character:getPerkLevel(Perks.Doctor)-1)*40-(o.isDoctor and 100 or 0);
	if top then
		o.maxTime = math.floor(o.maxTime/100*66);
	end--if
	o.stopOnWalk = true;
	o.stopOnRun = true;
	return o;
end--function
