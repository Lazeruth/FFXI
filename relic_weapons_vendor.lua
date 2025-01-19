------------------------------------------
-- Area: Lower Jeuno
-- NPC: Relic Weaopn Merchant
-- !pos -13.5987 | -0.4490 | 8.3915 | 208
------------------------------------------
-- Customizable
------------------------------------------
require('modules/module_utils')
require('scripts/zones/Lower_Jeuno/Zone')
require('scripts/globals/shop') 

local m = Module:new('relic_weapons')           -- module name that will be loaded

m:addOverride('xi.zones.Lower_Jeuno.Zone.onInitialize', function(zone) -- overriding the zone 
    super(zone)

    local ava = zone:insertDynamicEntity({      -- placing the NPC (name, look, x, y, z, rotation can be customized)
        objtype = xi.objType.NPC,
        name = 'Ava',
        look = 2255, 
        x = -13.5987, 
        y = -0.4490, 
        z = 8.3915, 
        rotation = 208,
        widescan = 1,

        onTrade = function(player, npc, trade)  -- trading to NPC
            player:printToPlayer('Meeooowwww.....', 0, npc:getPacketName())
        end,

        onTrigger = function(player, npc)       -- when selecting the NPC
            player:printToPlayer("Welcome to Ava's Relic Weapons!", 0, npc:getPacketName()) -- added welcome message

            local stock = {                     -- inventory of the NPC
                18264,  1000,   -- Spharai          lv75 relic MNK
                18270,  1000,   -- Mandau           lv75 relic RDM | THF | BRD 
                18276,  1000,   -- Excalibur        lv75 relic RDM | PLD
                18282,  1000,   -- Ragnarok         lv75 relic WAR | PLD | DRK
                18288,  1000,   -- Guttler          lv75 relic BST
                18294,  1000,   -- Bravura          Lv75 relic WAR
                18300,  1000,   -- Gungir           lv75 relic DRG
                18306,  1000,   -- Apocalypse       lv75 relic DRK
                18312,  1000,   -- Kikoku           lv75 relic NIN
                18318,  1000,   -- Amanomurakumo    lv75 relic SAM
                18324,  1000,   -- Mjolinir         lv75 relic WHM
                18330,  1000,   -- Claustrum        lv75 relic BLM | SMN
                18336,  1000,   -- Annihilator      lv75 relic RNG
                18342,  1000,   -- Gjallarhorn      lv75 relic BRD
                18348,  1000,   -- Youchinoyumi     lv75 relic RNG | SAM
            }

            xi.shop.general(player, stock) 
        end, 
    })

    utils.unused(ava)                           -- haven't determined if this is actually needed, still experimenting

end)

return m
