AddEventHandler('playerConnecting', function(name, kickreason, deferral)
    deferral.defer()
    Wait(50)

    CreateThread(function()
        local breakLoop = false
        while true do

            local cardOne = DeferralCards.Card:Create({
                body = {
                    DeferralCards.CardElement:TextBlock({
                        size = 'ExtraLarge',
                        weight = 'Bolder',
                        text = 'Server password?!'
                    }),
                    DeferralCards.CardElement:TextBlock({
                        text = "That's right! You have to enter a PASSWORD to connect to this server...",
                        wrap = true
                    }),
                    DeferralCards.Input:Text({
                        id = 'password',
                        title = '',
                        placeholder = 'better enter one now'
                    }),
                    DeferralCards.CardElement:Image({
                        url = 'http://images.amcnetworks.com/ifccenter.com/wp-content/uploads/2019/04/pulpfic_1280.jpg',
                        altText = ''
                    }),
                    DeferralCards.Container:ActionSet({
                        actions = {
                            DeferralCards.Action:Submit({
                                title = 'Sure...'
                            }),
                            DeferralCards.Action:ShowCard({
                                title = 'YOU WISH!!!!!!',
                                card = DeferralCards.Card:Create({
                                    body = {
                                        DeferralCards.CardElement:Image({
                                            url = 'https://i.imgur.com/YjMR0E6.jpg',
                                            altText = ''
                                        })
                                    }
                                })
                            })
                        }
                    })
                }
            })
            deferral.presentCard(cardOne, function(data, rawData)
                local cardTwo = DeferralCards.Card:Create({
                    body = {
                        DeferralCards.Container:Create({
                            items = {
                                DeferralCards.CardElement:TextBlock({
                                    size = 'Medium',
                                    weight = 'Bolder',
                                    text = 'Publish Adaptive Card schema'
                                }),
                                DeferralCards.Container:ColumnSet({
                                    columns = {
                                        DeferralCards.Container:Column({
                                            items = {
                                                DeferralCards.CardElement:Image({
                                                    style = 'Person',
                                                    url = 'https://pbs.twimg.com/profile_images/3647943215/d7f12830b3c17a5a9e4afcc370e3a37e_400x400.jpeg',
                                                    size = 'Small'
                                                })
                                            },
                                            width = 'auto'
                                        }),
                                        DeferralCards.Container:Column({
                                            items = {
                                                DeferralCards.CardElement:TextBlock({
                                                    weight = 'Bolder',
                                                    text = 'Matt Hidinger',
                                                    wrap = true
                                                }),
                                                DeferralCards.CardElement:TextBlock({
                                                    spacing = 'None',
                                                    text = 'Created {{DATE(2017-02-14T06:08:39Z,SHORT)}}',
                                                    isSubtle = true,
                                                    wrap = true
                                                })
                                            },
                                            width = 'stretch'
                                        })
                                    }
                                })
                            }
                        }),
                        DeferralCards.Container:Create({
                            items = {
                                DeferralCards.CardElement:TextBlock({
                                    text = 'Now that we have defined the main rules and features of the format, we need to produce a schema and publish it to GitHub. The schema will be the starting point of our reference documentation.',
                                    wrap = true
                                }),
                                DeferralCards.Container:FactSet({
                                    facts = {
                                        DeferralCards.Container:Fact({
                                            title = 'Board:',
                                            value = 'Adaptive Card'
                                        }),
                                        DeferralCards.Container:Fact({
                                            title = 'List:',
                                            value = 'Backlog'
                                        }),
                                        DeferralCards.Container:Fact({
                                            title = 'Assigned to:',
                                            value = 'Matt Hidinger'
                                        }),
                                        DeferralCards.Container:Fact({
                                            title = 'Due date:',
                                            value = 'Not set'
                                        })
                                    }
                                })
                            }
                        })
                    },
                    actions = {
                        DeferralCards.Action:ShowCard({
                            title = 'Set due date',
                            card = DeferralCards.Card:Create({
                                body = {
                                    DeferralCards.Input:Date({
                                        id = 'dueDate'
                                    }),
                                    DeferralCards.Input:Text({
                                        title = 'comment',
                                        placeholder = 'Add a comment',
                                        isMultiline = true
                                    })
                                },
                                actions = {
                                    DeferralCards.Action:Submit({
                                        title = 'OK',
                                        url = 'http://adaptivecards.io'
                                    })
                                }
                            })
                        }),
                        DeferralCards.Action:Submit({
                            title = 'View',
                            url = 'http://adaptivecards.io'
                        })
                    }
                })
                deferral.presentCard(cardTwo, function(_, rawData2)
                    deferral.done('you suck actually for entering the password: ' ..
                        data.password .. ' and data like ' .. rawData2)
                    breakLoop = true
                end)
            end)
            if breakLoop then break end
    
            Wait(1000)
        end
    end)
end)
