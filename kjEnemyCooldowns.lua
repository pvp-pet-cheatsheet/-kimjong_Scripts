if (EnemyCooldowns == 1) then
  local frame = CreateFrame("FRAME", "EnemyCooldowns")
  frame:RegisterEvent("PLAYER_ENTERING_WORLD")
  local function eventHandler(self, event, ...)
    USS="UNIT_SPELLCAST_SUCCEEDED";OE="OnEvent";F="Frame";CF=CreateFrame;BO="Border";xb=630;yb=320;sb=24;ib=1;ii=1
    function TrS(f,x,y,cd,T,s,h)f:SetPoint("BOTTOMLEFT",x,y)f:SetSize(s,s)f.c=CF("Cooldown",cd,nil,"CooldownFrameTemplate")f.c:SetAllPoints(f)f.t=f:CreateTexture(nil,BO)f.t:SetAllPoints()f.t:SetTexture(T);if not h then f:Hide();end f:RegisterEvent(USS)end
    function Ts(f,cd,U,N,S,TI)if CPz(N,S,U) then f:Show();CooldownFrame_SetTimer(cd,GetTime(),TI,1)f.elapsed = 0 f:SetScript('OnUpdate', function(self, elapsed)if self.elapsed > TI+1 then self:SetScript('OnUpdate', nil) self:Hide();else self.elapsed = self.elapsed + elapsed end end)end end
    function CPz(N,S,U)if(N==S and (U=="arena1" or U=="arena2" or U=="arena3" or U=="arenapet1" or U=="arenapet2" or U=="arenapet3" or U=="target" or U=="focus"))then return true else return false end end
    --rogue
    t1p="Interface\\Icons\\ability_rogue_preparation";t1=CF(F);TrS(t1,xb,yb,"cd1",t1p,sb,false);t1:SetScript(OE,function(self,event,...) Ts(t1,cd1,select(1,...),select(5,...),14185,300) end);
    t2p="Interface\\Icons\\ability_rogue_kidneyshot";t2=CF(F);TrS(t2,xb+sb+ii,yb,"cd2",t2p,sb,false);t2:SetScript(OE,function(self,event,...) Ts(t2,cd2,select(1,...),select(5,...),408,20) end);
    t3p="Interface\\Icons\\spell_shadow_nethercloak";t3=CF(F);TrS(t3,xb+sb*2+ii*2,yb,"cd3",t3p,sb,false);t3:SetScript(OE,function(self,event,...) Ts(t3,cd3,select(1,...),select(5,...),31224,60) end);
    t4p="Interface\\Icons\\ability_rogue_combatreadiness";t4=CF(F);TrS(t4,xb+sb*3+ii*3,yb,"cd4",t4p,sb,false);t4:SetScript(OE,function(self,event,...) Ts(t4,cd4,select(1,...),select(5,...),74001,120) end);
    t5p="Interface\\Icons\\ability_vanish";t5=CF(F);TrS(t5,xb+sb*4+ii*4,yb,"cd5",t5p,sb,false);t5:SetScript(OE,function(self,event,...) Ts(t5,cd5,select(1,...),select(5,...),1856,120) end);
    t6p="Interface\\Icons\\ability_rogue_shadowstep";t6=CF(F);TrS(t6,xb+sb*5+ii*5,yb,"cd6",t6p,sb,false);t6:SetScript(OE,function(self,event,...) Ts(t6,cd6,select(1,...),select(5,...),36554,20) end);
    t7p="Interface\\Icons\\spell_shadow_mindsteal";t7=CF(F);TrS(t7,xb+sb*6+ii*6,yb,"cd7",t7p,sb,false);t7:SetScript(OE,function(self,event,...) Ts(t7,cd7,select(1,...),select(5,...),2094,120) end);
    t8p="Interface\\Icons\\ability_rogue_smoke";t8=CF(F);TrS(t8,xb+sb*7+ii*7,yb,"cd8",t8p,sb,false);t8:SetScript(OE,function(self,event,...) Ts(t8,cd8,select(1,...),select(5,...),76577,180) end);
    t9p="Interface\\Icons\\ability_rogue_shadowdance";t9=CF(F);TrS(t9,xb+sb*8+ii*8,yb,"cd9",t9p,sb,false);t9:SetScript(OE,function(self,event,...) Ts(t9,cd9,select(1,...),select(5,...),51713,60) end);
    t10p="Interface\\Icons\\achievement_bg_killingblow_berserker";t10=CF(F);TrS(t10,xb+sb*9+ii*9,yb,"cd10",t10p,sb,false);t10:SetScript(OE,function(self,event,...) Ts(t10,cd10,select(1,...),select(5,...),137619,60) end);
    --warlock
    t11p="Interface\\Icons\\ability_warlock_howlofterror";t11=CF(F);TrS(t11,xb,yb-(sb+ib),"cd11",t11p,sb,false);t11:SetScript(OE,function(self,event,...) Ts(t11,cd11,select(1,...),select(5,...),5484,40) end);
    t12p="Interface\\Icons\\ability_warlock_mortalcoil";t12=CF(F);TrS(t12,xb+sb+ii,yb-(sb+ib),"cd12",t12p,sb,false);t12:SetScript(OE,function(self,event,...) Ts(t12,cd12,select(1,...),select(5,...),6789,45) end);
    t13p="Interface\\Icons\\ability_warlock_shadowfurytga";t13=CF(F);TrS(t13,xb+sb*2+ii*2,yb-(sb+ib),"cd13",t13p,sb,false);t13:SetScript(OE,function(self,event,...) Ts(t13,cd13,select(1,...),select(5,...),30283,30) end);
    t14p="Interface\\Icons\\spell_shadow_demoniccircleteleport";t14=CF(F);TrS(t14,xb+sb*3+ii*3,yb-(sb+ib),"cd14",t14p,sb,false);t14:SetScript(OE,function(self,event,...) Ts(t14,cd14,select(1,...),select(5,...),48020,26) end);
    t15p="Interface\\Icons\\spell_shadow_demonictactics";t15=CF(F);TrS(t15,xb+sb*4+ii*4,yb-(sb+ib),"cd15",t15p,sb,false);t15:SetScript(OE,function(self,event,...) Ts(t15,cd15,select(1,...),select(5,...),104773,180) end);
    t16p="Interface\\Icons\\spell_warlock_darkregeneration";t16=CF(F);TrS(t16,xb+sb*5+ii*5,yb-(sb+ib),"cd16",t16p,sb,false);t16:SetScript(OE,function(self,event,...) Ts(t16,cd16,select(1,...),select(5,...),108359,120) end);
    t17p="Interface\\Icons\\ability_deathwing_bloodcorruption_death";t17=CF(F);TrS(t17,xb+sb*6+ii*6,yb-(sb+ib),"cd17",t17p,sb,false);t17:SetScript(OE,function(self,event,...) Ts(t17,cd17,select(1,...),select(5,...),110913,180) end);
    t18p="Interface\\Icons\\warlock_sacrificial_pact";t18=CF(F);TrS(t18,xb+sb*7+ii*7,yb-(sb+ib),"cd18",t18p,sb,false);t18:SetScript(OE,function(self,event,...) Ts(t18,cd18,select(1,...),select(5,...),108416,60) end);
    t19p="Interface\\Icons\\warlock_spelldrain";t19=CF(F);TrS(t19,xb+sb*8+ii*8,yb-(sb+ib),"cd19",t19p,sb,false);t19:SetScript(OE,function(self,event,...) Ts(t19,cd19,select(1,...),select(5,...),108482,120) end);
    --mage
    t20p="Interface\\Icons\\spell_arcane_blink";t20=CF(F);TrS(t20,xb,yb-2*(sb+ib),"cd20",t20p,sb,false);t20:SetScript(OE,function(self,event,...) Ts(t20,cd20,select(1,...),select(5,...),1953,15) end);
    t21p="Interface\\Icons\\ability_mage_deepfreeze";t21=CF(F);TrS(t21,xb+sb+ii,yb-2*(sb+ib),"cd21",t21p,sb,false);t21:SetScript(OE,function(self,event,...) Ts(t21,cd21,select(1,...),select(5,...),44572,30) end);
    t22p="Interface\\Icons\\spell_frost_iceshard";t22=CF(F);TrS(t22,xb+sb*2+ii*2,yb-2*(sb+ib),"cd22",t22p,sb,false);t22:SetScript(OE,function(self,event,...) Ts(t22,cd22,select(1,...),select(5,...),113724,45) end);
    t23p="Interface\\Icons\\spell_frost_frost";t23=CF(F);TrS(t23,xb+sb*3+ii*3,yb-2*(sb+ib),"cd23",t23p,sb,false);t23:SetScript(OE,function(self,event,...) Ts(t23,cd23,select(1,...),select(5,...),45438,300) end);
    t24p="Interface\\Icons\\spell_frost_wizardmark";t24=CF(F);TrS(t24,xb+sb*4+ii*4,yb-2*(sb+ib),"cd24",t24p,sb,false);t24:SetScript(OE,function(self,event,...) Ts(t24,cd24,select(1,...),select(5,...),11958,180) end);
    t25p="Interface\\Icons\\spell_mage_altertime";t25=CF(F);TrS(t25,xb+sb*5+ii*5,yb-2*(sb+ib),"cd25",t25p,sb,false);t25:SetScript(OE,function(self,event,...) Ts(t25,cd25,select(1,...),select(5,...),108978,90) end);
    --dk
    t26p="Interface\\Icons\\spell_deathknight_strangulate";t26=CF(F);TrS(t26,xb,yb-3*(sb+ib),"cd26",t26p,sb,false);t26:SetScript(OE,function(self,event,...) Ts(t26,cd26,select(1,...),select(5,...),49576,25) end);
    t27p="Interface\\Icons\\spell_deathknight_gnaw_ghoul";t27=CF(F);TrS(t27,xb+sb+ii,yb-3*(sb+ib),"cd27",t27p,sb,false);t27:SetScript(OE,function(self,event,...) Ts(t27,cd27,select(1,...),select(5,...),91800,60) end);
    t28p="Interface\\Icons\\ability_deathknight_asphixiate";t28=CF(F);TrS(t28,xb+sb*2+ii*2,yb-3*(sb+ib),"cd28",t28p,sb,false);t28:SetScript(OE,function(self,event,...) Ts(t28,cd28,select(1,...),select(5,...),108194,30) end);
    t29p="Interface\\Icons\\spell_shadow_antimagicshell";t29=CF(F);TrS(t29,xb+sb*3+ii*3,yb-3*(sb+ib),"cd29",t29p,sb,false);t29:SetScript(OE,function(self,event,...) Ts(t29,cd29,select(1,...),select(5,...),48707,45) end);
    t30p="Interface\\Icons\\spell_deathknight_antimagiczone";t30=CF(F);TrS(t30,xb+sb*4+ii*4,yb-3*(sb+ib),"cd30",t30p,sb,false);t30:SetScript(OE,function(self,event,...) Ts(t30,cd30,select(1,...),select(5,...),51052,120) end);
    t31p="Interface\\Icons\\spell_deathknight_iceboundfortitude";t31=CF(F);TrS(t31,xb+sb*5+ii*5,yb-3*(sb+ib),"cd31",t31p,sb,false);t31:SetScript(OE,function(self,event,...) Ts(t31,cd31,select(1,...),select(5,...),48792,180) end);
    t32p="Interface\\Icons\\spell_shadow_demonicempathy";t32=CF(F);TrS(t32,xb+sb*6+ii*6,yb-3*(sb+ib),"cd32",t32p,sb,false);t32:SetScript(OE,function(self,event,...) Ts(t32,cd32,select(1,...),select(5,...),96268,30) end);
    t33p="Interface\\Icons\\ability_deathknight_pillaroffrost";t33=CF(F);TrS(t33,xb+sb*7+ii*7,yb-3*(sb+ib),"cd33",t33p,sb,false);t33:SetScript(OE,function(self,event,...) Ts(t33,cd33,select(1,...),select(5,...),51271,60) end);
    t34p="Interface\\Icons\\spell_holy_consumemagic";t34=CF(F);TrS(t34,xb+sb*8+ii*8,yb-3*(sb+ib),"cd34",t34p,sb,false);t34:SetScript(OE,function(self,event,...) Ts(t34,cd34,select(1,...),select(5,...),77606,60) end);
    t35p="Interface\\Icons\\spell_shadow_raisedead";t35=CF(F);TrS(t35,xb+sb*9+ii*9,yb-3*(sb+ib),"cd35",t35p,sb,false);t35:SetScript(OE,function(self,event,...) Ts(t35,cd35,select(1,...),select(5,...),49039,120) end);
    --priest
    t36p="Interface\\Icons\\spell_shadow_psychichorrors";t36=CF(F);TrS(t36,xb,yb-4*(sb+ib),"cd36",t36p,sb,false);t36:SetScript(OE,function(self,event,...) Ts(t36,cd36,select(1,...),select(5,...),64044,35) end);
    t37p="Interface\\Icons\\spell_priest_voidtendrils";t37=CF(F);TrS(t37,xb+sb+ii,yb-4*(sb+ib),"cd37",t37p,sb,false);t37:SetScript(OE,function(self,event,...) Ts(t37,cd37,select(1,...),select(5,...),108920,30) end);
    t38p="Interface\\Icons\\spell_shadow_psychicscream";t38=CF(F);TrS(t38,xb+sb*2+ii*2,yb-4*(sb+ib),"cd38",t38p,sb,false);t38:SetScript(OE,function(self,event,...) Ts(t38,cd38,select(1,...),select(5,...),8122,45) end);
    t39p="Interface\\Icons\\spell_shadow_dispersion";t39=CF(F);TrS(t39,xb+sb*3+ii*3,yb-4*(sb+ib),"cd39",t39p,sb,false);t39:SetScript(OE,function(self,event,...) Ts(t39,cd39,select(1,...),select(5,...),47585,105) end);
    t40p="Interface\\Icons\\spell_priest_spectralguise";t40=CF(F);TrS(t40,xb+sb*4+ii*4,yb-4*(sb+ib),"cd40",t40p,sb,false);t40:SetScript(OE,function(self,event,...) Ts(t40,cd40,select(1,...),select(5,...),112833,30) end);
    t41p="Interface\\Icons\\spell_holy_painsupression";t41=CF(F);TrS(t41,xb+sb*5+ii*5,yb-4*(sb+ib),"cd41",t41p,sb,false);t41:SetScript(OE,function(self,event,...) Ts(t41,cd41,select(1,...),select(5,...),33206,180) end);
    --paladin
    t42p="Interface\\Icons\\spell_holy_prayerofhealing";t42=CF(F);TrS(t42,xb,yb-5*(sb+ib),"cd42",t42p,sb,false);t42:SetScript(OE,function(self,event,...) Ts(t42,cd42,select(1,...),select(5,...),20066,15) end);
    t43p="Interface\\Icons\\spell_holy_sealofmight";t43=CF(F);TrS(t43,xb+sb+ii,yb-5*(sb+ib),"cd43",t43p,sb,false);t43:SetScript(OE,function(self,event,...) Ts(t43,cd43,select(1,...),select(5,...),853,60) end);
    t44p="Interface\\Icons\\spell_holy_fistofjustice";t44=CF(F);TrS(t44,xb+sb*2+ii*2,yb-5*(sb+ib),"cd44",t44p,sb,false);t44:SetScript(OE,function(self,event,...) Ts(t44,cd44,select(1,...),select(5,...),105593,30) end);
    t45p="Interface\\Icons\\ability_paladin_blindinglight";t45=CF(F);TrS(t45,xb+sb*3+ii*3,yb-5*(sb+ib),"cd45",t45p,sb,false);t45:SetScript(OE,function(self,event,...) Ts(t45,cd45,select(1,...),select(5,...),115750,120) end);
    t46p="Interface\\Icons\\spell_holy_divineshield";t46=CF(F);TrS(t46,xb+sb*4+ii*4,yb-5*(sb+ib),"cd46",t46p,sb,false);t46:SetScript(OE,function(self,event,...) Ts(t46,cd46,select(1,...),select(5,...),642,300) end);
    t47p="Interface\\Icons\\spell_holy_avenginewrath";t47=CF(F);TrS(t47,xb+sb*5+ii*5,yb-5*(sb+ib),"cd47",t47p,sb,false);t47:SetScript(OE,function(self,event,...) Ts(t47,cd47,select(1,...),select(5,...),31884,120) end);
    t48p="Interface\\Icons\\ability_paladin_holyavenger";t48=CF(F);TrS(t48,xb+sb*6+ii*6,yb-5*(sb+ib),"cd48",t48p,sb,false);t48:SetScript(OE,function(self,event,...) Ts(t48,cd48,select(1,...),select(5,...),105809,120) end);
    t49p="Interface\\Icons\\ability_paladin_speedoflight";t49=CF(F);TrS(t49,xb+sb*7+ii*7,yb-5*(sb+ib),"cd49",t49p,sb,false);t49:SetScript(OE,function(self,event,...) Ts(t49,cd49,select(1,...),select(5,...),85499,45) end);
    --warrior
    t50p="Interface\\Icons\\ability_warrior_charge";t50=CF(F);TrS(t50,xb,yb-6*(sb+ib),"cd50",t50p,sb,false);t50:SetScript(OE,function(self,event,...) Ts(t50,cd50,select(1,...),select(5,...),100,20) end);
    t51p="Interface\\Icons\\ability_golemthunderclap";t51=CF(F);TrS(t51,xb+sb+ii,yb-6*(sb+ib),"cd51",t51p,sb,false);t51:SetScript(OE,function(self,event,...) Ts(t51,cd51,select(1,...),select(5,...),5246,90) end);
    t52p="Interface\\Icons\\ability_warrior_shockwave";t52=CF(F);TrS(t52,xb+sb*2+ii*2,yb-6*(sb+ib),"cd52",t52p,sb,false);t52:SetScript(OE,function(self,event,...) Ts(t52,cd52,select(1,...),select(5,...),46968,40) end);
    t53p="Interface\\Icons\\ability_warrior_dragonroar";t53=CF(F);TrS(t53,xb+sb*3+ii*3,yb-6*(sb+ib),"cd53",t53p,sb,false);t53:SetScript(OE,function(self,event,...) Ts(t53,cd53,select(1,...),select(5,...),118000,60) end);
    t54p="Interface\\Icons\\ability_warrior_challange";t54=CF(F);TrS(t54,xb+sb*4+ii*4,yb-6*(sb+ib),"cd54",t54p,sb,false);t54:SetScript(OE,function(self,event,...) Ts(t54,cd54,select(1,...),select(5,...),118038,120) end);
    t55p="Interface\\Icons\\ability_warrior_shieldwall";t55=CF(F);TrS(t55,xb+sb*5+ii*5,yb-6*(sb+ib),"cd55",t55p,sb,false);t55:SetScript(OE,function(self,event,...) Ts(t55,cd55,select(1,...),select(5,...),871,180) end);
    t56p="Interface\\Icons\\ability_warrior_bladestorm";t56=CF(F);TrS(t56,xb+sb*6+ii*6,yb-6*(sb+ib),"cd56",t56p,sb,false);t56:SetScript(OE,function(self,event,...) Ts(t56,cd56,select(1,...),select(5,...),46924,60) end);
    t57p="Interface\\Icons\\warrior_skullbanner";t57=CF(F);TrS(t57,xb+sb*7+ii*7,yb-6*(sb+ib),"cd57",t57p,sb,false);t57:SetScript(OE,function(self,event,...) Ts(t57,cd57,select(1,...),select(5,...),1719,180) end);
    t58p="Interface\\Icons\\ability_warrior_bloodbath";t58=CF(F);TrS(t58,xb+sb*8+ii*8,yb-6*(sb+ib),"cd58",t58p,sb,false);t58:SetScript(OE,function(self,event,...) Ts(t58,cd58,select(1,...),select(5,...),12292,60) end);
    t59p="Interface\\Icons\\warrior_talent_icon_avatar";t59=CF(F);TrS(t59,xb+sb*9+ii*9,yb-6*(sb+ib),"cd59",t59p,sb,false);t59:SetScript(OE,function(self,event,...) Ts(t59,cd59,select(1,...),select(5,...),107574,180) end);
    t60p="Interface\\Icons\\spell_nature_ancestralguardian";t60=CF(F);TrS(t60,xb+sb*10+ii*10,yb-6*(sb+ib),"cd60",t60p,sb,false);t60:SetScript(OE,function(self,event,...) Ts(t60,cd60,select(1,...),select(5,...),18499,30) end);
    --druid
    t61p="Interface\\Icons\\spell_druid_massentanglement";t61=CF(F);TrS(t61,xb,yb-7*(sb+ib),"cd61",t61p,sb,false);t61:SetScript(OE,function(self,event,...) Ts(t61,cd61,select(1,...),select(5,...),102359,30) end);
    t62p="Interface\\Icons\\ability_druid_bash";t62=CF(F);TrS(t62,xb+sb+ii,yb-7*(sb+ib),"cd62",t62p,sb,false);t62:SetScript(OE,function(self,event,...) Ts(t62,cd62,select(1,...),select(5,...),5211,50) end);
    t63p="Interface\\Icons\\ability_druid_demoralizingroar";t63=CF(F);TrS(t63,xb+sb*2+ii*2,yb-7*(sb+ib),"cd63",t63p,sb,false);t63:SetScript(OE,function(self,event,...) Ts(t63,cd63,select(1,...),select(5,...),99,30) end);
    t64p="Interface\\Icons\\spell_druid_ursolsvortex";t64=CF(F);TrS(t64,xb+sb*3+ii*3,yb-7*(sb+ib),"cd64",t64p,sb,false);t64:SetScript(OE,function(self,event,...) Ts(t64,cd64,select(1,...),select(5,...),102793,60) end);
    t65p="Interface\\Icons\\spell_nature_stoneclawtotem";t65=CF(F);TrS(t65,xb+sb*4+ii*4,yb-7*(sb+ib),"cd65",t65p,sb,false);t65:SetScript(OE,function(self,event,...) Ts(t65,cd65,select(1,...),select(5,...),22812,60) end);
    t66p="Interface\\Icons\\ability_druid_tigersroar";t66=CF(F);TrS(t66,xb+sb*5+ii*5,yb-7*(sb+ib),"cd66",t66p,sb,false);t66:SetScript(OE,function(self,event,...) Ts(t66,cd66,select(1,...),select(5,...),61336,180) end);
    t67p="Interface\\Icons\\spell_nature_natureblessing";t67=CF(F);TrS(t67,xb+sb*6+ii*6,yb-7*(sb+ib),"cd67",t67p,sb,false);t67:SetScript(OE,function(self,event,...) Ts(t67,cd67,select(1,...),select(5,...),108238,120) end);
    t68p="Interface\\Icons\\achievement_zone_feralas";t68=CF(F);TrS(t68,xb+sb*7+ii*7,yb-7*(sb+ib),"cd68",t68p,sb,false);t68:SetScript(OE,function(self,event,...) Ts(t68,cd68,select(1,...),select(5,...),124974,90) end);
    t69p="Interface\\Icons\\ability_druid_berserk";t69=CF(F);TrS(t69,xb+sb*8+ii*8,yb-7*(sb+ib),"cd69",t69p,sb,false);t69:SetScript(OE,function(self,event,...) Ts(t69,cd69,select(1,...),select(5,...),106952,180) end);
    t70p="Interface\\Icons\\spell_druid_displacement";t70=CF(F);TrS(t70,xb+sb*9+ii*9,yb-7*(sb+ib),"cd70",t70p,sb,false);t70:SetScript(OE,function(self,event,...) Ts(t70,cd70,select(1,...),select(5,...),102280,30) end);
    t71p="Interface\\Icons\\spell_druid_incarnation";t71=CF(F);TrS(t71,xb+sb*10+ii*10,yb-7*(sb+ib),"cd71",t71p,sb,false);t71:SetScript(OE,function(self,event,...) Ts(t71,cd71,select(1,...),select(5,...),102543,180) end);
    --shaman
    t72p="Interface\\Icons\\spell_shaman_hex";t72=CF(F);TrS(t72,xb,yb-8*(sb+ib),"cd72",t72p,sb,false);t72:SetScript(OE,function(self,event,...) Ts(t72,cd72,select(1,...),select(5,...),51514,35) end);
    t73p="Interface\\Icons\\spell_nature_stranglevines";t73=CF(F);TrS(t73,xb+sb+ii,yb-8*(sb+ib),"cd73",t73p,sb,false);t73:SetScript(OE,function(self,event,...) Ts(t73,cd73,select(1,...),select(5,...),51485,30) end);
    t74p="Interface\\Icons\\spell_shaman_spiritlink";t74=CF(F);TrS(t74,xb+sb*2+ii*2,yb-8*(sb+ib),"cd74",t74p,sb,false);t74:SetScript(OE,function(self,event,...) Ts(t74,cd74,select(1,...),select(5,...),98008,180) end);
    t75p="Interface\\Icons\\ability_shaman_astralshift";t75=CF(F);TrS(t75,xb+sb*3+ii*3,yb-8*(sb+ib),"cd75",t75p,sb,false);t75:SetScript(OE,function(self,event,...) Ts(t75,cd75,select(1,...),select(5,...),108271,90) end);
    t76p="Interface\\Icons\\ability_shaman_healingtide";t76=CF(F);TrS(t76,xb+sb*4+ii*4,yb-8*(sb+ib),"cd76",t76p,sb,false);t76:SetScript(OE,function(self,event,...) Ts(t76,cd76,select(1,...),select(5,...),108280,180) end);
    t77p="Interface\\Icons\\ability_shaman_windwalktotem";t77=CF(F);TrS(t77,xb+sb*5+ii*5,yb-8*(sb+ib),"cd77",t77p,sb,false);t77:SetScript(OE,function(self,event,...) Ts(t77,cd77,select(1,...),select(5,...),108273,60) end);
    t78p="Interface\\Icons\\spell_fire_elementaldevastation";t78=CF(F);TrS(t78,xb+sb*6+ii*6,yb-8*(sb+ib),"cd78",t78p,sb,false);t78:SetScript(OE,function(self,event,...) Ts(t78,cd78,select(1,...),select(5,...),114049,180) end);
    t79p="Interface\\Icons\\spell_nature_wispheal";t79=CF(F);TrS(t79,xb+sb*7+ii*7,yb-8*(sb+ib),"cd79",t79p,sb,false);t79:SetScript(OE,function(self,event,...) Ts(t79,cd79,select(1,...),select(5,...),16166,120) end);
    t80p="Interface\\Icons\\ability_shaman_multitotemactivation";t80=CF(F);TrS(t80,xb+sb*8+ii*8,yb-8*(sb+ib),"cd80",t80p,sb,false);t80:SetScript(OE,function(self,event,...) Ts(t80,cd80,select(1,...),select(5,...),108285,180) end);
    t81p="Interface\\Icons\\spell_nature_tremortotem";t81=CF(F);TrS(t81,xb+sb*9+ii*9,yb-8*(sb+ib),"cd81",t81p,sb,false);t81:SetScript(OE,function(self,event,...) Ts(t81,cd81,select(1,...),select(5,...),8143,60) end);
    t82p="Interface\\Icons\\spell_nature_groundingtotem";t82=CF(F);TrS(t82,xb+sb*10+ii*10,yb-8*(sb+ib),"cd82",t82p,sb,false);t82:SetScript(OE,function(self,event,...) Ts(t82,cd82,select(1,...),select(5,...),8177,25) end);
    --hunter
    t83p="Interface\\Icons\\ability_whirlwind";t83=CF(F);TrS(t83,xb,yb-9*(sb+ib),"cd83",t83p,sb,false);t83:SetScript(OE,function(self,event,...) Ts(t83,cd83,select(1,...),select(5,...),19263,180) end);
    t84p="Interface\\Icons\\ability_hunter_onewithnature";t84=CF(F);TrS(t84,xb+sb+ii,yb-9*(sb+ib),"cd84",t84p,sb,false);t84:SetScript(OE,function(self,event,...) Ts(t84,cd84,select(1,...),select(5,...),109304,120) end);
    t85p="Interface\\Icons\\ability_hunter_bestialdiscipline";t85=CF(F);TrS(t85,xb+sb*2+ii*2,yb-9*(sb+ib),"cd85",t85p,sb,false);t85:SetScript(OE,function(self,event,...) Ts(t85,cd85,select(1,...),select(5,...),121818,300) end);
    t86p="Interface\\Icons\\ability_druid_ferociousbite";t86=CF(F);TrS(t86,xb+sb*3+ii*3,yb-9*(sb+ib),"cd86",t86p,sb,false);t86:SetScript(OE,function(self,event,...) Ts(t86,cd86,select(1,...),select(5,...),19574,60) end);
    t87p="Interface\\Icons\\ability_hunter_resistanceisfutile";t87=CF(F);TrS(t87,xb+sb*4+ii*4,yb-9*(sb+ib),"cd87",t87p,sb,false);t87:SetScript(OE,function(self,event,...) Ts(t87,cd87,select(1,...),select(5,...),109259,45) end);
    --monk
    t88p="Interface\\Icons\\ability_monk_paralysis";t88=CF(F);TrS(t88,xb+sb*5+ii*5,yb-9*(sb+ib),"cd88",t88p,sb,false);t88:SetScript(OE,function(self,event,...) Ts(t88,cd88,select(1,...),select(5,...),115078,15) end);
    t89p="Interface\\Icons\\ability_monk_fortifyingale_new";t89=CF(F);TrS(t89,xb+sb*6+ii*6,yb-9*(sb+ib),"cd89",t89p,sb,false);t89:SetScript(OE,function(self,event,...) Ts(t89,cd89,select(1,...),select(5,...),115203,180) end);
    t90p="Interface\\Icons\\ability_monk_zenmeditation";t90=CF(F);TrS(t90,xb+sb*7+ii*7,yb-9*(sb+ib),"cd90",t90p,sb,false);t90:SetScript(OE,function(self,event,...) Ts(t90,cd90,select(1,...),select(5,...),115176,180) end);
  end
  frame:SetScript("OnEvent", eventHandler)
end