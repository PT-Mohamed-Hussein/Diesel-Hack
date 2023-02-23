local QBCore = exports['qb-core']:GetCoreObject()

local MinigameActive = false
local Result = nil

Begin = function(robbery)
    if MinigameActive then return end

    MinigameActive = true
    QBCore.Functions.TriggerCallback ('Diesel-Hack:Server:GetRobberyInfo', function (username, password)
        TriggerScreenblurFadeIn(800)
        SetNuiFocus(true, true)
        SendNUIMessage({action = 'open', username = username, password = password})
    end, robbery)
    
    while MinigameActive do
        Citizen.Wait(100)
    end

    if Result == 'success' then 
        TriggerServerEvent('Diesel-Hack:Server:ChangeRobberyInfo', robbery)
    end
    return Result
end

exports('Begin', Begin)

RegisterCommand('testhack', function()
    local success = Begin('lap')
end)

RegisterNUICallback('HackFinished', function(data, cb)
    TriggerScreenblurFadeOut(800)
    Result = data.status
    MinigameActive = false
    SetNuiFocus(false, false)
    cb('ok')
end)