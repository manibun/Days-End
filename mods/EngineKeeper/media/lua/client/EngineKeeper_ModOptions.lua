require "EngineKeeper_VehicleMechanics"

-- These are the default options.
if not EngineKeeper then  EngineKeeper = {} end
if not EngineKeeper.OPTIONS then EngineKeeper.OPTIONS = {} end
if not EngineKeeper.OPTIONS.EnginePartThreshold then EngineKeeper.OPTIONS.EnginePartThreshold = 6 end--default to 60 percent

function EngineKeeper.getEnginePartThreshold()
    if SandboxVars and SandboxVars.EngineKeeper and SandboxVars.EngineKeeper.ECT and SandboxVars.EngineKeeper.ECT >=0 then return SandboxVars.EngineKeeper.ECT end
    if EngineKeeper.OPTIONS.EnginePartThreshold == 1 then return 10 end
    if EngineKeeper.OPTIONS.EnginePartThreshold == 2 then return 20 end
    if EngineKeeper.OPTIONS.EnginePartThreshold == 3 then return 30 end
    if EngineKeeper.OPTIONS.EnginePartThreshold == 4 then return 40 end
    if EngineKeeper.OPTIONS.EnginePartThreshold == 5 then return 50 end
    if EngineKeeper.OPTIONS.EnginePartThreshold == 6 then return 60 end
    if EngineKeeper.OPTIONS.EnginePartThreshold == 7 then return 70 end
    if EngineKeeper.OPTIONS.EnginePartThreshold == 8 then return 80 end
    if EngineKeeper.OPTIONS.EnginePartThreshold == 9 then return 90 end
    return 100
end

if not EngineKeeper.activateModOption then return end -- TODO activate mod options on admin and spread the threshold to clients
-- Connecting the options to the menu, so user can change them.
if ModOptions and ModOptions.getInstance then
    local settings = ModOptions:getInstance(EngineKeeper.OPTIONS, "EngineKeeper", "Engine Keeper")

    ModOptions:loadFile();

    local optEnginePartThreshold   = settings:getData("EnginePartThreshold")
    optEnginePartThreshold.name      = "UI_EngineKeeper_EnginePartThreshold";
    optEnginePartThreshold.tooltip   = "UI_EngineKeeper_Tooltip_EnginePartThreshold";

    optEnginePartThreshold[1] = getText("UI_EngineKeeper_EnginePartThreshold_10")
    optEnginePartThreshold[2] = getText("UI_EngineKeeper_EnginePartThreshold_20")
    optEnginePartThreshold[3] = getText("UI_EngineKeeper_EnginePartThreshold_30")
    optEnginePartThreshold[4] = getText("UI_EngineKeeper_EnginePartThreshold_40")
    optEnginePartThreshold[5] = getText("UI_EngineKeeper_EnginePartThreshold_50")
    optEnginePartThreshold[6] = getText("UI_EngineKeeper_EnginePartThreshold_60")
    optEnginePartThreshold[7] = getText("UI_EngineKeeper_EnginePartThreshold_70")
    optEnginePartThreshold[8] = getText("UI_EngineKeeper_EnginePartThreshold_80")
    optEnginePartThreshold[9] = getText("UI_EngineKeeper_EnginePartThreshold_90")
    optEnginePartThreshold[10]= getText("UI_EngineKeeper_EnginePartThreshold_100")
end
