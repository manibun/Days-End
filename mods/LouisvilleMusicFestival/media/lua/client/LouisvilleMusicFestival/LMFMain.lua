--***********************************************************
--**                       BitBraven                       **
--***********************************************************

local mainStagesq

local availableMusic = {
    -- "DisplayName,SoundName"
    "Rage (Metal),Sample01",
    "No Limits (Metal),Sample02",
    "Dark Matter (Metal),Sample03",
    "Knockout Blow (Dubstep),Sample04",
    "Aggressive (Dubstep),Sample05",
    "Devil Flames (Dubstep),Sample06",
    "Funk It (Funk),Sample07",
    "Fun Disco (Funk),Sample08",
    "Country Fiddle (Country),Sample09",
    "Joker Boy (Bright),Sample10",
}

local function TryStartFestival(playerObj, square, musicName)
	ISTimedActionQueue.add(ISPathFindAction:pathToLocationF(playerObj, 13703.5, 1987, 0));
	ISTimedActionQueue.add(ISLMFTimeAction:UsePC(playerObj, square, musicName, 250));
end

local function onFillWorldObjectContextMenu(player, context, worldobjects, test)

    if getCore():getGameMode() == 'LastStand' then return end
    if test then return end

    -- Check for specific PC square on map.
    if clickedSquare:getX() ~= 13702 then return end
    if clickedSquare:getY() ~= 1987 then return end
    if clickedSquare:getZ() ~= 0 then return end

    -- Return if no electricity
    if not (clickedSquare:haveElectricity() or GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) then return end

    -- Return if no player
    local playerObj = getSpecificPlayer(player); if not playerObj then return end
    if playerObj:getVehicle() then return; end

    -- Cue in the extremely overcomplicated method of checking if the player right clicked a PC
    local squareHasPC = false
    local objs = clickedSquare:getObjects();
        
    for i = 0, objs:size() - 1 do

        local obj = objs:get(i);
        local moveProps = ISMoveableSpriteProps.fromObject(obj);

        if moveProps then

            for _ in pairs(moveProps) do
                print(moveProps[_])
                if moveProps[_] == "Desktop Computer" then
                    squareHasPC = true
                end
            end
        end
    end

    if not squareHasPC then return end

    if not mainStagesq then
        mainStagesq = getSquare(13703, 1962, 0)
    end

    local FestivalMenu = context:addOption(getText("ContextMenu_PlayMusic"));
    FestivalMenu.iconTexture = getTexture("media/ui/FloppyDisk.png")

    local insertDiskContext = ISContextMenu:getNew(context);
    context:addSubMenu(FestivalMenu, insertDiskContext);

    for _ in pairs(availableMusic) do
        local splitKey = string.split(availableMusic[_], ",")
        insertDiskContext:addOption(splitKey[1], playerObj, TryStartFestival, mainStagesq, splitKey[2]);
    end
end

Events.OnFillWorldObjectContextMenu.Add(onFillWorldObjectContextMenu);