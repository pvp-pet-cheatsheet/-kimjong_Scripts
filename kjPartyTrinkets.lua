----------------------------------------------------------------------------------------------------
--PartyTrinkets--
----------------------------------------------------------------------------------------------------
local trinkets = {}
local events = CreateFrame("Frame")            
local partyFrame, trinket
    for i = 1, MAX_PARTY_MEMBERS do
        partyFrame = "PartyMemberFrame"..i
        trinket = CreateFrame("Cooldown", partyFrame.."Trinket")
        trinket:SetPoint("TOPRIGHT", partyFrame, 30, -6)
        trinket:SetSize(24, 24)
        trinket.icon = trinket:CreateTexture(nil, "BACKGROUND")
        trinket.icon:SetAllPoints()
        trinket.icon:SetTexture("Interface\\Icons\\inv_jewelry_trinketpvp_02")
        trinket:Hide()
        trinkets["party"..i] = trinket
    end
function events:UNIT_SPELLCAST_SUCCEEDED(unitID, spell, rank, lineID, spellID)
    if not trinkets[unitID] then
        return
    end
    if spellID == 59752 or spellID == 42292 then
        CooldownFrame_SetTimer(trinkets[unitID], GetTime(), 120, 1)        
    elseif spellID == 7744 then
        CooldownFrame_SetTimer(trinkets[unitID], GetTime(), 45, 1)        
    end
end
function events:PLAYER_ENTERING_WORLD()
        local _, instanceType = IsInInstance()
             if instanceType == "arena" then
             self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
                         elseif instanceType == "none" then
             self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
             elseif self:IsEventRegistered("UNIT_SPELLCAST_SUCCEEDED") then
              self:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")          
             for _, trinket in pairs(trinkets) do
            trinket:SetCooldown(0, 0)
            trinket:Hide()
             end  end  
end
events:SetScript("OnEvent", function(self, event, ...) return self[event](self, ...) end)
events:RegisterEvent("PLAYER_ENTERING_WORLD")