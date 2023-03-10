--***********************************************************
--**                    NECROPOLISRP.NET                   **
--**			 Mod Author: github.com/buffyuwu    	   **
--***********************************************************

require "ISUI/ISPanel"
require "ISUI/ISPanelJoypad"

local TTRPG = {};
local staticArmorBonus = 0 --so we dont run get_armorBonus every frame in our render proc
local staticDiceMax = 0
local function get_rpname()
	local charDesc = getPlayer():getDescriptor()
	local name = charDesc:getForename()
	return name;
end
DiceRolling = false;
function TTRPG.get_diceBudget()
	local diceBudgetMax = SandboxVars.DnDRules.SkillBalance;
	staticDiceMax = diceBudgetMax
	return diceBudgetMax
end
function TTRPG.get_over20crit()
	local over20crit = SandboxVars.DnDRules.Criticals;
	return over20crit
end
function TTRPG.get_armorBonus()
	local armorBonus = 0
	staticArmorBonus = 0
	for i=0,getPlayer():getWornItems():size()-1 do
		local item = getPlayer():getWornItems():get(i):getItem();
		if item and not instanceof(item, "InventoryContainer") then
			local defense = tonumber(item:getBulletDefense())
			if defense > 50 then
				armorBonus = armorBonus + defense / 100
			end
		end
	end
	staticArmorBonus = armorBonus
	return round(armorBonus,0)
