--***********************************************************
--**                    THE INDIE STONE                    **
--**			Author: turbotutone		   **
--***********************************************************

ISInventoryMenuElements = ISInventoryMenuElements or {};

function ISInventoryMenuElements.ContextMagic8Ball()
    local self 					= ISMenuElement.new();
    self.invMenu			    = ISContextManager.getInstance().getInventoryMenu();

    function self.init()
    end

    function self.createMenu( _item )
        if _item:getType() == "Magic8Ball" then
            if _item:getContainer() ~= self.invMenu.inventory then
                return;
            end

            self.invMenu.context:addOption(getText("ContextMenu_Ask"), self.invMenu, self.ask8Ball, _item );
        end
    end

    function self.ask8Ball( _p, _item )
	ISInventoryPaneContextMenu.transferIfNeeded(_p.player, _item)
	ISTimedActionQueue.add(ISAsk8Ball:new(_p.player, _item));
    end

    return self;
end

