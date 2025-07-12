-------------------------------------------------------------------
---文件: Server\Skywalker\Game\Match\MatchMgrS.lua
---作者: shyfan
---日期: 2025/02/22 11:09:03
---功能: 匹配管理
-------------------------------------------------------------------
local pairs = pairs

local includeGame = Skywalker.RequireGame
local includeGameUtil = Skywalker.RequireGameUtil

includeGame("Match/MatchNetMessageS.lua")

local skyModule = SKYS_Module
local gameMisc = Skywalker.GameMisc
local utilTool = UtilTool

local ENoticeId = gameMisc.NoticeId.id
local EMatchMode = gameMisc.MatchMode.id

---@type MatchListS 匹配列表
local MatchListClass = includeGame("Match/MatchListS.lua")
---@type MatchRoomS 匹配房间
local MatchRoomClass = includeGame("Match/MatchRoomS.lua")
---@type PlayerMatchUtilS 玩家匹配数据
local playerMatchUtil = includeGameUtil("PlayerMatchUtilS.lua")

local logObject = Skywalker.Logger:GetLogObject("Game.Match")

---@class MatchMgrS:Class 匹配管理
---@field public new fun(...):MatchMgrS 创建实例
---@field private scheduleID integer 定时器ID
local MatchMgrS = Class("MatchMgrS")

-- * 匹配队列
---@type table<integer, MatchListS>
local matchListMap = {}

-- * 匹配房间
---@type table<integer, MatchRoomS>
local matchRoomMap = {}

-- * 匹配房间自增ID
---@type integer
local matchRoomAddID = 0

-- * 获取匹配列表
---@param mode integer 匹配模式
---@return MatchListS? 匹配列表
local function getMatchList(mode)
    return matchListMap[mode]
end

-- * 定时器
---@param scheduleID integer 定时器ID
---@param repeatIndex integer 重复次数
---@param backParam? any 回调参数
local function update(scheduleID, repeatIndex, backParam)
    -- 遍历匹配队列
    for _, v in pairs(matchListMap) do
        local tempRoomList = v:Update()

        -- 遍历匹配房间
        for _, teamPlayerList in pairs(tempRoomList) do
            matchRoomAddID = matchRoomAddID + 1
            local matchRoom = MatchRoomClass:new(matchRoomAddID, teamPlayerList)
            matchRoomMap[matchRoomAddID] = matchRoom
        end
    end

    -- 遍历匹配房间
    for _, v in pairs(matchRoomMap) do
        v:Update()

        if v:IsEnd() then
            v:Dtor()
            matchRoomMap[v:GetRoomID()] = nil
        end
    end
end

-- * 构造函数
function MatchMgrS:Ctor()
    -- * 注册定时器
    self.scheduleID = skyModule.schedule:RegisterSchedule(update, 1000)

    -- * 创建匹配队列
    for _, v in pairs(EMatchMode) do
        if v ~= EMatchMode.None then
            if skyModule.config.allTables == nil or skyModule.config.allTables.TbSBattlefieldBase:GetData(v) == nil then
                logObject:Error(utilTool.string.Format("匹配模式 %d 的配置数据不存在", v))
                break
            end

            matchListMap[v] = MatchListClass:new()
            logObject:Debug(utilTool.string.Format("创建匹配队列 %d", v))
        end
    end

    -- * 匹配房间
    matchRoomMap = {}
    matchRoomAddID = 0
end

-- * 析构函数
function MatchMgrS:Dtor()
    -- * 清理匹配队列
    for _, v in pairs(matchListMap) do
        v:Dtor()
    end
    matchListMap = {}

    -- * 清理匹配房间
    for _, v in pairs(matchRoomMap) do
        v:Dtor()
    end
    matchRoomMap = {}

    matchRoomAddID = 0

    -- * 反注册定时器
    if self.scheduleID then
        skyModule.schedule:UnRegisterSchedule(self.scheduleID)
    end
    self.scheduleID = nil
end

