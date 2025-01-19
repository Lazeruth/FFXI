------------------------------------------
-- Area: Lower Jeuno
-- NPC: Sky God Gear | Random Cool Gear
-- !pos -15.8041 | -0.4490 | 8.8100 | 185
------------------------------------------
-- Customizable
------------------------------------------
require('modules/module_utils')
require('scripts/zones/Lower_Jeuno/Zone')
require('scripts/globals/shop') 

local m = Module:new('louis_knick_knacks')              -- module name that will be loaded

m:addOverride('xi.zones.Lower_Jeuno.Zone.onInitialize', function(zone) -- overriding the zone 
    super(zone)

    local louis = zone:insertDynamicEntity({            -- placing the NPC (name, look, x, y, z, rotation can be customized)
        objtype = xi.objType.NPC,
        name = 'Louis',
        look = 2197, 
        x = -15.8041, 
        y = -0.4490, 
        z = 8.8100, 
        rotation = 185,
        widescan = 1,

        onTrade = function(player, npc, trade)          -- trading to NPC
            player:printToPlayer('Rawrrr...', 0, npc:getPacketName())
        end,

        onTrigger = function(player, npc)               -- when selecting the NPC
            player:printToPlayer("Welcome to Louis's Knick-Knacks!", 0, npc:getPacketName()) -- added welcome message

            local stock = {                             -- inventory of the NPC
                18852,  1000,   -- Octave Club
                19163,  1000,   -- Nightfall
                17745,  1000,   -- Hofud
                16555,  1000,   -- Ridill
                18121,  1000,   -- Valkyrie's Fork
                12296,  1000,   -- Genbu's Shield
                12434,  1000,   -- Genbu's Kabuto
                18198,  1000,   -- Byakko's Axe
                12818,  1000,   -- Byakko's Haidate
                17659,  1000,   -- Seiryu's Sword
                12690,  1000,   -- Seiryu's Kote
                18043,  1000,   -- Suzaku's Scythe
                12946,  1000,   -- Suzaku's Sune-Ate
                14469,  1000,   -- Reverand Mail
                11354,  1000,   -- Nocturnus Mail
                11501,  1000,   -- Noturnus Helm
                14577,  1000,   -- Valhalla Breastplate
                16117,  1000,   -- Valhalla Helm
                11502,  1000,   -- Acuben's Helm
                11544,  1000,   -- Veela Cape
            }

            xi.shop.general(player, stock) 
        end, 
    })

    utils.unused(louis)                                 -- haven't determined if this is actually needed, still experimenting
end)

return m
