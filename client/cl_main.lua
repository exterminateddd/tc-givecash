local function cashMenu(targetId)
    local input = exports['qb-input']:ShowInput({
        header = "Give Cash",
        submitText = "Give Cash",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = '$ amount'
            }
        }
    })
    if input then
        if not input.amount then return end
        TriggerServerEvent("tc-giveCash:server:charge", targetId, input.amount)
    end
end

CreateThread(function()
    exports['qb-target']:AddGlobalPlayer({
        options = {
            { 
                action = function(entity)
                    cashMenu(NetworkGetNetworkIdFromEntity(entity))
                end,
                icon = "fas fa-money",
                label = "Give Cash To Nearby Player",
            },
        },
        distance = 3.0 
    })
end)



