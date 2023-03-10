local ScrapGuns = ScrapGuns or {}

ScrapGuns.manageGatlingAnimations = function(player, item)
    if item and item.getFullType and item:getFullType() == "SGuns.ScrapGatling" then
        player:setVariable("ScrapGatlingEquipped", true)
    else
        player:clearVariable("ScrapGatlingEquipped")
    end
end

Events.OnEquipPrimary.Add(ScrapGuns.manageGatlingAnimations)
Events.OnEquipSecondary.Add(ScrapGuns.manageGatlingAnimations)

ScrapGuns.initGatlingAnimations = function(playerIndex, player)
    local primary = player:getPrimaryHandItem()
    local secondary = player:getSecondaryHandItem()

    if primary and primary == secondary and primary.getFullType and primary:getFullType() == "SGuns.ScrapGatling" then
        player:setVariable("ScrapGatlingEquipped", true)
    end
end

Events.OnCreatePlayer.Add(ScrapGuns.initGatlingAnimations)

return ScrapGuns