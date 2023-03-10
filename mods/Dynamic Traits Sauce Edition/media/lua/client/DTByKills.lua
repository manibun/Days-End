function traitsGainsByKills(player)
	local player = getPlayer();
	if player:getZombieKills() >= 500 then
		if player:HasTrait("Cowardly") then
			player:getTraits():remove("Cowardly");
		end
	end
	if player:getZombieKills() >= 1000 then
		if not player:HasTrait("Brave") then
			player:getTraits():add("Brave");
		end
	end
	if player:getZombieKills() >= 1500 then
		if player:HasTrait("Agoraphobic") then
			player:getTraits():remove("Agoraphobic");
		end
		if player:HasTrait("Claustophobic") then
			player:getTraits():remove("Claustophobic");
		end
		if player:HasTrait("Hemophobic") then
			player:getTraits():remove("Hemophobic");
		end
	end	
	if player:getZombieKills() >= 2000 then
		if player:HasTrait("Pacifist") then
			player:getTraits():remove("Pacifist");
		end
	end
	if player:getZombieKills() >= 2500 then
		if not player:HasTrait("Paranoid") then
			if not player:HasTrait("Desensitized") then
				player:getTraits():add("Desensitized");
			end
		end
	end
	if player:getZombieKills() < 2500 and player:getDescriptor():getProfession()~="veteran" then
		if player:HasTrait("Desensitized") then
			player:getTraits():remove("Desensitized");
		end
	end
end
Events.EveryHours.Add(traitsGainsByKills);