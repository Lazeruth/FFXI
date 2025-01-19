-----------------------------------------------------
-- Trust: Iroha II
-- Updated 12/30/24
-- Added in functional job abilities
-- Added Regen, Regain, Triple Attack
-- Added gear haste +25 (cap)
-- Job: Samurai|WhiteMage
-- TODO: Animations on weaopnskills are messed up
----------------------------------------------------
require('modules/module_utils')
require('scripts/globals/trust')
---------------------------------------------------
local m = Module:new('iroha_ii')

m:addOverride('xi.actions.spells.trust.iroha_ii.onMagicCastingCheck', function(caster, target, spell)
    return xi.trust.canCast(caster, spell, xi.magic.spell.IROHA)
end)

m:addOverride('xi.actions.spells.trust.iroha_ii.onSpellCast', function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end)

m:addOverride('xi.actions.spells.trust.iroha_ii.onMobSpawn', function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.SPAWN)
    
    mob:addMod(xi.mod.REGEN, 5)
    mob:addMod(xi.mod.REGAIN, 75)
    mob:addMod(xi.mod.TRIPLE_ATTACK, 15)
    mob:addMod(xi.mod.HASTE_GEAR, 2500)

    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.HASSO)
    mob:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.MEDITATE)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 25, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PROTECTRA)
    mob:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.SHELL, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SHELLRA)

    mob:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM, 1500)
end)

m:addOverride('xi.actions.spells.trust.iroha_ii.onMobDespawn', function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DESPAWN)
end)

m:addOverride('xi.actions.spells.trust.iroha_ii.onMobDeath', function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DEATH)
end)

return m
