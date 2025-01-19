--------------------------------------------------------------
-- Trust: Valaineral - (updated to lv75 (12/30/2024))
-- From BGWiki:
-- Possesses Enmity+, Cure Potency Bonus+50%, 
-- Spell interruption rate decrease, 
-- Refresh+ (+3mp/tick Auto Refresh, stacks with PLD trait), 
-- Damage Taken -8%, HP+10%, MP+20%
-- Added Regen, Double Attack, Killer Effects, and Terror Res
-- Job: Paladin|Warrior
--------------------------------------------------------------
require('modules/module_utils')
require('scripts/globals/trust')
--------------------------------------------------------------
local m = Module:new('valaineral')

m:addOverride('xi.actions.spells.trust.valaineral.onSpellCast', function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end)

m:addOverride('xi.actions.spells.trust.valaineral.onSpellCast', function(caster, target, spell)
    -- Records of Eminence: Alter Ego: Valaineral
    if caster:getEminenceProgress(933) then
        xi.roe.onRecordTrigger(caster, 933)
    end

    return xi.trust.spawn(caster, spell)
end)

m:addOverride('xi.actions.spells.trust.valaineral.onMobSpawn', function(mob)
    --[[
        Summon: With your courage and valor, Altana's children will live to see a brighter day.
        Summon (Formerly): Let the Royal Family’s blade be seared forever into their memories!
    ]]
    xi.trust.message(mob, xi.trust.messageOffset.SPAWN)

    mob:addMod(xi.mod.HPP, 10)
    mob:addMod(xi.mod.MPP, 20)
    mob:addMod(xi.mod.ENMITY, 250)
    mob:addMod(xi.mod.FASTCAST, 50)
    mob:addMod(xi.mod.CURE_POTENCY_RCVD, 30)
    mob:addMod(xi.mod.DMG, -800)
    mob:addMod(xi.mod.REFRESH, 3)
    mob:addMod(xi.mod.REGEN, 5)
    mob:addMod(xi.mod.DOUBLE_ATTACK, 15)
    mob:addMod(xi.mod.HASTE_GEAR, 2500)

    mob:addMod(xi.mod.VERMIN_KILLER, 10)
    mob:addMod(xi.mod.BIRD_KILLER, 10)
    mob:addMod(xi.mod.AMORPH_KILLER, 10)
    mob:addMod(xi.mod.LIZARD_KILLER, 10)
    mob:addMod(xi.mod.AMORPH_KILLER, 10)                  
    mob:addMod(xi.mod.AQUAN_KILLER, 10)
    mob:addMod(xi.mod.PLANTOID_KILLER, 10)                 
    mob:addMod(xi.mod.BEAST_KILLER, 10)                    
    mob:addMod(xi.mod.UNDEAD_KILLER, 10)                   
    mob:addMod(xi.mod.ARCANA_KILLER, 10)                   
    mob:addMod(xi.mod.DRAGON_KILLER, 10)                   
    mob:addMod(xi.mod.DEMON_KILLER, 10)                   
    mob:addMod(xi.mod.EMPTY_KILLER, 10)                    
    mob:addMod(xi.mod.HUMANOID_KILLER, 10)                 
    mob:addMod(xi.mod.LUMINIAN_KILLER, 10)                 
    mob:addMod(xi.mod.LUMINION_KILLER, 10)    
    
    --Terror resistance
    mob:addMod(xi.mod.STUNRES, 30)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FLASH)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, xi.ja.SENTINEL)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.RAMPART, ai.r.JA, ai.s.SPECIFIC, xi.ja.RAMPART)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 50, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    mob:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM, 1500)
end)

m:addOverride('xi.actions.spells.trust.valaineral.onMobDespawn', function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DESPAWN)
end)

m:addOverride('xi.actions.spells.trust.valaineral.onMobDeath', function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DEATH)
end)

return m
