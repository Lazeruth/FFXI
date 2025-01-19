-------------------------------------------
-- Area: Lower Jeuno
-- NPC: Starlight Vendor
-- !pos -1.8517 | 0 | -8.2825 | 146
-------------------------------------------
require('modules/module_utils')
require('scripts/zones/Lower_Jeuno/Zone')
require('scripts/globals/shop') 
-------------------------------------------

local m = Module:new('starlight_vendor')

m:addOverride('xi.zones.Lower_Jeuno.Zone.onInitialize', function(zone) 
    super(zone)

    local noelle = zone:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = 'Noelle',
        look = 1424, 
        x = -1.8517, 
        y = 0, 
        z = -8.2825, 
        rotation = 146,
        widescan = 1,

        onTrade = function(player, npc, trade)
            player:printToPlayer('Enjoy the Starlight Celebration!', 0, npc:getPacketName())
        end,

        onTrigger = function(player, npc)
            player:printToPlayer("Welcome to the Starlight Shop!", 0, npc:getPacketName()) -- added welcome message

            local stock = {
                141,    1000,   -- Dream Coffer
                155,    1000,   -- Dream Stocking
                140,    1000,   -- Dream Platter
                3634,   1000,   -- Starlight Cake
                116,    1000,   -- Windurstian Tree
                115,    1000,   -- Bastokan Tree
                86,     1000,   -- San Dorian Tree
                138,    1000,   -- Jeunoan Tree
                3619,   1000,   -- San Dorian Wreath
                3620,   1000,   -- Bastokan Wreath
                3621,   1000,   -- Windurstian Wreath
                117,    1000,   -- Snowman Miner
                176,    1000,   -- Snowman Knight
                178,    1000,   -- Snowman Mage
                6690,   1000,   -- Starlight Tunes
                26728,  1000,   -- Frosty Cap
                11491,  1000,   -- Snow Bunny Hat
                15179,  1000,   -- Dream Hat
                14520,  1000,   -- Dream Robe
                10383,  1000,   -- Dream Mittens
                11968,  1000,   -- Dream Pants
                15753,  1000,   -- Dream Boots
                18864,  1000,   -- Dream Bell
            }

            xi.shop.general(player, stock) 
        end, 
    })

    utils.unused(noelle)

end)

return m