-- * 请求匹配
---@param player userdata 玩家对象
---@param reqMatchMode integer 请求的匹配模式
---@param rspData MatchRspDataS 响应数据
function MatchMgrS:ReqMatch(player, reqMatchMode, rspData)
    -- 是否已经在匹配了
    local playerMatchMode = playerMatchUtil:GetByPlayer_MatchMode(player)
    if playerMatchMode > 0 then
        logObject:Debug(utilTool.string.Format("玩家ID %s 名字 %s 已经在匹配模式 %d 中了",
            skyModule.object:GetID(player), skyModule.object:GetName(player), playerMatchMode))
        reqMatchMode = playerMatchMode
    end

    rspData.matchMode = reqMatchMode

    -- 获取匹配队列
    local matchList = getMatchList(reqMatchMode)
    if matchList == nil then
        rspData.errorCode = ENoticeId.Match_ModeNotExist

        logObject:Error(utilTool.string.Format(
            "玩家ID %s 名字 %s 请求匹配失败了，找不到 %d 的匹配模式",
            skyModule.object:GetID(player), skyModule.object:GetName(player), reqMatchMode))
        return
    end

    -- 加入匹配队列
    local playerMatchData, errorCode = matchList:AddPlayer(player)
    if playerMatchData == nil then
        rspData.errorCode = errorCode

        logObject:Error(utilTool.string.Format(
            "玩家ID %s 名字 %s 请求匹配失败了，玩家加入匹配队列错误 %d",
            skyModule.object:GetID(player), skyModule.object:GetName(player), errorCode))
        return
    end

    if errorCode == ENoticeId.Match_Success then
        -- 记录玩家匹配模式
        playerMatchUtil:SetByPlayer_MatchMode(player, reqMatchMode)
        logObject:Debug(utilTool.string.Format("玩家ID %s 名字 %s 请求匹配成功了，匹配模式 %d",
            skyModule.object:GetID(player), skyModule.object:GetName(player), reqMatchMode))
    end

    rspData.errorCode = errorCode
    rspData.startTime = playerMatchData.startTime
end

-- * 请求取消匹配
---@param player userdata 玩家对象
---@param rspData MatchCancelRspDataS 响应数据
function MatchMgrS:ReqCancelMatch(player, rspData)
    local playerMatchMode = playerMatchUtil:GetByPlayer_MatchMode(player)
    if playerMatchMode <= 0 then
        rspData.errorCode = ENoticeId.Match_NoInList

        logObject:Error(utilTool.string.Format(
            "玩家ID %s 名字 %s 请求取消匹配失败了,没有在匹配列表中",
            skyModule.object:GetID(player), skyModule.object:GetName(player)))
        return
    end

    rspData.matchMode = playerMatchMode

    local matchList = getMatchList(playerMatchMode)
    if matchList == nil then
        rspData.errorCode = ENoticeId.Match_ModeNotExist

        logObject:Error(utilTool.string.Format(
            "玩家ID %s 名字 %s 请求取消匹配失败了，找不到 %d 的匹配模式",
            skyModule.object:GetID(player), skyModule.object:GetName(player), playerMatchMode))
        return
    end

    local playerMatchData = matchList:GetPlayerMatchData(player)
    if playerMatchData == nil then
        rspData.errorCode = ENoticeId.Match_NoInList

        -- 移除玩家匹配模式
        playerMatchUtil:SetByPlayer_MatchMode(player, 0)

        logObject:Error(utilTool.string.Format(
            "玩家ID %s 名字 %s 请求取消匹配失败了, 不在 %d 的匹配列表中",
            skyModule.object:GetID(player), skyModule.object:GetName(player), playerMatchMode))
        return
    end

    -- 如果已经匹配成功了，不允许取消
    if playerMatchData.matchRoomID > 0 then
        rspData.errorCode = ENoticeId.Match_AlreadySuccess
        return
    end

    local errorCode = matchList:RemovePlayer(player)
    rspData.errorCode = errorCode
    if errorCode ~= ENoticeId.Success then
        logObject:Error(utilTool.string.Format("玩家ID %s 名字 %s 请求取消匹配失败了",
            skyModule.object:GetID(player), skyModule.object:GetName(player)))
        return
    end
    rspData.errorCode = ENoticeId.Match_CancelSuccess

    -- 移除玩家匹配模式
    playerMatchUtil:SetByPlayer_MatchMode(player, 0)
end

-- * 获取玩家匹配开始时间
---@param player userdata 玩家对象
---@param matchMode integer 匹配模式
---@return integer 匹配开始时间
function MatchMgrS:GetPlayerMatchStartTime(player, matchMode)
    local matchList = getMatchList(matchMode)
    if matchList == nil then
        logObject:Error(utilTool.string.Format("获取玩家 %s 的匹配开始时间失败，找不到匹配模式 %d",
            skyModule.object:GetName(player), matchMode))
        return 0
    end
    local playerMatchData = matchList:GetPlayerMatchData(player)
    if playerMatchData == nil then
        logObject:Error(utilTool.string.Format(
            "获取玩家 %s 的匹配开始时间失败，玩家不在匹配列表中",
            skyModule.object:GetName(player)))
        return 0
    end

    return playerMatchData.startTime
end

return MatchMgrS:new()
