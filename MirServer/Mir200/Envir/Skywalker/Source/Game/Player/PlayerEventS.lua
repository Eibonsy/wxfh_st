-------------------------------------------------------------------
---文件: Server\Skywalker\Game\Player\PlayerEventS.lua
---作者: shyfan
---日期: 2025/06/23 14:40:37
---功能: 玩家事件处理 S
-------------------------------------------------------------------
local includeGameUtil = Skywalker.RequireGameUtil

---@type PlayerMatchUtilS 玩家匹配数据
local playerMatchUtil = includeGameUtil("PlayerMatchUtilS.lua")

local json = Skywalker.Json
local skyModule = SKYS_Module
local game = GameS
local gameMisc = Skywalker.GameMisc
local utilTool = UtilTool

local EEventId = gameMisc.EventIDS.id
local EMatchMode = gameMisc.MatchMode.id
local ENoticeId = gameMisc.NoticeId.id
local ENetMessageId = gameMisc.NetMessageId.id
local NetMessageData = gameMisc.NetMessageData

local logObject = Skywalker.Logger:GetLogObject("Game.Player")

local _DEBUG = Skywalker.DEBUG and true

-- * 事件 玩家登录
---@param eventId integer 事件ID
---@param player userdata 玩家对象
local function Event_PlayerLogin(eventId, player)
    -- TODO Shyfan 玩家登录时，检查是否机器人

    -- 下发玩家信息
    local msgData = NetMessageData.createPlayer_LoginInfo()
    msgData.DetailState = playerMatchUtil:GetByPlayer_DetailState(player)
    msgData.MatchMode = playerMatchUtil:GetByPlayer_MatchMode(player)

    -- TODO Shyfan 如果还在匹配状态，则需要去确定以下匹配是否还在进行中
    if msgData.MatchMode > EMatchMode.None then
        msgData.MatchStartTime = game.matchMgr:GetPlayerMatchStartTime(player, msgData.MatchMode)
    else
        msgData.MatchStartTime = 0
    end

    -- 转换为Json字符串
    local strMsg = json.encode(msgData)
    if utilTool.string.IsValid(strMsg) == false then
        logObject:Error(utilTool.string.Format("玩家ID %s 名称 %s 登录下发信息失败，Json解析失败",
            skyModule.object:GetID(player), skyModule.object:GetName(player)))
        skyModule.net:SendNetMsg(player, ENetMessageId.Player_Login, ENoticeId.Error_JsonParseError)
        return
    else
        skyModule.net:SendNetMsg(player, ENetMessageId.Player_Login, ENoticeId.Success, nil, nil, strMsg)
        if _DEBUG then
            logObject:Debug(utilTool.string.Format(
                "玩家ID %s 名称 %s 登录时下发信息成功，匹配模式 %s 详细状态 %s 匹配开始时间 %d",
                skyModule.object:GetID(player), skyModule.object:GetName(player),
                gameMisc:GetEnumIdDesc(gameMisc.MatchMode, msgData.MatchMode),
                gameMisc:GetEnumIdDesc(gameMisc.PlayerDetailState, msgData.DetailState), msgData.MatchStartTime))
        end
    end

    -- TODO Shyfan 玩家登录时，处理各个系统的登录逻辑
end

-- * 注册事件
local function registerEvent()
    skyModule.event:RegisterEvent(EEventId.Player_Login, "Player.PlayerLogin", Event_PlayerLogin)
end

-- * 反注册事件
local function unregisterEvent()
    skyModule.event:UnRegisterEvent(EEventId.Player_Login, "Player.PlayerLogin")
end

unregisterEvent()
registerEvent()
