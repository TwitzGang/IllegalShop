ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('tz_illegal:BuyChargeur')
AddEventHandler('tz_illegal:BuyChargeur', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 1000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('clip', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)



RegisterNetEvent('tz_illegal:BuySac')
AddEventHandler('tz_illegal:BuySac', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 3000
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('headbag', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)