-------------------------------------------
-- Trust: Lion II (updated (12/30/2024))
-- Added gear haste +25 (cap)
-- Treasure Hunter, and Triple Attack
-- Job: Ninja|Thief
------------------------------------------
require('modules/module_utils')
require('scripts/globals/trust')
------------------------------------------
local m = Module:new('lion_ii')

m:addOverride('xi.actions.spells.trust.lion_ii.onMagicCastingCheck', function(caster, target, spell)
    return xi.trust.canCast(caster, spell, xi.magic.spell.LION)
end)

m:addOverride('xi.actions.spells.trust.lion_ii.onSpellCast', function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end)

m:addOverride('xi.actions.spells.trust.lion_ii.onMobSpawn', function(mob)
    xi.trust.teamworkMessage(mob, {
        [xi.magic.spell.ZEID] = xi.trust.messageOffset.TEAMWORK_1,
        [xi.magic.spell.PRISHE_II] = xi.trust.messageOffset.TEAMWORK_2,
        [xi.magic.spell.LILISETTE_II] = xi.trust.messageOffset.TEAMWORK_4,
        [xi.magic.spell.ARCIELA_II] = xi.trust.messageOffset.TEAMWORK_5,
    })

    mob:addMod(xi.mod.REGEN, 5)
    mob:addMod(xi.mod.REGAIN, 75)
    mob:addMod(xi.mod.TRIPLE_ATTACK, 25)
    mob:addMod(xi.mod.HASTE_GEAR, 2500)
    mob:addMod(xi.mod.TREASURE_HUNTER, 8)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.COPY_IMAGE, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.UTSUSEMI)

    mob:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM, 1500)

    mob:addListener('WEAPONSKILL_USE', 'LION_II_WEAPONSKILL_USE', function(mobArg, target, wsid, tp, action)
        if wsid == 3493 then -- Powder Keg
            --  I won't sit by and let Vana'diel be engulged!
            xi.trust.message(mobArg, xi.trust.messageOffset.SPECIAL_MOVE_1)
        end
    end)
end)

m:addOverride('xi.actions.spells.trust.lion_ii.onMobDespawn', function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DESPAWN)
end)

m:addOverride('xi.actions.spells.trust.lion_ii.onMobDeath', function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DEATH)
end)

return m
