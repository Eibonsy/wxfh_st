-------------------------------------------------------------------
---文件: Server\Skywalker\Module\Map\MapInstanceMgr.lua
---作者: shyfan
---日期: 2025/03/10 15:53:52
---功能: 地图实例管理
-------------------------------------------------------------------
local includeModule = Skywalker.RequireModule
local includeGame = Skywalker.RequireGame

includeModule("Map/MapInstance.lua")

local function includeMap(luaPath)
    return includeGame("Map/" .. luaPath)
end

---@class MapInstanceMgr
local MapInstanceMgr = {}

---@type table<string, MapInstanceS> 地图实例
local mapInstanceList = {}

--* 创建地图实例
---@param oldMapID string 原地图
---@param newMapID string 新地图
---@return boolean 是否成功
function MapInstanceMgr:CreateMapInstance(oldMapID, newMapID)
    -- TODO include 对应的地图lua文件
    local mapClass = includeMap("Map_Battlefield.lua")

    --  创建地图实例
    local mapInstance = mapClass:new(oldMapID, newMapID)
    mapInstanceList[newMapID] = mapInstance

    return true
end

--* 删除地图实例
---@param mapID string 地图ID
---@return boolean 是否成功
function MapInstanceMgr:DeleteMapInstance(mapID)
    mapInstanceList[mapID] = nil

    return true
end

--* 获取地图实例
---@param mapID string 地图ID
---@return MapInstanceS 地图实例
function MapInstanceMgr:GetMapInstance(mapID)
    return mapInstanceList[mapID]
end

return MapInstanceMgr
