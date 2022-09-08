local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = true

local onDuty = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "smoking" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

Citizen.CreateThread(function()
    SmokingShop = AddBlipForCoord(-1197.32, -897.655, 13.995)
    SetBlipSprite (SmokingShop, 106)
    SetBlipDisplay(SmokingShop, 4)
    SetBlipScale  (SmokingShop, 0.5)
    SetBlipAsShortRange(SmokingShop, true)
    SetBlipColour(SmokingShop, 75)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("SmokingShop")
    EndTextCommandSetBlipName(SmokingShop)
end)

RegisterNetEvent("crew-vapejob:Duty")
AddEventHandler("crew-vapejob:Duty", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("crew-vapejob:Tray1")
AddEventHandler("crew-vapejob:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "Counter 1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Counter 1", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("crew-vapejob:Tray2")
AddEventHandler("crew-vapejob:Tray2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "Counter 2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Counter 2", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("crew-vapejob:Storage")
AddEventHandler("crew-vapejob:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "Vape Storage 1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Vape Storage 1", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("crew-vapejob:Storage2")
AddEventHandler("crew-vapejob:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "Vape Storage 2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Vape Storage 2", {
        maxweight = 250000,
        slots = 40,
    })
end)

-- Getting Vape
RegisterNetEvent("crew-vapejob:TakeVape")
AddEventHandler("crew-vapejob:TakeVape", function()
		QBCore.Functions.Progressbar("pickup_sla", "Taking Vape", 4000, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
			}, {
			animDict = "mp_common",
			anim = "givetake1_a",
			flags = 8,
			}, {}, {}, function() -- Done
			TriggerServerEvent('QBCore:Server:AddItem', "vape_pen", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["vape_pen"], "add")
            QBCore.Functions.Notify("You have unboxed one vape!!", "success")
			end, function()
			QBCore.Functions.Notify("Cancelled..", "error")
		end)
	end)

-- Making Juice
RegisterNetEvent("crew-vapejob:VapeJuice1")
AddEventHandler("crew-vapejob:VapeJuice1", function()
	QBCore.Functions.TriggerCallback('crew-vapejob:server:get:ingredient', function(HasItems)  
    	if HasItems then
			QBCore.Functions.Progressbar("pickup_sla", "Making Chubby Bubble Blue Raz", 4000, false, true, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {
				animDict = "mp_common",
				anim = "givetake1_a",
				flags = 8,
			}, {}, {}, function() -- Done
				TriggerServerEvent('QBCore:Server:RemoveItem', "commonjuice", 1)
				TriggerServerEvent('QBCore:Server:RemoveItem', "juicebottle", 1)
				TriggerServerEvent('QBCore:Server:AddItem', "chubby", 2)
                    	TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chubby"], "add")
                    		QBCore.Functions.Notify("You made chubby bubble blue raz", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	end)

-- Functions
   
RegisterNetEvent("crew-vapejob:shop")
AddEventHandler("crew-vapejob:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "smoking", Config.Items)
end)
