ESX = exports["es_extended"]:getSharedObject()

-------------------------------------------------------------------------------------------------
------------------------------------- PARTE SERVER ARMI -----------------------------------------
-------------------------------------------------------------------------------------------------
RegisterServerEvent("pistola", function(item)
    exports.ox_inventory:RemoveItem(source, Config.Item.oggetto, item, false, false)
    exports.ox_inventory:AddItem(source, 'WEAPON_PISTOL', Config.QuantitaRicevere, false, false)
end)

RegisterServerEvent("pistolamk2", function(item)
    exports.ox_inventory:RemoveItem(source, Config.Item.oggetto, item, false, false)
    exports.ox_inventory:AddItem(source, 'WEAPON_PISTOL_MK2', Config.QuantitaRicevere, false, false)
end)

RegisterServerEvent("pdw", function(item)
    exports.ox_inventory:RemoveItem(source, Config.Item.oggetto, item, false, false)
    exports.ox_inventory:AddItem(source, 'WEAPON_COMBATPDW', Config.QuantitaRicevere, false, false)
end)
-------------------------------------------------------------------------------------------------
------------------------------------ PARTE SERVER OGGETTI ---------------------------------------
-------------------------------------------------------------------------------------------------
RegisterServerEvent("granata", function(item)
    exports.ox_inventory:RemoveItem(source, Config.Item.oggetto, item, false, false)
    exports.ox_inventory:AddItem(source, 'WEAPON_GRENADE', Config.QuantitaRicevere, false, false)
end)

RegisterServerEvent("armour", function(item)
    exports.ox_inventory:RemoveItem(source, Config.Item.oggetto, item, false, false)
    exports.ox_inventory:AddItem(source, 'ARMOUR', Config.QuantitaRicevere, false, false)
end)

RegisterServerEvent("parachute", function(item)
    exports.ox_inventory:RemoveItem(source, Config.Item.oggetto, item, false, false)
    exports.ox_inventory:AddItem(source, 'PARACHUTE', Config.QuantitaRicevere, false, false)
end)
