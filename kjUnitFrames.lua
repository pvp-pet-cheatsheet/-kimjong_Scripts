if (UnitFrames == 1) then
  --player frame tweaks
  hooksecurefunc("PlayerFrame_UpdateStatus", function()
    if IsResting("player") then PlayerStatusTexture:Hide()PlayerRestIcon:Hide()PlayerRestGlow:Hide()PlayerStatusGlow:Hide()
    elseif PlayerFrame.inCombat then PlayerStatusTexture:Hide()PlayerAttackIcon:Show()PlayerRestIcon:Hide()PlayerAttackGlow:Hide()
      PlayerRestGlow:Hide()PlayerStatusGlow:Hide()PlayerAttackBackground:Hide() end end)
  -- background tweaks
  hooksecurefunc('TargetFrame_CheckFaction', function(self)
    if ( not UnitPlayerControlled(self.unit)
      and UnitIsTapped(self.unit)
      and not UnitIsTappedByPlayer(self.unit)
      and not UnitIsTappedByAllThreatList(self.unit) ) then
      self.nameBackground:SetVertexColor(0.0, 0.0, 0.0, 0.5);
      if ( self.portrait ) then
        self.portrait:SetVertexColor(0.5, 0.5, 0.5);
      end
    else
      self.nameBackground:SetVertexColor(0.0, 0.0, 0.0, 0.5);
      if ( self.portrait ) then
        self.portrait:SetVertexColor(1.0, 1.0, 1.0);
      end
    end
  end)
  -- hp
  local f=function(v)if(v>=1e4) then return ('%.1fk'):format(v/1e3):gsub('%.?0+([km])$','%1')  else return v end end
  hooksecurefunc("TextStatusBar_UpdateTextString",function(s)
    if not GetCVarBool("statusTextPercentage") then
      if s.TextString and s.currValue then
        s.TextString:SetText(f(s.currValue))
      end
    end
  end)
  --class colored hp bars
  local UnitIsPlayer,UnitIsConnected, UnitClass, RAID_CLASS_COLORS = UnitIsPlayer,UnitIsConnected,UnitClass, RAID_CLASS_COLORS
  local _, class, c
  local function colour(statusbar, unit, name)
    if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
      _, class = UnitClass(unit) c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
      statusbar:SetStatusBarColor(c.r, c.g, c.b)
      statusbar = _G["PlayerFrame".."HealthBar"]:SetStatusBarColor(0.1, 1.0, 0.1)--playerframe fix
    end
  end
  hooksecurefunc("UnitFrameHealthBar_Update", colour)
  hooksecurefunc("HealthBar_OnValueChanged", function(self)colour(self, self.unit)end)
  --class colored names
  hooksecurefunc("UnitFrame_Update", function(self)
    if UnitClass(self.unit) then
      local c = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[select(2,UnitClass(self.unit))]
      self.name:SetTextColor(c.r,c.g,c.b,1) self.name:SetFont("Fonts\\font.ttf", 13)end end)
end