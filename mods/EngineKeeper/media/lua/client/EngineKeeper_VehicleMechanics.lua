
EngineKeeper = EngineKeeper or {}

EngineKeeper.ISVehicleMechanics_doMenuTooltip = ISVehicleMechanics.doMenuTooltip
function ISVehicleMechanics:doMenuTooltip(part, option, lua, name)
    EngineKeeper.ISVehicleMechanics_doMenuTooltip(self,part,option,lua,name)
    local playerObj = getSpecificPlayer(self.playerNum);
    local accessLevel = playerObj:getAccessLevel()
    local specificRights = isAdmin() or accessLevel and accessLevel ~= "None"
    if not specificRights and lua == "takeengineparts" and  part:getCondition() >= EngineKeeper.getEnginePartThreshold() then
        --print ("Engine Part Condition="..part:getCondition().."/"..EngineKeeper.getEnginePartThreshold().."("..EngineKeeper.OPTIONS.EnginePartThreshold..")")
        if option.toolTip and option.toolTip.description then
            option.toolTip.description = option.toolTip.description .. " <RED> ".. getText("UI_EngineKeeper_Tooltip_EnginePartThreshold").." "..EngineKeeper.getEnginePartThreshold()
        end
        option.notAvailable = true;
    end
end
