function limiter(player, perk, amount)
    local allPerks = {};
    for i=0, Perks.getMaxIndex() - 1 do
        local perk = PerkFactory.getPerk(Perks.fromIndex(i));
        if perk and perk:getParent() ~= Perks.None then
            local newPerk = {};
            newPerk.perk = Perks.fromIndex(i);
            --newPerk.name = perk:getName() .. " (" .. PerkFactory.getPerkName(perk:getParent()) .. ")";
			newPerk.name = perk:getName();
            newPerk.level = player:getPerkLevel(Perks.fromIndex(i));
            newPerk.xpToLevel = perk:getXpForLevel(newPerk.level + 1);
            newPerk.xpAdd = round(player:getXp():getXP(newPerk.perk) - ISSkillProgressBar.getPreviousXpLvl(perk, newPerk.level),2);
            newPerk.xpTotal = player:getXp():getXP(newPerk.perk);
			newPerk.last = ISSkillProgressBar.getPreviousXpLvl(perk, newPerk.level);
            newPerk.xpBoost = player:getXp():getPerkBoost(newPerk.perk);
            newPerk.multiplier = player:getXp():getMultiplier(newPerk.perk);
			allPerks[tostring(newPerk.name)]=newPerk
        end
    end
  if perk == Perks.Woodwork then
		if allPerks[perk:getName()].xpBoost == 0 and allPerks[perk:getName()].level >=5 then
			player:getXp():setXPToLevel(Perks.Woodwork, 5);
		elseif allPerks[perk:getName()].xpBoost == 1 and allPerks[perk:getName()].level >=7 then
			player:getXp():setXPToLevel(Perks.Woodwork, 7);
		elseif allPerks[perk:getName()].xpBoost == 2 and allPerks[perk:getName()].level >=9 then
			player:getXp():setXPToLevel(Perks.Woodwork, 9);
		end
	end
	if perk == Perks.Cooking then
		if allPerks[perk:getName()].xpBoost == 0 and allPerks[perk:getName()].level >=5 then
			player:getXp():setXPToLevel(Perks.Cooking, 5);
		elseif allPerks[perk:getName()].xpBoost == 1 and allPerks[perk:getName()].level >=7 then
			player:getXp():setXPToLevel(Perks.Cooking, 7);
		elseif allPerks[perk:getName()].xpBoost == 2 and allPerks[perk:getName()].level >=9 then
			player:getXp():setXPToLevel(Perks.Cooking, 9);
		end
	end
	if perk == Perks.Farming then
		if allPerks[perk:getName()].xpBoost == 0 and allPerks[perk:getName()].level >=5 then
			player:getXp():setXPToLevel(Perks.Farming, 5);
		elseif allPerks[perk:getName()].xpBoost == 1 and allPerks[perk:getName()].level >=7 then
			player:getXp():setXPToLevel(Perks.Farming, 7);
		elseif allPerks[perk:getName()].xpBoost == 2 and allPerks[perk:getName()].level >=9 then
			player:getXp():setXPToLevel(Perks.Farming, 9);
		end
	end
	if perk == Perks.Doctor then
		if allPerks[perk:getName()].xpBoost == 0 and allPerks[perk:getName()].level >=5 then
			player:getXp():setXPToLevel(Perks.Doctor, 5);
		elseif allPerks[perk:getName()].xpBoost == 1 and allPerks[perk:getName()].level >=7 then
			player:getXp():setXPToLevel(Perks.Doctor, 7);
		elseif allPerks[perk:getName()].xpBoost == 2 and allPerks[perk:getName()].level >=9 then
			player:getXp():setXPToLevel(Perks.Doctor, 9);
		end
	end
	if perk == Perks.Electrical then
		if allPerks[perk:getName()].xpBoost == 0 and allPerks[perk:getName()].level >=5 then
			player:getXp():setXPToLevel(Perks.Electrical, 5);
		elseif allPerks[perk:getName()].xpBoost == 1 and allPerks[perk:getName()].level >=7 then
			player:getXp():setXPToLevel(Perks.Electrical, 7);
		elseif allPerks[perk:getName()].xpBoost == 2 and allPerks[perk:getName()].level >=9 then
			player:getXp():setXPToLevel(Perks.Electrical, 9);
		end
	end
	if perk == Perks.MetalWelding then
		if allPerks[perk:getName()].xpBoost == 0 and allPerks[perk:getName()].level >=5 then
			player:getXp():setXPToLevel(Perks.MetalWelding, 5);
		elseif allPerks[perk:getName()].xpBoost == 1 and allPerks[perk:getName()].level >=7 then
			player:getXp():setXPToLevel(Perks.MetalWelding, 7);
		elseif allPerks[perk:getName()].xpBoost == 2 and allPerks[perk:getName()].level >=9 then
			player:getXp():setXPToLevel(Perks.MetalWelding, 9);
		end
	end
	if perk == Perks.Mechanics then
		if allPerks[perk:getName()].xpBoost == 0 and allPerks[perk:getName()].level >=5 then
			player:getXp():setXPToLevel(Perks.Mechanics, 5);
		elseif allPerks[perk:getName()].xpBoost == 1 and allPerks[perk:getName()].level >=7 then
			player:getXp():setXPToLevel(Perks.Mechanics, 7);
		elseif allPerks[perk:getName()].xpBoost == 2 and allPerks[perk:getName()].level >=9 then
			player:getXp():setXPToLevel(Perks.Mechanics, 9);
		end
	end
	if perk == Perks.Tailoring then
		if allPerks[perk:getName()].xpBoost == 0 and allPerks[perk:getName()].level >=5 then
			player:getXp():setXPToLevel(Perks.Tailoring, 5);
		elseif allPerks[perk:getName()].xpBoost == 1 and allPerks[perk:getName()].level >=7 then
			player:getXp():setXPToLevel(Perks.Tailoring, 7);
		elseif allPerks[perk:getName()].xpBoost == 2 and allPerks[perk:getName()].level >=9 then
			player:getXp():setXPToLevel(Perks.Tailoring, 9);
		end
	end
	if perk == Perks.Masonry then
		if allPerks[perk:getName()].xpBoost == 0 and allPerks[perk:getName()].level >=5 then
			player:getXp():setXPToLevel(Perks.Masonry, 5);
		elseif allPerks[perk:getName()].xpBoost == 1 and allPerks[perk:getName()].level >=7 then
			player:getXp():setXPToLevel(Perks.Masonry, 7);
		elseif allPerks["Masonry"].xpBoost == 2 and allPerks[perk:getName()].level >=9 then
			player:getXp():setXPToLevel(Perks.Masonry, 9);
		end
	end
	if perk == Perks.Fishing then
		if allPerks[perk:getName()].xpBoost == 0 and allPerks[perk:getName()].level >=5 then
			player:getXp():setXPToLevel(Perks.Fishing, 5);
		elseif allPerks[perk:getName()].xpBoost == 1 and allPerks[perk:getName()].level >=7 then
			player:getXp():setXPToLevel(Perks.Fishing, 7);
		elseif allPerks[perk:getName()].xpBoost == 2 and allPerks[perk:getName()].level >=9 then
			player:getXp():setXPToLevel(Perks.Fishing, 9);
		end
	end
	if perk == Perks.Trapping then
		if allPerks[perk:getName()].xpBoost == 0 and allPerks[perk:getName()].level >=5 then
			player:getXp():setXPToLevel(Perks.Trapping, 5);
		elseif allPerks[perk:getName()].xpBoost == 1 and allPerks[perk:getName()].level >=7 then
			player:getXp():setXPToLevel(Perks.Trapping, 7);
		elseif allPerks[perk:getName()].xpBoost == 2 and allPerks[perk:getName()].level >=9 then
			player:getXp():setXPToLevel(Perks.Trapping, 9);
		end
	end
	if perk == Perks.PlantScavenging then
		if allPerks[perk:getName()].xpBoost == 0 and allPerks[perk:getName()].level >=5 then
			player:getXp():setXPToLevel(Perks.PlantScavenging, 5);
		elseif allPerks[perk:getName()].xpBoost == 1 and allPerks[perk:getName()].level >=7 then
			player:getXp():setXPToLevel(Perks.PlantScavenging, 7);
		elseif allPerks[perk:getName()].xpBoost == 2 and allPerks[perk:getName()].level >=9 then
			player:getXp():setXPToLevel(Perks.PlantScavenging, 9);
		end
	end
end
Events.AddXP.Add(limiter)
