-------------------------------------------------------------------
---文件: Server\Skywalker\Game\Dream\DreamNetMessageS.lua
---作者: shyfan
---日期: 2025/06/27 15:47:11
---功能: 梦境网络消息处理（Dream Network Message Server）
-------------------------------------------------------------------
local skyModule = SKYS_Module
local gameS = GameS
local gameMisc = Skywalker.GameMisc

local ENetMessageId = gameMisc.NetMessageId.id
local ENoticeId = gameMisc.NoticeId.id
local EMatchMode = gameMisc.MatchMode.id

---@class DreamEnterRspDataS @请求进入梦境响应数据
local DreamEnterRspDataS = {
    errorCode = ENoticeId.Success -- 错误码，见 ENoticeId
}
function DreamEnterRspDataS:Reset()
    self.errorCode = ENoticeId.Success
end

-- * 请求进入梦境
---@param player userdata 玩家对象
---@param msgID integer 消息ID
---@param arg1 integer 梦境ID
---@param arg2 any 参数2
---@param arg3 any 参数3
---@param msgData any 消息数据
local function enterReq(player, msgID, arg1, arg2, arg3, msgData)
    -- 重置数据
    DreamEnterRspDataS:Reset()

    gameS.dreamMgr:ReqEnterDream(player, arg1, DreamEnterRspDataS)

    skyModule.net:SendNetMsg(player, ENetMessageId.DREAM_EnterDreamRsp, DreamEnterRspDataS.errorCode)
end

---@class DreamLeaveRspDataS @请求退出梦境响应数据
local DreamLeaveRspDataS = {
    errorCode = ENoticeId.Success -- 错误码，见 ENoticeId
}
function DreamLeaveRspDataS:Reset()
    self.errorCode = ENoticeId.Success
end

-- * 请求退出梦境
---@param player userdata 玩家对象
---@param msgID integer 消息ID
---@param arg1 any 参数1
---@param arg2 any 参数2
---@param arg3 any 参数3
---@param msgData any 消息数据
local function leaveReq(player, msgID, arg1, arg2, arg3, msgData)
    -- 重置数据
    DreamLeaveRspDataS:Reset()

    gameS.dreamMgr:ReqLeaveDream(player, DreamLeaveRspDataS)

    skyModule.net:SendNetMsg(player, ENetMessageId.DREAM_LeaveDreamRsp, DreamLeaveRspDataS.errorCode)
end

-- * 注册网络消息
local function registerNetMsg()
    skyModule.net:RegisterNetMsg(ENetMessageId.DREAM_EnterDreamReq, enterReq)
    skyModule.net:RegisterNetMsg(ENetMessageId.DREAM_LeaveDreamReq, leaveReq)
end

-- * 反注册网络消息
local function unregisterNetMsg()
    skyModule.net:UnRegisterNetMsg(ENetMessageId.DREAM_EnterDreamReq)
    skyModule.net:UnRegisterNetMsg(ENetMessageId.DREAM_LeaveDreamReq)
end

unregisterNetMsg()
registerNetMsg()
