require "ISUI/ISPanel"
require "ISUI/ISButton"
require "ISUI/ISMouseDrag"
require "ISUI/ISInventoryPage"

local SORT_KEY = "ReorderContainers_Sort"
local SORT_KEY_FLOOR = "ReorderContainers_Sort_Floor"
local SET_MANUALLY = "ReorderContainers_SetManually"
local INV_LOCK = "ReorderContainers_InvLock"
local LOOT_LOCK = "ReorderContainers_LootLock"

ReorderContainers_Mod = {}

ReorderContainers_Mod.isLocked = function(inventoryPage)
    local player = getSpecificPlayer(inventoryPage.player)
    if inventoryPage.onCharacter then
        return player:getModData()[INV_LOCK]
    else
        return player:getModData()[LOOT_LOCK]
    end
end

ReorderContainers_Mod.onMouseDown = function(self, x, y)
    self.pre_reorder_onMouseDown(self, x, y)
    self.reorderStartMouseY = getMouseY()
    self.reorderStartY = self:getY()

    self.canDragToReorder = not ReorderContainers_Mod.isLocked(self:getParent())
end

ReorderContainers_Mod.onMouseMove = function(self, dx, dy, skipOgMouseMove)
    if not skipOgMouseMove then -- skipOgMouseMove is true when we're calling this from onMouseMoveOutside
        self.pre_reorder_onMouseMove(self, dx, dy)
    end

    if self.pressed and self.canDragToReorder then
        local parent = self:getParent()

        if math.abs(self.reorderStartMouseY - getMouseY()) > parent.buttonSize/2 then
            self.draggingToReorder = true
        end

        if self.draggingToReorder then
            local x = getMouseX()
            local y = getMouseY()
            local parentY = parent:getAbsoluteY()
            local newY = y - parentY - self:getHeight() / 2
            
            newY = math.max(parent:titleBarHeight() - 16, newY)

            self:setY(newY)
            self:bringToTop()
    
            self.draggingToReorder = true
        end
    end
end

ReorderContainers_Mod.onMouseMoveOutside = function(self, dx, dy)
    self.pre_reorder_onMouseMoveOutside(self, dx, dy)
    ReorderContainers_Mod.onMouseMove(self, dx, dy, true)

    -- if the mouse is no longer down, we missed the mouse up event
    if self.draggingToReorder and not isMouseButtonDown(0) then
        ReorderContainers_Mod.onMouseUp(self, 0, 0)
    end
end

ReorderContainers_Mod.onMouseUp = function(self, x, y)
    local page = self:getParent()
    if self.draggingToReorder then
        self.pressed = false;
        self.draggingToReorder = false
        page:reorderContainerButtons(self)
        page:refreshBackpacks()
    else
        self.pre_reorder_onMouseUp(self, x, y)
    end
end

ISInventoryPage.pre_reorder_addContainerButton = ISInventoryPage.addContainerButton
function ISInventoryPage:addContainerButton(container, texture, name, tooltip)
    local button = self.pre_reorder_addContainerButton(self, container, texture, name, tooltip)

    -- Buttons can be reused, so we need to make sure we don't overwrite the original functions

    if not button.pre_reorder_onMouseDown then
        button.pre_reorder_onMouseDown = button.onMouseDown
    end
    button.onMouseDown = ReorderContainers_Mod.onMouseDown
    
    if not button.pre_reorder_onMouseMove then
        button.pre_reorder_onMouseMove = button.onMouseMove
    end
    button.onMouseMove = ReorderContainers_Mod.onMouseMove

    if not button.pre_reorder_onMouseMoveOutside then
        button.pre_reorder_onMouseMoveOutside = button.onMouseMoveOutside
    end
    button.onMouseMoveOutside = ReorderContainers_Mod.onMouseMoveOutside

    if not button.pre_reorder_onMouseUp then
        button.pre_reorder_onMouseUp = button.onMouseUp
    end
    button.onMouseUp = ReorderContainers_Mod.onMouseUp

    return button
end

ISInventoryPage.pre_reorder_createChildren = ISInventoryPage.createChildren
ISInventoryPage.createChildren = function(self)
    self.pre_reorder_createChildren(self)

    self:createReorderContainersSortButton()
    self:createReorderContainersLockButton()
