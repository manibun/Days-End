--
-- Created by IntelliJ IDEA.
-- User: ProjectSky
-- Date: 2017/7/11
-- Time: 13:10
-- Project Zomboid More Builds Mod
--

-- pull global functions to local
local getSpecificPlayer = getSpecificPlayer
local pairs = pairs
local split = string.split
local getItemNameFromFullType = getItemNameFromFullType
local PerkFactory = PerkFactory
local getMoveableDisplayName = Translator.getMoveableDisplayName
local getSprite = getSprite
local getFirstTypeEval = getFirstTypeEval
local getItemCountFromTypeRecurse = getItemCountFromTypeRecurse
local getText = getText

local MoreBuild = {}
MoreBuild.NAME = 'More Builds'
MoreBuild.AUTHOR = 'ProjectSky, SiderisAnon'
MoreBuild.VERSION = '1.1.6'

print('Mod Loaded: ' .. MoreBuild.NAME .. ' by ' .. MoreBuild.AUTHOR .. ' (v' .. MoreBuild.VERSION .. ')')

MoreBuild.neededMaterials = {}
MoreBuild.neededTools = {}
MoreBuild.toolsList = {}
MoreBuild.playerSkills = {}
MoreBuild.textSkillsRed = {}
MoreBuild.textSkillsGreen = {}
MoreBuild.playerCanPlaster = false
MoreBuild.textTooltipHeader = ' <RGB:2,2,2> <LINE> <LINE>' .. getText('Tooltip_craft_Needs') .. ' : <LINE> '
MoreBuild.textCanRotate = '<LINE> <RGB:1,1,1>' .. getText('Tooltip_craft_pressToRotate', Keyboard.getKeyName(getCore():getKey('Rotate building')))
MoreBuild.textPlasterRed = '<RGB:1,0,0> <LINE> <LINE>' .. getText('Tooltip_PlasterRed_Description')
MoreBuild.textPlasterGreen = '<RGB:1,1,1> <LINE> <LINE>' .. getText('Tooltip_PlasterGreen_Description')
MoreBuild.textPlasterNever = '<RGB:1,0,0> <LINE> <LINE>' .. getText('Tooltip_PlasterNever_Description')

MoreBuild.textWallDescription = getText('Tooltip_Wall_Description')
MoreBuild.textPillarDescription = getText('Tooltip_Pillar_Description')
MoreBuild.textDoorFrameDescription = getText('Tooltip_DoorFrame_Description')
MoreBuild.textWindowFrameDescription = getText('Tooltip_WindowFrame_Description')
MoreBuild.textFenceDescription = getText('Tooltip_Fence_Description')
MoreBuild.textFencePostDescription = getText('Tooltip_FencePost_Description')
MoreBuild.textDoorGenericDescription = getText('Tooltip_craft_woodenDoorDesc')
MoreBuild.textDoorIndustrial = getText('Tooltip_DoorIndustrial_Description')
MoreBuild.textDoorExterior = getText('Tooltip_DoorExterior_Description')
MoreBuild.textStairsDescription = getText('Tooltip_craft_stairsDesc')
MoreBuild.textFloorDescription = getText('Tooltip_Floor_Description')
MoreBuild.textBarElementDescription = getText('Tooltip_BarElement_Description')
MoreBuild.textBarCornerDescription = getText('Tooltip_BarCorner_Description')
MoreBuild.textTrashCanDescription = getText('Tooltip_TrashCan_Description')
MoreBuild.textLightPoleDescription = getText('Tooltip_LightPole_Description')
MoreBuild.textSmallTableDescription = getText('Tooltip_SmallTable_Description')
MoreBuild.textLargeTableDescription = getText('Tooltip_LargeTable_Description')
MoreBuild.textCouchFrontDescription = getText('Tooltip_CouchFront_Description')
MoreBuild.textCouchRearDescription = getText('Tooltip_CouchRear_Description')
MoreBuild.textDresserDescription = getText('Tooltip_Dresser_Description')
MoreBuild.textBedDescription = getText('Tooltip_Bed_Description')
MoreBuild.textFlowerBedDescription = getText('Tooltip_FlowerBed_Description')

--- ????????????????????????
--- @todo: ????????????
MoreBuild.skillLevel = {
  simpleObject = 4,
  waterwellObject = 7,
  simpleDecoration = 1,
  landscaping = 1,
  lighting = 4,
  simpleContainer = 3,
  complexContainer = 5,
  advancedContainer = 7,
  simpleFurniture = 3,
  basicContainer = 1,
  basicFurniture = 1,
  moderateFurniture = 2,
  counterFurniture = 3,
  complexFurniture = 4,
  logObject = 0,
  floorObject = 1,
  wallObject = 7,
  doorObject = 3,
  garageDoorObject = 8,
  stairsObject = 6,
  stoneArchitecture = 7,
  metalArchitecture = 5,
  architecture = 5,
  complexArchitecture = 5,
  nearlyimpossible = 5,
  barbecueObject = 4,
  fridgeObject = 8,
  lightingObject = 4,
  generatorObject = 8,
  windowsObject = 2,
}

