-------------------------------------------------------------------
---文件: Server\Skywalker\Game\OperateControl\OperateControlMgrS.lua
---作者: shyfan
---日期: 2025/06/17 14:09:14
---功能: 操作控制管理器
-------------------------------------------------------------------
local includeGameUtil = Skywalker.RequireGameUtil

local utilTool = UtilTool
local GameMisc = Skywalker.GameMisc

local logObject = Skywalker.Logger:GetLogObject("Game.OperateControl")

local skyModule = SKYS_Module
local EPlayerDetailState = GameMisc.PlayerDetailState.id

---@type PlayerMatchUtilS
local playerMatchUtil = includeGameUtil("PlayerMatchUtilS.lua")

local _DEBUG = Skywalker.DEBUG and true

-- * 获取玩家详细状态
local function getPlayerDetailState(player)
    if not player or not skyModule.object:IsPlayer(player) then
        logObject:Error("玩家对象无效")
        return EPlayerDetailState.Unknown
    end

    local playerDetailState = playerMatchUtil:GetByPlayer_DetailState(player)
    if playerDetailState == EPlayerDetailState.Unknown then
        logObject:Error(utilTool.string.Format("玩家 %s 名字 %s 状态未知，无法检测",
            skyModule.object:GetID(player), skyModule.object:GetName(player)))
    end

    return playerDetailState
end

---@class OperateControlMgrS:Class 操作控制管理器
---@field public new fun(...):OperateControlMgrS 创建实例
local OperateControlMgrS = Class("OperateControlMgrS")

-- * 构造函数
function OperateControlMgrS:ctor()
    logObject:Debug("操作控制管理器创建")

end

-- * 析构函数
function OperateControlMgrS:dtor()
    logObject:Debug("操作控制管理器销毁")
end

-- * 功能是否可用
---@param player userdata @玩家对象
---@param funcId integer @功能ID
function OperateControlMgrS:CanFunc(player, funcId)
    local playerDetailState = getPlayerDetailState(player)
    if playerDetailState == EPlayerDetailState.Unknown then
        return false
    end

    local result = skyModule.operateControl:CanFunc(playerDetailState, funcId)
    if _DEBUG then
        logObject:Debug(utilTool.string.Format("玩家ID %s 名字 %s 状态 %d 检测功能 %d 结果: %s",
            skyModule.object:GetID(player), skyModule.object:GetName(player), playerDetailState, funcId,
            result and "可用" or "不可用"))
    end

    return result
end

-- * 操作是否可用
---@param player userdata @玩家对象
---@param operateId integer @操作ID
function OperateControlMgrS:CanOperate(player, operateId)
    local playerDetailState = getPlayerDetailState(player)
    if playerDetailState == EPlayerDetailState.Unknown then
        return false
    end

    local result = skyModule.operateControl:CanOperate(playerDetailState, operateId)
    if _DEBUG then
        logObject:Debug(utilTool.string.Format("玩家ID %s 名字 %s 状态 %d 检测操作 %d 结果: %s",
            skyModule.object:GetID(player), skyModule.object:GetName(player), playerDetailState, operateId,
            result and "可用" or "不可用"))
    end

    return result
end

return OperateControlMgrS:new()
