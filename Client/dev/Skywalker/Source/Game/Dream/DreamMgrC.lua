-------------------------------------------------------------------
---文件: Client/Skywalker/Game/Dream/DreamMgrC.lua
---作者: shyfan
---日期: 2025/06/27
---功能: 梦境管理器（Dream Manager）
-------------------------------------------------------------------
local skyModule = SKYC_Module
local gameMisc = Skywalker.GameMisc

local ENetMessageId = gameMisc.NetMessageId.id

local logObject = Skywalker.Logger:GetLogObject("Game.Dream")

---@class DreamMgrC:Class 梦境管理器
---@field public new fun(...):DreamMgrC 创建实例
local DreamMgrC = Class("DreamMgrC")

function DreamMgrC:Ctor()
    logObject:Debug("梦境管理器创建")
end

function DreamMgrC:Dtor()
    logObject:Debug("梦境管理器销毁")
end

-- * 请求进入梦境
---@param dreamId integer 梦境ID
function DreamMgrC:ReqEnterDream(dreamId)
    if not dreamId or dreamId <= 0 then
        logObject:Error("无效的梦境ID: " .. tostring(dreamId))
        return
    end

    -- TODO Shyfan 是否能进入梦境的逻辑判断

    skyModule.net:SendNetMsg(ENetMessageId.DREAM_EnterDreamReq, dreamId)
end

-- * 请求退出梦境
function DreamMgrC:ReqExitDream()
    -- TODO Shyfan 是否能退出梦境的逻辑判断

    skyModule.net:SendNetMsg(ENetMessageId.DREAM_LeaveDreamReq)
end

return DreamMgrC:new()
