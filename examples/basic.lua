AddEventHandler('playerConnecting', function(name, kickreason, deferral)    
    deferral.defer()

    Wait(1000)
    
    CreateThread(function()
        local breakLoop = false
        while true do
            local card = DeferralCards.Card:Create({
                body = {
                    DeferralCards.Container:Create({
                        items = {
                            DeferralCards.CardElement:Image({
                                url = 'https://logos-world.net/wp-content/uploads/2021/03/FiveM-Logo.png',
                                size = 'large',
                                horizontalAlignment = 'center'
                            }),
                            DeferralCards.CardElement:TextBlock({
                                text = ('Welcome, %s'):format(name),
                                weight = 'Light',
                                size = 'large',
                                horizontalAlignment = 'center'
                            }),
                            DeferralCards.Container:ActionSet({
                                actions = {
                                    DeferralCards.Action:Submit({
                                        id = 'submit_join',
                                        title = 'Join'
                                    })
                                }
                            })
                        },
                        isVisible = true
                    })
                }
            })
    
            deferral.presentCard(card, function(pData, pRawData)
                if pData.submitId == 'submit_join' then
                    deferral.update('✅ Connecting to server...')
                    Wait(1000)
                    deferral.done()
                    print(('%s is connecting to the server'):format(name))
                    breakLoop = true
                end
            end)

            if breakLoop then break end
    
            Wait(1000)
        end
    end)
end)