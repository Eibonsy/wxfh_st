-------------------------------------------------------------------
---文件: Server\Skywalker\Game\Dream\DreamMgrS.lua
---作者: shyfan
---日期: 2025/06/27 15:45:17
---功能: 梦境管理器（Dream Manager）
-------------------------------------------------------------------
local includeGame = Skywalker.RequireGame

includeGame("Dream/DreamNetMessageS.lua")

local skyModule = SKYS_Module

local logObject = Skywalker.Logger:GetLogObject("Game.Dream")

local dreamAddId = 0

---@class DreamMgrS:Class 梦境管理器
---@field public new fun(...):DreamMgrS 创建实例
local DreamMgrS = Class("DreamMgrS")

-- * 构造函数
function DreamMgrS:Ctor()
    logObject:Debug("梦境管理器创建")
end

-- * 析构函数
function DreamMgrS:Dtor()
    logObject:Debug("梦境管理器销毁")
end

-- * 请求进入梦境
---@param player userdata 玩家对象
---@param dreamId integer 梦境ID
---@param rspData DreamEnterRspDataS
function DreamMgrS:ReqEnterDream(player, dreamId, rspData)
    local dreamConfig = skyModule.config.allTables.TbSDreamBase:GetData(dreamId)
    if not dreamConfig then
        logObject:Error("无效的梦境ID: " .. tostring(dreamId))
        return
    end

    -- TODO Shyfan 是否能进入梦境的逻辑判断

    local mapConfig = skyModule.config.allTables.TbSMapBase:GetData(dreamConfig.MapId)
    if not mapConfig then
        logObject:Error("梦境 " .. dreamId .. " 的地图配置无效: " .. tostring(dreamConfig.MapId))
        return
    end
    local pos = mapConfig.BirthPosList[1]
    if pos == nil then
        logObject:Error("梦境 " .. dreamId .. " 的地图出生点配置无效")
        return
    end

    -- * 创建梦境地图
    dreamAddId = dreamAddId + 1
    local mapId = "Dream_" .. dreamId .. "_" .. dreamAddId .. "_" .. skyModule.object:GetID(player)
    skyModule.map:CreateMirrorMap(mapConfig.AssetName, mapId, "梦境 " .. dreamId, 60 * 60, "0")
    skyModule.map:MapTransferXY(player, mapId, pos.X, pos.Y, 0)
    logObject:Debug("玩家 " .. skyModule.object:GetID(player) .. " 进入梦境 " .. dreamId .. " 地图 " .. mapId ..
                        " 出生点 " .. pos.X .. ", " .. pos.Y)
end

-- * 请求退出梦境
---@param player userdata 玩家对象
---@param rspData DreamLeaveRspDataS
function DreamMgrS:ReqLeaveDream(player, rspData)
end

return DreamMgrS:new()
