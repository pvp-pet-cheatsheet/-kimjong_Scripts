-- Do this when I enter the world
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent",function(event, ...)
-- hide gryphon's when I log in
local g1, g2 = MainMenuBarLeftEndCap, MainMenuBarRightEndCap;
if g1 and g2 then
g1:Hide()
g2:Hide()
end
end)