--- ??????????????????
--- @todo: ????????????
MoreBuild.healthLevel = {
  stoneWall = 300,
  metalWall = 700,
  metalStairs = 400,
  woodContainer = 200,
  stoneContainer = 250,
  metalContainer = 350,
  wallDecoration = 50,
  woodenFence = 100,
  metalDoor = 700
}

--- OnFillWorldObjectContextMenu??????
--- @param player number: IsoPlayer??????
--- @param context ISContextMenu: ?????????????????????
--- @param worldobjects table: ???????????????
--- @param test boolean: ????????????????????????????????????true, ????????????false
--- @todo ????????????, ISContextMenu????????????, ?????????, ??????300+ISContextMenu????????????????????????????????????0.24?????????, ?????????????????????????????????, ??????????????????
MoreBuild.OnFillWorldObjectContextMenu = function(player, context, worldobjects, test)
  if getCore():getGameMode() == 'LastStand' then
    return
  end

  if test and ISWorldObjectContextMenu.Test then
    return true
  end

  local playerObj = getSpecificPlayer(player)
  if playerObj:getVehicle() then
    return
  end

  if MoreBuild.haveAToolToBuild(player) then

    MoreBuild.buildSkillsList(player)

    if MoreBuild.playerSkills["Woodwork"] > 0 or ISBuildMenu.cheat then
      MoreBuild.playerCanPlaster = true
    else
      MoreBuild.playerCanPlaster = false
    end

    local _firstTierMenu = context:addOption(getText('ContextMenu_MoreBuild'))
    local _secondTierMenu = ISContextMenu:getNew(context)
    context:addSubMenu(_firstTierMenu, _secondTierMenu)

    local _wallsOption = _secondTierMenu:addOption(getText('ContextMenu_Wall_Menu'))
    local _wallsSubMenu = _secondTierMenu:getNew(_secondTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuild.wallStylesMenuBuilder(_wallsSubMenu, player, context)

    local _doorsOption = _secondTierMenu:addOption(getText('ContextMenu_Garage_Doors'))
    local _doorsSubMenu = _secondTierMenu:getNew(_secondTierMenu)

    context:addSubMenu(_doorsOption, _doorsSubMenu)
    MoreBuild.doorsMenuBuilder(_doorsSubMenu, player, context)

    local _HighMetalFenceOption = _secondTierMenu:addOption(getText('ContextMenu_HighMetal_Fence'))
    local _HighMetalFenceSubMenu = _secondTierMenu:getNew(_secondTierMenu)

    context:addSubMenu(_HighMetalFenceOption, _HighMetalFenceSubMenu)
    MoreBuild.highMetalFenceMenuBuilder(_HighMetalFenceSubMenu, player, context)

    local _moreFencesOption = _secondTierMenu:addOption(getText('ContextMenu_Fences_Menu'))
    local _moreFencesSubMenu = _secondTierMenu:getNew(_secondTierMenu)

    context:addSubMenu(_moreFencesOption, _moreFencesSubMenu)
    MoreBuild.moreFencesMenuBuilder(_moreFencesSubMenu, player)

    local _moreFencePostsOption = _secondTierMenu:addOption(getText('ContextMenu_FencePosts_Menu'))
    local _moreFencePostsSubMenu = _secondTierMenu:getNew(_secondTierMenu)

    context:addSubMenu(_moreFencePostsOption, _moreFencePostsSubMenu)
    MoreBuild.moreFencePostsMenuBuilder(_moreFencePostsSubMenu, player)

    local _stairsOption = _secondTierMenu:addOption(getText('ContextMenu_Stairs'))
    local _stairsSubMenu = _secondTierMenu:getNew(_secondTierMenu)

    context:addSubMenu(_stairsOption, _stairsSubMenu)
    MoreBuild.stairsMenuBuilder(_stairsSubMenu, player)

    local _lightPostOption = _secondTierMenu:addOption(getText 'ContextMenu_LightPost_Menu')
    local _lightPostSubMenu = _secondTierMenu:getNew(_secondTierMenu)

    context:addSubMenu(_lightPostOption, _lightPostSubMenu)
    MoreBuild.lightPostMenuBuilder(_lightPostSubMenu, player)

    if SandboxVars.MoreBuilds.EnableSurvivalCategory or isAdmin() or ISBuildMenu.cheat then
      local _SurvivalOption = _secondTierMenu:addOption(getText 'ContextMenu_Survival_Menu')
      local _SurvivalThirdTierMenu = _secondTierMenu:getNew(_secondTierMenu)

      context:addSubMenu(_SurvivalOption, _SurvivalThirdTierMenu)
      MoreBuild.SurvivalMenuBuilder(_SurvivalThirdTierMenu, player)
    end

    --MoreBuild.doWaterWellInfo(player, context, worldobjects)
  end
end

--- ????????????????????????
--- @param item string: ????????????????????????
--- @return boolean: ???????????????????????????true, ????????????false
local function predicateNotBroken(item)
  return not item:isBroken()
end

--- ???????????????????????????????????????
--- @param sprite string: Sprite??????
--- @return string: ???????????????????????????
MoreBuild.getMoveableDisplayName = function(sprite)
  local props = getSprite(sprite):getProperties()
  if props:Is('CustomName') then
    local name = props:Val('CustomName')
    if props:Is('GroupName') then
      name = props:Val('GroupName') .. ' ' .. name
    end
    return getMoveableDisplayName(name)
  end
end

--- ????????????????????????????????????
--- @param player number: IsoPlayer??????
--- @return boolean: ???????????????????????????????????????true????????????false
MoreBuild.haveAToolToBuild = function(player)
  -- ????????????????????????????????? [??????] {??????1, ??????2, ...}
  MoreBuild.toolsList['Hammer'] = {"Base.Hammer", "Base.HammerStone", "Base.BallPeenHammer", "Base.WoodenMallet", "Base.ClubHammer"}
  MoreBuild.toolsList['Screwdriver'] = {"Base.Screwdriver"}
  MoreBuild.toolsList['HandShovel'] = {"farming.HandShovel"}
  MoreBuild.toolsList['Saw'] = {"Base.Saw"}
  MoreBuild.toolsList['Spade'] = {"Base.Shovel"}

  local havaTools = nil

  havaTools = MoreBuild.getAvailableTools(player, 'Hammer')

  return havaTools or ISBuildMenu.cheat
end

--- ????????????????????????????????????
--- @param player number: IsoPlayer??????
--- @param tool string: ????????????
--- @return InventoryItem: ?????????????????????, ????????????????????????nil
MoreBuild.getAvailableTools = function(player, tool)
  local tools = nil
  local toolList = MoreBuild.toolsList[tool]
  local inv = getSpecificPlayer(player):getInventory()
  for _, type in pairs (toolList) do
    tools = inv:getFirstTypeEval(type, predicateNotBroken)
    if tools then
      return tools
    end
  end
end

--- ??????????????????
--- @param object IsoObject: IsoObject??????
--- @param player number: IsoPlayer??????
--- @param tool string: ????????????
MoreBuild.equipToolPrimary = function(object, player, tool)
  local tools = nil
  tools = MoreBuild.getAvailableTools(player, tool)
  if tools then
    ISInventoryPaneContextMenu.equipWeapon(tools, true, false, player)
    object.noNeedHammer = true
  end
end

--- ??????????????????
--- @param object Isoobject: Isoobject??????
--- @param player number: IsoPlayer??????
--- @param tool string: ????????????
--- @info ?????????
MoreBuild.equipToolSecondary = function(object, player, tool)
  local tools = nil
  tools = MoreBuild.getAvailableTools(player, tool)
  if tools then
    ISInventoryPaneContextMenu.equipWeapon(tools, false, false, player)
  end
end

--- ??????????????????
--- @param player number: IsoPlayer??????
MoreBuild.buildSkillsList = function(player)
  local perks = PerkFactory.PerkList
  local perkID = nil
  local perkType = nil
  for i = 0, perks:size() - 1 do
    perkID = perks:get(i):getId()
    perkType = perks:get(i):getType()
    MoreBuild.playerSkills[perkID] = getSpecificPlayer(player):getPerkLevel(perks:get(i))
    MoreBuild.textSkillsRed[perkID] = ' <RGB:1,0,0>' .. PerkFactory.getPerkName(perkType) .. ' ' .. MoreBuild.playerSkills[perkID] .. '/'
    MoreBuild.textSkillsGreen[perkID] = ' <RGB:1,1,1>' .. PerkFactory.getPerkName(perkType) .. ' '
  end
end

--- ??????&????????????????????????
--- @param player number: IsoPlayer??????
--- @param material string: ????????????
--- @param amount number: ?????????????????????
--- @param tooltip ISToolTip: ??????????????????
--- @return boolean: ?????????????????????????????????true????????????false
--- @info ISBuildMenu.countMaterial????????????, ??????????????????????????????????????????????????????, ???????????????
MoreBuild.tooltipCheckForMaterial = function(player, material, amount, tooltip)
  local inv = getSpecificPlayer(player):getInventory()
  local type = split(material, '\\.')[2]
  local invItemCount = 0
  local groundItem = ISBuildMenu.materialOnGround
  if amount > 0 then
    invItemCount = inv:getItemCountFromTypeRecurse(material)

    if material == "Base.Nails" then
      invItemCount = invItemCount + inv:getItemCountFromTypeRecurse("Base.NailsBox") * 100
      if groundItem["Base.NailsBox"] then
        invItemCount = invItemCount + groundItem["Base.NailsBox"] * 100
      end
    end

    -- ISBuildUtil not support boxed screws, later solve it
    --[[
    if material == "Base.Screws" then
      invItemCount = invItemCount + inv:getItemCountFromTypeRecurse("Base.ScrewsBox") * 100
      if groundItem["Base.ScrewsBox"] then
        invItemCount = invItemCount + groundItem["Base.ScrewsBox"] * 100
      end
    end
    --]]

    -- why #groundItem 0?
    for groundItemType, groundItemCount in pairs(groundItem) do
      if groundItemType == type then
        invItemCount = invItemCount + groundItemCount
      end
    end

    if invItemCount < amount then
      tooltip.description = tooltip.description .. ' <RGB:1,0,0>' .. getItemNameFromFullType(material) .. ' ' .. invItemCount .. '/' .. amount .. ' <LINE>'
      return false
    else
      tooltip.description = tooltip.description .. ' <RGB:1,1,1>' .. getItemNameFromFullType(material) .. ' ' .. invItemCount .. '/' .. amount .. ' <LINE>'
      return true
    end
  end
end

--- ??????&????????????????????????
--- @param player number: IsoPlayer??????
--- @param tool string: ????????????
--- @param tooltip ISToolTip: ??????????????????
--- @return boolean: ?????????????????????????????????true????????????false
MoreBuild.tooltipCheckForTool = function(player, tool, tooltip)
  local tools = MoreBuild.getAvailableTools(player, tool)
  if tools then
    tooltip.description = tooltip.description .. ' <RGB:1,1,1>' .. tools:getName() .. ' <LINE>'
    return true
  else
    for _, type in pairs (MoreBuild.toolsList[tool]) do
      tooltip.description = tooltip.description .. ' <RGB:1,0,0>' .. getItemNameFromFullType(type) .. ' <LINE>'
      return false
    end
  end
end

--- ??????????????????????????????
--- @param skills table: ?????????????????????, ?????????????????? {Woodwork = 1, Strength = 2, ...}
--- @param option ISContextMenu: ?????????????????????
--- @return ISToolTip: ????????????????????????
MoreBuild.canBuildObject = function(skills, option, player)
  local _tooltip = ISToolTip:new()
  _tooltip:initialise()
  _tooltip:setVisible(false)
  option.toolTip = _tooltip

  local _canBuildResult = true

  _tooltip.description = MoreBuild.textTooltipHeader

  local _currentResult = true

  for _, _currentMaterial in pairs(MoreBuild.neededMaterials) do
    if _currentMaterial['Material'] and _currentMaterial['Amount'] then
      _currentResult = MoreBuild.tooltipCheckForMaterial(player, _currentMaterial['Material'], _currentMaterial['Amount'], _tooltip)
    else
      _tooltip.description = _tooltip.description .. ' <RGB:1,0,0> Error in required material definition. <LINE>'
      _canBuildResult = false
    end

    if not _currentResult then
      _canBuildResult = false
    end
  end

  for _, _currentTool in pairs(MoreBuild.neededTools) do
    _currentResult = MoreBuild.tooltipCheckForTool(player, _currentTool, _tooltip)

    if not _currentResult then
      _canBuildResult = false
    end
  end

  for skill, level in pairs (skills) do
    if (MoreBuild.playerSkills[skill] < level) then
      _tooltip.description = _tooltip.description .. MoreBuild.textSkillsRed[skill]
      _canBuildResult = false
    else
      _tooltip.description = _tooltip.description .. MoreBuild.textSkillsGreen[skill]
    end
    _tooltip.description = _tooltip.description .. level .. ' <LINE>'
  end

  if not _canBuildResult and not ISBuildMenu.cheat then
    option.onSelect = nil
    option.notAvailable = true
  end
  return _tooltip
end

--- ??????MoreBuild??????
--- @return table: MoreBuild table
function getMoreBuildInstance()
  return MoreBuild
end

--- ??????OnFillWorldObjectContextMenu??????
-- @callback1 player number: ?????????IsoPlayer??????
-- @callback2 context ISContextMenu: ?????????????????????
-- @callback3 worldobjects table: ???????????????
-- @callback4 test Boolean: ????????????????????????????????????true, ????????????false
Events.OnFillWorldObjectContextMenu.Add(MoreBuild.OnFillWorldObjectContextMenu)