end

ISInventoryPage.createReorderContainersSortButton = function(self)
    local reorderButton = ISButton:new(self:getWidth() - self.buttonSize/2, self:getHeight() - self.buttonSize*0.75, self.buttonSize/2, self.buttonSize/2, "", self)
    reorderButton:setImage(getTexture("media/ui/ReorderContainers/reorder-icon.png"))

    reorderButton.anchorLeft = false
    reorderButton.anchorRight = true
    reorderButton.anchorTop = false
    reorderButton.anchorBottom = true

    reorderButton.onMouseDown = function(self, x, y)
        local selectedButton = self:getParent().selectedButton
        if selectedButton then
            local x = getCore():getScreenWidth() / 2
            local y = getCore():getScreenHeight() / 2
            local popup = ReorderContainers_ManualPopup:new(x - 100, y - 60, self:getParent(), selectedButton.inventory)
            popup:initialise()
            popup:addToUIManager()
        end
    end

    reorderButton:initialise()
    reorderButton:instantiate()
    self:addChild(reorderButton)
end

ISInventoryPage.createReorderContainersLockButton = function(self)
    local player = getSpecificPlayer(self.player)
    local onCharacter = self.onCharacter

    local lockButton = ISButton:new(self:getWidth() - self.buttonSize, self:getHeight() - self.buttonSize * 0.75, self.buttonSize/2, self.buttonSize/2, "", self)
    if ReorderContainers_Mod.isLocked(self) then
        lockButton:setImage(getTexture("media/ui/ReorderContainers/reorder-locked.png"))
    else
        lockButton:setImage(getTexture("media/ui/ReorderContainers/reorder-unlocked.png"))
    end

    lockButton.anchorLeft = false
    lockButton.anchorRight = true
    lockButton.anchorTop = false
    lockButton.anchorBottom = true

    -- Toggle the lock state and update the button image
    lockButton:setOnClick(function()
        local modData = player:getModData()
        local key = INV_LOCK
        if not onCharacter then
            key = LOOT_LOCK
        end
        
        local newState = (not modData[key])
        if newState then 
            lockButton:setImage(getTexture("media/ui/ReorderContainers/reorder-locked.png"))        
        else
            lockButton:setImage(getTexture("media/ui/ReorderContainers/reorder-unlocked.png"))
        end

        modData[key] = newState
    end)

    lockButton:initialise()
    lockButton:instantiate()
    self:addChild(lockButton)
end

ReorderContainers_Mod.getTargetModDataAndSortKeyAndParentObject = function(player, inventory)
    local playerKey = player:getUsername()
    local sortKey = SORT_KEY
    local parentObject = nil

    if inventory == player:getInventory() then
        targetModData = player:getModData()
    elseif inventory:getType() == "floor" then
        targetModData = player:getModData()
        sortKey = SORT_KEY_FLOOR
    else
        sortKey = playerKey..SORT_KEY

        local item = inventory:getContainingItem()
        local isoObject = inventory:getParent()
        if item then
            targetModData = item:getModData()
            parentObject = item
        elseif isoObject then
            targetModData = isoObject:getModData()
            parentObject = isoObject
        end
    end

    return targetModData, sortKey, parentObject
end

ReorderContainers_Mod.getSortPriority = function(player, inventory, inventoryPage)
    local targetModData, sortKey = ReorderContainers_Mod.getTargetModDataAndSortKeyAndParentObject(player, inventory)
    if targetModData then
        return targetModData[sortKey] or ReorderContainers_Mod.getDefaultSortPriority(inventory, inventoryPage)
    end
    return ReorderContainers_Mod.getDefaultSortPriority(inventory, inventoryPage)
end

ReorderContainers_Mod.getDefaultSortPriority = function(inventory, inventoryPage)
    local index = 0
    for i, backpack in ipairs(inventoryPage.backpacks) do
        if backpack.inventory == inventory then
            index = i
            break
        end
    end
    return 1000 + index
end

ReorderContainers_Mod.setSortPriority = function(player, inventory, priority, isManual)
    local targetModData, sortKey = ReorderContainers_Mod.getTargetModDataAndSortKeyAndParentObject(player, inventory)
    if targetModData then
        targetModData[sortKey] = priority
        targetModData[SET_MANUALLY] = isManual
    end
