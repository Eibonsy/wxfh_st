-------------------------------------------------------------------
---文件: Server\Skywalker\Game\Match\MatchNetMessageS.lua
---作者: shyfan
---日期: 2025/06/16 16:44:21
---功能: 匹配网络消息处理 S
-------------------------------------------------------------------
local skyModule = SKYS_Module
local gameS = GameS
local gameMisc = Skywalker.GameMisc

local ENetMessageId = gameMisc.NetMessageId.id
local ENoticeId = gameMisc.NoticeId.id
local EMatchMode = gameMisc.MatchMode.id

---@class MatchRspDataS @请求匹配响应数据
local MatchRspDataS = {
    errorCode = ENoticeId.Match_Success, -- 错误码，见 ENoticeId
    startTime = 0, -- 匹配开始时间
    matchMode = EMatchMode.None -- 匹配模式，见 EMatchMode
}
function MatchRspDataS:Reset()
    self.errorCode = ENoticeId.Match_Success
    self.startTime = 0
    self.matchMode = EMatchMode.None
end

-- * 请求匹配
---@param player userdata 玩家对象
---@param msgID integer 消息ID
---@param arg1 integer 匹配模式
---@param arg2 any 参数2
---@param arg3 any 参数3
---@param msgData any 消息数据
local function matchReq(player, msgID, arg1, arg2, arg3, msgData)
    -- 重置数据
    MatchRspDataS:Reset()

    gameS.matchMgr:ReqMatch(player, arg1, MatchRspDataS)

    -- 回复玩家
    skyModule.net:SendNetMsg(player, ENetMessageId.MATCH_MatchRsp, MatchRspDataS.errorCode, MatchRspDataS.startTime)
end

---@class MatchCancelRspDataS @请求取消匹配响应数据
local MatchCancelRspDataS = {
    errorCode = ENoticeId.Success, -- 错误码，见 ENoticeId
    matchMode = EMatchMode.None -- 匹配模式，见 EMatchMode
}
function MatchCancelRspDataS:Reset()
    self.errorCode = ENoticeId.Success
    self.matchMode = EMatchMode.None
end

-- * 请求取消匹配
---@param player userdata 玩家对象
---@param msgID integer 消息ID
---@param arg1 any 参数1
---@param arg2 any 参数2
---@param arg3 any 参数3
---@param msgData any 消息数据
local function cancelMatchReq(player, msgID, arg1, arg2, arg3, msgData)
    -- 重置数据
    MatchCancelRspDataS:Reset()

    gameS.matchMgr:ReqCancelMatch(player, MatchCancelRspDataS)

    -- 回复玩家
    skyModule.net:SendNetMsg(player, ENetMessageId.MATCH_CancelMatchRsp, MatchCancelRspDataS.errorCode,
        MatchCancelRspDataS.matchMode)
end

-- * 注册网络消息
local function registerNetMsg()
    skyModule.net:RegisterNetMsg(ENetMessageId.MATCH_MatchReq, matchReq)
    skyModule.net:RegisterNetMsg(ENetMessageId.MATCH_CancelMatchReq, cancelMatchReq)
end

-- * 反注册网络消息
local function unregisterNetMsg()
    skyModule.net:UnRegisterNetMsg(ENetMessageId.MATCH_MatchReq)
    skyModule.net:UnRegisterNetMsg(ENetMessageId.MATCH_CancelMatchReq)
end

unregisterNetMsg()
registerNetMsg()
