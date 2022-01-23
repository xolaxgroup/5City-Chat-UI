ESX                       = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)


function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
		}
	else
		return nil
	end
end

  AddEventHandler('chatMessage', function(source, name, message)
      if string.sub(message, 1, string.len("/")) ~= "/" then
          local name = GetPlayerName(source)
		TriggerClientEvent("sendProximityMessage", -1, source, name, message)
      end
      CancelEvent()
  end)

	
  TriggerEvent('es:addCommand', 'me', function(source, args, user)
      local name = getIdentity(source)
			TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, table.concat(args, " "))
			--TriggerClientEvent('sendProximityMessageChmura', -1, source, args)
  end)

  TriggerEvent('es:addCommand', 'do', function(source, args, user)
      local name = getIdentity(source)
      TriggerClientEvent("sendProximityMessageDo", -1, source, name.firstname, table.concat(args, " "))
  end)

  TriggerEvent('es:addCommand', 'twt', function(source, args, user)
	local name = getIdentity(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local amount = 25
	
	xPlayer.removeAccountMoney('bank', amount)
	TriggerClientEvent('esx:showNotification', source, '~r~Zabrano ~w~25 ~g~$ ~w~Dolarów ~r~z konta bankowego')

	TriggerClientEvent('chatMessage', -1, "🕊️^5@" .. name.firstname .. " " .. name.lastname .. "", {45, 102, 196}, table.concat(args, " "))
end, {help = 'Wyslij wiadomosc na tweet. [IC]'})

TriggerEvent('es:addCommand', 'reklama', function(source, args, user)
	local name = getIdentity(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local amount = 400
	xPlayer.removeAccountMoney('bank', amount)
	TriggerClientEvent('esx:showNotification', source, '~r~Zabrano ~w~400 ~g~$ ~w~Dolarów ~r~z konta bankowego')

	TriggerClientEvent('chatMessage', -1, "📱" .. name.firstname .. " " .. name.lastname .. "", {185, 206, 7}, table.concat(args, " "))
end, {help = 'Wyslij swoją reklame na czat. [IC]'})

TriggerEvent('es:addCommand', 'dw', function(source, args, user)
if args[1] == nil then
        print("Prosze podaj pierwszy argument.")
        return
		end
		
  local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local amount = 200
	local wiadomosc = args[1]
	
	table.remove(args, 1)
	
	xPlayer.removeAccountMoney('bank', amount)
	TriggerClientEvent('esx:showNotification', source, '~r~Zabrano ~w~200 ~g~$ ~w~Dolarów ~r~z konta bankowego')

    TriggerClientEvent('chatMessage', -1, "💻" .. wiadomosc .. "", {182, 12, 12}, table.concat(args, " "))
  end, {help = 'Wyslij wiadomosc na darkweb. [IC]'})

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end
