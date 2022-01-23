ESX                           = nil
local PlayerData                = {}

Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)

RegisterNetEvent('sendProximityMessage')
AddEventHandler('sendProximityMessage', function(id, name, message)
  local monid = PlayerId()
  local sonid = GetPlayerFromServerId(id)
  if sonid == monid then
    TriggerEvent('chatMessage',"💭" .. name, {128, 128, 128}, message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(monid)), GetEntityCoords(GetPlayerPed(sonid)), true) < 19.999 then
    TriggerEvent('chatMessage',"💭" .. name, {128, 128, 128}, message)
  end
end)

RegisterNetEvent('sendProximityMessageMe')
AddEventHandler('sendProximityMessageMe', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "", {255, 0, 0}, " ^1 " .. 'Obywatel' .. '['.. GetPlayerServerId(PlayerId()) .. ']' .. "^1 " .. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chatMessage', "", {255, 0, 0}, " ^1 " .. 'Obywatel' .. '['.. GetPlayerServerId(PlayerId()) .. ']' .. "^1 " .. message)
  end
end)

RegisterNetEvent('sendProximityMessageDo')
AddEventHandler('sendProximityMessageDo', function(id, name, message)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "", {255, 0, 0}, " ^5 " .. 'Obywatel' .. '['.. GetPlayerServerId(PlayerId()) .. ']' .. "^5 " .. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chatMessage', "", {255, 0, 0}, " ^5 " .. 'Obywatel' .. '['.. GetPlayerServerId(PlayerId()) .. ']' .. "^5 " .. message)
  end
end)

RegisterNetEvent('sendProximityMessageMed')
AddEventHandler('sendProximityMessageMed', function(id, name, message)
	local myId = PlayerId()
	local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "", {255, 0, 0}, " ^5 " .. 'Obywatel' .. '['.. GetPlayerServerId(PlayerId()) .. ']' .. "^5 " .. message)
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
    TriggerEvent('chatMessage', "", {255, 0, 0}, " ^5 " .. 'Obywatel' .. '['.. GetPlayerServerId(PlayerId()) .. ']' .. "^5 " .. message)
  end
end)
