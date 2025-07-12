-------------------------------------------------------------------
---文件: Client\Skywalker\Game\Player\PlayerNetMessageC.lua
---作者: shyfan
---日期: 2025/06/23 14:56:56
---功能: 玩家网络消息处理 C
-------------------------------------------------------------------
local skyModule = SKYC_Module
local gameMisc = Skywalker.GameMisc
local json = Skywalker.Json
local utilTool = UtilTool
local game = GameC

local ENoticeId = gameMisc.NoticeId.id
local ENetMessageId = gameMisc.NetMessageId.id

local logObject = Skywalker.Logger:GetLogObject("Game.Player")

-- * 玩家登录
---@param msgID number 消息ID
---@param arg1 integer @错误码，见 ENoticeId
---@param arg2? any 参数2
---@param arg3? any 参数3
---@param msgData? string NetMessage.Player_LoginInfo
local function playerLogin(msgID, arg1, arg2, arg3, msgData)
    local mainPlayer = game.playerMgr:GetMainPlayer()
    if not mainPlayer then
        logObject:Error("Player_Login msgData 错误，主玩家不存在")
        return
    end
    mainPlayer:Init()

    if arg1 ~= ENoticeId.Success then
        logObject:Error("Player_Login msgData 错误，错误码: " .. gameMisc:GetEnumIdDesc(gameMisc.NoticeId, arg1))
        return
    end

    if not msgData or utilTool.string.IsValid(msgData) == false then
        logObject:Error("Player_Login msgData 错误，数据无效")
        return
    end

    local loginInfo = json.decode(msgData)
    if not loginInfo then
        logObject:Error("Player_Login msgData 解析失败")
        return
    end

    mainPlayer:Login(loginInfo)
end

-- * 注册网络消息
local function registerNetMsg()
    skyModule.net:RegisterNetMsg(ENetMessageId.Player_Login, playerLogin)
end

-- * 反注册网络消息
local function unregisterNetMsg()
    skyModule.net:UnRegisterNetMsg(ENetMessageId.Player_Login)
end

unregisterNetMsg()
registerNetMsg()
