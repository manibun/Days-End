--***********************************************************
--**                     SOUL FILCHER                      **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISAsk8Ball = ISBaseTimedAction:derive("ISAsk8Ball");


function ISAsk8Ball:isValid()
	return true
end

function ISAsk8Ball:update()
    self.item:setJobDelta(self:getJobDelta());
end

function ISAsk8Ball:start()
    self.item:setJobType(getText("ContextMenu_Ask") ..' '.. self.item:getName());
    self.item:setJobDelta(0.0);

    self:setAnimVariable("ReadType", "book")

    self:setActionAnim(CharacterActionAnims.Read);
    self:setOverrideHandModels(nil, "RoundFood_Black");
end

function ISAsk8Ball:stop()
    self.item:setJobDelta(0.0);
    ISBaseTimedAction.stop(self);
end

function ISAsk8Ball:perform()
    if self.character:HasTrait("Illiterate") then
	local txtRandom = ZombRand(3);
        if txtRandom == 0 then
        	self.character:Say(getText("IGUI_PlayerText_DontGet"));
        elseif txtRandom == 1 then
        	self.character:Say(getText("IGUI_PlayerText_TooComplicated"));
        else
		self.character:Say(getText("IGUI_PlayerText_DontUnderstand"));
        end
    else
	local txtRandom = ZombRand(20);
        if txtRandom == 0 then
        	self.character:Say(getText("IGUI_Magic8Ball_Positive01"));
        elseif txtRandom == 1 then
        	self.character:Say(getText("IGUI_Magic8Ball_Positive02"));
        elseif txtRandom == 2 then
        	self.character:Say(getText("IGUI_Magic8Ball_Positive03"));
        elseif txtRandom == 3 then
        	self.character:Say(getText("IGUI_Magic8Ball_Positive04"));
        elseif txtRandom == 4 then
        	self.character:Say(getText("IGUI_Magic8Ball_Positive05"));
        elseif txtRandom == 5 then
        	self.character:Say(getText("IGUI_Magic8Ball_Positive06"));
        elseif txtRandom == 6 then
        	self.character:Say(getText("IGUI_Magic8Ball_Positive07"));
        elseif txtRandom == 7 then
        	self.character:Say(getText("IGUI_Magic8Ball_Positive08"));
        elseif txtRandom == 8 then
        	self.character:Say(getText("IGUI_Magic8Ball_Positive09"));
        elseif txtRandom == 9 then
        	self.character:Say(getText("IGUI_Magic8Ball_Positive10"));
        elseif txtRandom == 10 then
        	self.character:Say(getText("IGUI_Magic8Ball_Neutral01"));
        elseif txtRandom == 11 then
        	self.character:Say(getText("IGUI_Magic8Ball_Neutral02"));
        elseif txtRandom == 12 then
        	self.character:Say(getText("IGUI_Magic8Ball_Neutral03"));
        elseif txtRandom == 13 then
        	self.character:Say(getText("IGUI_Magic8Ball_Neutral04"));
        elseif txtRandom == 14 then
        	self.character:Say(getText("IGUI_Magic8Ball_Neutral05"));
        elseif txtRandom == 15 then
        	self.character:Say(getText("IGUI_Magic8Ball_Negative01"));
        elseif txtRandom == 16 then
        	self.character:Say(getText("IGUI_Magic8Ball_Negative02"));
        elseif txtRandom == 17 then
        	self.character:Say(getText("IGUI_Magic8Ball_Negative03"));
        elseif txtRandom == 18 then
        	self.character:Say(getText("IGUI_Magic8Ball_Negative04"));
        else
        	self.character:Say(getText("IGUI_Magic8Ball_Negative05"));
	end
    end

    self.item:getContainer():setDrawDirty(true);
    self.item:setJobDelta(0.0);

    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function ISAsk8Ball:new(character, item)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.item = item;
    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.ignoreHandsWounds = true;
    o.maxTime = 30;
    o.caloriesModifier = 0.5;
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end

    return o;
end