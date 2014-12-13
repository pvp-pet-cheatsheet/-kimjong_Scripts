local LibActionButton = LibStub and LibStub("LibActionButton-1.0", true)
local activeButtons = LibActionButton and LibActionButton.activeButtons or ActionBarActionEventsFrame.frames


local Fixer = CreateFrame("Frame")

local function Reset()
	for button in pairs(activeButtons) do
		button.cooldown:SetLossOfControlCooldown(0, 0)
	end
end

local function Enable()
	Fixer:RegisterEvent("LOSS_OF_CONTROL_ADDED")
	Fixer:RegisterEvent("LOSS_OF_CONTROL_UPDATE")

	Fixer:SetScript("OnEvent", Reset)
end

Fixer:RegisterEvent("PLAYER_ENTERING_WORLD")

Fixer:SetScript("OnEvent", Enable)


if (LoCRemover == 1) then
  select(1,LossOfControlFrame:GetRegions()):SetAlpha(0)
  select(2,LossOfControlFrame:GetRegions()):SetAlpha(0)
  select(3,LossOfControlFrame:GetRegions()):SetAlpha(0)
  select(5,LossOfControlFrame:GetRegions()):SetAlpha(0)
  --[[hooksecurefunc("CooldownFrame_SetTimer", function(self)

        if self.currentCooldownType == COOLDOWN_TYPE_LOSS_OF_CONTROL then

                self:SetCooldown(0, 0)

        end

end)]]--
  hooksecurefunc('CooldownFrame_SetTimer',function(self)
    if self.currentCooldownType == COOLDOWN_TYPE_LOSS_OF_CONTROL then
      self:SetEdgeTexture("Interface\\Cooldown\\cooldown2");
      self:SetCooldown(4500,4500);
      self:SetSwipeColor(0.35,0.25,0.25,0);
    end
  end)
end