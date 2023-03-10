local function tryBlock(BodyPartType, InjuryType, ArmorType, player)
    if true then return true end
	local Armor = player:getInventory():getItemFromType(ArmorType);
	if(InjuryType == "scratched") then
		if(Armor:getModData().ScratchRes ~= nil) and (Armor:getModData().ScratchRes[BodyPartType] ~= nil) then
			return ( (ZombRand(100)+1) < Armor:getModData().ScratchRes[BodyPartType] );
		end	
	elseif(InjuryType == "deepWound") then
		if((Armor:getModData().DeepWoundRes ~= nil) and Armor:getModData().DeepWoundRes[BodyPartType] ~= nil) then
			return ( (ZombRand(100)+1) < Armor:getModData().DeepWoundRes[BodyPartType] );
		end
	elseif(InjuryType == "bitten") then
		if(Armor:getModData().BiteRes ~= nil) and (Armor:getModData().BiteRes[BodyPartType] ~= nil) then
			return ( (ZombRand(100)+1) < Armor:getModData().BiteRes[BodyPartType] );
		end
    elseif(InjuryType == "bleeding") then
		if(Armor:getModData().ScratchRes ~= nil) and (Armor:getModData().ScratchRes[BodyPartType] ~= nil) then
			return ( (ZombRand(100)+1) < Armor:getModData().ScratchRes[BodyPartType] );
		end
	elseif(InjuryType == "haveBullet") then
		if(Armor:getModData().BulletRes ~= nil) and (Armor:getModData().BulletRes[BodyPartType] ~= nil) then
			return ( (ZombRand(100)+1) < Armor:getModData().BulletRes[BodyPartType] );
		end
	end
end


local function DamageArmor(Armor, player, InjuryType)
	if Armor == nil then return true end
    local Damage = 1;
	
	if(InjuryType == "scratched") then
		Damage = 1;
	elseif(InjuryType == "deepWound") then
		Damage = 3;
    elseif(InjuryType == "bleeding") then
		Damage = 1;
	elseif(InjuryType == "bitten") then
		Damage = 2;
	elseif(InjuryType == "haveBullet") then
		Damage = 5;
	end

	local isBroken = false;
    print(Armor:getCondition())
    Armor:setCondition(Armor:getCondition() - Damage/3.0)
	if (Armor:getCondition() <= 0) then
		isBroken = true;
		player:getInventory():Remove(Armor);
        player:setSecondaryHandItem(nil);
	end
	return isBroken;
end


