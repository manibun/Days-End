--***********************************************************
--**                    NECROPOLISRP.NET                   **
--**			 Mod Author: github.com/buffyuwu    	   **
--***********************************************************
ISInventoryMenuElements = ISInventoryMenuElements or {};

function ISInventoryMenuElements.ContextUtilities(context)
    local ctrlshiftdeleting = false
    local self 					= ISMenuElement.new();
    self.invMenu			    = ISContextManager.getInstance().getInventoryMenu();

    function self.init()
    end

    function self.createMenu( _item )
        local itemname = _item:getName() or "item"
        local itemtype = _item:getFullType() or "type"
        if _item:IsClothing() and _item:isEquipped() then
            return
        end
        if _item:isFavorite() then
            return
        end
        if _item:getContainer() ~= self.invMenu.inventory then
            return;
        end
        if self.invMenu.player:getPrimaryHandItem() ~= _item and self.invMenu.player:getSecondaryHandItem() ~= _item then
            if itemtype == "Buffy.DiceResetBook" then
                self.invMenu.context:addOption("Reset Dice Skills", self.invMenu, self.ResetDice, _item)
            end
        end
    end

    function self.ResetDice(_p,_item)
        DiceRolling = false;
        call_reset_skills()
        getSpecificPlayer(0):getInventory():Remove(_item)
		getPlayer():addLineChatElement("TTRPG Skills reset.", 0, 0, 1);
    end

    return self;
end
