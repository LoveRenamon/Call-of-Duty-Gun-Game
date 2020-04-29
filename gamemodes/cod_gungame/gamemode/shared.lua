--[[-------------------------------------------------------------------------

	Copyright © Fabian Wennink - All rights reserved
	CALL OF DUTY is a trademark of Activision Publishing, Inc.

	Please do not copy and/or re-distribute any code without my
	written permission.

---------------------------------------------------------------------------]]

GM.Name = "Call of Duty - Gun Game"
GM.Author = "Original by: Fabian Wennink"
GM.Website = "https://www.fabianwennink.nl"

function GM:Initialize()

	-- COD HUD Font
	resource.AddSingleFile("resource/fonts/bankgthd.ttf")
	resource.AddSingleFile( "materials/hud/knife.png" )
	resource.AddSingleFile( "materials/hud/m9.png" )
	resource.AddSingleFile( "materials/hud/skull.png" )

	if( SERVER ) then
		if(GG_USE_TFA) then
			MsgC( Color( 255, 204, 51 ), "[Call of Duty - Gun Game] Using TFA Weapons" )
			resource.AddWorkshop("415143062") -- TFA Base
			resource.AddWorkshop("866368346") -- TFA INS2 Shared Parts
			resource.AddWorkshop("1333109607") -- TFA INS2 GiTS Sights Extension
			resource.AddWorkshop("582493650") -- TFA No More Room in Hell Firearm SWEPs
			resource.AddWorkshop("832086722") -- TFA AVA Small Arms Pack

			resource.AddWorkshop("762408261") -- TFA Bombshell Tri-Revolver
			resource.AddWorkshop("785580807") -- TFA VP70
			resource.AddWorkshop("867971938") -- TFA Vector
			resource.AddWorkshop("1243624080") -- TFA H&K MP7
			resource.AddWorkshop("1463245906") -- TFA P90
			resource.AddWorkshop("873701799") -- TFA AK12
			resource.AddWorkshop("1522738778") -- TFA AKM (AK47 bait)
			resource.AddWorkshop("785336854") -- TFA SCAR-H || Mk.20 Mod 0
			resource.AddWorkshop("1363932517") -- TFA AUG
			resource.AddWorkshop("783401651") -- TFA M950
			resource.AddWorkshop("795125103") -- TFA M240B
			resource.AddWorkshop("1307539172") -- TFA AR-15
			resource.AddWorkshop("1676032134") -- TFA AR-15
			resource.AddWorkshop("742777629") -- TFA M1918 BAR
			resource.AddWorkshop("921417323") -- TFA CheyTac M200
			resource.AddWorkshop("1230930270") -- TFA Kar98k
			resource.AddWorkshop("870165339") -- TFA Hyper's RFB
			resource.AddWorkshop("866368352") -- TFA GOL Magnum
			resource.AddWorkshop("881075089") -- TFA RPG7

			-- Aditional disabled workshop weapons for no use
			--resource.AddWorkshop("880974987") -- TFA Freedom SR
			--resource.AddWorkshop("1358056848") -- TFA SKS
			--resource.AddWorkshop("873252197") -- TFA Remington MSR
			--resource.AddWorkshop("860057535") -- TFA SPAS-12
			--resource.AddWorkshop("738512664") -- TFA MP40/U
			--resource.AddWorkshop("876487668") -- TFA KSG
			--resource.AddWorkshop("1490190269") -- TFA M60
			--resource.AddWorkshop("869372937") -- TFA M249
			--resource.AddWorkshop("810994797") -- TFA KS-23
			--resource.AddWorkshop("739573232") -- TFA Mosin Nagant 91/30
			--resource.AddWorkshop("741416444") -- TFA Sten Mk. II
			--resource.AddWorkshop("738952543") -- TFA M500
			--resource.AddWorkshop("742059096") -- TFA Dragon's Breath
			--resource.AddWorkshop("740317766") -- TFA Desert Eagle
			--resource.AddWorkshop("786266249") -- TFA Dual Deagle
			--resource.AddWorkshop("740878170") -- TFA Galil SAR-Ext
			--resource.AddWorkshop("753887005") -- TFA Cele's RU-556
			--resource.AddWorkshop("1334129559") -- TFA Forst-500
			--resource.AddWorkshop("1349149066") -- TFA C7E
			--resource.AddWorkshop("1363006331") -- TFA Kimber Night Warrior
			--resource.AddWorkshop("1259466583") -- TFA ARX-160
			--resource.AddWorkshop("1364750934") -- TFA Volk
			--resource.AddWorkshop("1348871148") -- TFA HK417

			RunConsoleCommand("sv_tfa_soundscale","0") -- This should keep the sound working when time scaled events occur while in Multiplayer.

		else

			MsgC( Color( 255, 10, 10 ), "[Call of Duty - Gun Game] Using default weapons.")

		end

		if(GG_USE_PLAYERMODELS) then
		MsgC( Color( 255, 204, 51 ), "[Call of Duty - Gun Game] custom playermodels enabled.")
			--resource.AddWorkshop("000000") -- manual add workshop ID if needed
		else
			MsgC( Color( 255, 10, 10 ), "[Call of Duty - Gun Game] no custom playermodels, using the default.")
		end

	    -- 0 = not started,
	    -- 1 = playing,
	    -- 2 = match beginning,
	    -- 3 = round changing
		SetGlobalInt( "GG_GAME_STATUS" , 0 )
		SetGlobalInt( "GG_CURRENT_ROUND" , 1 )
		SetGlobalInt( "GG_MATCH_START_TIMER" , 10 )
		SetGlobalInt( "GG_ROUND_END_TIMER", 20 )
		SetGlobalBool( "GG_INVERT_WEAPON_LIST", false )
	end

	if( CLIENT ) then

		surface.CreateFont( "COD_FONT_1", { font = "BankGothic Md BT", size = 25, antialias = true })
		surface.CreateFont( "COD_FONT_2", { font = "BankGothic Md BT", size = 18, antialias = true })
		surface.CreateFont( "COD_FONT_3", { font = "BankGothic Md BT", size = 14, antialias = true })
		surface.CreateFont( "COD_FONT_COUNT_1", { font = "BankGothic Md BT", size = 50, antialias = true })
		surface.CreateFont( "COD_FONT_COUNT_2", { font = "BankGothic Md BT", size = 100, antialias = true })
		surface.CreateFont( "COD_FONT_SCORE_1", { font = "BankGothic Md BT", size = 30, antialias = true })

	end

	self.BaseClass.Initialize(self)

end

-- Count values in table
function countValues(tbl)

	local total = 0
	for k, v in ipairs( tbl ) do
		total = total + 1
	end

	return total

end