function ArmorCheckForDamage(player)
    if player ~= nil then
        local emi = player:getEmitter()
        local BD = player:getBodyDamage()
        local tempBD = {}

        local BPs = BD:getBodyParts();
        for i=0, BPs:size()-1 do
            local bp = BPs:get(i)
            local bpType = tostring(bp:getType())
            tempBD[bpType] = {}
            tempBD[bpType]["bitten"] = bp:bitten()
            tempBD[bpType]["deepWound"] = bp:deepWounded()
            tempBD[bpType]["scratched"] = bp:scratched()
            tempBD[bpType]["IsInfected"] = bp:IsInfected()
            tempBD[bpType]["IsFakeInfected"] = bp:IsFakeInfected()
            tempBD[bpType]["haveBullet"] = bp:haveBullet()
            tempBD[bpType]["bleeding"] = bp:bleeding()
            if bp:bleeding() then print ("BLEED") end
            tempBD[bpType]["health"] = bp:getHealth()
        end

        if player:getSecondaryHandItem() ~= nil and player:getModData().ShieldArmor ~= nil and player:getSecondaryHandItem():getType() == player:getModData().ShieldArmor and player:getModData().LastBD ~= nil then
            for i=0, BPs:size()-1 do
                local bp = BPs:get(i)
                local bpType = tostring(bp:getType())
                
                if tempBD[bpType]["bitten"] and not player:getModData().LastBD[bpType]["bitten"] then
                    if tryBlock(bpType, "bitten", player:getModData().ShieldArmor, player) then
                        DamageArmor(player:getSecondaryHandItem(), player, "bitten")
                        -- Heal
                        bp:SetBitten(false)
                        bp:setBiteTime(0)
                        if not player:getModData().LastBD[bpType]["IsInfected"] then
                            bp:SetInfected(false) 
                            bp:setInfectedWound(false) 
                        end
                        if not player:getModData().LastBD[bpType]["IsFakeInfected"] then
                            bp:SetFakeInfected(false)  
                        end
                        
                        if tempBD[bpType]["health"] < player:getModData().LastBD[bpType]["health"] then
                            bp:SetHealth(player:getModData().LastBD[bpType]["health"])
                        end
                        -- Sound
                        emi:playSound("ShieldBlock")
                    end
                end

                if tempBD[bpType]["bleeding"] and not player:getModData().LastBD[bpType]["bleeding"] then
                    if tryBlock(bpType, "bleeding", player:getModData().ShieldArmor, player) then
                        DamageArmor(player:getSecondaryHandItem(), player, "bleeding")
                        -- Heal
                        bp:setBleeding(false)
                        bp:setCut(false)
                        bp:setCutTime(0.0)
                        bp:setBleedingTime(0)
                        if not player:getModData().LastBD[bpType]["IsInfected"] then
                            bp:SetInfected(false) 
                            bp:setInfectedWound(false)      
                        end
                        if not player:getModData().LastBD[bpType]["IsFakeInfected"] then
                            bp:SetFakeInfected(false)  
                        end
                        if tempBD[bpType]["health"] < player:getModData().LastBD[bpType]["health"] then
                            bp:SetHealth(player:getModData().LastBD[bpType]["health"])
                        end
                        -- Sound
                        emi:playSound("ShieldBlock")
                    end
                end

                if tempBD[bpType]["deepWound"] and not player:getModData().LastBD[bpType]["deepWound"] then
                    if tryBlock(bpType, "deepWound", player:getModData().ShieldArmor, player) then
                        DamageArmor(player:getSecondaryHandItem(), player, "deepWound")
                        -- Heal
                        bp:setDeepWounded(false)
                        bp:setDeepWoundTime(0)
                        if not player:getModData().LastBD[bpType]["IsInfected"] then
                            bp:SetInfected(false)  
                            bp:setInfectedWound(false) 
                        end
                        if not player:getModData().LastBD[bpType]["IsFakeInfected"] then
                            bp:SetFakeInfected(false)  
                        end
                        if tempBD[bpType]["health"] < player:getModData().LastBD[bpType]["health"] then
                            bp:SetHealth(player:getModData().LastBD[bpType]["health"])
                        end
                        -- Sound
                        emi:playSound("ShieldBlock")
                    end
                end

                if tempBD[bpType]["scratched"] and not player:getModData().LastBD[bpType]["scratched"] then
                    if tryBlock(bpType, "scratched", player:getModData().ShieldArmor, player) then
                        DamageArmor(player:getSecondaryHandItem(), player, "scratched")
                        -- Heal
                        bp:setScratched(false, false)
                        bp:setScratchTime(0)
                        if not player:getModData().LastBD[bpType]["isInfected"] then
                            bp:SetInfected(false)  
                            bp:setInfectedWound(false)     
                        end
                        if not player:getModData().LastBD[bpType]["IsFakeInfected"] then
                            bp:SetFakeInfected(false)  
                        end
                        if tempBD[bpType]["health"] < player:getModData().LastBD[bpType]["health"] then
                            bp:SetHealth(player:getModData().LastBD[bpType]["health"])
                        end
                        -- Sound
                        emi:playSound("ShieldBlock")
                    end
                end

                if tempBD[bpType]["haveBullet"] and not player:getModData().LastBD[bpType]["haveBullet"] then
                    if tryBlock(bpType, "haveBullet", player:getModData().ShieldArmor, player) then
                        DamageArmor(player:getSecondaryHandItem(), player, "haveBullet")
                        -- Heal
                        bp:setHaveBullet(false, 0)
                        if tempBD[bpType]["health"] < player:getModData().LastBD[bpType]["health"] then
                            bp:SetHealth(player:getModData().LastBD[bpType]["health"])
                        end
                        -- Sound
                        emi:playSound("ShieldBlock")
                    end
                end 
            end

            for i=0, BPs:size()-1 do
                local bp = BPs:get(i)
                local bpType = tostring(bp:getType())
                tempBD[bpType] = {}
                tempBD[bpType]["bitten"] = bp:bitten()
                tempBD[bpType]["deepWound"] = bp:deepWounded()
                tempBD[bpType]["scratched"] = bp:scratched()
                tempBD[bpType]["IsInfected"] = bp:IsInfected()
                tempBD[bpType]["IsFakeInfected"] = bp:IsFakeInfected()
                tempBD[bpType]["haveBullet"] = bp:haveBullet()
                tempBD[bpType]["bleeding"] = bp:bleeding()
                tempBD[bpType]["health"] = bp:getHealth()
            end
        end

        player:getModData().LastBD = tempBD
    end
	
	return ArmorbInjuryDetected;
end