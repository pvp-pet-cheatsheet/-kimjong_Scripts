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