function DrawText3Ds(x,y,z, text)
  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  
  SetTextScale(0.35, 0.35)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextCentre(1)
  AddTextComponentString(text)
  DrawText(_x,_y)
  local factor = (string.len(text)) / 370
  DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

HT = nil

Citizen.CreateThread(function()
    while HT == nil do
        TriggerEvent('HT_base:getBaseObjects', function(obj) HT = obj end)
        Citizen.Wait(0)
    end
end)


function openPolitiMenu()
    local elements = {
        { label = "Tag våben", value = "faa" },
        { label = "Fjern våben", value = "fjern" },
        { label = "Monteringer", value = "attach" },
        { label = "Fyld ammunition", value = "ammo"},
        { label = "Tag vest", value = "vest"},
    }
    HT.UI.Menu.Open('default', GetCurrentResourceName(), "xmq_vabenskab",
        {
            title    = "Politiets våbenskab",
            align    = "right",
            elements = elements
        },
    function(data, menu)
        menu = menu
        if(data.current.value == 'faa') then
            menu.close()
            openPolitiMenu9()
        end
        if(data.current.value == 'fjern') then
            menu.close()
            openPolitiMenu2()
        end
        if(data.current.value == 'attach') then
            menu.close()
            openPolitiMenu4()
        end
        if(data.current.value == 'ammo') then
            SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), 250)
            SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), 250)
            SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), 250)
            SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRFILE"), 250)
            exports['mythic_notify']:SendAlert('inform', "Fyldte ammo", 2000)
        end
        if(data.current.value == 'vest') then
            SetPedArmour(GetPlayerPed(-1), 100)
            SetPedComponentVariation(GetPlayerPed(-1), 9, 27, 5, 0)
            exports['mythic_notify']:SendAlert('inform', "Modtog vest", 2000)
        end
    end, function(data, menu)
        menu.close()
    end)
end

function openPolitiMenu1()
  local elements = {
      { label = "Betjent", value = "betjent" },
      { label = "Elev", value = "elev" },
      { label = "AKS 1", value = "aks" },
      { label = "AKS 2", value = "aks2"},
      { label = "Sniper", value = "sniper"},
      { label = "Tilbage", value = "back"},
  }
  HT.UI.Menu.Open('default', GetCurrentResourceName(), "xmq_vabenskab",
      {
          title    = "Våbenskab | Loadouts",
          align    = "right",
          elements = elements
      },
  function(data, menu)
      menu = menu
      if(data.current.value == 'betjent') then
          RemoveAllPedWeapons(GetPlayerPed(-1), true)
          GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), 250, false, false)
          GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 1, false, false)
          GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"), 1, false, false)
          GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1, false, false)
          exports['mythic_notify']:SendAlert('inform', "Modtog loadoutet Politibetjent", 2000)
      end
      if(data.current.value == 'elev') then
          RemoveAllPedWeapons(GetPlayerPed(-1), true)
          GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 1, false, false)
          GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"), 1, false, false)
          GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1, false, false)
          exports['mythic_notify']:SendAlert('inform', "Modtog loadoutet Politielev", 2000)
      end
      if(data.current.value == 'aks') then
          RemoveAllPedWeapons(GetPlayerPed(-1), true)
          GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), 250, false, false)
          GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), 250, false, false)
          GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 1, false, false)
          GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"), 1, false, false)
          GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1, false, false)
          exports['mythic_notify']:SendAlert('inform', "Modtog loadoutet AKS", 2000)
      end
      if(data.current.value == 'aks2') then
        RemoveAllPedWeapons(GetPlayerPed(-1), true)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), 250, false, false)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), 250, false, false)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), 250, false, false)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 1, false, false)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"), 1, false, false)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1, false, false)
        exports['mythic_notify']:SendAlert('inform', "Modtog loadoutet AKS 2", 2000)
    end
    if(data.current.value == 'sniper') then
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), 250, false, false)
        exports['mythic_notify']:SendAlert('inform', "Modtog loadoutet Sniper", 2000)
    end
    if(data.current.value == 'back') then
      menu.close()
      openPolitiMenu()
    end
  end, function(data, menu)
      menu.close()
  end)
end

