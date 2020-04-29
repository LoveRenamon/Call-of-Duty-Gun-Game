---------------------------------------------------------------------------
-- Enable / disable the usage of the TFA weapon list.
GG_USE_TFA = true

---------------------------------------------------------------------------
-- Enable / disable the usage of custom playermodels.
GG_USE_PLAYERMODELS = false

---------------------------------------------------------------------------
GG_WEAPONS_LIST = {
	{ weapon = "tfa_ava_trigun", ammo = 30 }, -- Bombshell Tri-Revolver
	{ weapon = "tfa_l4d2_vp70", ammo = 30 }, -- VP70
	{ weapon = "tfa_nmrih_g17", ammo = 32 }, -- Glock
	{ weapon = "tfa_ins2_krissv", ammo = 60 }, -- Vector
	{ weapon = "tfa_ins2_mp7", ammo = 60 }, -- H&K MP7
	{ weapon = "tfa_ins2_mwr_p90", ammo = 100 }, -- P90
	{ weapon = "tfa_ins2_ak12", ammo = 45 }, -- AK12
	{ weapon = "tfa_ins2_akm_bw", ammo = 40 }, -- AKM (AK47 bait)
	{ weapon = "tfa_l4d2_rocky_scarh", ammo = 30 }, -- SCAR
	{ weapon = "tfa_ins2_aug_a3", ammo = 30 }, -- AUG
	{ weapon = "tfa_l4d2_calico", ammo = 150 }, -- M950
	{ weapon = "tfa_l4d2_m240b", ammo = 100 }, -- M240B
	{ weapon = "tfa_kzsf_vc30", ammo = 30 }, -- VC30
	{ weapon = "tfa_nmrih_1892", ammo = 12 }, -- Winchester 1892
	{ weapon = "tfa_l4d2_rocky_ro2bar", ammo = 40 }, -- M1918
	{ weapon = "tfa_l4d2_ctm200", ammo = 60 }, -- M200
	{ weapon = "tfa_ins2_k98", ammo = 15 }, -- Kar98k
	{ weapon = "tfa_ins2_rfb", ammo = 15 }, -- RFB
	{ weapon = "tfa_ins2_gol", ammo = 8 }, -- GOL Magnum
	{ weapon = "tfa_ins2_rpg", ammo = 1 }, -- RPG7
}

--[[-------------------------------------------------------------------------
This is the back-up weapons list that will be used during the game if somehow the above weapons lists doesn't work. Leave this list untouched.
---------------------------------------------------------------------------]]
GG_BACKUP_WEAPONS_LIST = {
	{ weapon = "weapon_357", ammo = 36 },
	{ weapon = "weapon_pistol", ammo = 36 },
	{ weapon = "weapon_smg1", ammo = 64 },
	{ weapon = "weapon_shotgun", ammo = 40 },
	{ weapon = "weapon_ar2", ammo = 100 },
	{ weapon = "weapon_crossbow", ammo = 10 },
	{ weapon = "weapon_rpg", ammo = 2 },
	{ weapon = "weapon_357", ammo = 36 },
	{ weapon = "weapon_pistol", ammo = 36 },
	{ weapon = "weapon_smg1", ammo = 64 },
	{ weapon = "weapon_shotgun", ammo = 40 },
	{ weapon = "weapon_ar2", ammo = 100 },
	{ weapon = "weapon_crossbow", ammo = 10 },
	{ weapon = "weapon_rpg", ammo = 2 },
	{ weapon = "weapon_357", ammo = 36 },
	{ weapon = "weapon_pistol", ammo = 36 },
	{ weapon = "weapon_smg1", ammo = 64 },
	{ weapon = "weapon_shotgun", ammo = 40 },
	{ weapon = "weapon_ar2", ammo = 100 },
	{ weapon = "weapon_crossbow", ammo = 10 },
}

--[[-------------------------------------------------------------------------
This is the secondary weapon which should be a melee weapon of some sort.

Note: If somehow the melee weapon down below doesn't work, the back-up melee weapon will be used instead.
---------------------------------------------------------------------------]]
GG_KNIFE = "weapon_fists"
GG_KNIFE_THROW = "weapon_fists"

--[[-------------------------------------------------------------------------
This is the back-up melee weapon that will be used during the game if somehow the above melee weapon doesn't work. Leave this list untouched.
---------------------------------------------------------------------------]]
GG_BACKUP_KNIFE = "weapon_crowbar"
GG_BACKUP_KNIFE_THROW = "weapon_crowbar"

--[[-------------------------------------------------------------------------
This is a list of custom playermodels that will be used during the game.
---------------------------------------------------------------------------]]
GG_PLAYERMODEL_LIST = {
	"models/debiddo/kyuukimon/kyuukimon_pm.mdl"
}

--[[-------------------------------------------------------------------------
This is a list of playermodels that will be used during the game if somehow the playermodels in the list above don't work. Leave this list untouched.
---------------------------------------------------------------------------]]
GG_BACKUP_SKINS_LIST = {
	"models/player/urban.mdl",
	"models/player/gasmask.mdl",
	"models/player/riot.mdl",
	"models/player/swat.mdl",
	"models/player/leet.mdl",
	"models/player/guerilla.mdl",
	"models/player/arctic.mdl",
	"models/player/phoenix.mdl"
}

--[[-------------------------------------------------------------------------
The default number of minutes a round will take. You can also edit this in-game.
---------------------------------------------------------------------------]]
GG_ROUND_TIME_IN_MINUTES = 15

--[[-------------------------------------------------------------------------
The default amount of rounds a match has. You can also edit this in-game.
---------------------------------------------------------------------------]]
GG_AMOUNT_OF_ROUNDS_PER_MATCH = 5

--[[-------------------------------------------------------------------------
This is a list of usernames who can edit the game settings and start the match. If you leave the list empty, every player can start the match.

Note: If a player has admin rights but is not present in this list, he/she can still start and control the game.

Example: GG_ALLOWED_PLAYERS = { "poepjejan1", "bluedragon102" }
---------------------------------------------------------------------------]]
GG_ALLOWED_PLAYERS = {}

--[[-------------------------------------------------------------------------
MySQL Support. If enabled, certain game stats will be stored which can be used later on by for example, a dashboard on a website.

Requirements to get this feature working:

- Have gmsv_tmysql4 installed on the dedicated server
	Windows: https://github.com/bkacjios/gm_tmysql4/releases/download/R1/gmsv_tmysql4_win32.dll
	Linux: https://github.com/bkacjios/gm_tmysql4/releases/download/R1.01/gmsv_tmysql4_linux.dll

	Install in "path/to/server/garrysmod/lua/bin/".
	(create the bin folder if it does not exist)

- Have libmysql/libmysqlclient installed on the dedicated server
	Windows: https://github.com/syl0r/MySQLOO/raw/master/MySQL/lib/windows/libmysql.dll
	Linux: https://github.com/syl0r/MySQLOO/raw/master/MySQL/lib/linux/libmysqlclient.so.18

	Install in "path/to/server/".
	(in the folder that contains srcds.exe or srcds_run)

Note: no pre-made website dashboard will be provided. You need to have programming knowledge to develop your own.
---------------------------------------------------------------------------]]
GG_USE_MYSQL = false
GG_MYSQL_HOST = "localhost"
GG_MYSQL_USERNAME = "username"
GG_MYSQL_PASSWORD = "password"
GG_MYSQL_DATABASE = "database"
GG_MYSQL_POST = 3306

--[[-------------------------------------------------------------------------
keep this disabled on real servers - for debugging only.
---------------------------------------------------------------------------]]
GG_DEBUG = true
