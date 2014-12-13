--DRTracker Warlords of Draenor
if (DRTrackerWoD == 1) then
  local DRTracker = CreateFrame("Cooldown", "DRTracker", UIParent)
  local DRs = {}
  local lastChangedFrame = nil
  DRTracker:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
  DRTracker:RegisterEvent("ADDON_LOADED")
  local spellIds = { -- DR Categories listed here http://eu.battle.net/wow/en/forum/topic/11267997531
    -- Many thanks to those that assisted the creation of the original list from LoseControl.
    -- Categories: Stun (1), Silence (2), Disorient/Fear (3), Incapacitate/Polymorph (4), Roots (5)
    -- Death Knight
    [108194] = "Stun",              -- Asphyxiate
    [115001] = "Stun",              -- Remorseless Winter
    [47476]  = "Silence",           -- Strangulate
    [96294]  = "Root",              -- Chains of Ice (Chilblains)
    -- Death Knight Ghoul
    [91800]  = "Stun",              -- Gnaw
    [91797]  = "Stun",              -- Monstrous Blow (Dark Transformation)
    [91807]  = "Root",              -- Shambling Rush (Dark Transformation)
    -- Druid
    [113801] = "Stun",              -- Bash (Force of Nature - Feral Treants)
    [102795] = "Stun",              -- Bear Hug
    [33786]  = "Disorient",         -- Cyclone
    [99]     = "Incap",             -- Disorienting (Incapacitating) Roar
    [22570]  = "Stun",              -- Maim
    [5211]   = "Stun",              -- Mighty Bash
    [163505]   = "Stun",            -- Rake
    [114238] = "Silence",           -- Fae Silence (Glyph of Fae Silence)
    [81261]  = "Silence",           -- Solar Beam
    [339]    = "Root",              -- Entangling Roots
    [113770] = "Root",              -- Entangling Roots (Force of Nature - Balance Treants)
    [19975]  = "Root",              -- Entangling Roots (Nature's Grasp)
    [45334]  = "Root",              -- Immobilized (Wild Charge - Bear)
    [102359] = "Root",              -- Mass Entanglement
    -- Hunter
    [117526] = "Stun",              -- Binding Shot
    [3355]   = "Incap",             -- Freezing Trap
    [1513]   = "Disorient",         -- Scare Beast
    [19386]  = "Incap",             -- Wyvern Sting
    [34490]  = "Silence",           -- Silencing Shot
    [19185]  = "Root",              -- Entrapment
    [64803]  = "Root",              -- Entrapment
    [128405] = "Root",              -- Narrow Escape
    -- Mage
    [118271] = "Stun",              -- Combustion Impact
    [44572]  = "Stun",              -- Deep Freeze
    [31661]  = "Disorient",         -- Dragon's Breath
    [118]    = "Incap",             -- Polymorph
    [61305]  = "Incap",             -- Polymorph: Black Cat
    [28272]  = "Incap",             -- Polymorph: Pig
    [61721]  = "Incap",             -- Polymorph: Rabbit
    [61780]  = "Incap",             -- Polymorph: Turkey
    [28271]  = "Incap",             -- Polymorph: Turtle
    [82691]  = "Incap",             -- Ring of Frost
    [102051] = "Silence",           -- Frostjaw (also a root)
    [122]    = "Root",              -- Frost Nova
    [111340] = "Root",              -- Ice Ward
    -- Mage Water Elemental
    [33395]  = "Root",              -- Freeze
    -- Monk
    [123393] = "Incap",             -- Breath of Fire (Glyph of Breath of Fire)
    [119392] = "Stun",              -- Charging Ox Wave
    [120086] = "Stun",              -- Fists of Fury
    [119381] = "Stun",              -- Leg Sweep
    [115078] = "Incap",             -- Paralysis
    [137460] = "Incap",             -- Silenced (Ring of Peace)
    [116706] = "Root",              -- Disable
    [123407] = "Root",              -- Spinning Fire Blossom
    -- Paladin
    [105421] = "Disorient",         -- Blinding Light
    [115752] = "Stun",              -- Blinding Light (Glyph of Blinding Light)
    [105593] = "Stun",              -- Fist of Justice
    [853]    = "Stun",              -- Hammer of Justice
    [119072] = "Stun",              -- Holy Wrath
    [20066]  = "Incap",             -- Repentance
    [10326]  = "Disorient",         -- Turn Evil
    [145067] = "Disorient",         -- Turn Evil (Evil is a Point of View)
    [31935]  = "Silence",           -- Avenger's Shield
    -- Priest
    [605]    = "Incap",             -- Dominate Mind
    [88625]  = "Incap",             -- Holy Word: Chastise
    [64044]  = "Incap",             -- Psychic Horror
    [8122]   = "Disorient",         -- Psychic Scream
    [113792] = "Disorient",         -- Psychic Terror (Psyfiend)
    [9484]   = "Disorient",         -- Shackle Undead
    [15487]  = "Silence",           -- Silence
    [87194]  = "Root",              -- Glyph of Mind Blast
    [114404] = "Root",              -- Void Tendril's Grasp
    -- Rogue
    [2094]   = "Disorient",         -- Blind
    [1833]   = "Stun",              -- Cheap Shot
    [1776]   = "Incap",             -- Gouge
    [408]    = "Stun",              -- Kidney Shot
    [6770]   = "Incap",             -- Sap
    [1330]   = "Silence",           -- Garrote - Silence
    -- Shaman
    [51514]  = "Incap",             -- Hex
    [118905] = "Stun",              -- Static Charge (Capacitor Totem)
    [64695]  = "Root",              -- Earthgrab (Earthgrab Totem)
    [63685]  = "Root",              -- Freeze (Frozen Power)
    -- Shaman Primal Earth Elemental
    [118345] = "Stun",              -- Pulverize
    -- Warlock
    [710]    = "Incap",             -- Banish
    [137143] = "Incap",             -- Blood Horror
    [5782]   = "Disorient",         -- Fear
    [118699] = "Disorient",         -- Fear
    [130616] = "Disorient",         -- Fear (Glyph of Fear)
    [5484]   = "Disorient",         -- Howl of Terror
    [22703]  = "Stun",              -- Infernal Awakening
    [6789]   = "Incap",             -- Mortal Coil
    [132412] = "Disorient",         -- Seduction (Grimoire of Sacrifice)
    [30283]  = "Stun",              -- Shadowfury
    [132409] = "Silence",           -- Spell Lock (Grimoire of Sacrifice)
    [31117]  = "Silence",           -- Unstable Affliction
    -- Warlock Pets
    [89766]  = "Stun",              -- Axe Toss (Felguard/Wrathguard)
    [115268] = "Disorient",         -- Mesmerize (Shivarra)
    [6358]   = "Disorient",         -- Seduction (Succubus)
    [115782] = "Silence",           -- Optical Blast (Observer)
    [24259]  = "Silence",           -- Spell Lock (Felhunter)
    -- Warrior
    --[7922]   = "Root",            -- Charge Stun
    [5246]   = "Disorient",         -- Intimidating Shout (aoe)
    [20511]  = "Disorient",         -- Intimidating Shout (targeted)
    [132168] = "Stun",              -- Shockwave
    [107570] = "Stun",              -- Storm Bolt
    [132169] = "Stun",              -- Storm Bolt
    [18498]  = "Silence",           -- Silenced - Gag Order (PvE only)
    [107566] = "Root",              -- Staggering Shout
    [105771] = "Root",              -- Warbringer
    -- Other
    [107079] = "Incap",             -- Quaking Palm
    [13327]  = "Stun",              -- Reckless Charge
    [20549]  = "Stun",              -- War Stomp
    [25046]  = "Silence",           -- Arcane Torrent (Energy)
    [28730]  = "Silence",           -- Arcane Torrent (Mana)
    [50613]  = "Silence",           -- Arcane Torrent (Runic Power)
    [69179]  = "Silence",           -- Arcane Torrent (Rage)
    [80483]  = "Silence",           -- Arcane Torrent (Focus)
    [129597] = "Silence",           -- Arcane Torrent (Chi)
    [39965]  = "Root",              -- Frost Grenade
    [55536]  = "Root",              -- Frostweave Net
    [13099]  = "Root",              -- Net-o-Matic
  }

  function DRTracker:GetSpellCategory(spellID) -- Returns CC category of the spellIDs listed above
    return spellID and spellIds[spellID] or nil
  end

  function DRTracker:OnEvent(event, ...) -- Runs things, and stuff.
    self[event](self, ...)
  end
  DRTracker:SetScript("OnEvent", DRTracker.OnEvent)

  function DRTracker:ADDON_LOADED(addonName) -- Anchor DR trackers
    if addonName == "Blizzard_ArenaUI" then
      local arenaFrame
      for i = 1, 5 do
        arenaFrame = "ArenaEnemyFrame"..i
        --local loc = -30 -- (Depreciated) Distance between the left edge of each frame. Should match the width of the frame.
        for j = 1, 5 do
          local DR = CreateFrame("Frame", arenaFrame.."DR"..j, ArenaEnemyFrames)
          DR:ClearAllPoints()
          DR:SetPoint("BOTTOMRIGHT", arenaFrame, "TOPLEFT", 0, -10)
          DR:SetSize(24, 24) -- (Width, Height) of each frame. A perfect square is preferable, otherwise the spell icon will look stretched.
          DR.border = DR:CreateTexture(nil, "LOW")
          DR.border:SetAllPoints()
          DR.border:SetTexture("Interface\\BUTTONS\\UI-Quickslot-Depress.png")
          DR.icon = DR:CreateTexture(nil, "BACKGROUND")
          DR.shown = false
          DR.severity = 1
          DR.unit = i
          DR.cate = j
          DR.applied = 0
          DR.sweep = CreateFrame("Cooldown", nil, DR, "CooldownFrameTemplate")
          DR.sweep:ClearAllPoints()
          DR.sweep:SetAllPoints(DR)
          local function OnShow(self)
            local curX = 0
            for b=1,5 do
              local curFrame = DRs["arena"..DR.unit..b]
              if curFrame.shown == true and b ~= self.cate then
                curX = curX - 30
              end
            end
            self:ClearAllPoints()
            self:SetPoint("BOTTOMRIGHT", "ArenaEnemyFrame"..self.unit, "TOPLEFT", curX, -10)
            self.shown = true
            self.applied = GetTime()
          end
          DR:HookScript("OnShow", OnShow)

          local function OnHide(self)
            for b = 1,5 do
              local curFrame = DRs["arena"..self.unit..b]
              if curFrame and curFrame.shown == true and curFrame.applied > self.applied then
                local _, _, _, x = curFrame:GetPoint(1)
                curFrame:ClearAllPoints()
                curFrame:SetPoint("BOTTOMRIGHT", "ArenaEnemyFrame"..curFrame.unit, "TOPLEFT", x+30, -10)
              end
            end
            self:ClearAllPoints()
            self:SetPoint("BOTTOMRIGHT", "ArenaEnemyFrame"..self.unit, "TOPLEFT", 0, -10)
          end
          DR:HookScript("OnHide", OnHide)

          local function DREnd(self, elapsed)
            if self.sweep:GetCooldownDuration() == 0 and self.shown == true then
              self:Hide()
              self.shown = false
              self.severity = 1
            end
          end
          DR:HookScript("OnUpdate", DREnd)

          DR:Hide()
          DRs["arena"..i..j] = DR
        end
      end
  end
  end

  function DRTracker:SetTexture(Frame, spellID) -- Sets displayed icon to last spell.
    if Frame.shown == true then
      Frame.dur = Frame.sweep:GetCooldownDuration()
      Frame:Hide()
  end
  lastChangedFrame = Frame
  local _, _, icon, _, _, _, _, _, _ = GetSpellInfo(spellID)
  Frame.icon:ClearAllPoints()
  Frame.icon:SetAllPoints()
  Frame.icon:SetTexture(icon)
  Frame:Show()
  if Frame.severity == 1 then
    Frame.border:SetVertexColor(1, 1, 0, 1)
    Frame.severity = 2
  elseif Frame.severity == 2 then
    Frame.border:SetVertexColor(1, .4, 0, 1)
    Frame.severity = 3
  elseif Frame.severity == 3 then
    Frame.border:SetVertexColor(1, 0, 0, 1)
  end
  end

  function DRTracker:TimerStart(GUID, spellID, spellName) -- Primary function; begins CD sweep and icon updates. Not a good idea to edit any of this.
    local _, instanceType = IsInInstance()
    if instanceType ~= "arena" then
      return
    end
    local cat = DRTracker:GetSpellCategory(spellID)
    if(UnitGUID("arena1") == GUID) then
      local name, rank, icon, count, dispelType, duration, expires, caster, isStealable, shouldConsolidate, spellID, canApplyAura, isBossDebuff, value1, value2, value3 = UnitDebuff("arena1", spellName)
      if(cat=="Stun") then
        DRTracker:SetTexture(DRs["arena1"..1], spellID)
        CooldownFrame_SetTimer(DRs["arena1"..1].sweep, GetTime(), 17+duration, 1)
      elseif(cat=="Silence") then
        DRTracker:SetTexture(DRs["arena1"..2], spellID)
        CooldownFrame_SetTimer(DRs["arena1"..2].sweep, GetTime(), 17+duration, 1)
      elseif(cat=="Disorient") then
        DRTracker:SetTexture(DRs["arena1"..3], spellID)
        CooldownFrame_SetTimer(DRs["arena1"..3].sweep, GetTime(), 17+duration, 1)
      elseif(cat=="Incap") then
        DRTracker:SetTexture(DRs["arena1"..4], spellID)
        CooldownFrame_SetTimer(DRs["arena1"..4].sweep, GetTime(), 17+duration, 1)
      else
        DRTracker:SetTexture(DRs["arena1"..5], spellID)
        CooldownFrame_SetTimer(DRs["arena1"..5].sweep, GetTime(), 17+duration, 1)
      end
    elseif(UnitGUID("arena2") == GUID) then
      local name, rank, icon, count, dispelType, duration, expires, caster, isStealable, shouldConsolidate, spellID, canApplyAura, isBossDebuff, value1, value2, value3 = UnitDebuff("arena2", spellName)
      if(cat=="Stun") then
        DRTracker:SetTexture(DRs["arena2"..1], spellID)
        CooldownFrame_SetTimer(DRs["arena2"..1].sweep, GetTime(), 17+duration, 1)
      elseif(cat=="Silence") then
        DRTracker:SetTexture(DRs["arena2"..2], spellID)
        CooldownFrame_SetTimer(DRs["arena2"..2].sweep, GetTime(), 17+duration, 1)
      elseif(cat=="Disorient") then
        DRTracker:SetTexture(DRs["arena2"..3], spellID)
        CooldownFrame_SetTimer(DRs["arena2"..3].sweep, GetTime(), 17+duration, 1)
      elseif(cat=="Incap") then
        DRTracker:SetTexture(DRs["arena2"..4], spellID)
        CooldownFrame_SetTimer(DRs["arena2"..4].sweep, GetTime(), 17+duration, 1)
      else
        DRTracker:SetTexture(DRs["arena2"..5], spellID)
        CooldownFrame_SetTimer(DRs["arena2"..5].sweep, GetTime(), 17+duration, 1)
      end
    elseif(UnitGUID("arena3") == GUID) then
      local name, rank, icon, count, dispelType, duration, expires, caster, isStealable, shouldConsolidate, spellID, canApplyAura, isBossDebuff, value1, value2, value3 = UnitDebuff("arena3", spellName)
      if(cat=="Stun") then
        DRTracker:SetTexture(DRs["arena3"..1], spellID)
        CooldownFrame_SetTimer(DRs["arena3"..1].sweep, GetTime(), 17+duration, 1)
      elseif(cat=="Silence") then
        DRTracker:SetTexture(DRs["arena3"..2], spellID)
        CooldownFrame_SetTimer(DRs["arena3"..2].sweep, GetTime(), 17+duration, 1)
      elseif(cat=="Disorient") then
        DRTracker:SetTexture(DRs["arena3"..3], spellID)
        CooldownFrame_SetTimer(DRs["arena3"..3].sweep, GetTime(), 17+duration, 1)
      elseif(cat=="Incap") then
        DRTracker:SetTexture(DRs["arena3"..4], spellID)
        CooldownFrame_SetTimer(DRs["arena3"..4].sweep, GetTime(), 17+duration, 1)
      else
        DRTracker:SetTexture(DRs["arena3"..5], spellID)
        CooldownFrame_SetTimer(DRs["arena3"..5].sweep, GetTime(), 17+duration, 1)
      end
    elseif(UnitGUID("arena4") == GUID) then
      local name, rank, icon, count, dispelType, duration, expires, caster, isStealable, shouldConsolidate, spellID, canApplyAura, isBossDebuff, value1, value2, value3 = UnitDebuff("arena4", spellName)
      if(cat=="Stun") then
        DRTracker:SetTexture(DRs["arena4"..1], spellID)
        CooldownFrame_SetTimer(DRs["arena4"..1].sweep, GetTime(), 17+duration, 1)
      elseif(cat=="Silence") then
        DRTracker:SetTexture(DRs["arena4"..2], spellID)
        CooldownFrame_SetTimer(DRs["arena4"..2].sweep, GetTime(), 17+duration, 1)
      elseif(cat=="Disorient") then
        DRTracker:SetTexture(DRs["arena4"..3], spellID)
        CooldownFrame_SetTimer(DRs["arena4"..3].sweep, GetTime(), 17+duration, 1)
      elseif(cat=="Incap") then
        DRTracker:SetTexture(DRs["arena4"..4], spellID)
        CooldownFrame_SetTimer(DRs["arena4"..4].sweep, GetTime(), 17+duration, 1)
      else
        DRTracker:SetTexture(DRs["arena4"..5], spellID)
        CooldownFrame_SetTimer(DRs["arena4"..5].sweep, GetTime(), 17+duration, 1)
      end
    elseif(UnitGUID("arena5") == GUID) then
      local name, rank, icon, count, dispelType, duration, expires, caster, isStealable, shouldConsolidate, spellID, canApplyAura, isBossDebuff, value1, value2, value3 = UnitDebuff("arena5", spellName)
      if(cat=="Stun") then
        DRTracker:SetTexture(DRs["arena5"..1], spellID)
        CooldownFrame_SetTimer(DRs["arena5"..1].sweep, GetTime(), 17+duration, 1)
      elseif(cat=="Silence") then
        DRTracker:SetTexture(DRs["arena5"..2], spellID)
        CooldownFrame_SetTimer(DRs["arena5"..2].sweep, GetTime(), 17+duration, 1)
      elseif(cat=="Disorient") then
        DRTracker:SetTexture(DRs["arena5"..3], spellID)
        CooldownFrame_SetTimer(DRs["arena5"..3].sweep, GetTime(), 17+duration, 1)
      elseif(cat=="Incap") then
        DRTracker:SetTexture(DRs["arena5"..4], spellID)
        CooldownFrame_SetTimer(DRs["arena5"..4].sweep, GetTime(), 17+duration, 1)
      else
        DRTracker:SetTexture(DRs["arena5"..5], spellID)
        CooldownFrame_SetTimer(DRs["arena5"..5].sweep, GetTime(), 17+duration, 1)
      end
    end
    return
  end

  function DRTracker:GetDRs()
    return DRTracker and DRs
  end

  function DRTracker:COMBAT_LOG_EVENT_UNFILTERED(timeStamp, eventType, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID, spellName, spellSchool, auraType)
    if eventType == "SPELL_AURA_APPLIED" or eventType == "SPELL_AURA_REFRESH" then -- Crowd control landed, time to do stuff.
      if auraType == "DEBUFF" and DRTracker:GetSpellCategory(spellID) then
        DRTracker:TimerStart(destGUID, spellID, spellName)
    end
    end
  end
end