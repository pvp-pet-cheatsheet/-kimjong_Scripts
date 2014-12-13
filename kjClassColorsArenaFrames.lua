if (cArenas == 1) then
  local frame = CreateFrame("FRAME")
  frame:RegisterEvent("PLAYER_ENTERING_WORLD")
  frame:RegisterEvent("PARTY_MEMBERS_CHANGED")
  frame:RegisterEvent("PLAYER_TARGET_CHANGED")
  frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
  frame:RegisterEvent("ARENA_OPPONENT_UPDATE")
  frame:RegisterEvent("PLAYER_CONTROL_GAINED")
  frame:RegisterEvent("PLAYER_CONTROL_LOST")
  frame:RegisterEvent("ADDON_LOADED");
  local function DoArenaColorHook()
    hooksecurefunc("ArenaEnemyFrame_Unlock",
      function(self)
        local color=RAID_CLASS_COLORS[select(2,UnitClass(self.unit)) or ""]
        if color then
          self.healthbar:SetStatusBarColor(color.r,color.g,color.b)
          self.healthbar.lockColor=true
        end
      end
    )
  end
  local function eventHandler(self, event, arg, ...)
    if event == "ADDON_LOADED" then
      if arg == "Blizzard_ArenaUI" then
        self:UnregisterEvent(event);
        DoArenaColorHook();
      end
    end
  end
  if IsAddOnLoaded("Blizzard_ArenaUI") then
    DoArenaColorHook();
  end
  frame:SetScript("OnEvent", eventHandler)
end