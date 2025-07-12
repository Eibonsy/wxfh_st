-------------------------------------------------------------------
---文件: Client\Skywalker\Game\OperateControl\OperateControlMgrC.lua
---作者: shyfan
---日期: 2025/06/17 14:27:13
---功能: 操作控制管理器
-------------------------------------------------------------------
local game = GameC
local skyModule = SKYC_Module

local logObject = Skywalker.Logger:GetLogObject("Game.OperateControl")

---@class OperateControlMgrC:Class 操作控制管理器
---@field public new fun(...):OperateControlMgrC 创建实例
local OperateControlMgrC = Class("OperateControlMgrC")

-- * 构造函数
function OperateControlMgrC:ctor()
    logObject:Debug("操作控制管理器创建")
end

-- * 析构函数
function OperateControlMgrC:dtor()
    logObject:Debug("操作控制管理器销毁")
end

-- * 功能是否可用
---@param funcId integer @功能ID
function OperateControlMgrC:CanFunc(funcId)
    local mainPlayer = game.playerMgr:GetMainPlayer()
    if not mainPlayer or mainPlayer.Valid == false then
        logObject:Error("主玩家无效，无法检测功能是否可用")
        return false
    end

    return skyModule.operateControl:CanOperate(mainPlayer.DetailState, funcId)
end

-- * 操作是否可用
---@param operateId integer @操作ID
function OperateControlMgrC:CanOperate(operateId)
    local mainPlayer = game.playerMgr:GetMainPlayer()
    if not mainPlayer or mainPlayer.Valid == false then
        logObject:Error("主玩家无效，无法检测操作是否可用")
        return false
    end

    return skyModule.operateControl:CanOperate(mainPlayer.DetailState, operateId)
end

return OperateControlMgrC:new()