function openPolitiMenu2()
    local elements = {
        { label = "Alle våben", value = "alle" },
        { label = "Tjenestepistol", value = "tjeneste" },
        { label = "Strømpistol", value = "stungun" },
        { label = "SMG", value = "smg" },
        { label = "Karbin-riffel", value = "karbin" },
        { label = "Sniper-riffel", value = "sniper" },
        { label = "Politistav", value = "stav" },
        { label = "Lommelygte", value = "lomme" },
        { label = "Tilbage", value = "back" },

    }
    HT.UI.Menu.Open('default', GetCurrentResourceName(), "xmq_vabenskab",
        {
            title    = "Våbenskab | Fjern våben",
            align    = "right",
            elements = elements
        },
    function(data, menu)
        menu = menu
        if(data.current.value == 'alle') then
            RemoveAllPedWeapons(GetPlayerPed(-1), true)
        end
        if(data.current.value == 'tjeneste') then
            RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"))
            exports['mythic_notify']:SendAlert('inform', "Fjernede tjenestepistol", 2000)
        end
        if(data.current.value == 'stungun') then
            RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"))
            exports['mythic_notify']:SendAlert('inform', "Fjernede strømpistol", 2000)
        end
        if(data.current.value == 'smg') then
            RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"))
            exports['mythic_notify']:SendAlert('inform', "Fjernede SMG", 2000)
        end
        if(data.current.value == 'karbin') then
            RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"))
            exports['mythic_notify']:SendAlert('inform', "Fjernede karbinriffel", 2000)
        end
        if(data.current.value == 'sniper') then
            RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"))
            exports['mythic_notify']:SendAlert('inform', "Fjernede sniperriffel", 2000)
        end
        if(data.current.value == 'stav') then
            RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"))
            exports['mythic_notify']:SendAlert('inform', "Fjernede politistav", 2000)
        end
        if(data.current.value == 'lomme') then
            RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"))
            exports['mythic_notify']:SendAlert('inform', "Fjernede lommelygte", 2000)
        end
        if(data.current.value == 'back') then
            menu.close()
            openPolitiMenu()
        end
    end, function(data, menu)
        menu.close()
    end)
  end

  function openPolitiMenu4()
    local elements = {
        { label = "Tjenestepistol", value = "tjeneste" },
        { label = "SMG", value = "smg" },
        { label = "Karbin-riffel", value = "karbin" },
        { label = "Sniper-riffel", value = "sniper" },
        { label = "Tilbage", value = "back" },

    }
    HT.UI.Menu.Open('default', GetCurrentResourceName(), "xmq_vabenskab",
        {
            title    = "Våbenskab | Monteringer",
            align    = "right",
            elements = elements
        },
    function(data, menu)
        menu = menu
        if(data.current.value == 'tjeneste') then
            menu.close()
            openPolitiMenu5()
        end
        if(data.current.value == 'smg') then
            menu.close()
            openPolitiMenu6()
        end
        if(data.current.value == 'karbin') then
            menu.close()
            openPolitiMenu7()
        end
        if(data.current.value == 'sniper') then
            menu.close()
            openPolitiMenu8()
        end
        if(data.current.value == 'back') then
            menu.close()
            openPolitiMenu()
        end
    end, function(data, menu)
        menu.close()
    end)
  end

  function openPolitiMenu5()
    local elements = {
        { label = "Fjern alle", value = "fjern" },
        { label = "Lygte", value = "flashlight" },
        { label = "Tilbage", value = "back" },

    }
    HT.UI.Menu.Open('default', GetCurrentResourceName(), "xmq_vabenskab",
        {
            title    = "Våbenskab | Tjenestepistol",
            align    = "right",
            elements = elements
        },
    function(data, menu)
        menu = menu
        if(data.current.value == 'fjern') then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))
        end
        if(data.current.value == 'flashlight') then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))
        end
        if(data.current.value == 'back') then
            menu.close()
            openPolitiMenu4()
        end
    end, function(data, menu)
        menu.close()
    end)
  end

