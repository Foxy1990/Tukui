local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

-- CONFIG
yearsvar = 0						-- Number of years since the member was last online (number)
monthsvar = 0						-- Number of months since the member was last online (number)
daysvar = 14						-- Number of days since the member was last online (number)
hoursvar = 0						-- Number of hours since the member was last online (number)
rankvar = "Neuling"					-- Name of the member's rank (string)
prefix = "|cffcb0073Gui:|r "


SLASH_GUI1 = "/GUI"
function SlashCmdList.GUI(aguis)
	if (aguis == "") then
		ChatFrame1:AddMessage(""..prefix.."Usage:", 1.0, 0.0, 0.0);
		ChatFrame1:AddMessage(""..prefix.."/gui kick to Kick all Members with Rank "..rankvar.." and Offlineday's > "..daysvar, 1.0, 0.0, 0.0);
		ChatFrame1:AddMessage(""..prefix.."/gui promote to Promote all Level 20 Members with  Rank "..rankvar.." and Lastonline <= 1 Day's" , 1.0, 0.0, 0.0);
	end
	
	if (aguis == "kick") then
		kick_check()
	end
	
	if (aguis == "promote") then
		promote_check()
	end
	
	if (aguis == "full") then
		promote_check()
		kick_check()
	end
end