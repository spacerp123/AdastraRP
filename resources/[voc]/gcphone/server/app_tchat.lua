function TchatGetMessageChannel(channel, cb)
	MySQL.Async.fetchAll("SELECT * FROM phone_app_chat WHERE channel = @channel ORDER BY time DESC LIMIT 100", {
		['@channel'] = channel
	}, cb)
end

function TchatAddMessage(channel, message)
	MySQL.Async.execute("INSERT INTO phone_app_chat (`channel`, `message`) VALUES (@channel, @message)", {
		['@channel'] = channel,
		['@message'] = message
	}, function(result)
		MySQL.Async.fetchAll('SELECT * from phone_app_chat WHERE `id` = @id', {
			['@id'] = result
		}, function(result2)
			TriggerClientEvent('::{ayzwen}::gcPhone:tchat_receive', -1, result2[1])
		end)
	end)
end

RegisterServerEvent('::{ayzwen}::gcPhone:tchat_channel')
AddEventHandler('::{ayzwen}::gcPhone:tchat_channel', function(channel)
	local sourcePlayer = tonumber(source)

	TchatGetMessageChannel(channel, function(messages)
		TriggerClientEvent('::{ayzwen}::gcPhone:tchat_channel', sourcePlayer, channel, messages)
	end)
end)

RegisterServerEvent('::{ayzwen}::gcPhone:tchat_addMessage')
AddEventHandler('::{ayzwen}::gcPhone:tchat_addMessage', function(channel, message)
	TchatAddMessage(channel, message)
end)