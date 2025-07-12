-------------------------------------------------------------------
---文件: Client\Skywalker\Game\Match\MatchMgrC.lua
---作者: shyfan
---日期: 2025/02/21 20:09:14
---功能: 匹配管理
-------------------------------------------------------------------
local includeGame = Skywalker.RequireGame

includeGame("Match/MatchNetMessageC.lua")

local logObject = Skywalker.Logger:GetLogObject("Game.Match")

local gameMisc = Skywalker.GameMisc
local skyModule = SKYC_Module
local game = GameC

local ENoticeId = gameMisc.NoticeId.id
local ENetMessageId = gameMisc.NetMessageId.id
local EEventIDC = gameMisc.EventIDC.id
local EOperateId = gameMisc.OperateId.id

---@class MatchMgrC:Class 匹配管理
---@field public new fun(...):MatchMgrC 创建实例
local MatchMgrC = Class("MatchMgrC")

-- * 构造函数
function MatchMgrC:Ctor()
end

-- * 析构函数
function MatchMgrC:Dtor()
end

-- * 请求匹配
---@param matchMode integer 匹配模式
function MatchMgrC:ReqMatch(matchMode)
    if game.operateControlMgr:CanOperate(EOperateId.Match_ReqMatch) == false then
        -- TODO Shyfan 提示操作不可用
        return
    end

    skyModule.net:SendNetMsg(ENetMessageId.MATCH_MatchReq, matchMode)
end

-- * 请求取消匹配
function MatchMgrC:ReqCancelMatch()
    if game.operateControlMgr:CanOperate(EOperateId.Match_CancelMatch) == false then
        -- TODO Shyfan 提示操作不可用
        return
    end

    skyModule.net:SendNetMsg(ENetMessageId.MATCH_CancelMatchReq)
end

-- * 请求匹配回复
---@param errorCode integer @错误码，见 ENoticeId
---@param startTime integer @匹配开始时间
function MatchMgrC:ReqMatchRsp(errorCode, startTime)
    if errorCode ~= ENoticeId.Match_Success then
        -- TODO Shyfan 提示匹配失败
        logObject:Debug("匹配失败，错误码: " .. gameMisc:GetEnumIdDesc(gameMisc.NoticeId, errorCode))
    end

    local mainPlayer = game.playerMgr:GetMainPlayer()
    if not mainPlayer or mainPlayer.Valid == false then
        logObject:Error("主玩家无效，无法处理匹配回复")
        return
    end

    local oldStartTime = mainPlayer.MatchStartTime
    mainPlayer.MatchStartTime = startTime
    if oldStartTime ~= mainPlayer.MatchStartTime then
        skyModule.event:FireEvent(EEventIDC.Match_Status_Refresh)
    end
end

-- * 请求取消匹配回复
---@param errorCode integer @错误码，见 ENoticeId
---@param matchMode integer @匹配模式，见 EMatchMode
function MatchMgrC:ReqCancelMatchRsp(errorCode, matchMode)
    if errorCode ~= ENoticeId.Match_CancelSuccess then
        -- TODO Shyfan 提示取消匹配失败
        logObject:Debug("取消匹配失败，错误码: " .. gameMisc:GetEnumIdDesc(gameMisc.NoticeId, errorCode))
        return
    end

    local mainPlayer = game.playerMgr:GetMainPlayer()
    if not mainPlayer or mainPlayer.Valid == false then
        logObject:Error("主玩家无效，无法处理取消匹配回复")
        return
    end

    mainPlayer.MatchStartTime = 0
    skyModule.event:FireEvent(EEventIDC.Match_Status_Refresh)
end

-- * 匹配成功通知
function MatchMgrC:MatchSuccessNtf()
    -- TODO Shyfan 处理匹配成功逻辑
    skyModule.event:FireEvent(EEventIDC.Match_Success)
end

return MatchMgrC:new()
