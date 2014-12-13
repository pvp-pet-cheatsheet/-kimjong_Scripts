if (FCTtweaks == 1) then
  CompactRaidFrameContainer:SetScale(0.85)
  ObjectiveTrackerFrame:SetScale(0.75)
  ObjectiveTrackerBlocksFrame.QuestHeader:SetAlpha(0)
  hooksecurefunc("PlayerFrame_ResetPosition", function(self)
    self:ClearAllPoints()
    self:SetPoint("CENTER", -370, 70)
    TargetFrame:ClearAllPoints()
    TargetFrame:SetPoint("BOTTOMRIGHT",PlayerFrame,100,-45)
    FocusFrame:ClearAllPoints()
    FocusFrame:SetPoint("BOTTOMRIGHT",PlayerFrame,750,0)
  end)
  StanceButton1:ClearAllPoints()
  StanceButton1:SetPoint("BOTTOMLEFT",MultiBarBottomLeftButton2,-500,0)
  StanceButton1.SetPoint = function() end
  local frame = CreateFrame("FRAME", "DefaultUIScrips")
  frame:RegisterEvent("PLAYER_ENTERING_WORLD")
  local function eventHandler(self, event, ...)
    -- LARGE_NUMBER_SEPERATOR = ""
    SetCVar('BreakUpLargeNumbers', 0)
    COMBAT_TEXT_HEIGHT = 20;
    COMBAT_TEXT_SCROLLSPEED = 3.0
    --UIErrorsFrame:UnregisterEvent("UI_ERROR_MESSAGE")
    UIErrorsFrame:SetScale(0.7)
    COMBAT_TEXT_TYPE_INFO.PERIODIC_HEAL_ABSORB.show = nil
    --COMBAT_TEXT_TYPE_INFO.PERIODIC_HEAL.show = nil
    --COMBAT_TEXT_TYPE_INFO.PERIODIC_HEAL_CRIT.show = nil
    --COMBAT_TEXT_TYPE_INFO.HEAL_CRIT.show = nil
    --COMBAT_TEXT_TYPE_INFO.HEAL.show = nil
    COMBAT_TEXT_TYPE_INFO.HEAL_CRIT_ABSORB.show = nil
    COMBAT_TEXT_TYPE_INFO.HEAL_ABSORB.show = nil
    COMBAT_TEXT_TYPE_INFO.ABSORB.show = nil
    COMBAT_TEXT_TYPE_INFO.SPELL_ABSORB.show = nil
    COMBAT_TEXT_TYPE_INFO["ENTERING_COMBAT"].r = 1
    COMBAT_TEXT_TYPE_INFO["ENTERING_COMBAT"].g = 0.82
    COMBAT_TEXT_TYPE_INFO["ENTERING_COMBAT"].b = 0
    COMBAT_TEXT_TYPE_INFO["LEAVING_COMBAT"].r = 1
    COMBAT_TEXT_TYPE_INFO["LEAVING_COMBAT"].g = 0.82
    COMBAT_TEXT_TYPE_INFO["LEAVING_COMBAT"].b = 0
    PlayerHitIndicator:SetFont("Fonts\\font.ttf",30)
    ENTERING_COMBAT = "+Combat"
    LEAVING_COMBAT = "-Combat"
  end
  frame:SetScript("OnEvent", eventHandler)
  --combat text font
  local fontName = "Fonts\\font.ttf"
  local fontHeight = 40
  local fFlags = ""
  local function FS_SetFont()
    DAMAGE_TEXT_FONT = fontName
    COMBAT_TEXT_HEIGHT = fontHeight
    COMBAT_TEXT_CRIT_MAXHEIGHT = fontHeight + 2
    COMBAT_TEXT_CRIT_MINHEIGHT = fontHeight - 2
    local fName, fHeight, fFlags = CombatTextFont:GetFont()
    CombatTextFont:SetFont(fontName, fontHeight, fFlags)
  end
  FS_SetFont()
  --combat text location
  local f = CreateFrame("FRAME");
  f:SetScript("OnEvent", function(self,event,...)
    local arg1 =...;
    if (arg1=="Blizzard_CombatText") then
      f:UnregisterEvent("ADDON_LOADED");
      hooksecurefunc("CombatText_UpdateDisplayedMessages",
        function ()
          COMBAT_TEXT_LOCATIONS =
            {startX  = 0,
              --startY = 384 * COMBAT_TEXT_Y_SCALE, endX =0,endY = 159 * COMBAT_TEXT_Y_SCALE};
              startY = 164 * COMBAT_TEXT_Y_SCALE, endX =0,endY = 80 * COMBAT_TEXT_Y_SCALE};
        end)end end)
  f:RegisterEvent("ADDON_LOADED");
end