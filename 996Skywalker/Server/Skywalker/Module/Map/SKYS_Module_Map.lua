-------------------------------------------------------------------
---文件: Server\Skywalker\Module\Map\SKYS_Module_Map.lua
---作者: shyfan
---日期: 2025/03/07 14:54:22
---功能: SKYS_Module_Map 地图模块
-------------------------------------------------------------------
local includeModule = Skywalker.RequireModule

local skyModule = SKYS_Module
local logObject = Skywalker.Logger:GetLogObject("Module.Map")

local mapInstanceMgr = includeModule("Map/MapInstanceMgr.lua")

includeModule("Map/MapProxy.lua")

---@class SKYS_Module_Map
local SKYS_Module_Map = {}

-- * 创建镜像地图
---@param oldMapID string 原地图
---@param newMapID string 新地图
---@param newMapName string 新地图名称
---@param time integer 有效时间
---@param backMapID string 回城地图
---@return boolean 是否成功
function SKYS_Module_Map:CreateMirrorMap(oldMapID, newMapID, newMapName, time, backMapID)
    -- 创建地图实例
    if not mapInstanceMgr:CreateMapInstance(oldMapID, newMapID) then
        logObject:Error("以地图 " .. oldMapID .. " 为原地图创建地图 " .. newMapID .. " 实例失败")
        return false
    end

    local result = addmirrormap(oldMapID, newMapID, newMapName, time, backMapID)
    if not result then
        logObject:Error("创建地图 " .. newMapID .. " 失败")
        return false
    end

    return true
end

-- * 删除镜像地图
---@param mapID string 地图ID
---@return boolean 是否成功
function SKYS_Module_Map:DeleteMirrorMap(mapID)
    delmirrormap(mapID)

    -- TODO 需要判断是否成功

    -- 删除地图实例
    mapInstanceMgr:DeleteMapInstance(mapID)

    return true
end

-- * 获取地图实例
---@param mapID string 地图ID
---@return MapInstanceS 地图实例
function SKYS_Module_Map:GetMapInstance(mapID)
    return mapInstanceMgr:GetMapInstance(mapID)
end

-- * 地图随机传送
---@param player userdata 玩家
---@param mapID string 地图ID
function SKYS_Module_Map:MapTransfer(player, mapID)
    map(player, mapID)
end

-- * 地图传送
---@param player userdata 玩家
---@param mapID string 地图ID
---@param x integer 坐标X
---@param y integer 坐标Y
---@param range integer 传送范围
function SKYS_Module_Map:MapTransferXY(player, mapID, x, y, range)
    mapmove(player, mapID, x, y, range)
end

return SKYS_Module_Map