end
function ISSkillProgressBar:onMouseDown(x, y)
	local lvlSelected = math.floor(self:getMouseX()/20);
	local playerchar = getPlayer();
	local strengthSkills = 0
	local dexSkills = 0

	self.level = self.char:getPerkLevel(self.perk:getType());

	self.xpForLvl = ISSkillProgressBar.getXpForLvl(self.perk, self.level);
    local special = " ";
    local modifier = ": ";
	local result = ZombRand(0, 20)+1; --this looks like shitcode, but trust me, the zombrand func doesnt ever roll on the ceiling number, only the low
	local spcresult = result + self.level
	local realroll = result;
	local perkLevel = self.level
    -- if self.level > 0 then
	-- 	modifier = ": " .. realroll .. " +" .. self.level .. " : ";
    -- end
	
    if result >= 20 then
        special = " *green* [CRITICAL SUCCESS!] ";
	elseif result > 20 then
		result = 20
	elseif spcresult >= 20 and TTRPG.get_over20crit() then
		special = " *green* [CRITICAL SUCCESS!] ";
    elseif result <= 1 then
        special = " *red* [CRITICAL FAILURE!] ";
    elseif spcresult == 0 then
        result = 1;
    end
	result = result + self.level;
	
	if DiceRolling and not isCtrlKeyDown() and not isShiftKeyDown() then
		if 		self.perk == Perks.DnDInitiative or 
		self.perk == Perks.DnDStr_Strength or
		self.perk == Perks.DnDStr_1hMelee or
		self.perk == Perks.DnDStr_2hMelee or
		self.perk == Perks.DnDStr_Defense or
		self.perk == Perks.DnDStr_Evasion or
		self.perk == Perks.DnDCharisma or
		self.perk == Perks.DnDPersuasion or
		self.perk == Perks.DnDDeception or
		self.perk == Perks.DnDIntelligence or
		self.perk == Perks.DnDWisdom or
		self.perk == Perks.DnDInsight or
		self.perk == Perks.DnDFirstAid or
		self.perk == Perks.DnDPerception or
		self.perk == Perks.DnDDex_SleightOfHand or
		self.perk == Perks.DnDDex_Agility or
		self.perk == Perks.DnDDex_Stealth or
		self.perk == Perks.DnDLuck or
		self.perk == Perks.DnDDex_Dexterity or
		self.perk == Perks.DnDWillpower then
		modifier = ": " .. realroll .. "+" .. perkLevel .. "= ";
		if self.perk == Perks.DnDStr_Defense then
			result = result + TTRPG.get_armorBonus()
			modifier = ": " .. realroll .. "+" .. perkLevel .. "+" .. TTRPG.get_armorBonus() .. "= ";
		elseif self.perk == Perks.DnDStr_Evasion then
			result = result - TTRPG.get_armorBonus()
			modifier = ": " .. realroll .. "+" .. perkLevel .. "-" .. TTRPG.get_armorBonus() .. "= ";
		end
		local combined = "*dice*" .. special .. get_rpname() .. " rolled " .. self.perk:getName() .. modifier .. result;
		processSayMessage(combined);
		getPlayer():getSquare():playSound("rollDice")
		TTRPG.get_armorBonus()
		return
	   end
	end
	if isCtrlKeyDown() and isShiftKeyDown() and not DiceRolling then
		DiceRolling = false;
		call_reset_skills()
		return
	end
	if TTRPG.total_dice_skills() < TTRPG.get_diceBudget() and not DiceRolling then
		if self.perk == Perks.DnDStr_Strength or
		self.perk == Perks.DnDStr_1hMelee or
		self.perk == Perks.DnDStr_Defense or
		self.perk == Perks.DnDStr_Evasion or
		self.perk == Perks.DnDCharisma or
		self.perk == Perks.DnDPersuasion or
		self.perk == Perks.DnDDeception or
		self.perk == Perks.DnDIntelligence or
		self.perk == Perks.DnDWisdom or
		self.perk == Perks.DnDInsight or
		self.perk == Perks.DnDFirstAid or
		self.perk == Perks.DnDPerception or
		self.perk == Perks.DnDDex_AccuracyA or
		self.perk == Perks.DnDDex_AccuracyT or
		self.perk == Perks.DnDDex_SleightOfHand or
		self.perk == Perks.DnDDex_Agility or
		self.perk == Perks.DnDDex_Stealth or
		self.perk == Perks.DnDLuck or
		self.perk == Perks.DnDDex_Dexterity or
		self.perk == Perks.DnDWillpower then
		if string.match(tostring(self.perk:getType()), "DnDStr_") then
			strengthSkills = self.char:getPerkLevel(Perks.DnDStr_Strength) + 
			self.char:getPerkLevel(Perks.DnDStr_1hMelee) + 
			self.char:getPerkLevel(Perks.DnDStr_Defense) + 
			self.char:getPerkLevel(Perks.DnDStr_Evasion);
			if strengthSkills == 10 then return end
		end
		if string.match(tostring(self.perk:getType()), "DnDDex_") then
			dexSkills = self.char:getPerkLevel(Perks.DnDDex_Dexterity) + 
			self.char:getPerkLevel(Perks.DnDDex_Agility) + 
			self.char:getPerkLevel(Perks.DnDDex_Stealth) + 
			self.char:getPerkLevel(Perks.DnDDex_SleightOfHand);
			if dexSkills == 10 then return end
		end
		if self.char:getPerkLevel(self.perk) >= 6 then return end
		self.char:LevelPerk(self.perk:getType());
		end
		if string.match(self.perk:getName(), "Evasion") then
			self.char:LevelPerk(Perks.DnDInitiative)
		end
		if TTRPG.total_dice_skills() == TTRPG.get_diceBudget() then
			DiceRolling = true;
			return
		end
	elseif TTRPG.total_dice_skills() == TTRPG.get_diceBudget() then
		if not DiceRolling then
			getPlayer():addLineChatElement("Skills updated. Ask an Admin for a reset book to change them!", 0, 0, 1);
			print("budget exceeded, enabling DiceRolling")
			DiceRolling = true;
		end
	end
end


