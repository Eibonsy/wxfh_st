-------------------------------------------------------------------
---文件: Server\Skywalker\Module\Player\PlayerProxyS.lua
---作者: shyfan
---日期: 2025/03/14 21:34:59
---功能: 玩家代理
-------------------------------------------------------------------
local libGlobalSafeDefine = Skywalker.GlobalSafeDefine

local logObject = Skywalker.Logger:GetLogObject("Module.Player")

local utilTool = UtilTool
local skyModule = SKYS_Module
local GameMisc = Skywalker.GameMisc

local EEventIDS = GameMisc.EventIDS.id

-- * 玩家登录
-- ! 每次登录都会触发
---@param player userdata 玩家
local function login(player)
    logObject:Debug(utilTool.string.Format("玩家ID %s 名称 %s 登录游戏", skyModule.object:GetID(player),
        skyModule.object:GetName(player)))

    skyModule.event:FireEvent(EEventIDS.Player_Login, player)
end
libGlobalSafeDefine("login", login)

-- * 跨天登录
-- ! 在线玩家跨0点会触发，之后今日内登录不会触发
-- ! 跨0点不在线玩家，登录会触发
-- ! 新玩家不会触发
---@param player userdata 玩家对象
local function resetday(player)
    logObject:Debug(utilTool.string.Format("玩家ID %s 名称 %s 跨天登录游戏", skyModule.object:GetID(player),
        skyModule.object:GetName(player)))

    skyModule.event:FireEvent(EEventIDS.Player_CrossDayLogin, player)
end
libGlobalSafeDefine("resetday", resetday)

-- * 每天首次登录
-- ! 每天首次登录触发
-- ! 就算跨0点了，今日内再次登录也会触发
-- ! 新玩家会触发
---@param player userdata 玩家对象
local function setday(player)
    logObject:Debug(utilTool.string.Format("玩家ID %s 名称 %s 每天首次登录游戏",
        skyModule.object:GetID(player), skyModule.object:GetName(player)))

    skyModule.event:FireEvent(EEventIDS.Player_DailyFirstLogin, player)

end
libGlobalSafeDefine("setday", setday)

-- * 击杀玩家
---@param killer userdata 击杀者
---@param player userdata 死亡玩家
local function killplay(killer, player)
    -- 地图通知
    local mapID = skyModule.object:GetMapID(killer)
    local mapInstance = skyModule.map:GetMapInstance(mapID)
    if mapInstance then
        mapInstance:OnKillPlayer(killer, player)
    end

    -- TODO 广播一个事件
end
libGlobalSafeDefine("killplay", killplay)

-- * 玩家死亡
---@param player userdata 死亡玩家
---@param killer userdata 击杀者
local function playdie(player, killer)
    -- 地图通知
    local mapID = skyModule.object:GetMapID(player)
    local mapInstance = skyModule.map:GetMapInstance(mapID)
    if mapInstance then
        mapInstance:OnPlayerDie(player, killer)
    end

    skyModule.event:FireEvent(EEventIDS.Player_Die, {player, killer})

end
libGlobalSafeDefine("playdie", playdie)