function openPolitiMenu6()
    local elements = {
        { label = "Tilføj alle", value = "alle" },
        { label = "Fjern alle", value = "fjern" },
        { label = "Lygte", value = "flashlight" },
        { label = "Sigtekorn", value = "scope" },
        { label = "Lyddæmper", value = "silencer" },
        { label = "Tilbage", value = "back" },

    }
    HT.UI.Menu.Open('default', GetCurrentResourceName(), "xmq_vabenskab",
        {
            title    = "Våbenskab | SMG",
            align    = "right",
            elements = elements
        },
    function(data, menu)
        menu = menu
        if(data.current.value == 'fjern') then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_02")) -- Scope
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_AR_FLSH")) -- Flashlight
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_PI_SUPP")) -- Silencer
        end
        if(data.current.value == 'flashlight') then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))
        end
        if(data.current.value == 'alle') then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_02"))
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_PI_SUPP"))
        end
        if(data.current.value == 'scope') then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_02"))
        end
        if(data.current.value == 'silencer') then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_PI_SUPP"))
        end
        if(data.current.value == 'back') then
            menu.close()
            openPolitiMenu4()
        end
    end, function(data, menu)
        menu.close()
    end)
  end

  function openPolitiMenu7()
    local elements = {
        { label = "Tilføj alle", value = "alle" },
        { label = "Fjern alle", value = "fjern" },
        { label = "Lygte", value = "flashlight" },
        { label = "Sigtekorn", value = "scope" },
        { label = "Lyddæmper", value = "silencer" },
        { label = "Tilbage", value = "back" },

    }
    HT.UI.Menu.Open('default', GetCurrentResourceName(), "xmq_vabenskab",
        {
            title    = "Våbenskab | Karbin-riffel",
            align    = "right",
            elements = elements
        },
    function(data, menu)
        menu = menu
        if(data.current.value == 'fjern') then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM")) -- Scope
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH")) -- Flashlight
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP")) -- Silencer
        end
        if(data.current.value == 'flashlight') then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))
        end
        if(data.current.value == 'alle') then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))
        end
        if(data.current.value == 'scope') then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))
        end
        if(data.current.value == 'silencer') then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))
        end
        if(data.current.value == 'back') then
            menu.close()
            openPolitiMenu4()
        end
    end, function(data, menu)
        menu.close()
    end)
  end

  function openPolitiMenu8()
    local elements = {
        { label = "Tilføj alle", value = "alle" },
        { label = "Fjern alle", value = "fjern" },
        { label = "Sigtekorn", value = "scope" },
        { label = "Lyddæmper", value = "silencer" },
        { label = "Tilbage", value = "back" },

    }
    HT.UI.Menu.Open('default', GetCurrentResourceName(), "xmq_vabenskab",
        {
            title    = "Våbenskab | Sniper-riffel",
            align    = "right",
            elements = elements
        },
    function(data, menu)
        menu = menu
        if(data.current.value == 'fjern') then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MAX")) -- Scope
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02")) -- Silencer
        end
        if(data.current.value == 'alle') then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MAX"))
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
        end
        if(data.current.value == 'scope') then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MAX"))
        end
        if(data.current.value == 'silencer') then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
        end
        if(data.current.value == 'back') then
            menu.close()
            openPolitiMenu4()
        end
    end, function(data, menu)
        menu.close()
    end)
  end

  function openPolitiMenu9()
    local elements = {
        { label = "Vælg selv", value = "vealg" },
        { label = "Loadouts", value = "load" },
        { label = "Tilbage", value = "back" },

    }
    HT.UI.Menu.Open('default', GetCurrentResourceName(), "xmq_vabenskab",
        {
            title    = "Våbenskab | Tag våben",
            align    = "right",
            elements = elements
        },
    function(data, menu)
        menu = menu
        if(data.current.value == 'load') then
            menu.close()
            openPolitiMenu1()
        end
        if(data.current.value == 'vealg') then
            menu.close()
            openPolitiMenu10()
        end
        if(data.current.value == 'back') then
            menu.close()
            openPolitiMenu()
        end
    end, function(data, menu)
        menu.close()
    end)
  end

