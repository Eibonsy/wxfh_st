-------------------------------------------------------------------
---文件: Server\Skywalker\Module\Map\MapProxy.lua
---作者: shyfan
---日期: 2025/03/10 18:07:46
---功能: 地图代理
-------------------------------------------------------------------
local libGlobalSafeDefine = Skywalker.GlobalSafeDefine

local skyModule = SKYS_Module
local EEventIDS = Skywalker.GameMisc.EventIDS.id

local logObject = Skywalker.Logger:GetLogObject("Module.Map")

-- * 玩家进入地图
---@param player userdata 玩家对象
---@param mapID string 地图ID
---@param x integer x坐标
---@param y integer y坐标
local function entermap(player, mapID, x, y)
    local mapInstance = skyModule.map:GetMapInstance(mapID)
    if mapInstance then
        mapInstance:OnPlayerEnter(player, mapID, x, y)
    end

    skyModule.event:FireEvent(EEventIDS.Map_Enter, {player, mapID, x, y})
end
libGlobalSafeDefine("entermap", entermap)

-- * 玩家离开地图
---@param player userdata 玩家对象
---@param mapID string 地图ID
---@param x integer x坐标
---@param y integer y坐标
local function leavemap(player, mapID, x, y)
    local mapInstance = skyModule.map:GetMapInstance(mapID)
    if mapInstance then
        mapInstance:OnPlayerLeave(player, mapID, x, y)
    end

    skyModule.event:FireEvent(EEventIDS.Map_Leave, {player, mapID, x, y})
end
libGlobalSafeDefine("leavemap", leavemap)

-- * 镜像地图销毁
---@param map userdata 地图对象
---@param mapID string 地图ID
local function mirrormapend(map, mapID)
    local mapInstance = skyModule.map:GetMapInstance(mapID)
    if mapInstance then
        mapInstance:OnMirrorMapDestroy(map, mapID)
    end

end
libGlobalSafeDefine("mirrormapend", mirrormapend)

-- * 进入地图传送点前
---@param player userdata 玩家对象
---@param mapID string 地图ID
---@param x integer x坐标
---@param y integer y坐标
---@return boolean 是否可以传送
local function beforeroute(player, mapID, x, y)
    local mapInstance = skyModule.map:GetMapInstance(mapID)
    if mapInstance then
        return mapInstance:OnBeforeEnterTeleport(player, mapID, x, y)
    end

    return true

end
libGlobalSafeDefine("beforeroute", beforeroute)
