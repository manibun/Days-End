FreeHandUI = ISPanelJoypad:derive("FreeHandUI")

function FreeHandUI:new(x, y, width, height, symbolsUI)
	local o = ISPanelJoypad:new(x, y, width, height);
    o.moveWithMouse = true;
    setmetatable(o, self)
    self.__index = self
    self.symbolsUI = symbolsUI;
    return o
end

function FreeHandUI:init()
	local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

	local btnWid = self.width - 40
	local btnHgt = FONT_HGT_SMALL + 2 * 2

	local y = 10

	self.splineBtn = ISButton:new(20, y, btnWid, btnHgt, getText("UI_DrawOnMap_Draw"), self, FreeHandUI.onButtonClick)
	self.splineBtn.internal = "FREE_HAND"
	self.splineBtn:initialise()
	self.splineBtn:instantiate()
	self.splineBtn.borderColor.a = 0.0
	self:addChild(self.splineBtn)

	y = self.splineBtn:getBottom() + 10

	self.freeHandEraseBtn = ISButton:new(20, y, btnWid, btnHgt, getText("UI_DrawOnMap_Erase"), self, FreeHandUI.onButtonClick)
	self.freeHandEraseBtn.internal = "FREE_HAND_ERASE"
	self.freeHandEraseBtn:initialise()
	self.freeHandEraseBtn:instantiate()
	self.freeHandEraseBtn.borderColor.a = 0.0
	self:addChild(self.freeHandEraseBtn)

	y = self.freeHandEraseBtn:getBottom() + 10

	local sizeControlButtonW = 30
	local otherBtnWid = btnWid - 10 - (sizeControlButtonW * 2);
	
	self.freeHandSizeBtn = ISButton:new(25 + sizeControlButtonW, y, otherBtnWid, btnHgt, getText("UI_DrawOnMap_Thickness")..": 3", self, FreeHandUI.onButtonClick)
	self.freeHandSizeBtn.internal = "FREE_HAND_SIZE"
	self.freeHandSizeBtn:initialise()
	self.freeHandSizeBtn:instantiate()
	self.freeHandSizeBtn.borderColor.a = 0.0
	self:addChild(self.freeHandSizeBtn)

	self.sizeDownBtn = ISButton:new(20, y, sizeControlButtonW, btnHgt, "-", self, FreeHandUI.onButtonClick)
	self.sizeDownBtn.internal = "FREE_HAND_SIZE_DOWN"
	self.sizeDownBtn:initialise()
	self.sizeDownBtn:instantiate()
	self.sizeDownBtn.borderColor.a = 0.0
	self:addChild(self.sizeDownBtn)

	self.sizeUpBtn = ISButton:new(30 + sizeControlButtonW + otherBtnWid, y, sizeControlButtonW, btnHgt, "+", self, FreeHandUI.onButtonClick)
	self.sizeUpBtn.internal = "FREE_HAND_SIZE_UP"
	self.sizeUpBtn:initialise()
	self.sizeUpBtn:instantiate()
	self.sizeUpBtn.borderColor.a = 0.0
	self:addChild(self.sizeUpBtn)

	y = self.freeHandSizeBtn:getBottom() + 10

	self.lineSpacingBtn = ISButton:new(25 + sizeControlButtonW, y, otherBtnWid, btnHgt, getText("UI_DrawOnMap_Fill")..": 1", self, FreeHandUI.onButtonClick)
	self.lineSpacingBtn.internal = "LINE_SPACING"
	self.lineSpacingBtn:initialise()
	self.lineSpacingBtn:instantiate()
	self.lineSpacingBtn.borderColor.a = 0.0
	self:addChild(self.lineSpacingBtn)

	self.lineSpacingDownBtn = ISButton:new(20, y, sizeControlButtonW, btnHgt, "-", self, FreeHandUI.onButtonClick)
	self.lineSpacingDownBtn.internal = "LINE_SPACING_DOWN"
	self.lineSpacingDownBtn:initialise()
	self.lineSpacingDownBtn:instantiate()
	self.lineSpacingDownBtn.borderColor.a = 0.0
	self:addChild(self.lineSpacingDownBtn)

	self.lineSpacingUpBtn = ISButton:new(30 + sizeControlButtonW + otherBtnWid, y, sizeControlButtonW, btnHgt, "+", self, FreeHandUI.onButtonClick)
	self.lineSpacingUpBtn.internal = "LINE_SPACING_UP"
	self.lineSpacingUpBtn:initialise()
	self.lineSpacingUpBtn:instantiate()
	self.lineSpacingUpBtn.borderColor.a = 0.0
	self:addChild(self.lineSpacingUpBtn)

	self:insertNewLineOfButtons(self.splineBtn)
	self:insertNewLineOfButtons(self.freeHandEraseBtn)
	self:insertNewLineOfButtons(self.sizeDownBtn, self.freeHandSizeBtn, self.sizeUpBtn)
	self:insertNewLineOfButtons(self.lineSpacingDownBtn, self.lineSpacingBtn, self.lineSpacingUpBtn)

	self:setHeight(self.lineSpacingBtn:getBottom() + 20)
