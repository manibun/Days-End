ISInventoryPaneContextMenu.extraMenu = function(player, context, items)

	local customLiterature = nil;
	local noLiterature = nil;
	local checkImage = nil;

	local playerObj = getSpecificPlayer(player)

	local containerList = ISInventoryPaneContextMenu.getContainers(playerObj)
    local testItem = nil;
    local editItem = nil;

    for i,v in ipairs(items) do
        testItem = v;
        if not instanceof(v, "InventoryItem") then
            --print(#v.items);
            if #v.items == 2 then
                editItem = v.items[1];
            end
            testItem = v.items[1];
        else
            editItem = v
        end

		if (instanceof(testItem, "Literature")) and testItem:getMaxCapacity() == 0 then
            noLiterature = testItem;
		elseif (instanceof(testItem, "Literature")) and testItem:getCustomMenuOption() then
            customLiterature = testItem;
		end

		local type = testItem:getType();
		local texPath1 = ("media/textures/Inspect/" .. type .. ".png");
		local texPath2 = ("media/textures/Inspect/" .. type .. "_0.png");
		local texture = getTexture(texPath1) or getTexture(texPath2);
		
		if not (instanceof(testItem, "Moveable")) and testItem:getConditionMax() >= 1 and texture ~= nil and testItem:getMechanicType() < 1 then
			checkImage = testItem;
		end
	end


	if customLiterature then
		for i,v in ipairs(context.options) do
			if v.name == getText("ContextMenu_Read") then
				local readOption = context:replaceOption(v, customLiterature:getCustomMenuOption(), customLiterature, ISInventoryPaneContextMenu.readItem, player);

				if customLiterature:getRequireInHandOrInventory() then
					local list = customLiterature:getRequireInHandOrInventory();
					local found = false;
					local required = "";
					for i=0,list:size()-1 do
						--local item = list:get(i):getItem();
						local fullType = moduleDotType(customLiterature:getModule(), list:get(i))
						if playerObj:getInventory():containsTypeRecurse(fullType) then
							found = true;
							break;
						end
						required = required .. getItemNameFromFullType(fullType);
						if i < list:size()-1 then
							required = required .. "/";
						end
					end
					if not found then
						readOption.notAvailable = true;
						local tooltip = ISInventoryPaneContextMenu.addToolTip();
						tooltip.description = getText("ContextMenu_Require", required);
						readOption.toolTip = tooltip;
					end
				end
				if getSpecificPlayer(player):isAsleep() then
					readOption.notAvailable = true;
					local tooltip = ISInventoryPaneContextMenu.addToolTip();
					tooltip.description = getText("ContextMenu_NoOptionSleeping");
					readOption.toolTip = tooltip;
				end
			end
		end
	end
	if checkImage then
		if testItem:getMaxCapacity() == 0 then
			for i,v in ipairs(context.options) do
				if v.name == getText("ContextMenu_Read") then
					local readOption = context:replaceOption(v, getText("IGUI_invpanel_Inspect"), player, ISInventoryPaneContextMenu.checkImage, checkImage);
				end
			end
		else
			context:addOption(getText("IGUI_invpanel_Inspect"), player, ISInventoryPaneContextMenu.checkImage, checkImage );
		end
	end

	--return context
end

    function ISInventoryPaneContextMenu.checkImage( player, item )
	ISInventoryPaneContextMenu.transferIfNeeded(getSpecificPlayer(player), item)
    	local mapUI = SFRelax_CheckImage:new(0, 0, 0, 0, item, player);
    	mapUI:initialise();
    	local wrap = mapUI:wrapInCollapsableWindow(item:getName(), false);
    	wrap:setInfo(getText("IGUI_Map_Info"));
    	mapUI.wrap = wrap;
    	wrap.render = SFRelax_CheckImage.renderWrap;
    	wrap.prerender = SFRelax_CheckImage.prerenderWrap;
    	wrap.setVisible = SFRelax_CheckImage.setWrapVisible;
    	wrap.close = SFRelax_CheckImage.closeWrap;
	wrap.mapUI = mapUI;
    	mapUI.render = SFRelax_CheckImage.noRender;
    	mapUI.prerender = SFRelax_CheckImage.noRender;
    	wrap:setVisible(true);
    	wrap:addToUIManager();
	if JoypadState.players[player+1] then
        	setJoypadFocus(player, mapUI)
    	end
    end

Events.OnFillInventoryObjectContextMenu.Add(ISInventoryPaneContextMenu.extraMenu);