function ISCharacterInfo:render()
	local tabHeight = self.y
	local maxHeight = getCore():getScreenHeight() - ISWindow.TitleBarHeight - tabHeight - 20
	local y = 10

	if self.lastLevelUpTime > 0 then
		self.lastLevelUpTime = self.lastLevelUpTime - 0.0025
	elseif self.lastLevelUpTime < 0 then
		self.lastLevelUpTime = 0
	end

	ISSkillProgressBar.updateAlpha() -- FIXME: do this once per frame, not for each player
	-- how much skills pts we got ?
	if self.reloadSkillBar then
		self.progressBarLoaded = false;
		self.reloadSkillBar = false;
		for i,v in pairs(self.progressBars) do
			self:removeChild(v);
		end
		self.progressBars = {}

	end

	local top = y

	-- if we got a multiplier, we gonna anim that with ">, >>, >>>"
	 -- FIXME: do this once per frame, not for each player
	local ms = UIManager.getMillisSinceLastRender()
	ISCharacterInfo.timerMultiplierAnim = ISCharacterInfo.timerMultiplierAnim + ms;
	if ISCharacterInfo.timerMultiplierAnim <= 500 then
        ISCharacterInfo.animOffset = -1;
	elseif ISCharacterInfo.timerMultiplierAnim <= 1000 then
        ISCharacterInfo.animOffset = 0;
	elseif ISCharacterInfo.timerMultiplierAnim <= 1500 then
        ISCharacterInfo.animOffset = 15;
	elseif ISCharacterInfo.timerMultiplierAnim <= 2000 then
        ISCharacterInfo.animOffset = 30;
	else
		ISCharacterInfo.timerMultiplierAnim = 0;
	end

	local sorted = {}
	local nameToPerk = {}
	for k,v in pairs(self.perks) do
		local parentPerk = PerkFactory.getPerk(k)
		table.insert(sorted, parentPerk)
		nameToPerk[parentPerk:getName()] = k
	end

	table.sort(sorted, function(a,b)
		if a:isPassiv() then
			local dbg = 1
		end
		if a:isPassiv() and not b:isPassiv() then
			return true
		end
		if b:isPassiv() and not a:isPassiv() then
			return false
		end
		return not string.sort(a:getName(), b:getName())
	end)

	local left = 0
	local maxY = y
	local fontHgt = getTextManager():getFontFromEnum(UIFont.Small):getLineHeight()
	local progressHgt = 18
	local rowHgt = math.max(fontHgt, progressHgt + 2)
	
	if DiceRolling then
    	self:drawText("Click a _Dice skill to roll a d20.", left + 5, y, 1, 1, 1, 1, UIFont.Small);
		y = y + 20
		self:drawText("Armor Bonus: "..staticArmorBonus, left + 5, y, 1, 1, 1, 1, UIFont.Small);
		y = y + 5
	else
		self:drawText("Click a TTRPG skill to level it up.", left + 5, y, 1, 1, 1, 1, UIFont.Small);
		y = y + 25;
		self:drawText("Assigned: " .. TTRPG.total_dice_skills() .. "/"..staticDiceMax,left + 5, y, 1, 1, 1, 1, UIFont.Small);
		y = y + 5;
    end
    self:drawTexture(self.SkillBarSeparator, left, y + fontHgt + 10, 1,1,1,1);
    y = y + 40;
	for _,parentPerk in ipairs(sorted) do
		local perkList = self.perks[parentPerk:getType()]
		-- we first draw our parent name
		self:drawText(parentPerk:getName(), left + 5, y, 1, 1, 1, 1, UIFont.Small);
		self:drawTexture(self.SkillBarSeparator, left, y + fontHgt + 2, 1,1,1,1);
		y = y + math.max(25, fontHgt);
		-- then all the skills with their progress bar
		for ind, perk in ipairs(perkList) do
            local xpBoost = self.char:getXp():getPerkBoost(perk:getType());
            local r = 1;
            local g = 1;
            local b = 1;
            if xpBoost == 0 then
                r = 0.54;
                g = 0.54;
                b = 0.54;
            elseif xpBoost == 1 then
                r = 0.8;
                g = 0.8;
                b = 0.8;
            elseif xpBoost == 3 then
                r = 1;
                g = 0.83;
                b = 0;
            end
			self:drawText(perk:getName().." ("..self.char:getPerkLevel(perk:getType())..")", left + 20, y, r, g, b, 1, UIFont.Small);
			-- if we got a multiplier, we gonna anim that with ">, >>, >>>"
            if self.char:getXp():getMultiplier(perk:getType()) > 0 then
                self:drawTexture(self.disabledArrow, left + 20 + self.txtLen, y, 1, 1, 1, 1);
                self:drawTexture(self.disabledArrow, left + 35 + self.txtLen, y, 1, 1, 1, 1);
                self:drawTexture(self.disabledArrow, left + 50 +self.txtLen, y, 1, 1, 1, 1);

                if ISCharacterInfo.animOffset > -1 then
                    self:drawTexture(self.arrow, left + 20 + self.txtLen + ISCharacterInfo.animOffset, y, 1, 1, 1, 1);
                end
            end
			if not self.progressBarLoaded then
				local progressBar = ISSkillProgressBar:new(left + 20 + self.txtLen + 45, y + (rowHgt - progressHgt) / 2, 0, 0, self.playerNum, perk, self);
				progressBar:initialise();
				self:addChild(progressBar);
				table.insert(self.progressBars, progressBar);
			end
			y = y + rowHgt;
		end
		y = y + 10;
		maxY = math.max(maxY, y)
	end

