--player buffs

/run BuffFrame:ClearAllPoints();BuffFrame:SetPoint("CENTER", PlayerFrame, "CENTER", 771, 468);BuffFrame.SetPoint = function() end
/run BuffFrame:SetScale(1.2)

--player debuffs

/run DebuffButton1:ClearAllPoints();DebuffButton1:SetPoint("CENTER", PlayerFrame, "CENTER", 771, 468);DebuffButton1.SetPoint = function() end
/run DebuffButton1:SetScale(1.2)

-target buffs

/run hooksecurefunc("TargetFrame_UpdateAuraPositions",function(self) local g=_G["TargetFrameBuff1"] if g then g:ClearAllPoints();g:SetPoint("CENTER",TargetFrame,"CENTER",67,10)end end); TargetFrame.maxBuffs = 16
/run TargetFrameBuff1:SetScale(1.2)
/run TargetFrameDebuff1:SetScale(1.2)
etc