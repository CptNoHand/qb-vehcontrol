local QBCore = exports['qb-core']:GetCoreObject()
local veh = GetVehiclePedIsIn(PlayerPedId(), true)

RegisterKeyMapping('vc', 'Vehicle controls', 'keyboard', 'K')


RegisterCommand("vc", function(source, args, raw)
    local veh = GetVehiclePedIsIn(PlayerPedId(), true)
    if IsPedInVehicle(PlayerPedId(), veh) then
    TriggerEvent("qb-vehcontrol:MainMenu")
    else
        QBCore.Functions.Notify('You are not in a vehicle', 'error')
    
    end
end)
    
 RegisterNetEvent('qb-vehcontrol:MainMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            header = "Car Controls",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },

        {
            header = "Engine On/Off",
            txt = "",
            params = {
                event = "vehiclekeys:client:ToggleEngine", --triggers to qb-vehiclekeys
                args = {
                    number = 1,
                }
            }
        },
        {
            header = "Open/Close Doors",
            txt = "",
            params = {
                event = "qb-vehcontrol:DoorMenu",
                args = {
                    number = 2,
                }
            }
        },

        {
            header = "Change Seats",
            txt = "",
            params = {
                event = "qb-vehcontrol:SeatMenu",
                args = {
                    number = 3,
                }
            }
        },
    })
end)



RegisterNetEvent('qb-vehcontrol:DoorMenu', function(data)

     exports['qb-menu']:openMenu({
        {
            header = "Door Options",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },

        {
            header = "Front Left",
            txt = "",
            params = {
                event = "qb-vehcontrol:LeftDoor", --triggers to qb-vehiclekeys
                args = {
                    number = 0,
                }
            }
        },
        {
            header = "Front Right",
            txt = "",
            params = {
                event = "qb-vehcontrol:RightDoor",
                args = {
                    number = 1,
                }
            }
        },

        {
            header = "Back Left",
            txt = "",
            params = {
                event = "qb-vehcontrol:BackLeft",
                args = {
                    number = -1,
                }
            }
        },
        {
            header = "Back Right",
            txt = "",
            params = {
                event = "qb-vehcontrol:BackRight",
                args = {
                    number = 4,
                }
            }
        },
        {
            header = "Hood",
            txt = "",
            params = {
                event = "qb-vehcontrol:Hood",
                id = 5,
                args = {
                    number = 5,
                }
            }
        },
        {
            header = "Trunk",
            txt = "",
            params = {
                event = "qb-vehcontrol:Trunk",
                args = {
                    number = 6,
                }
            }
        },
        {
            header = "<< Back to menu",
            txt = "",
            params = {
                event = "qb-vehcontrol:MainMenu",
                args = {
                    number = 6,
                }
            }
        },
    })
    end)


    RegisterNetEvent('qb-vehcontrol:SeatMenu', function(data)

        exports['qb-menu']:openMenu({
           {
               header = "Door Options",
               isMenuHeader = true, -- Set to true to make a nonclickable title
           },
   
           {
               header = "Front Left Seat",
               txt = "",
               params = {
                   event = "qb-vehcontrol:SeatFL", --triggers to qb-vehiclekeys
                   args = {
                       number = 0,
                   }
               }
           },
           {
               header = "Front Right Seat",
               txt = "",
               params = {
                   event = "qb-vehcontrol:SeatFR",
                   args = {
                       number = 1,
                   }
               }
           },
   
           {
               header = "Back Left",
               txt = "",
               params = {
                   event = "qb-vehcontrol:SeatBL",
                   args = {
                       number = -1,
                   }
               }
           },
           {
               header = "Back Right",
               txt = "",
               params = {
                   event = "qb-vehcontrol:SeatBR",
                   args = {
                       number = 4,
                   }
               }
           },
           {
               header = "<< Back to menu",
               txt = "",
               params = {
                   event = "qb-vehcontrol:MainMenu",
                   args = {
                       number = 6,
                   }
               }
           },
       })
       end)

