require "ISUI/Maps/ISWorldMap"
require "DrawOnMap/FreeHandUI"

local _freeHandUi

ISWorldMap.handleFreeHandButtonClick = function(self)
	self.freeHandUI:setVisible(not self.freeHandUI:getIsVisible())
end

ISWorldMap.createChildren_prepatch_drawonmap = ISWorldMap.createChildren;
ISWorldMap.createChildren = function(self)
	self:createChildren_prepatch_drawonmap();

    self.freeHandUI = FreeHandUI:new(20, getCore():getScreenHeight() - 220, 225, 150, self.symbolsUI)
    self.freeHandUI:setAnchorLeft(true)
	self.freeHandUI:setAnchorRight(false)
    self.freeHandUI:init()
    self:addChild(self.freeHandUI)

    _freeHandUi = self.freeHandUI

    self.freeHandButton = ISButton:new(0, 0, 48, 48, "", self, self.handleFreeHandButtonClick);
    self.freeHandButton:setImage(getTexture("media/ui/DrawOnTheMap/pencil_icon.png"));
    self:addChild(self.freeHandButton)

    local worldMap = self;
    self.freeHandButton.prerender = function(self)
		ISButton.prerender(self)
		
		local offset = 68 --20px spacing + 48px img
		if worldMap.legendButton then
			self:setX(worldMap.legendButton:getX() + offset)
			self:setY(worldMap.legendButton:getY())
		else
			self:setX(20)
			self:setY(getCore():getScreenHeight() - offset)
		end
	end
end

local function OnResolutionChange()
	if _freeHandUi then
		_freeHandUi:setX(20)
		_freeHandUi:setY(getCore():getScreenHeight() - 220)
	end
end

Events.OnResolutionChange.Add(OnResolutionChange)
