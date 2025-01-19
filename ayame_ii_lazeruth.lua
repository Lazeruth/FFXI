-----------------------------------
-- Trust: Ayame
-- Updated 1/1/25
-- Job: Samurai|Samurai
-----------------------------------
require('modules/module_utils')
require('scripts/globals/trust')
-----------------------------------
local m = Module:new('ayame')

m:addOverride('xi.actions.spells.trust.ayame.onMagicCastingCheck', function(caster, target, spell)
    return xi.trust.canCast(caster, spell, xi.magic.spell.AYAME_UC)
end)

m:addOverride('xi.actions.spells.trust.ayame.onSpellCast', function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end)

m:addOverride('xi.actions.spells.trust.ayame.onMobSpawn', function(mob)
    xi.trust.teamworkMessage(mob, {
        [xi.magic.spell.NAJI] = xi.trust.messageOffset.TEAMWORK_1,
        [xi.magic.spell.GILGAMESH] = xi.trust.messageOffset.TEAMWORK_2,
    })

    mob:addMod(xi.mod.CRITHITRATE, 15)
    mob:addMod(xi.mod.HASTE_GEAR, 2500)
    mob:addMod(xi.mod.TWOHAND_HASTE_ABILITY, 1500)
    mob:addMod(xi.mod.REGEN, 5)
    mob:addMod(xi.mod.REGAIN, 75)
    mob:addMod(xi.mod.DOUBLE_ATTACK, 15)
    mob:addMod(xi.mod.ACC, 950)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.HASSO, ai.r.JA, ai.s.SPECIFIC, xi.ja.HASSO)

    mob:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.THIRD_EYE)

    mob:addSimpleGambit(ai.t.SELF, ai.c.TP_LT, 1000, ai.r.JA, ai.s.SPECIFIC, xi.ja.MEDITATE)

    mob:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.SPECIAL_AYAME)
end)

m:addOverride('xi.actions.spells.trust.ayame.onMobDespawn',  function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DESPAWN)
end)

m:addOverride('xi.actions.spells.trust.ayame.onMobDeath', function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DEATH)
end)

return m
