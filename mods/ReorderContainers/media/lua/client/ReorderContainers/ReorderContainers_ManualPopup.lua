-- A popup window that allows the user to manually enter a number to sort by.

require "ISUI/ISPanel"

ReorderContainers_ManualPopup = ISPanel:derive("ReorderContainers_ManualPopup")

function ReorderContainers_ManualPopup:initialise()
    ISPanel.initialise(self)
end

function ReorderContainers_ManualPopup:createChildren()
    --self:setTitle("Reorder Containers")

    self.label = ISLabel:new(0, 0, 10, self:getTargetName(), 1, 1, 1, 1, UIFont.Small, true)
    self.label:initialise()
    self.label:instantiate()
    self.label:setX(self:getWidth() / 2 - self.label:getWidth() / 2)
    self.label:setY(10)
    self.label:setAnchorLeft(true)
    self.label:setAnchorRight(true)
    self.label:setAnchorTop(true)
    self.label:setAnchorBottom(false)
    self:addChild(self.label)

    self.infoLabel = ISLabel:new(0, 0, 10, "Sorting Priority", 1, 1, 1, 0.7, UIFont.Small, true)
    self.infoLabel:initialise()
    self.infoLabel:instantiate()
    self.infoLabel:setX(self:getWidth() / 2 - self.infoLabel:getWidth() / 2)
    self.infoLabel:setY(25)
    self.infoLabel:setAnchorLeft(true)
    self.infoLabel:setAnchorRight(true)
    self.infoLabel:setAnchorTop(true)
    self.infoLabel:setAnchorBottom(false)
    self:addChild(self.infoLabel)

    local player = getSpecificPlayer(self.inventoryPage.player)
    local currentValue = ReorderContainers_Mod.getSortPriority(player, self.inventory, self.inventoryPage)

    self.entry = ISTextEntryBox:new(tostring(currentValue), 0, 0, 100, 20)
    self.entry:initialise()
    self.entry:instantiate()
    self.entry:setOnlyNumbers(true)
    self.entry:setTooltip("Enter a number to sort by.")
    self.entry:setX(self:getWidth() / 2 - self.entry:getWidth() / 2)
    self.entry:setY(45)
    self.entry:setAnchorLeft(true)
    self.entry:setAnchorRight(true)
    self.entry:setAnchorTop(true)
    self.entry:setAnchorBottom(false)
    self:addChild(self.entry)

    self.okButton = ISButton:new(self:getWidth() / 2 - 100, self:getHeight() - 25, 100, 25, getText("UI_Ok"), self, self.onOK)
    self.okButton:initialise()
    self.okButton:instantiate()
    self.okButton:setAnchorLeft(true)
    self.okButton:setAnchorRight(false)
    self.okButton:setAnchorTop(false)
    self.okButton:setAnchorBottom(true)
    self:addChild(self.okButton)

    self.cancelButton = ISButton:new(self:getWidth() / 2, self:getHeight() - 25, 100, 25, getText("UI_Cancel"), self, self.onCancel)
    self.cancelButton:initialise()
    self.cancelButton:instantiate()
    self.cancelButton:setAnchorLeft(false)
    self.cancelButton:setAnchorRight(true)
    self.cancelButton:setAnchorTop(false)
    self.cancelButton:setAnchorBottom(true)
    self:addChild(self.cancelButton)
    
    self:bringToTop()
end

function ReorderContainers_ManualPopup:getTargetName()
    local player = getSpecificPlayer(self.inventoryPage.player)

    if self.inventory == player:getInventory() then
        return getText("IGUI_InventoryName", player:getDescriptor():getForename(), player:getDescriptor():getSurname())
    else
        local item = self.inventory:getContainingItem()
        if item then
            return item:getName()
        else
            return getTextOrNull("IGUI_ContainerTitle_" .. self.inventory:getType()) or ""
        end
    end
end

function ReorderContainers_ManualPopup:onOK()
    local player = getSpecificPlayer(self.inventoryPage.player)
    local number = tonumber(self.entry:getText())
    if number then
        ReorderContainers_Mod.setSortPriority(player, self.inventory, number, true)
    else
        ReorderContainers_Mod.setSortPriority(player, self.inventory, nil, false)
    end

    self.inventoryPage:refreshBackpacks()
    self:removeFromUIManager()
end

function ReorderContainers_ManualPopup:onCancel()
    self:removeFromUIManager()
end

function ReorderContainers_ManualPopup:new(x, y, inventoryPage, inventory)
    local o = ISPanel:new(x, y, 200, 120)
    setmetatable(o, self)
    self.__index = self
    o.inventoryPage = inventoryPage
    o.inventory = inventory
    o:initialise()
    o:createChildren()

    o:setAlwaysOnTop(true)
    o:setCapture(true)
    o.backgroundColor.a = 0.9

    return o
end