end

function FreeHandUI:prerender()
	ISPanelJoypad.prerender(self)
	
	self:checkInventory()
	self.splineBtn.borderColor.a = (self.symbolsUI.currentTool == self.symbolsUI.tools.SplineTool) and 1 or 0
	self.freeHandEraseBtn.borderColor.a = (self.symbolsUI.currentTool == self.symbolsUI.tools.FreeHandEraseTool) and 1 or 0
end

function FreeHandUI:checkInventory()
	self.splineBtn.enable = self.symbolsUI.addNoteBtn.enable;
	self.splineBtn.tooltip = self.symbolsUI.addNoteBtn.tooltip;

	self.freeHandEraseBtn.enable = self.symbolsUI.removeBtn.enable;
	self.freeHandEraseBtn.tooltip = self.symbolsUI.removeBtn.tooltip;

	if self.symbolsUI.currentTool == self.symbolsUI.tools.SplineTool and not self.splineBtn.enable then
		self.symbolsUI:setCurrentTool(nil)
	end
	if self.symbolsUI.currentTool == self.symbolsUI.tools.FreeHandEraseTool and not self.freeHandEraseBtn.enable then
		self.symbolsUI:setCurrentTool(nil)
	end
end

function FreeHandUI:onButtonClick(button)
	local symbolsUI = self.symbolsUI;
	
	if button.internal == "FREE_HAND" then
		symbolsUI.selectedSymbol = nil
		symbolsUI:toggleTool(symbolsUI.tools.SplineTool)
	end

	if button.internal == "FREE_HAND_ERASE" then
		symbolsUI.selectedSymbol = nil
		symbolsUI:toggleTool(symbolsUI.tools.FreeHandEraseTool)
	end

	if button.internal == "FREE_HAND_SIZE" then
		symbolsUI.tools.SplineTool:resetScale();
		self.freeHandSizeBtn.title = getText("UI_DrawOnMap_Thickness") .. ": " .. symbolsUI.tools.SplineTool.scale
	end

	if button.internal == "FREE_HAND_SIZE_DOWN" then
		symbolsUI.tools.SplineTool:scaleDown();
		self.freeHandSizeBtn.title = getText("UI_DrawOnMap_Thickness") .. ": " .. symbolsUI.tools.SplineTool.scale
	end

	if button.internal == "FREE_HAND_SIZE_UP" then
		symbolsUI.tools.SplineTool:scaleUp();
		self.freeHandSizeBtn.title = getText("UI_DrawOnMap_Thickness") .. ": " .. symbolsUI.tools.SplineTool.scale
	end

	if button.internal == "LINE_SPACING" then
		symbolsUI.tools.SplineTool:resetFill();
		self:updateFillText();
	end

	if button.internal == "LINE_SPACING_DOWN" then
		symbolsUI.tools.SplineTool:fillDown();
		self:updateFillText();
	end

	if button.internal == "LINE_SPACING_UP" then
		symbolsUI.tools.SplineTool:fillUp();
		self:updateFillText();
	end
end

function FreeHandUI:updateFillText()
	local fill = self.symbolsUI.tools.SplineTool.fill;
	if fill > 0.01 then
		self.lineSpacingBtn.title = getText("UI_DrawOnMap_Fill") .. ": " .. fill
	else
		self.lineSpacingBtn.title = getText("UI_DrawOnMap_Fill") .. ": -"
	end
end

