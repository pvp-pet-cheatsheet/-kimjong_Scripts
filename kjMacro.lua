if (Macro == 1) then
  --[[hooksecurefunc('ActionButton_UpdateHotkeys', function(self)

    local macro, hotkey = _G[self:GetName()..'Name'], _G[self:GetName()..'HotKey']

    if macro and hotkey then macro:Hide() hotkey:Hide() end

end) ]]--
  hooksecurefunc('ActionButton_UpdateHotkeys', function(self)
    local macro = _G[self:GetName()..'Name']
    if macro then macro:Hide() end
  end)
end