--~ 	self:drawText("Strong : " .. getPlayer():getPerkLevel(Perks.Strength), self.x + 8, y, 1, 1, 1, 1, UIFont.Small);
	y = maxY + 10;
--~ 	for i = 0, getPlayer():getTraits():size() - 1 do
--~ 		local v = getPlayer():getTraits():get(i);
--~ 		self:drawText("Trait : " .. v, self.x + 8, y, 1, 1, 1, 1, UIFont.Small);
--~ 		y = y + 20;
--~ 	end
--~ 	self:drawText("Hauling : " .. getPlayer():getXp():getXP(Perks.Hauling), self.x + 8, y, 1, 1, 1, 1, UIFont.Small);

    self:setWidthAndParentWidth(left + self.txtLen + 380);
	self:setHeightAndParentHeight(math.min(y, maxHeight));

	self:setScrollHeight(y)

	self.progressBarLoaded = true;

	if self.joyfocus then
		if self.joypadIndex and self.joypadIndex >= 1 and self.joypadIndex <= #self.progressBars then
			local bar = self.progressBars[self.joypadIndex]
			local left = bar:getX() - (self.txtLen + 45)
			local right = bar:getX() + bar:getWidth()
			self:drawRectBorder(left-2, bar:getY()-2, (right - left) + 2, bar:getHeight() + 3, 0.4, 0.2, 1.0, 1.0);
			if bar.tooltip then
				bar.tooltip.followMouse = false
				bar.tooltip:setX(bar:getAbsoluteX())
				local tty = bar:getAbsoluteY() + bar:getHeight() + 1
				if tty + bar.tooltip:getHeight() > getCore():getScreenHeight() then
					tty = bar:getAbsoluteY() - bar.tooltip:getHeight() - 1
				end
				bar.tooltip:setY(tty)
			end
		end
	end

	self:clearStencilRect()
end

function call_reset_skills()
	processSayMessage("*spiffohead*"..get_rpname().." reset their dice skills.")
	Events.OnTick.Add(TTRPG.reset_skills)
end

