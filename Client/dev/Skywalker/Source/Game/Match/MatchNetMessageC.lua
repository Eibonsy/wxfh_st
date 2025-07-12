-------------------------------------------------------------------
---文件: Client\Skywalker\Game\Match\MatchNetMessageC.lua
---作者: shyfan
---日期: 2025/06/17 14:46:22
---功能: 匹配网络消息处理
-------------------------------------------------------------------
local skyModule = SKYC_Module
local gameC = GameC
local gameMisc = Skywalker.GameMisc

local ENetMessageId = gameMisc.NetMessageId.id

local logObject = Skywalker.Logger:GetLogObject("Game.Match")

-- * 请求匹配回复
---@param msgID number 消息ID
---@param arg1 integer @错误码，见 ENoticeId
---@param arg2 integer @匹配开始时间
---@param arg3? any 参数3
---@param msgData? any 消息数据
local function reqMatchRsp(msgID, arg1, arg2, arg3, msgData)
    gameC.matchMgr:ReqMatchRsp(arg1, arg2)
end

-- * 请求取消匹配回复
---@param msgID number 消息ID
---@param arg1 integer @错误码，见 ENoticeId
---@param arg2 integer @匹配模式，见 EMatchMode
---@param arg3? any 参数3
---@param msgData? any 消息数据
local function reqCancelMatchRsp(msgID, arg1, arg2, arg3, msgData)
    gameC.matchMgr:ReqCancelMatchRsp(arg1, arg2)
end

-- * 匹配成功通知
---@param msgID number 消息ID
---@param arg1? any 参数1
---@param arg2? any 参数2
---@param arg3? any 参数3
---@param msgData? any 消息数据
local function matchSuccessNtf(msgID, arg1, arg2, arg3, msgData)
    gameC.matchMgr:MatchSuccessNtf()
end

-- * 注册网络消息
local function registerNetMsg()
    skyModule.net:RegisterNetMsg(ENetMessageId.MATCH_MatchRsp, reqMatchRsp)
    skyModule.net:RegisterNetMsg(ENetMessageId.MATCH_CancelMatchRsp, reqCancelMatchRsp)
    skyModule.net:RegisterNetMsg(ENetMessageId.MATCH_MatchSuccessNtf, matchSuccessNtf)
end

-- * 反注册网络消息
local function unregisterNetMsg()
    skyModule.net:UnRegisterNetMsg(ENetMessageId.MATCH_MatchRsp)
    skyModule.net:UnRegisterNetMsg(ENetMessageId.MATCH_CancelMatchRsp)
    skyModule.net:UnRegisterNetMsg(ENetMessageId.MATCH_MatchSuccessNtf)
end

unregisterNetMsg()
registerNetMsg()
