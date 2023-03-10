if isServer() then return end

require "ExpandedHelicopter00c_SpawnerAPI"
require "ExpandedHelicopter01f_ShadowSystem"
require "ExpandedHelicopter01b_MainSounds"
require "ExpandedHelicopter11_EventMarkerHandler"

LuaEventManager.AddEvent("EHE_ClientModDataReady") -- p1: isNewGame
--triggerEvent("EHE_ClientModDataReady", false) send change if any

local function onClientModDataReady() ModData.request("ExpandedHelicopterEvents") end
Events.EHE_ClientModDataReady.Add(onClientModDataReady)

function eventShadowHandler.updateForPlayer(player)
	local currentTime = getTimeInMillis()
	if not storedShadows then return end
	for shadowID,_ in pairs(storedShadows) do
		if storedShadowsUpdateTimes and storedShadowsUpdateTimes[shadowID]+5000 <= currentTime then
			print("-- EHE: WARN: eventShadowHandler.updateForPlayer: no update received")
			---@type WorldMarkers.GridSquareMarker
			local shadow = storedShadows[shadowID]
			shadow:setAlpha(0)
			storedShadows[shadowID] = nil
			storedShadowsUpdateTimes[shadowID] = nil
		end
	end
end
Events.OnPlayerUpdate.Add(eventShadowHandler.updateForPlayer)


storedLooperEvents = {}
storedLooperEventsSoundEffects = {}
storedLooperEventsUpdateTimes = {}

function eventSoundHandler.updateForPlayer(player)
	for emitterID,timeStamp in pairs(storedLooperEventsUpdateTimes) do
		if timeStamp~=false and timeStamp <= getGametimeTimestamp() then
			--[[DEBUG]] local printString = ""
			---@type FMODSoundEmitter | BaseSoundEmitter emitter
			local emitter = storedLooperEvents[emitterID]

			if storedLooperEventsSoundEffects[emitterID] then
				for sound,_ in pairs(storedLooperEventsSoundEffects[emitterID]) do
					if emitter:isPlaying(sound) then
						printString = sound..", "..printString
						emitter:stopSoundByName(sound)
					end
				end
			end
			--[[DEBUG]] if printString~="" then printString = "\n --- stopped: "..printString end
			--[[DEBUG]] print("-- EHE: "..emitterID.." eventSoundHandler.updateForPlayer: no update received; stopping sound. "..printString)
			emitter:setVolumeAll(0)
			--emitter:stopAll()
			storedLooperEventsSoundEffects[emitterID] = nil
			storedLooperEventsUpdateTimes[emitterID] = nil
		end
	end
end
Events.OnPlayerUpdate.Add(eventSoundHandler.updateForPlayer)


function eventMarkerHandler.updateForPlayer(player)
	local personalMarkers = eventMarkerHandler.markers[player]
	if personalMarkers then
		for id,_ in pairs(personalMarkers) do
			---@type ISUIElement
			local marker = eventMarkerHandler.markers[player][id]
			if marker and marker:getEnabled() then
				local currentTime = getGametimeTimestamp()
				local currentTimeMS = getTimeInMillis()
				local expireTime = eventMarkerHandler.expirations[player][id]
				if (expireTime <= currentTime) and (marker.lastUpdateTime+100 <= currentTimeMS) then
					print("-- EHE: eventMarkerHandler.updateForPlayer: no update received; stopping marker. ")
					eventMarkerHandler.markers[player][id] = nil
					eventMarkerHandler.expirations[player][id] = nil
					marker:setDuration(0)
					marker:setEnabled(false)
				end
			end
		end
	end
end
Events.OnPlayerUpdate.Add(eventMarkerHandler.updateForPlayer)

-- sendServerCommand(module, command, player, args) end -- to client
local function onCommand(_module, _command, _dataA, _dataB)
	--clientside
	if _module == "sendLooper" then
		storedLooperEventsUpdateTimes[_dataA.reusableID] = getGametimeTimestamp()+100

		if _command == "play" then
			eventSoundHandler:handleLooperEvent(_dataA.reusableID,
					{soundEffect=_dataA.soundEffect, x=_dataA.coords.x, y=_dataA.coords.y, z=_dataA.coords.z}, _dataA.command)

		elseif _command == "setPos" then
			eventSoundHandler:handleLooperEvent(_dataA.reusableID, {x=_dataA.coords.x, y=_dataA.coords.y, z=_dataA.coords.z}, _dataA.command)

		elseif _command == "stop" then
			eventSoundHandler:handleLooperEvent(_dataA.reusableID, {soundEffect=_dataA.soundEffect}, _dataA.command)

		elseif _command == "drop" then
			eventSoundHandler:handleLooperEvent(_dataA.reusableID, nil, _dataA.command)
		end

	elseif _module == "eventMarkerHandler" and _command == "setOrUpdateMarker" then
		eventMarkerHandler.setOrUpdate(_dataA.eventID, _dataA.icon, _dataA.duration, _dataA.posX, _dataA.posY, true)

	elseif _module == "eventShadowHandler" and _command == "setShadowPos" then
		eventShadowHandler:setShadowPos(_dataA.eventID, _dataA.texture, _dataA.x, _dataA.y, _dataA.z, true)
	end
end
Events.OnServerCommand.Add(onCommand)--/server/ to client
