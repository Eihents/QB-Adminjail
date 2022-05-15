local currentGate = 0
local requiredItemsShowed = false
local requiredItems = {}
local inRange = false
local securityLockdown = false

-- Functions

-- Events


-- Threads

CreateThread(function()
	while true do
		Wait(7)
		local pos = GetEntityCoords(PlayerPedId(), true)
        if #(pos - vector3(Config.Locations["middle"].coords.x, Config.Locations["middle"].coords.y, Config.Locations["middle"].coords.z)) > 200 and inJail then
			inJail = false
            jailTime = 0
            RemoveBlip(currentBlip)
            RemoveBlip(CellsBlip)
            CellsBlip = nil
            RemoveBlip(TimeBlip)
            TimeBlip = nil
            RemoveBlip(ShopBlip)
            ShopBlip = nil
            TriggerServerEvent("suns:server:SecurityLockdown")
            TriggerEvent('suns:client:PrisonBreakAlert')
            TriggerServerEvent("suns:server:SetJailStatus", 0)
            TriggerServerEvent("QBCore:Server:SetMetaData", "jailitems", {})
            QBCore.Functions.Notify(Lang:t("error.escaped"), "error")
        else
            Wait(2000)
		end
	end
end)