ESX = exports["es_extended"]:getSharedObject()

local options = {
    {
        name = 'ox:option1',
        event = 'crafta:oggetti',
        icon = Config.Icon.ox,
        label = 'Crafta Oggetti',
    },
}
local crafting = { 
    Config.Ped.name
}
exports.ox_target:addModel(crafting, options)

-- BLIP IN MAPPA -- 
ydblip = AddBlipForCoord(Config.Blip.coords)
    SetBlipSprite(ydblip, Config.Blip.sprite)
    SetBlipScale(ydblip, Config.Blip.scale)
    SetBlipColour(ydblip, Config.Blip.colour)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.Blip.name)
    EndTextCommandSetBlipName(ydblip)

-- MODELLO PED --
Citizen.CreateThread(function()
  if not HasModelLoaded(Config.Ped.name) then
     RequestModel(Config.Ped.name)
     while not HasModelLoaded(Config.Ped.name) do
        Citizen.Wait(5)
     end
  end

npc = CreatePed(4, Config.Ped.name, Config.Ped.coords, false, true)
FreezeEntityPosition(npc, true)
SetEntityInvincible(npc, true)
SetBlockingOfNonTemporaryEvents(npc, true)
end)
-------------------------------------------------------------------------------------------------
------------------------------------ MENU CRAFTING -------------------------------------------
-------------------------------------------------------------------------------------------------
RegisterNetEvent('crafta:oggetti', function()
    lib.registerContext({
        id = 'menu',
        title = 'CRAFTING',
        options = {
        {
            title = 'CATEGORIA ARMI',
            description = 'Crafta Pistole, smg, AK-47, ecc..',
            icon = Config.Icon.arma,
            iconColor = Config.Icon.color,
            onSelect = function()
                craftaarmi()
            end,
        },
        {
            title = 'CATEGORIA OGGETTI',
            description = 'Crafta Granate, Giubbotti Antiproiettile, Ecc..',
            icon = Config.Icon.oggetti,
            iconColor = Config.Icon.color,
            onSelect = function()
                craftaoggetti()
            end,
        },
        }
      })
    lib.showContext('menu')
end)
-- CRAAFT ARMI --
function craftaarmi()
    lib.registerContext({
      id = 'menu',
      title = 'CRAFTING ARMI',
      options = {
        {
            title = 'Pistol',
            icon = Config.Icon.play,
            iconColor = Config.Icon.color,
            onSelect = function()
                pistola()
            end,
        },
        {
            title = 'Pistola MK2',
            icon = Config.Icon.play,
            iconColor = Config.Icon.color,
            onSelect = function()
                pistolamk2()
            end,
        },
        {
            title = 'PDW',
            icon = Config.Icon.play,
            iconColor = Config.Icon.color,
            onSelect = function()
              pdw()
            end,
        },
      }
    })
    lib.showContext('menu')
end
-- CRAFT OGGETTI --
function craftaoggetti()
    lib.registerContext({
      id = 'menu',
      title = 'CRAFTING ARMI',
      options = {
        {
            title = 'Granate',
            icon = Config.Icon.play,
            iconColor = Config.Icon.color,
            onSelect = function()
                granata()
            end,
        },
        {
            title = 'Giubbotto Antiproiettile',
            icon = Config.Icon.play,
            iconColor = Config.Icon.color,
            onSelect = function()
                armour()
            end,
        },
        {
            title = 'Paracadute',
            icon = Config.Icon.play,
            iconColor = Config.Icon.color,
            onSelect = function()
                parachute()
            end,
        },
      }
    })
    lib.showContext('menu')
end
-------------------------------------------------------------------------------------------------
-----------------------------------FUNZIONI CRAFTING ARMI ---------------------------------------
-------------------------------------------------------------------------------------------------
-- PISTOLA --
function pistola()
    local oggetti = exports.ox_inventory:Search('count', Config.Item.oggetto)
    if oggetti >= Config.Item.pistola then
        ESX.ShowNotification("Hai pagato "..Config.Item.pistola.." Iron per una PISTOLA")
            if lib.progressCircle({
                duration = Config.Progress.pistola,
                label = 'Craftano PISTOLA',
                position = 'botton',
                useWhileDead = false,
                canCancel = true,
                anim = {
                    dict = 'mini@repair',
                    clip = 'fixing_a_ped'
                },
            }) then TriggerServerEvent('pistola', Config.Item.pistola) end
            ESX.ShowNotification("Hai craftato la PISTOLA")
    else
        ESX.ShowNotification("Devi avere "..Config.Item.pistola.." Iron per craftare una PISTOLA")
    end
