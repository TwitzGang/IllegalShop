ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

------------ Création du Menu / Sous Menu -----------

RMenu.Add('example', 'main', RageUI.CreateMenu("tz_Illégal Shop", "Menu Illégal"))
RMenu.Add('example', 'sac', RageUI.CreateSubMenu(RMenu:Get('example', 'main'), "Sac de tete", "Menu Sac"))
RMenu.Add('example', 'chargeur', RageUI.CreateSubMenu(RMenu:Get('example', 'main'), "Chargeur", "Menu Chargeur"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('example', 'main'), true, true, true, function()

            RageUI.Button("Sac", "Choisi le sac qui te convient", {RightLabel = "→→→"},true, function()
            end, RMenu:Get('example', 'sac'))

            RageUI.Button("Chargeur", "Choisi le chargeur qui te convient !", {RightLabel = "→→→"},true, function()
            end, RMenu:Get('example', 'chargeur'))
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('example', 'sac'), true, true, true, function()

            RageUI.Button("Sac de tete", "Voici les sacs de tete dispobibles", {RightLabel = "~g~3000$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('tz_illegal:BuySac')
                end
            end)
        end, function()
        end)

            RageUI.IsVisible(RMenu:Get('example', 'chargeur'), true, true, true, function()

                RageUI.Button("Chargeur", "Voici la liste des chargeurs disponibles !", {RightLabel = "~g~1000$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('tz_illegal:BuyChargeur')
                    end
                end)
                        
            end, function()
                ---Panels
            end, 1)
    
            Citizen.Wait(0)
        end
    end)



    ---------------------------------------- Position du Menu --------------------------------------------

    local position = {
        {x = -10.32 , y = -1828.06, z = 25.39, }
    }    
    
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
    
            for k in pairs(position) do
    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
    
                if dist <= 1.0 then

                   ESX.ShowHelpNotification("Appuyez sur [~b~E~w~] pour acceder au ~b~Shop illégal")
                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('example', 'main'), not RageUI.Visible(RMenu:Get('example', 'main')))
                    end
                end
            end
        end
    end)