end

ReorderContainers_Mod.isManual = function(player, inventory)
    local targetModData, sortKey = ReorderContainers_Mod.getTargetModDataAndSortKeyAndParentObject(player, inventory)
    return targetModData and targetModData[SET_MANUALLY]
end

ISInventoryPage.reorderContainerButtons = function(self, draggedButton)
    -- Don't reorder if the button hasn't moved far enough
    if draggedButton and math.abs(draggedButton:getY() - draggedButton.reorderStartY) <= 32 then
        draggedButton:setY(draggedButton.reorderStartY)
        return
    end

    local playerObj = getSpecificPlayer(self.player)

    local inventoriesAndY = {}
    for index, button in ipairs(self.backpacks) do
        table.insert(inventoriesAndY, {inventory = button.inventory, y = button:getY()})
    end
    table.sort(inventoriesAndY, function(a, b) return a.y < b.y end)

    local seenObjs = {}
    local lastSort = 0
    for index, data in ipairs(inventoriesAndY) do
        local targetModData, sortKey, parent = ReorderContainers_Mod.getTargetModDataAndSortKeyAndParentObject(playerObj, data.inventory)
        local isManual = targetModData and targetModData[SET_MANUALLY]
        local isDraggedButton = data.inventory == draggedButton.inventory

        if not isDraggedButton and parent and seenObjs[parent] then
            -- Skip this button, some IsoObjects have multiple inventories
        else
            if parent then
                seenObjs[parent] = true
            end

            if not isManual or isDraggedButton then
                lastSort = lastSort + 10
                targetModData[sortKey] = lastSort
                targetModData[SET_MANUALLY] = nil
            else
                lastSort = targetModData[sortKey]
                -- Look back one button
                if index > 1 then
                    local prevInventory = inventoriesAndY[index - 1].inventory
                    local prevSort = ReorderContainers_Mod.getSortPriority(playerObj, prevInventory)
                    if prevSort >= lastSort then
                        ReorderContainers_Mod.setSortPriority(playerObj, prevInventory, lastSort - 1, false)
                    end
                end
            end
        end
    end
end

ISInventoryPage.applyBackpackOrder = function(self)
    local playerObj = getSpecificPlayer(self.player)

    local buttonsAndSort = {}
    for index, button in ipairs(self.backpacks) do
        local sort = 1000 + index
        local targetModData, sortKey, parent = ReorderContainers_Mod.getTargetModDataAndSortKeyAndParentObject(playerObj, button.inventory)
        if targetModData then
            sort = targetModData[sortKey] or (1000 + index)
        end
        table.insert(buttonsAndSort, {button = button, sort = sort})
    end

    table.sort(buttonsAndSort, function(a, b) return a.sort < b.sort end)

    for index, data in ipairs(buttonsAndSort) do
        data.button:setY((index - 1) * self.buttonSize + self:titleBarHeight() - 1)
    end
end

ISInventoryPage.pre_reorder_refreshBackpacks = ISInventoryPage.refreshBackpacks
ISInventoryPage.refreshBackpacks = function(self)
    self:pre_reorder_refreshBackpacks()
    self:applyBackpackOrder()
    ReorderContainers_Mod.pendingRefresh = false
end

ISInventoryPage.pre_reorder_onMouseWheel = ISInventoryPage.onMouseWheel
ISInventoryPage.onMouseWheel = function(self, del)
    -- Store the original order of the backpacks
    local originalOrder = {}
    for index, button in ipairs(self.backpacks) do
        originalOrder[button] = index
    end

    -- Sort the backpacks by their Y position so that scrolling works as expected
    table.sort(self.backpacks, function(a, b) return a:getY() < b:getY() end)
    
    ReorderContainers_Mod.pendingRefresh = true
    -- The return value here is not reliable for checking if the backpacks were refreshed
    local retVal = self:pre_reorder_onMouseWheel(del)

    -- The backpacks were not refreshed, so we need to restore the original order
    if ReorderContainers_Mod.pendingRefresh then
        table.sort(self.backpacks, function(a, b) return originalOrder[a] < originalOrder[b] end)
        ReorderContainers_Mod.pendingRefresh = false
    end

    return retVal
end
