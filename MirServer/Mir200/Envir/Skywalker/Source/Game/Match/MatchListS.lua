-------------------------------------------------------------------
---文件: Server\Skywalker\Game\Match\MatchListS.lua
---作者: shyfan
---日期: 2025/03/02 12:11:41
---功能: 匹配列表
-------------------------------------------------------------------
local includeGameCommon = Skywalker.RequireGameCommon

local gameMisc = Skywalker.GameMisc

local utilTool = UtilTool
local stringUtil = utilTool.string

local objectModule = SKYS_Module.object
local configModule = SKYS_Module.config
local playerModule = SKYS_Module.player
local logObject = Skywalker.Logger:GetLogObject("Game.Match")

local ENoticeId = gameMisc.NoticeId.id

---@type PlayerVariateS_N
local playerVariateS_N = includeGameCommon("PlayerVariate/PlayerVariateS_N.lua")

---@class MatchListS:Class 匹配列表
---@field public new fun(...):MatchListS 创建实例
---@field private matchPlayerList table<string,PlayerMatchData> 匹配玩家列表
local MatchList = Class("MatchList")

-- * 创建玩家匹配数据
---@return PlayerMatchData
local function createPlayerMatchData()
    ---@class PlayerMatchData
    local playerMatchData = {
        startTime = utilTool.time.Now(), -- 匹配开始时间
        matchRoomID = 0 -- 匹配房间ID
    }

    return playerMatchData
end

-- * 构造函数
function MatchList:Ctor()
    self.matchPlayerList = {}
end

-- * 析构函数
function MatchList:Dtor()
    self:Clear()
end

-- * 清理数据
function MatchList:Clear()
    self.matchPlayerList = {}
end

-- * 把玩家加入匹配列表
---@param player userdata 玩家对象
---@return PlayerMatchData|nil 玩家匹配数据
---@return integer errorCode 错误码，见 MatchResult
function MatchList:AddPlayer(player)
    local playerID = objectModule:GetID(player)
    if not stringUtil.IsValid(playerID) then
        logObject:Error("把玩家加入匹配列表失败了，找不到玩家ID " .. playerID)
        return nil, ENoticeId.Error_InvalidPlayer
    end

    -- 结果
    local errorCode = ENoticeId.Match_Success

    -- 是否已经在匹配队列
    local playerMatchData = self.matchPlayerList[playerID]
    if playerMatchData == nil then
        playerMatchData = createPlayerMatchData()
        self.matchPlayerList[playerID] = playerMatchData
    else
        errorCode = ENoticeId.Match_Already
        logObject:Warn(stringUtil.Format("玩家ID %s 名字 %s 已经在匹配队列了", playerID,
            objectModule:GetName(player)))
    end

    return playerMatchData, errorCode
end

-- * 把玩家从匹配列表移除
---@param player userdata 玩家对象
---@return integer errorCode 错误码，见 ENoticeId
function MatchList:RemovePlayer(player)
    local playerID = objectModule:GetID(player)
    if not utilTool.string.IsValid(playerID) then
        logObject:Error("请求匹配的时候，找不到玩家ID")
        return ENoticeId.Error_InvalidPlayer
    end

    if self.matchPlayerList[playerID] == nil then
        return ENoticeId.Match_NoInList
    end

    self.matchPlayerList[playerID] = nil

    return ENoticeId.Success
end

-- * 获取玩家匹配数据
---@param player userdata 玩家对象
---@return PlayerMatchData|nil playerMatchData 玩家匹配数据
function MatchList:GetPlayerMatchData(player)
    local playerID = objectModule:GetID(player)
    if not utilTool.string.IsValid(playerID) then
        logObject:Error("获取玩家匹配数据的时候，找不到玩家ID")
        return nil
    end

    return self.matchPlayerList[playerID]
end

-- * Update
---@return table<integer,table<integer,string>> tempRoomList 匹配房间列表
function MatchList:Update()
    -- TODO 匹配逻辑需要优化

    ---@type table<integer,table<integer,string>>
    local tempRoomList = {}

    local teamCount = 0
    local teamPlayerList = {}
    for playerID, playerMatchData in pairs(self.matchPlayerList) do
        local player = playerModule:GetPlayerByID(playerID)
        if player ~= nil then
            if playerModule:GetDefVar(player, playerVariateS_N.MatchRoomID) <= 0 then
                utilTool.table.Insert(teamPlayerList, playerID)
                teamCount = teamCount + 1

                -- TODO Shyfan 6需要改成配置
                if teamCount >= 6 then
                    utilTool.table.Insert(tempRoomList, teamPlayerList)
                    teamPlayerList = {}
                    teamCount = 0
                end
            end
        end
    end

    -- 剩余的玩家
    if teamCount > 0 then
        utilTool.table.Insert(tempRoomList, teamPlayerList)
    end

    self.matchPlayerList = {}

    return tempRoomList
end

return MatchList
