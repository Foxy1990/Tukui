--[[ PROMOTE START ]]--
function promote_check()
	if not CanGuildPromote()  then
		ChatFrame1:AddMessage(""..prefix.."Insufficient Permissions. You can not Promote Guild Members!", 1.0, 0.0, 0.0);
		else
		StartpromoteIcd()
		for i=1, GetNumGuildMembers() do
			name, rank, rankIndex, level = GetGuildRosterInfo(i);
			years,months,days,hours = GetGuildRosterLastOnline(i);
			years,months,days,hours = years and years or 0, months and months or 0, days and days or 0, hours and hours or 0;
		if rank == rankvar and (level >= 20 and years == 0 and months == 0 and days <= 1) then
			GuildPromote(name)
		end
	end
end

end

--[[ TIMER START ]]--
_, _, promote_tex = GetSpellInfo(52635) -- http://wowhead.com/spell=52635
promote = CreateFrame("Frame",nil,UIParent)
promote:Width(30)
promote:Height(30)
promote:Point("CENTER",UIParent, "CENTER", -69, -100)
promote:SetTemplate()

promote.icon = promote:CreateTexture(nil, "OVERLAY")
promote.icon:Point("TOPLEFT", promote, "TOPLEFT", 2, -2)
promote.icon:Point("BOTTOMRIGHT", promote, "BOTTOMRIGHT", -2, 2)
promote.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
promote.icon:SetTexture(promote_tex)

promote.cooldown = CreateFrame("Cooldown", nil, promote, "CooldownFrameTemplate")
promote.cooldown:SetAllPoints(promote.icon)

promote:Hide()

promote_icd = false
promoteTimepromoteroup = promote:CreateAnimationGroup()
promoteTimer = promoteTimepromoteroup:CreateAnimation("Alpha")
promoteTimer:SetDuration(4)


promoteTimer:SetScript("OnFinished",function()
	SendChatMessage("Promoted all Level 20 Members with  Rank "..rankvar.." and Lastonline <= 1 Day's", "GUILD");
	promote:Hide()
	promote_icd = false
end)

 function StartpromoteIcd()
	promote_icd = true
	promote:Show()
	promote.cooldown:SetCooldown(GetTime(),4)
	promoteTimepromoteroup:Play()
end