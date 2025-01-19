------------------------------------------
-- Area: Lower Jeuno
-- NPC: Mythic Weaopn Merchant
-- !pos -12.8208 | -0.4490 | 6.6478 | 238
------------------------------------------
-- Customizable
------------------------------------------
require('modules/module_utils')
require('scripts/zones/Lower_Jeuno/Zone')
require('scripts/globals/shop') 

local m = Module:new('mythic_weapons')              -- module name that will be loaded

m:addOverride('xi.zones.Lower_Jeuno.Zone.onInitialize', function(zone) -- overriding the zone 
    super(zone)

    local twig = zone:insertDynamicEntity({         -- placing the NPC (name, look, x, y, z, rotation can be customized)
        objtype = xi.objType.NPC,
        name = 'Twig',
        look = 2197, 
        x = -12.8208, 
        y = -0.4490, 
        z = 6.6478, 
        rotation = 238,
        widescan = 1,

        onTrade = function(player, npc, trade)      -- trading to NPC
            player:printToPlayer('Meow...', 0, npc:getPacketName())
        end,

        onTrigger = function(player, npc)           -- when selecting the NPC
            player:printToPlayer("Welcome to Twig's Mythic Weapons!", 0, npc:getPacketName()) -- added welcome message

            local stock = {                         -- inventory of the NPC
               18989,   1000,   -- Terpsichore   lv75 DNC
               18990,   1000,   -- Tupsimati     lv75 SCH
               18991,   1000,   -- Conquerer     lv75 WAR
               18992,   1000,   -- Glanzfaust    lv75 MNK
               18993,   1000,   -- Yagrush       lv75 WHM
               18994,   1000,   -- Laevateinn    lv75 BLM 
               18995,   1000,   -- Murgleis      lv75 RDM
               18996,   1000,   -- Vajra         lv75 THF
               18997,   1000,   -- Burtgang      lv75 PLD
               18998,   1000,   -- Liberator     lv75 DRK
               18999,   1000,   -- Aymur         lv75 BST
               19000,   1000,   -- Carnwenhan    lv75 BRD
               19001,   1000,   -- Gastraphetes  lv75 RNG
               19002,   1000,   -- Kogarasumaru  lv75 SAM
               19003,   1000,   -- Nagi          lv75 NIN
               19004,   1000,   -- Ryuohige      lv75 DRG
               19005,   1000,   -- Nirvana       lv75 SMN
               19006,   1000,   -- Tizona        lv75 BLU
               19007,   1000,   -- Death Penalty lv75 COR
               19008,   1000,   -- Kenkonken     lv75 PUP
            }

            xi.shop.general(player, stock) 
        end, 
    })

    utils.unused(twig)                              -- haven't determined if this is actually needed, still experimenting

end)

return m
