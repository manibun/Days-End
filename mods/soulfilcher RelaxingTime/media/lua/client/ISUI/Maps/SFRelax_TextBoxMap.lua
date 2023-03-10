--***********************************************************
--**              	  ROBERT JOHNSON                   **
--***********************************************************
require "ISUI/Maps/ISTextBoxMap"

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

--************************************************************************--
--** ISTextBoxMap:initialise
--**
--************************************************************************--

function ISTextBoxMap:createChildren()
	local fontHgt = getTextManager():getFontFromEnum(UIFont.Small):getLineHeight()
	local buttonWid1 = getTextManager():MeasureStringX(UIFont.Small, "Ok") + 12
	local buttonWid2 = getTextManager():MeasureStringX(UIFont.Small, "Cancel") + 12
	local buttonWid = math.max(math.max(buttonWid1, buttonWid2), 100)
	local buttonHgt = math.max(fontHgt + 6, 25)
	local padBottom = 10
    local btnHgt2 = 20
    local btnPad = 5

    local inv = self.character and self.character:getInventory() or nil

    self.colorButtonInfo = {
        { item="Pen", colorInfo=ColorInfo.new(0, 0, 0, 1), tooltip=getText("Tooltip_Map_NeedBlackPen") },
        { item="Pencil", colorInfo=ColorInfo.new(0.2, 0.2, 0.2, 1), tooltip=getText("Tooltip_Map_NeedPencil") },
        { item="RedPen", colorInfo=ColorInfo.new(1, 0, 0, 1), tooltip=getText("Tooltip_Map_NeedRedPen") },
        { item="BluePen", colorInfo=ColorInfo.new(0, 0, 1, 1), tooltip=getText("Tooltip_Map_NeedBluePen") },
        { item="filcher.GreenPen", colorInfo=ColorInfo.new(0, 1, 0, 1), tooltip=getText("Tooltip_Map_NeedGreenPen") },
    }

    self.colorButtons = {}
    local buttonX = 20
    local buttonY = self:titleBarHeight() + FONT_HGT_SMALL + 10
    local column = 0
    local columns = math.floor((self.width - 20 * 2) / (btnHgt2 + btnPad))
    local colorButtons = {}
    for _,info in ipairs(self.colorButtonInfo) do
        local colorBtn = ISButton:new(buttonX, buttonY, btnHgt2, btnHgt2, "", self, ISTextBoxMap.onClick)
        colorBtn:initialise()
        colorBtn.internal = "COLOR"
        colorBtn.backgroundColor = {r=info.colorInfo:getR(), g=info.colorInfo:getG(), b=info.colorInfo:getB(), a=1}
        colorBtn.borderColor = {r=1, g=1, b=1, a=0.4}
        colorBtn.enable = (inv == nil) or inv:containsTagRecurse(info.item) or inv:containsTypeRecurse(info.item)
		if inv and inv:containsTypeRecurse("filcher.MulticolorPen") and (info.item == "Base.Pen" or info.item == "Base.BluePen" or info.item == "Base.RedPen" or info.item == "filcher.GreenPen") then
			colorBtn.enable = true;
		end
        if not colorBtn.enable then colorBtn.tooltip = info.tooltip end
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
            buttonX = 20
            buttonY = buttonY + btnHgt2 + btnPad
            column = 0
            self:insertNewListOfButtons(colorButtons)
            colorButtons = {}
        end
    end
    if #colorButtons then
        self:insertNewListOfButtons(colorButtons)
    end
    
    self.blackColor = ColorInfo.new(0, 0, 0, 1)
    self.currentColor = self.blackColor
    for _,colorBtn in ipairs(self.colorButtons) do
        if colorBtn.enable then
            colorBtn.borderColor.a = 1
            self.currentColor = colorBtn.buttonInfo.colorInfo
            break
        end
    end

    self.fontHgt = getTextManager():getFontFromEnum(UIFont.Medium):getLineHeight()
    local inset = 2
    local height = inset + self.fontHgt + inset
    self.entry = ISTextEntryBox:new(self.defaultEntryText, 20, buttonY + btnHgt2 + 10, self:getWidth() - 20 * 2, height);
    self.entry.backgroundColor = {r = 1, g = 1, b = 1, a = 0.3};
    self.entry.font = UIFont.Medium
    self.entry.onCommandEntered = function(self) self.parent.onCommandEntered(self.parent) end
    self.entry.onOtherKey = function(self, key) self.parent.onOtherKey(self.parent, key) end
    self.entry:initialise();
    self.entry:instantiate();
    self:addChild(self.entry);
    self:insertNewLineOfButtons(self.entry)

    self.tickBox = ISTickBox:new(self.entry.x, self.entry:getBottom() + 10, 20, FONT_HGT_SMALL + 4, "", nil, nil)
    self.tickBox.choicesColor = { r = 1, g = 1, b = 1, a = 1 }
    self:addChild(self.tickBox)
    self.tickBox:addOption(getText("IGUI_TextBoxMap_IsTranslation"))
    self.tickBox:setWidthToFit()
    self.tickBox:setVisible(false)

    self.yes = ISButton:new((self:getWidth() / 2)  - 5 - buttonWid, self.entry:getBottom() + 10, buttonWid, buttonHgt, getText("UI_Ok"), self, ISTextBoxMap.onClick);
    self.yes.internal = "OK";
    self.yes:initialise();
    self.yes:instantiate();
    self.yes.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.yes);

    self.no = ISButton:new((self:getWidth() / 2) + 5, self.entry:getBottom() + 10, buttonWid, buttonHgt, getText("UI_Cancel"), self, ISTextBoxMap.onClick);
    self.no.internal = "CANCEL";
    self.no:initialise();
    self.no:instantiate();
    self.no.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.no);

    self.entry.javaObject:setTextColor(self.currentColor);

    self:setHeight(self.yes:getBottom() + padBottom)
