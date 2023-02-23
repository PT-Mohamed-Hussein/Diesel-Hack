local QBCore = exports['qb-core']:GetCoreObject()

local HiestsInfo = {}

local function GenerateRandomString (length)
    local mystring = ""
    for i = 1, length do
        mystring = mystring .. string.char(math.random(97, 122))
    end
    return mystring
end


Citizen.CreateThread (function ()
    --while true do 
        for i, v in pairs (Config.Heists) do 
            HiestsInfo[v] = {}
            HiestsInfo[v].username = GenerateRandomString(Config.UsernameLength)
            HiestsInfo[v].password = GenerateRandomString(Config.PasswordLength)
            if Config.Debug then 
                print (v .. ' Username : ', HiestsInfo[v].username)
                print (v .. ' Password : ', HiestsInfo[v].password)
            end
        end
        --Citizen.Wait (1800000) -- 30 minutes
    --end
end)

QBCore.Functions.CreateCallback ('Diesel-Hack:Server:GetRobberyInfo', function (source, cb, robbery)
    if (HiestsInfo[robbery]) then 
        cb (HiestsInfo[robbery].username, HiestsInfo[robbery].password)
    else
        HiestsInfo[robbery] = {}
        HiestsInfo[robbery].username = GenerateRandomString(Config.UsernameLength)
        HiestsInfo[robbery].password = GenerateRandomString(Config.PasswordLength)
        
        if Config.Debug then 
            print (robbery .. ' Username : ', HiestsInfo[robbery].username)
            print (robbery .. ' Password : ', HiestsInfo[robbery].password)
        end

        cb (HiestsInfo[robbery].username, HiestsInfo[robbery].password)
    end
end)

function GetRobberyHackInfo (robbery)
    return HiestsInfo[robbery].username, HiestsInfo[robbery].password
end

exports('GetHackInfo', GetRobberyHackInfo)

RegisterNetEvent('Diesel-Hack:Server:ChangeRobberyInfo', function (robbery)
    if (HiestsInfo[robbery]) then
        HiestsInfo[robbery].username = GenerateRandomString(Config.UsernameLength)
        HiestsInfo[robbery].password = GenerateRandomString(Config.PasswordLength)   

        if Config.Debug then 
            print (robbery .. ' Username : ', HiestsInfo[robbery].username)
            print (robbery .. ' Password : ', HiestsInfo[robbery].password)
        end 

    else
        HiestsInfo[robbery] = {}
        HiestsInfo[robbery].username = GenerateRandomString(Config.UsernameLength)
        HiestsInfo[robbery].password = GenerateRandomString(Config.PasswordLength)
        
        if Config.Debug then 
            print (robbery .. ' Username : ', HiestsInfo[robbery].username)
            print (robbery .. ' Password : ', HiestsInfo[robbery].password)
        end
        
    end
end)