function openPolitiMenu10()
    local elements = {
        { label = "Tjenestepistol", value = "tjeneste" },
        { label = "Strømpistol", value = "stungun" },
        { label = "SMG", value = "smg" },
        { label = "Karbin-riffel", value = "karbin" },
        { label = "Sniper-riffel", value = "sniper" },
        { label = "Politistav", value = "stav" },
        { label = "Lommelygte", value = "lomme" },
        { label = "Tilbage", value = "back" },

    }
    HT.UI.Menu.Open('default', GetCurrentResourceName(), "xmq_vabenskab",
        {
            title    = "Våbenskab | Vælg selv",
            align    = "right",
            elements = elements
        },
    function(data, menu)
        menu = menu
        if(data.current.value == 'tjeneste') then
            GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), 250, false, false)
            exports['mythic_notify']:SendAlert('inform', "Modtog tjenestepistol", 2000)
        end
        if(data.current.value == 'stungun') then
            GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 250, false, false)
            exports['mythic_notify']:SendAlert('inform', "Modtog strømpistol", 2000)
        end
        if(data.current.value == 'smg') then
            GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), 250, false, false)
            exports['mythic_notify']:SendAlert('inform', "Modtog SMG", 2000)
        end
        if(data.current.value == 'karbin') then
            GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), 250, false, false)
            exports['mythic_notify']:SendAlert('inform', "Modtog karbinriffel", 2000)
        end
        if(data.current.value == 'sniper') then
            GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), 250, false, false)
            exports['mythic_notify']:SendAlert('inform', "Modtog sniperriffel", 2000)
        end
        if(data.current.value == 'stav') then
            GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"), 1, false, false)
            exports['mythic_notify']:SendAlert('inform', "Modtog politistav", 2000)
        end
        if(data.current.value == 'lomme') then
            GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1, false, false)
            exports['mythic_notify']:SendAlert('inform', "Modtog lommelygte", 2000)
        end
        if(data.current.value == 'back') then
            menu.close()
            openPolitiMenu()
        end
    end, function(data, menu)
        menu.close()
    end)
end

local stop = false 

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 452.40197753906,-980.00030517578,30.68931388855) < 2 and stop == false then
            DrawText3Ds(452.40197753906+0.5,-980.00030517578,30.68931388855+0.2, "Tryk ~r~[E]~s~ for at åbne våbenskabet")
            if IsControlJustPressed(1, 38) then
                HT.TriggerServerCallback("vabenskab:tjekperm", function(cb)
                    if cb ~= nil then
                        if cb == true then
                            openPolitiMenu()
                            stop = true
                        end
                    end
                end)
            end
        elseif GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 452.24136352539,-979.94482421875,30.68931388855) > 2 then
            HT.UI.Menu.Close('default', GetCurrentResourceName(), "xmq_vabenskab")
            stop = false
            Citizen.Wait(50)
        end
        if IsControlJustPressed(0,177) then
            stop = false
        end
    end
end)

Citizen.CreateThread(function()
    modelHash = GetHashKey("csb_cop")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
       	Wait(1)
    end
    created_ped = CreatePed(5, modelHash ,454.07373046875,-979.95780761719,30.689319610596-1, 265.0, false, true)
    SetEntityHeading(created_ped,80.0)
	FreezeEntityPosition(created_ped, true)
	SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)

    TaskPlayAnim(created_ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0) -- Ped Laver Anim
    SetPedComponentVariation(created_ped, 3, 131, 8, 2) -- Trøje
    SetPedComponentVariation(created_ped, 6, 25, 0, 2) -- Sko
    SetPedComponentVariation(created_ped, 4, 9, 7, 2) -- Arme
    SetPedComponentVariation(created_ped, 3, 19, 0, 2) -- Bukser
    SetPedComponentVariation(created_ped, 1, 121, 0, 2) -- Ansigt
    SetPedComponentVariation(created_ped, 0, 1, 0, 2) -- Ansigt
    SetPedComponentVariation(created_ped, 2, 3, 3, 2) -- Hår
end)

function vabenanimation()
end

RegisterCommand("cbt", function()
    GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_PI_SUPP"))
    Citizen.Wait(1)
    if HasPedGotWeaponComponent(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_PI_SUPP")) then
        exports['mythic_notify']:SendAlert('success', "Modtog component", 2000)
    end
end)