end

function ISTextBoxMap:updateButtons()
    local inv = self.character and self.character:getInventory() or nil
    for _,colorBtn in ipairs(self.colorButtons) do
        colorBtn.enable = (inv == nil) or inv:containsTagRecurse(colorBtn.buttonInfo.item) or inv:containsTypeRecurse(colorBtn.buttonInfo.item)
		if inv and inv:containsTypeRecurse("filcher.MulticolorPen") and (colorBtn.buttonInfo.item == "Base.Pen" or colorBtn.buttonInfo.item == "Base.BluePen" or colorBtn.buttonInfo.item == "Base.RedPen" or colorBtn.buttonInfo.item == "filcher.GreenPen") then
			colorBtn.enable = true;
		end
    end
    
    self.yes:setEnable(true);
    self.yes.tooltip = nil;
    local text = self.entry:getText()
    if self.validateFunc and not self.validateFunc(self.validateTarget, text, self.validateArgs[1], self.validateArgs[2]) then
        self.yes:setEnable(false);
        self.yes.tooltip = self.validateTooltipText;
    end
    if self.maxChars and self.entry:getInternalText():len() > self.maxChars then
        self.yes:setEnable(false);
        self.yes.tooltip = getText("IGUI_TextBox_TooManyChar", self.maxChars);
    end
    if self.noEmpty and string.trim(self.entry:getInternalText()) == "" then
        self.yes:setEnable(false);
        self.yes.tooltip = getText("IGUI_TextBox_CantBeEmpty");
    end

    if self.joyfocus and self.joypadIndexY >= 1 and self.joypadIndexY <= #self.joypadButtonsY then
        self.ISButtonA = nil
        self.ISButtonB = nil
        self.yes:clearJoypadButton()
        self.no:clearJoypadButton()
    elseif self.joyfocus and self.joypadIndexY == 0 then
        self:setISButtonForA(self.yes)
        self:setISButtonForB(self.no)
    end
end
