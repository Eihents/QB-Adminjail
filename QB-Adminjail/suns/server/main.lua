local QBCore = exports['qb-core']:GetCoreObject()

local AlarmActivated = false

RegisterNetEvent('suns:server:SetJailStatus', function(jailTime)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetMetaData("injail", jailTime)
    if jailTime > 0 then
        if Player.PlayerData.job.name ~= "test" then
            Player.Functions.SetJob("test")
            TriggerClientEvent('QBCore:Notify', src, 'darbs netika noņemts!')
        end
    end
end)

RegisterNetEvent('suns:server:CheckRecordStatus', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local CriminalRecord = Player.PlayerData.metadata["criminalrecord"]
    local currentDate = os.date("*t")

    if (CriminalRecord["date"].month + 1) == 13 then
        CriminalRecord["date"].month = 0
    end

    if CriminalRecord["hasRecord"] then
        if currentDate.month == (CriminalRecord["date"].month + 1) or currentDate.day == (CriminalRecord["date"].day - 1) then
            CriminalRecord["hasRecord"] = false
            CriminalRecord["date"] = nil
        end
    end
end)

RegisterNetEvent('eihents:server:JailPlayer', function(playerId, time)
local src = source
local Player = QBCore.Functions.GetPlayer(src)
local OtherPlayer = QBCore.Functions.GetPlayer(playerId)
local currentDate = os.date("*t")
if currentDate.day == 31 then
    currentDate.day = 30
end

if Player.PlayerData.job.name == "police" then
    if OtherPlayer then
        OtherPlayer.Functions.SetMetaData("injail", time)
        OtherPlayer.Functions.SetMetaData("criminalrecord", {
            ["hasRecord"] = true,
            ["date"] = currentDate
        })
        TriggerClientEvent("eihents:client:SendToJail", OtherPlayer.PlayerData.source, time)
        TriggerClientEvent('QBCore:Notify', src, Lang:t("info.sent_jail_for", {time = time}))
    end
end
end)

QBCore.Commands.Add("adminj", 'Tikai admini!', {{name = "id", help = 'ID'}, {name = "time", help = 'Laiks'}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
        local playerId = tonumber(args[1])
        local time = tonumber(args[2])
        if time > 0 then
            TriggerClientEvent("eihents:client:JailCommand", src, playerId, time)
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('info.jail_time_no'), 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Admini On Duty', 'error')
    end
end)

QBCore.Commands.Add("adminu", 'Tikai admini!', {{name = "id", help = 'ID'}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
        local playerId = tonumber(args[1])
        TriggerClientEvent("suns:client:UnjailPerson", playerId)
    else
        TriggerClientEvent('QBCore:Notify', src, 'Admini On Duty', 'error')
    end
end)


--QBCore.Commands.Add("adminu", 'Tikai admini!', {{name = "id", help = 'ID'}}, true, function(source, args)
--    local src = source
--    local Player = QBCore.Functions.GetPlayer(src)
--    if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
--        local playerId = tonumber(args[1])
--        TriggerClientEvent("suns:client:UnjailPerson", playerId)
 --   else
 --       TriggerClientEvent('QBCore:Notify', src, 'Admini On Duty', 'error')
 --   end
--end)