RegisterNetEvent('qb-vehcontrol:LeftDoor', function(data)
    if veh ~= 0 then
        if GetVehicleDoorAngleRatio(veh, 0) > 0.0 then
            SetVehicleDoorShut(veh, 0, false)
        else
            SetVehicleDoorOpen(veh, 0, false, false)
        end
    TriggerEvent("qb-vehcontrol:DoorMenu")
    end
end)

RegisterNetEvent('qb-vehcontrol:RightDoor', function(data)
    if veh ~= 0 then
        if GetVehicleDoorAngleRatio(veh, 1) > 0.0 then
            SetVehicleDoorShut(veh, 1, false)
        else
            SetVehicleDoorOpen(veh, 1, false, false)
        end
    TriggerEvent("qb-vehcontrol:DoorMenu")
    end
end)
RegisterNetEvent('qb-vehcontrol:BackRight', function(data)
    if veh ~= 0 then
        if GetVehicleDoorAngleRatio(veh, 3) > 0.0 then
            SetVehicleDoorShut(veh, 3, false)
        else
            SetVehicleDoorOpen(veh, 3, false, false)
        end
    TriggerEvent("qb-vehcontrol:DoorMenu")
    end
end)
RegisterNetEvent('qb-vehcontrol:BackLeft', function(data)
    if veh ~= 0 then
        if GetVehicleDoorAngleRatio(veh, 2) > 0.0 then
            SetVehicleDoorShut(veh, 2, false)
        else
            SetVehicleDoorOpen(veh, 2, false, false)
        end
    TriggerEvent("qb-vehcontrol:DoorMenu")
    end
end)

RegisterNetEvent('qb-vehcontrol:Trunk', function(data)
    if veh ~= 0 then
        if GetVehicleDoorAngleRatio(veh, 5) > 0.0 then
            SetVehicleDoorShut(veh, 5, false)
        else
            SetVehicleDoorOpen(veh, 5, false, false)
        end
    TriggerEvent("qb-vehcontrol:DoorMenu")
    end
end)

RegisterNetEvent('qb-vehcontrol:Hood', function(data)
    if veh ~= 0 then
        if GetVehicleDoorAngleRatio(veh, 4) > 0.0 then
            SetVehicleDoorShut(veh, 4, false)
        else
            SetVehicleDoorOpen(veh, 4, false, false)
        end
    TriggerEvent("qb-vehcontrol:DoorMenu")
    end
end)



RegisterNetEvent('qb-vehcontrol:SeatFL', function(data)
    local Veh = GetVehiclePedIsIn(PlayerPedId())
    local EmptySeat = IsVehicleSeatFree(Veh, -1)
    if EmptySeat then
        SetPedIntoVehicle(PlayerPedId(), Veh, -1)
    end
    TriggerEvent("qb-vehcontrol:SeatMenu")
end)

RegisterNetEvent('qb-vehcontrol:SeatFR', function(data)
    local Veh = GetVehiclePedIsIn(PlayerPedId())
    local EmptySeat = IsVehicleSeatFree(Veh, 0)
    if EmptySeat then
        SetPedIntoVehicle(PlayerPedId(), Veh, 0)
    end
    TriggerEvent("qb-vehcontrol:SeatMenu")
end)

RegisterNetEvent('qb-vehcontrol:SeatBL', function(data)
    local Veh = GetVehiclePedIsIn(PlayerPedId())
    local EmptySeat = IsVehicleSeatFree(Veh, 1)
    if EmptySeat then
        SetPedIntoVehicle(PlayerPedId(), Veh, 1)
    end
    TriggerEvent("qb-vehcontrol:SeatMenu")
end)

RegisterNetEvent('qb-vehcontrol:SeatBR', function(data)
    local Veh = GetVehiclePedIsIn(PlayerPedId())
    local EmptySeat = IsVehicleSeatFree(Veh, 2)
    if EmptySeat then
        SetPedIntoVehicle(PlayerPedId(), Veh, 2)
    end
    TriggerEvent("qb-vehcontrol:SeatMenu")
end)
    