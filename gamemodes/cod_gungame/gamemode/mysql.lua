--[[
For server owners who like to display game stats on their website / join screen, I added MySQL support. Certain game and player stats like wins, kills and deaths will be stored when this setting is enabled and configured properly.

>> Installation of the MySQL modules
Because Gmod doesn't have a MySQL driver installed by default, you have to install it yourself.
The required modules you need to install are `tmysql4` and `libmysql/libmysqlclient`.

>>> tmysql4
* Windows: https://github.com/bkacjios/gm_tmysql4/releases/download/R1/gmsv_tmysql4_win32.dll
* Linux: https://github.com/bkacjios/gm_tmysql4/releases/download/R1.01/gmsv_tmysql4_linux.dll

Copy the file to "path/to/server/garrysmod/lua/bin/". If the bin folder doesn't exist, go ahead and create one.

>>> libmysql/libmysqlclient
* Windows: https://github.com/syl0r/MySQLOO/raw/master/MySQL/lib/windows/libmysql.dll
* Linux: https://github.com/syl0r/MySQLOO/raw/master/MySQL/lib/linux/libmysqlclient.so.18

Copy the file to "path/to/server/". This is the folder that contains `srcds.exe` or `srcds_run`.

>> Database table
When you run the gamemode for the first time, it will automatically create the table `gmod_gungame` in your database.
The table will have the following columns:

```id, username, steam_id, rounds_played, rounds_won, rounds_lost, rounds_tied, total_kills, total_deaths, last_played```

`id` is the primary key, `username` is the unique key.
--]]

if(GG_USE_MYSQL) then
    require("tmysql4")

    ---------------------------------------------------
    -- Create database instance
    local db, err = tmysql.Create(GG_MYSQL_HOST, GG_MYSQL_USERNAME, GG_MYSQL_PASSWORD, GG_MYSQL_DATABASE, GG_MYSQL_POST)

    -- Called on connect
    local function createTable()
        print( "[Call of Duty - Gun Game] Established a connection with the MySQL database at '" .. GG_MYSQL_HOST .. "'!" )
    end

    local status, err = db:Connect()

    if err then
        print( "[Call of Duty - Gun Game] MySQL Connection error: " .. err )
        GG_USE_MYSQL = false
    else
        db:Query("CREATE TABLE IF NOT EXISTS `gmod_gungame` ( `id` int(11) NOT NULL AUTO_INCREMENT, `username` varchar(64) NOT NULL DEFAULT '0', `steam_id` varchar(64) NOT NULL DEFAULT '0', `rounds_played` int(11) NOT NULL DEFAULT '0', `rounds_won` int(11) NOT NULL DEFAULT '0', `rounds_lost` int(11) NOT NULL DEFAULT '0', `rounds_tied` int(11) NOT NULL DEFAULT '0', `total_kills` int(11) NOT NULL DEFAULT '0', `total_deaths` int(11) NOT NULL DEFAULT '0', `last_played` varchar(64) NOT NULL DEFAULT '0', PRIMARY KEY (`id`), UNIQUE KEY `username` (`username`) ) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;", createTable)
    end
    ---------------------------------------------------

    -- Update score function
    function updateScoreDatabase( player, steam_id, kills, deaths, status )

        local game_status

        if(status == 0) then
            game_status = "rounds_won"
        elseif(status == 1) then
            game_status = "rounds_lost"
        else
            game_status = "rounds_tied"
        end

        db:Query("INSERT INTO `gmod_gungame` (username, steam_id, rounds_played, " .. game_status .. ", total_kills, total_deaths, last_played) VALUES ('" .. player .. "', '" .. steam_id .. "', '1', '1', '" .. kills .. "', '" .. deaths .. "', '" .. os.time() .. "') ON DUPLICATE KEY UPDATE rounds_played = rounds_played+1, total_kills = " .. kills .. ", total_deaths = " .. deaths .. ", last_played = " .. os.time() .. ", " .. game_status .. " = " .. game_status .. "+1")

    end

end