end
-- PISTOLA MK2 --
function pistolamk2()
    local oggetti = exports.ox_inventory:Search('count', Config.Item.oggetto)
    if oggetti >= Config.Item.mk2 then
        ESX.ShowNotification("Hai pagato "..Config.Item.mk2.." Iron per una PISTOLA MK2")
            if lib.progressCircle({
                duration = Config.Progress.mk2,
                label = 'Craftano PISTOLA MK2',
                position = 'botton',
                useWhileDead = false,
                canCancel = true,
                anim = {
                    dict = 'mini@repair',
                    clip = 'fixing_a_ped'
                },
            }) then TriggerServerEvent('pistolamk2', Config.Item.mk2) end
            ESX.ShowNotification("Hai craftato la PISTOLA MK2")
    else
        ESX.ShowNotification("Devi avere "..Config.Item.mk2.." Iron per craftare una PISTOLA MK2")
    end
end
-- PDW --
function pdw()
    local oggetti = exports.ox_inventory:Search('count', Config.Item.oggetto)
    if oggetti >= Config.Item.pdw then
        ESX.ShowNotification("Hai pagato "..Config.Item.pdw.." Iron per un PDW")
            if lib.progressCircle({
                duration = Config.Progress.pdw,
                label = 'Craftano PDW',
                position = 'botton',
                useWhileDead = false,
                canCancel = true,
                anim = {
                    dict = 'mini@repair',
                    clip = 'fixing_a_ped'
                },
            }) then TriggerServerEvent('pdw', Config.Item.pdw) end
            ESX.ShowNotification("Hai craftato un PDW")
    else
        ESX.ShowNotification("Devi avere "..Config.Item.pdw.." Iron per craftare un PDW")
    end
end
-------------------------------------------------------------------------------------------------
-----------------------------------FUNZIONI CRAFTING OGGETTI ---------------------------------------
-------------------------------------------------------------------------------------------------
-- GRANATE --
function granata()
    local oggetti = exports.ox_inventory:Search('count', Config.Item.oggetto)
    if oggetti >= Config.Item.granate then
        ESX.ShowNotification("Hai pagato "..Config.Item.granate.." Iron per una GRANATA")
            if lib.progressCircle({
                duration = Config.Progress.granate,
                label = 'Craftano GRANATA',
                position = 'botton',
                useWhileDead = false,
                canCancel = true,
                anim = {
                    dict = 'mini@repair',
                    clip = 'fixing_a_ped'
                },
            }) then TriggerServerEvent('granata', Config.Item.granate) end
            ESX.ShowNotification("Hai craftato una GRANATA")
    else
        ESX.ShowNotification("Devi avere "..Config.Item.granate.." Iron per craftare una GRANATA")
    end
end
-- GIUBBOTTO ANTIPROIETTILE --
function armour()
    local oggetti = exports.ox_inventory:Search('count', Config.Item.oggetto)
    if oggetti >= Config.Item.armour then
        ESX.ShowNotification("Hai pagato "..Config.Item.armour.." Iron per un GIUBBOTTO ANTIPROIETTILE")
            if lib.progressCircle({
                duration = Config.Progress.armour,
                label = 'Craftano GIUBBOTTO ANTIPROIETTILE',
                position = 'botton',
                useWhileDead = false,
                canCancel = true,
                anim = {
                    dict = 'mini@repair',
                    clip = 'fixing_a_ped'
                },
            }) then TriggerServerEvent('armour', Config.Item.armour) end
            ESX.ShowNotification("Hai craftato un GIUBBOTTO ANTIPROIETTILE")
    else
        ESX.ShowNotification("Devi avere "..Config.Item.armour.." Iron per craftare un GIUBBOTTO ANTIPROIETTILE")
    end
end
-- PARACHUTE --
function parachute()
    local oggetti = exports.ox_inventory:Search('count', Config.Item.oggetto)
    if oggetti >= Config.Item.paracadute then
        ESX.ShowNotification("Hai pagato "..Config.Item.paracadute.." Iron per un PARACHUTE")
            if lib.progressCircle({
                duration = Config.Progress.paracadute,
                label = 'Craftano PARACHUTE',
                position = 'botton',
                useWhileDead = false,
                canCancel = true,
                anim = {
                    dict = 'mini@repair',
                    clip = 'fixing_a_ped'
                },
            }) then TriggerServerEvent('parachute', Config.Item.paracadute) end
            ESX.ShowNotification("Hai craftato un PARACHUTE")
    else
        ESX.ShowNotification("Devi avere "..Config.Item.paracadute.." Iron per craftare un PARACHUTE")
    end
end