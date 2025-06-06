-----------------------------------
-- Trust: Semih Lafihna
-- Updated 12/30/2024
-- And Haste from Gear +25 (cap)
-- Job: Ranger|Ranger
-----------------------------------
-----------------------------------
require('modules/module_utils')
require('scripts/globals/trust')
-----------------------------------
local m = Module:new('semih_lafihna_updated')

m:addOverride('xi.actions.spells.trust.semih_lafihna.onMagicCastingCheck', function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end)

m:addOverride('xi.actions.spells.trust.semih_lafihna.onSpellCast', function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end)

m:addOverride('xi.actions.spells.trust.semih_lafihna.onMobSpawn', function(mob)
    xi.trust.teamworkMessage(mob, {
        [xi.magic.spell.STAR_SIBYL] = xi.trust.messageOffset.TEAMWORK_1,
        [xi.magic.spell.AJIDO_MARUJIDO] = xi.trust.messageOffset.TEAMWORK_2,
    })

    mob:addMod(xi.mod.REGEN, 5)
    mob:addMod(xi.mod.HASTE_GEAR, 2500)
    
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, xi.effect.BARRAGE }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.BARRAGE })

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, xi.effect.SHARPSHOT }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.SHARPSHOT })

    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, xi.effect.DOUBLE_SHOT }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.DOUBLE_SHOT })

    -- TODO: Stealth Shot not yet implemented
    -- mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0,
    --                    ai.r.JA, ai.s.SPECIFIC, xi.ja.STEALTH_SHOT)

    mob:addListener('WEAPONSKILL_USE', 'SEMIH_LAFIHNA_WEAPONSKILL_USE', function(mobArg, target, wsid, tp, action)
        if wsid == 3490 then -- Stellar Arrow
            -- I'll show you no quarter!
            xi.trust.message(mobArg, xi.trust.messageOffset.SPECIAL_MOVE_1)
        end
    end)

    -- Ranged Attack as much as possible (limited by 'weapon' delay)
    mob:addGambit(ai.t.TARGET, { ai.c.ALWAYS, 0 }, { ai.r.RATTACK, 0, 0 })

    mob:setAutoAttackEnabled(false)

    -- Gets 252 TP per hit even at level 1, see https://www.bg-wiki.com/ffxi/BGWiki:Trusts#Semih_Lafihna
    -- Using STP as a hack to ensure proper TP amount, as her delay is not that high on retail.
    mob:addMod(xi.mod.STORETP, 86)

    mob:setMobMod(xi.mobMod.TRUST_DISTANCE, xi.trust.movementType.LONG_RANGE)
end)

m:addOverride('xi.actions.spells.trust.semih_lafihna.onMobDespawn', function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DESPAWN)
end)

m:addOverride('xi.actions.spells.trust.semih_lafihna.onMobDeath', function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DEATH)
end)

return m 
