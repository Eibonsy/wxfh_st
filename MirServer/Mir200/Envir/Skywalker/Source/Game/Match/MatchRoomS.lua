-------------------------------------------------------------------
---文件: Server\Skywalker\Game\Match\MatchRoomS.lua
---作者: shyfan
---日期: 2025/03/02 17:58:58
---功能: 匹配房间
-------------------------------------------------------------------
local includeGameCommon = Skywalker.RequireGameCommon

local GameMisc = Skywalker.GameMisc

local tableUtil = UtilTool.table
local timeUtil = UtilTool.time

local logObject = Skywalker.Logger:GetLogObject("Game.Match")
local playerModule = SKYS_Module.player
local objectModule = SKYS_Module.object
local netModule = SKYS_Module.net
local mapModule = SKYS_Module.map
local ENetMessageId = GameMisc.NetMessageId.id

---@type PlayerVariateS_N
local playerVariateN = includeGameCommon("PlayerVariate/PlayerVariateS_N.lua")

local game = GameS

---@class MatchRoomStatus
local matchRoomStatus = {
    Create = 0, -- 创建
    Wait = 1, -- 等待进入
    Battlefield = 2, -- 战场中
    End = 3 -- 结束
}

local WaitEnterTime = 10 -- 等待进入时间
local BattlefieldTime = 60 * 10 -- TODO 战场时间，单位秒，需要修改为配置

---@class MatchRoomS:Class 匹配房间
---@field public new fun(...):MatchRoomS 创建实例
---@field private mRoomID integer 匹配房间ID
---@field private bRoomID integer 战场房间ID
---@field private playerList table<integer,string> 玩家列表
---@field private status integer 状态
---@field private statusParam integer 状态参数
local MatchRoom = Class("MatchRoom")

-- * 构造函数
---@param roomID integer 房间ID
---@param playerList string[] 玩家列表
function MatchRoom:Ctor(roomID, playerList)
    -- 房间ID
    self.mRoomID = roomID
    -- 玩家列表
    self.playerList = playerList
    -- 战场房间ID
    self.bRoomID = 0

    logObject:Debug("创建匹配房间 " .. roomID .. " 玩家数 " .. #playerList)

    -- 给玩家设置匹配房间ID，顺便删除不在线的玩家
    for index = #playerList, 1, -1 do
        local player = playerModule:GetPlayerByID(playerList[index])
        if player == nil then
            tableUtil.Remove(playerList, index)
        else
            playerModule:SetDefVar(player, playerVariateN.MatchRoomID, roomID)

            logObject:Debug("玩家 " .. objectModule:GetName(player) .. " ID " .. playerList[index] ..
                                " 加入匹配房间 " .. roomID)
        end
    end

    -- 修改房间状态
    self.status = matchRoomStatus.Create
end

-- * 析构函数
function MatchRoom:Dtor()
    -- 清理玩家匹配房间ID
    for _, playerID in ipairs(self.playerList) do
        local player = playerModule:GetPlayerByID(playerID)
        if player ~= nil then
            playerModule:SetDefVar(player, playerVariateN.MatchRoomID, 0)
        end
    end
end

-- * updateCreate
function MatchRoom:updateCreate()
    self.status = matchRoomStatus.Wait
    self.statusParam = timeUtil.Now() + WaitEnterTime

    -- * 去创建战场
    self.bRoomID = game.battlefieldMgr:CreateBattlefield(self.mRoomID)
    if self.bRoomID == 0 then
        -- * 创建失败
        self.status = matchRoomStatus.End
        logObject:Error("房间 " .. self.mRoomID .. " 创建战场失败")

        -- TODO 需要解散房间，让玩家重新进入匹配

        return
    end

    -- * 通知所有玩家匹配成功
    for _, playerID in ipairs(self.playerList) do
        local player = playerModule:GetPlayerByID(playerID)
        if player ~= nil then
            netModule:SendNetMsg(player, ENetMessageId.MATCH_MatchSuccessNtf, self.statusParam)
        end
    end
end

-- * updateWait
function MatchRoom:updateWait()
    if timeUtil.Now() < self.statusParam then
        return
    end

    -- TODO 把玩家拉入战场
    local battlefieldRoom = game.battlefieldMgr:GetBattlefieldRoom(self.bRoomID)
    if battlefieldRoom == nil then
        -- * 战场不存在
        self.status = matchRoomStatus.End
        logObject:Error("房间 " .. self.mRoomID .. " 战场 " .. self.bRoomID .. " 不存在")
        return
    end

    local mapID = battlefieldRoom:GetMapID()
    for _, playerID in ipairs(self.playerList) do
        local player = playerModule:GetPlayerByID(playerID)
        if player ~= nil then
            -- 拉入战场
            mapModule:MapTransfer(player, mapID)

            logObject:Debug("玩家 " .. objectModule:GetName(player) .. " ID " .. playerID .. " 进入战场 " .. mapID)
        end
    end

    -- 修改房间状态
    self.status = matchRoomStatus.Battlefield

    -- 设置战场关闭时间
    self.statusParam = timeUtil.Now() + BattlefieldTime
end

-- * updateBattlefield
function MatchRoom:updateBattlefield()
    if timeUtil.Now() < self.statusParam then
        return
    end

    -- * TODO 结算

    logObject:Debug("房间 " .. self.mRoomID .. " 战场 " .. self.bRoomID .. " 结束")

    -- 修改房间状态
    self.status = matchRoomStatus.End
end

-- * Update
function MatchRoom:Update()
    -- 根据状态处理
    if self.status == matchRoomStatus.Create then
        self:updateCreate()
    elseif self.status == matchRoomStatus.Wait then
        self:updateWait()
    elseif self.status == matchRoomStatus.Battlefield then
        self:updateBattlefield()
    elseif self.status == matchRoomStatus.End then
        -- * 不用做啥
    end
end

-- * 是否结束
---@return boolean 是否结束
function MatchRoom:IsEnd()
    return self.status == matchRoomStatus.End
end

-- * 获取房间ID
---@return integer 房间ID
function MatchRoom:GetRoomID()
    return self.mRoomID
end

return MatchRoom