function TTRPG.reset_skills()
	local playerchar = getPlayer()
	DiceRolling = false;
	local dicetotals = TTRPG.total_dice_skills()
	if dicetotals > 0 then
		playerchar:LoseLevel(Perks.DnDInitiative);
		playerchar:getXp():setXPToLevel(Perks.DnDInitiative, playerchar:getPerkLevel(Perks.DnDInitiative))
		playerchar:LoseLevel(Perks.DnDStr_Strength);
		playerchar:getXp():setXPToLevel(Perks.DnDStr_Strength, playerchar:getPerkLevel(Perks.DnDStr_Strength))
		playerchar:LoseLevel(Perks.DnDStr_1hMelee);
		playerchar:getXp():setXPToLevel(Perks.DnDStr_1hMelee, playerchar:getPerkLevel(Perks.DnDStr_1hMelee))
		playerchar:LoseLevel(Perks.DnDStr_2hMelee);
		playerchar:getXp():setXPToLevel(Perks.DnDStr_2hMelee, playerchar:getPerkLevel(Perks.DnDStr_2hMelee))
		playerchar:LoseLevel(Perks.DnDStr_Defense);
		playerchar:getXp():setXPToLevel(Perks.DnDStr_Defense, playerchar:getPerkLevel(Perks.DnDStr_Defense))
		playerchar:LoseLevel(Perks.DnDStr_Evasion);
		playerchar:getXp():setXPToLevel(Perks.DnDStr_Evasion, playerchar:getPerkLevel(Perks.DnDStr_Evasion))
		playerchar:LoseLevel(Perks.DnDCharisma);
		playerchar:getXp():setXPToLevel(Perks.DnDCharisma, playerchar:getPerkLevel(Perks.DnDCharisma))
		playerchar:LoseLevel(Perks.DnDPersuasion);
		playerchar:getXp():setXPToLevel(Perks.DnDPersuasion, playerchar:getPerkLevel(Perks.DnDPersuasion))
		playerchar:LoseLevel(Perks.DnDDeception);
		playerchar:getXp():setXPToLevel(Perks.DnDDeception, playerchar:getPerkLevel(Perks.DnDDeception))
		playerchar:LoseLevel(Perks.DnDIntelligence);
		playerchar:getXp():setXPToLevel(Perks.DnDIntelligence, playerchar:getPerkLevel(Perks.DnDIntelligence))
		playerchar:LoseLevel(Perks.DnDWisdom);
		playerchar:getXp():setXPToLevel(Perks.DnDWisdom, playerchar:getPerkLevel(Perks.DnDWisdom))
		playerchar:LoseLevel(Perks.DnDInsight);
		playerchar:getXp():setXPToLevel(Perks.DnDInsight, playerchar:getPerkLevel(Perks.DnDInsight))
		playerchar:LoseLevel(Perks.DnDFirstAid);
		playerchar:getXp():setXPToLevel(Perks.DnDStrength, playerchar:getPerkLevel(Perks.DnDFirstAid))
		playerchar:LoseLevel(Perks.DnDPerception);
		playerchar:getXp():setXPToLevel(Perks.DnDPerception, playerchar:getPerkLevel(Perks.DnDPerception))
		playerchar:LoseLevel(Perks.DnDLuck);
		playerchar:getXp():setXPToLevel(Perks.DnDLuck, playerchar:getPerkLevel(Perks.DnDLuck))
		playerchar:LoseLevel(Perks.DnDDex_Agility);
		playerchar:getXp():setXPToLevel(Perks.DnDDex_Agility, playerchar:getPerkLevel(Perks.DnDDex_Agility))
		playerchar:LoseLevel(Perks.DnDDex_Stealth);
		playerchar:getXp():setXPToLevel(Perks.DnDDex_Stealth, playerchar:getPerkLevel(Perks.DnDDex_Stealth))
		playerchar:LoseLevel(Perks.DnDDex_SleightOfHand);
		playerchar:getXp():setXPToLevel(Perks.DnDDex_SleightOfHand, playerchar:getPerkLevel(Perks.DnDDex_SleightOfHand))
		playerchar:LoseLevel(Perks.DnDDex_Dexterity);
		playerchar:getXp():setXPToLevel(Perks.DnDDex_Dexterity, playerchar:getPerkLevel(Perks.DnDDex_Dexterity))
		playerchar:LoseLevel(Perks.DnDWillpower);
		playerchar:getXp():setXPToLevel(Perks.DnDWillpower, playerchar:getPerkLevel(Perks.DnDWillpower))
		SyncXp(playerchar)
		dicetotals = TTRPG.total_dice_skills()
		print("Removed 1 level")
	elseif dicetotals <= 0 then
		Events.OnTick.Remove(TTRPG.reset_skills)
		print("Removal complete")
	end
	if DiceRolling and dicetotals <= 0 then
		getPlayer():addLineChatElement("Skills reset.", 0, 0, 1);
		DiceRolling = false;
	end
end

function TTRPG.total_dice_skills()
	local playerchar = getPlayer()
	local dicetotals =	playerchar:getPerkLevel(Perks.DnDStr_Strength) + 
	playerchar:getPerkLevel(Perks.DnDStr_1hMelee) + 
	playerchar:getPerkLevel(Perks.DnDStr_2hMelee) + 
	playerchar:getPerkLevel(Perks.DnDStr_Defense) + 
	playerchar:getPerkLevel(Perks.DnDStr_Evasion) + 
	playerchar:getPerkLevel(Perks.DnDCharisma) + 
	playerchar:getPerkLevel(Perks.DnDPersuasion) + 
	playerchar:getPerkLevel(Perks.DnDDeception) + 
	playerchar:getPerkLevel(Perks.DnDIntelligence) + 
	playerchar:getPerkLevel(Perks.DnDWisdom) + 
	playerchar:getPerkLevel(Perks.DnDInsight) + 
	playerchar:getPerkLevel(Perks.DnDFirstAid) + 
	playerchar:getPerkLevel(Perks.DnDPerception) + 
	playerchar:getPerkLevel(Perks.DnDDex_SleightOfHand) + 
	playerchar:getPerkLevel(Perks.DnDDex_Agility) + 
	playerchar:getPerkLevel(Perks.DnDDex_Stealth) + 
	playerchar:getPerkLevel(Perks.DnDLuck) + 
	playerchar:getPerkLevel(Perks.DnDDex_Dexterity) + 
	playerchar:getPerkLevel(Perks.DnDWillpower);
	return dicetotals
end

Events.EveryTenMinutes.Add(TTRPG.setLocalSandboxVars) --check if these values have changed
