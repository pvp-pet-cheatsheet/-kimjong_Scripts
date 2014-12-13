hooksecurefunc("ActionButton_OnEvent",function(self, event, ...)
                if ( event == "PLAYER_TARGET_CHANGED" ) then
                        self.newTimer = self.rangeTimer
                end
        end)
 
        hooksecurefunc("ActionButton_UpdateUsable",function(self)
                local icon = _G[self:GetName().."Icon"]
                local valid = IsActionInRange(self.action)
 
                if ( valid == 0 ) then
                        icon:SetVertexColor(1.0, 0.1, 0.1)
                end
        end)
 
        hooksecurefunc("ActionButton_OnUpdate",function(self, elapsed)
                local rangeTimer = self.newTimer
 
                if ( rangeTimer ) then
                        rangeTimer = rangeTimer - elapsed
 
                        if ( rangeTimer <= 0 ) then
                                ActionButton_UpdateUsable(self)
                                rangeTimer = TOOLTIP_UPDATE_TIME
                        end
 
                        self.newTimer = rangeTimer
                end
        end)