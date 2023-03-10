function Recipe.OnGiveXP.MWXP2(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.MetalWelding, 2);
end

function Recipe.OnGiveXP.MWXP4(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.MetalWelding, 4);
end

function Recipe.OnGiveXP.MWXP5(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.MetalWelding, 5);
end


Give2MWXP = Recipe.OnGiveXP.MWXP2
Give4MWXP = Recipe.OnGiveXP.MWXP4
Give5MWXP = Recipe.OnGiveXP.MWXP5
