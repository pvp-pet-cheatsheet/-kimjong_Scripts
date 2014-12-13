if (InterruptA == 1) then
  local f = CreateFrame("Frame")
  local function Update(self, event, ...)
    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
      local timestamp, eventType, _, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, _, spellID, spellName, _, extraskillID, extraSkillName = ...
      if eventType == "SPELL_INTERRUPT" and sourceName == UnitName("player") then
        SendChatMessage("Interrupted >> "..GetSpellLink(extraskillID).."!", "SAY")
      end
    end
  end
  f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
  f:SetScript("OnEvent", Update)
end