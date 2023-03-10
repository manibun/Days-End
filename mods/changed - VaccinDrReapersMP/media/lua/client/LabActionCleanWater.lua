require "TimedActions/ISBaseTimedAction"

LabActionCleanWater = ISBaseTimedAction:derive("LabActionCleanWater");

function LabActionCleanWater:isValid()
	return LabRecipes_CountDrainablePieces(self.character:getInventory(), "CmpChlorineTablets") >= self.tablets and self.waterSource:isTaintedWater();
end--function

function LabActionCleanWater:update()
	self.waterSource:setJobDelta(self:getJobDelta());
end--function

function LabActionCleanWater:start()
	self.waterSource:setJobType(getText("ContextMenu_LabClearWater"));
	self.waterSource:setJobDelta(0.0);
	self:setActionAnim(CharacterActionAnims.Craft)
	self:setOverrideHandModels(nil, "PillBottle");
	self.character:playSound("Mixing_B");
end--function

function LabActionCleanWater:stop()
	ISBaseTimedAction.stop(self);
	self.waterSource:setJobDelta(0.0);
end--function

function LabActionCleanWater:useTablets(container)
	local items = container:getItems();
    if items then
		for i = 0, items:size()-1 do
			if self.tablets == 0 then
				return;
			end--if
			local item = items:get(i);
			if item then
				if item:getCategory() == "Container" then
					self:useTablets(item:getItemContainer());
				elseif item:getType() == "CmpChlorineTablets" then
					while self.tablets > 0 and math.floor(item:getUsedDelta()/item:getUseDelta()+0.5) > 0 do
						self.tablets = self.tablets - 1;
						item:Use();						
					end--while
				end--if
			end--if
		end--for
	end--if
end--function

function LabActionCleanWater:perform()
	self.waterSource:getContainer():setDrawDirty(true);
	self.waterSource:setJobDelta(0.0);
	self.waterSource:setTaintedWater(false);
	self:useTablets(self.character:getInventory());
	ISBaseTimedAction.perform(self);
end--function

function LabActionCleanWater:new(character, waterSource, tablets)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.waterSource = waterSource;
	o.tablets = tablets;
	o.maxTime = 200;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	return o;
end--function
