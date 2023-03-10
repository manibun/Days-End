require "ISUI/Maps/ISWorldMapSymbols"

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)
local FONT_HGT_HANDWRITTEN = getTextManager():getFontHeight(UIFont.Handwritten)

function ISWorldMapSymbols:createChildren()
	local btnWid = self.width - 20 * 2
	local btnHgt = FONT_HGT_SMALL + 2 * 2
	local btnHgt2 = 32
	local btnPad = 5
	local padBottom = 10
	local columns = 8

	self:populateSymbolList()

	self.colorButtonInfo = {
		{ item="Base.Pen", colorInfo=ColorInfo.new(0, 0, 0, 1), tooltip=getText("Tooltip_Map_NeedBlackPen") },
		{ item="Base.Pencil", colorInfo=ColorInfo.new(0.2, 0.2, 0.2, 1), tooltip=getText("Tooltip_Map_NeedPencil") },
		{ item="Base.RedPen", colorInfo=ColorInfo.new(1, 0, 0, 1), tooltip=getText("Tooltip_Map_NeedRedPen") },
		{ item="Base.BluePen", colorInfo=ColorInfo.new(0, 0, 1, 1), tooltip=getText("Tooltip_Map_NeedBluePen") },
		{ item="filcher.GreenPen", colorInfo=ColorInfo.new(0, 1, 0, 1), tooltip=getText("Tooltip_Map_NeedGreenPen") }
	}

	self.colorButtons = {}
	local buttonX = 30
	local buttonY = 60
	local column = 0
	local colorButtons = {}
	for _,info in ipairs(self.colorButtonInfo) do
		local colorBtn = ISButton:new(buttonX, buttonY, btnHgt2, btnHgt2, "", self, ISWorldMapSymbols.onButtonClick)
		colorBtn:initialise()
		colorBtn.internal = "COLOR"
		colorBtn.backgroundColor = {r=info.colorInfo:getR(), g=info.colorInfo:getG(), b=info.colorInfo:getB(), a=1}
		colorBtn.borderColor = {r=1, g=1, b=1, a=0.4}
		colorBtn.buttonInfo = info
		self:addChild(colorBtn)
		table.insert(self.colorButtons, colorBtn)
		table.insert(colorButtons, colorBtn)
		if #self.colorButtons == #self.colorButtonInfo then
			break
		end
		buttonX = buttonX + btnHgt2 + btnPad
		column = column + 1
		if column == columns then
			buttonX = 30
			buttonY = buttonY + btnHgt2 + btnPad
			column = 0
			self:insertNewListOfButtons(colorButtons)
			colorButtons = {}
		end
	end

	if #colorButtons > 0 then
		self:insertNewListOfButtons(colorButtons)
	end
	
	local symbolButtons = {}
	local x = 30
	local y = buttonY + btnHgt2 + 20
	column = 0
	for i,v in ipairs(self.symbolList) do
		local symbolBtn = ISButton:new(x, y, btnHgt2, btnHgt2, "", self, ISWorldMapSymbols.onButtonClick)
		symbolBtn:initialise()
		symbolBtn:instantiate()
		symbolBtn.borderColor = {r=0, g=0, b=0, a=0}
		symbolBtn.backgroundColor = {r = 0.5, g = 0.5, b = 0.5, a = 1}
		symbolBtn.textureColor = {r = 0, g = 0, b = 0, a = 1}
		self:addChild(symbolBtn)
		local symbolDef = MapSymbolDefinitions.getInstance():getSymbolById(v)
		symbolBtn.image = getTexture(symbolDef:getTexturePath())
		symbolBtn.tex = v
		symbolBtn.symbol = true
		table.insert(self.buttonList, symbolBtn)
