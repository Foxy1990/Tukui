--[[ kick START ]]--
function kick_check()
	if not CanGuildRemove() then
		ChatFrame1:AddMessage(""..prefix.."Insufficient Permissions. You can not Kick kickld Members!", 1.0, 0.0, 0.0);
		else
		StartkickIcd()
		for i=1, GetNumGuildMembers() do
			name, rank, rankIndex = GetGuildRosterInfo(i);
			years,months,days,hours = GetGuildRosterLastOnline(i);
			years,months,days,hours = years and years or 0, months and months or 0, days and days or 0, hours and hours or 0;
	
		if rank == rankvar and (days > daysvar or years > yearsvar or months > monthsvar) then
			GuildUninvite(name)
			ChatFrame1:AddMessage(""..prefix.."Rank: "..rank.." Name: "..name.." Days: "..days.." Hours: "..hours, 1.0, 0.0, 0.0);
		end
		end
	end
end

--[[ TIMER START ]]--
_, _, kick_tex = GetSpellInfo(52635) -- http://wowhead.com/spell=52635
kick = CreateFrame("Frame",nil,UIParent)
kick:Width(30)
kick:Height(30)
kick:Point("CENTER",UIParent, "CENTER", -100, -100)
kick:SetTemplate(Elv)

kick.icon = kick:CreateTexture(nil, "OVERLAY")
kick.icon:Point("TOPLEFT", kick, "TOPLEFT", 2, -2)
kick.icon:Point("BOTTOMRIGHT", kick, "BOTTOMRIGHT", -2, 2)
kick.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
kick.icon:SetTexture(kick_tex)

kick.cooldown = CreateFrame("Cooldown", nil, kick, "CooldownFrameTemplate")
kick.cooldown:SetAllPoints(kick.icon)

kick:Hide()

kick_icd = false
kickTimekickroup = kick:CreateAnimationGroup()
kickTimer = kickTimekickroup:CreateAnimation("Alpha")
kickTimer:SetDuration(4)


kickTimer:SetScript("OnFinished",function()
	SendChatMessage("Kicked all Members with Rank "..rankvar.." and Offlineday's > "..daysvar, "GUILD");
	kick:Hide()
	kick_icd = false
end)

 function StartkickIcd()
	kick_icd = true
	kick:Show()
	kick.cooldown:SetCooldown(GetTime(),4)
	kickTimekickroup:Play()
end