--[[
		if not self.selectedSymbol then
			self.selectedSymbol = symbolBtn
		end
--]]
		table.insert(symbolButtons, self.buttonList[#self.buttonList])
		x = x + btnHgt2 + btnPad
		column = column + 1
		if column == columns then
			x = 30
			y = y + btnHgt2 + btnPad
			column = 0
			self:insertNewListOfButtonsList(symbolButtons)
			symbolButtons = {}
		end
	end
	y = self.buttonList[#self.buttonList]:getBottom() + 20

	self.blackColor = ColorInfo.new(0, 0, 0, 1)
	self.currentColor = self.blackColor

	btnPad = 10

	self.addNoteBtn = ISButton:new(20, y, btnWid, btnHgt, getText("IGUI_Map_AddNote"), self, ISWorldMapSymbols.onButtonClick)
	self.addNoteBtn.internal = "ADDNOTE"
	self.addNoteBtn:initialise()
	self.addNoteBtn:instantiate()
	self.addNoteBtn.borderColor.a = 0.0
--	self.addNoteBtn.borderColor = {r=1, g=1, b=1, a=0.4}
	self:addChild(self.addNoteBtn)
	y = y + btnHgt + btnPad

	self.editNoteBtn = ISButton:new(20, y, btnWid, btnHgt, getText("IGUI_Map_EditNote"), self, ISWorldMapSymbols.onButtonClick)
	self.editNoteBtn.internal = "EDITNOTE"
	self.editNoteBtn:initialise()
	self.editNoteBtn:instantiate()
	self.editNoteBtn.borderColor.a = 0.0
--	self.editNoteBtn.borderColor = {r=1, g=1, b=1, a=0.4}
	self:addChild(self.editNoteBtn)
	y = y + btnHgt + btnPad

	self.moveBtn = ISButton:new(20, y, btnWid, btnHgt, getText("IGUI_Map_MoveElement"), self, ISWorldMapSymbols.onButtonClick)
	self.moveBtn.internal = "MOVE"
	self.moveBtn:initialise()
	self.moveBtn:instantiate()
	self.moveBtn.borderColor.a = 0.0
--	self.moveBtn.borderColor = {r=1, g=1, b=1, a=0.4}
	self:addChild(self.moveBtn)
	y = y + btnHgt + btnPad

	self.removeBtn = ISButton:new(20, y, btnWid, btnHgt, getText("IGUI_Map_RemoveElement"), self, ISWorldMapSymbols.onButtonClick)
	self.removeBtn.internal = "REMOVE"
	self.removeBtn:initialise()
	self.removeBtn:instantiate()
	self.removeBtn.borderColor.a = 0.0
--	self.removeBtn.borderColor = {r=1, g=1, b=1, a=0.4}
	self:addChild(self.removeBtn)

	self:insertNewLineOfButtons(self.addNoteBtn)
	self:insertNewLineOfButtons(self.editNoteBtn)
	self:insertNewLineOfButtons(self.moveBtn)
	self:insertNewLineOfButtons(self.removeBtn)

	self:setHeight(self.removeBtn:getBottom() + 20)

	self:initTools()

	self:checkInventory()
end

function ISWorldMapSymbols:checkInventory()
	local inv = self.character and self.character:getInventory() or nil
	local currentEnabled = nil
	local firstEnabled = nil
	for _,colorBtn in ipairs(self.colorButtons) do
		colorBtn.enable = (inv == nil) or inv:containsTagRecurse(colorBtn.buttonInfo.item) or inv:containsTypeRecurse(colorBtn.buttonInfo.item);
		if inv and inv:containsTypeRecurse("filcher.MulticolorPen") and (colorBtn.buttonInfo.item == "Base.Pen" or colorBtn.buttonInfo.item == "Base.BluePen" or colorBtn.buttonInfo.item == "Base.RedPen" or colorBtn.buttonInfo.item == "filcher.GreenPen") then
			colorBtn.enable = true;
		end
		colorBtn.borderColor.a = 0.4 -- not selected
		if colorBtn.enable then
			firstEnabled = firstEnabled or colorBtn
			if colorBtn.buttonInfo.colorInfo:equals(self.currentColor) then
				currentEnabled = colorBtn
				colorBtn.borderColor.a = 1.0
			end
			colorBtn.tooltip = nil
		else
			colorBtn.tooltip = colorBtn.buttonInfo.tooltip
		end
	end
	if not currentEnabled then
		if firstEnabled ~= nil then
			firstEnabled.borderColor.a = 1.0 -- selected
			self.currentColor = firstEnabled.buttonInfo.colorInfo
		else
			self.currentColor = self.blackColor
		end
	end
	self:updateSymbolColors()
	local canWrite = self:canWrite()
	for _,symbolButton in ipairs(self.buttonList) do
		symbolButton.enable = canWrite
		if canWrite then
			symbolButton.tooltip = nil
		else
			symbolButton.tooltip = getText("Tooltip_Map_CantWrite")
		end
	end
	local canErase = self:canErase()
	self.addNoteBtn.enable = canWrite
	self.editNoteBtn.enable = canWrite and canErase
	self.moveBtn.enable = canWrite and canErase
	self.removeBtn.enable = canErase

	if canWrite then
		self.addNoteBtn.tooltip = nil
	else
		self.addNoteBtn.tooltip = getText("Tooltip_Map_CantWrite")
	end

	if canWrite and canErase then
		self.editNoteBtn.tooltip = nil
		self.moveBtn.tooltip = nil
	else
		self.editNoteBtn.tooltip = getText("Tooltip_Map_CantEdit")
		self.moveBtn.tooltip = getText("Tooltip_Map_CantEdit")
	end

	if canErase then
		self.removeBtn.tooltip = nil
	else
		self.removeBtn.tooltip = getText("Tooltip_Map_CantErase")
	end

	if self.currentTool == self.tools.AddSymbol and not canWrite then
		self:setCurrentTool(nil)
	end
	if self.currentTool == self.tools.AddNote and not canWrite then
		self:setCurrentTool(nil)
	end
	if self.currentTool == self.tools.EditNote and not (canWrite and canErase) then
		self:setCurrentTool(nil)
	end
	if self.currentTool == self.tools.MoveAnnotation and not (canWrite and canErase) then
		self:setCurrentTool(nil)
	end
	if self.currentTool == self.tools.RemoveAnnotation and not canErase then
		self:setCurrentTool(nil)
	end
end

function ISWorldMapSymbols:canWrite()
	if not self.character then return true end
	local inv = self.character:getInventory()
	for _,info in ipairs(self.colorButtonInfo) do
		if inv:containsTagRecurse(info.item) or inv:containsTypeRecurse(info.item) then
			return true
		elseif inv:containsTypeRecurse("filcher.MulticolorPen") and (info.item == "Base.Pen" or info.item == "Base.BluePen" or info.item == "Base.RedPen" or info.item == "filcher.GreenPen") then
			return true
		end
	end
	return false
end
