-------------------------------------------------------------------
---文件: Server\Skywalker\Game\Match\PlayerMatchDataUtilS.lua
---作者: shyfan
---日期: 2025/06/16 14:49:32
---功能: 玩家匹配
-------------------------------------------------------------------
local includeGameCommon = Skywalker.RequireGameCommon

local GameMisc = Skywalker.GameMisc

local objectModule = SKYS_Module.object
local playerModule = SKYS_Module.player
local EPlayerDetailState = GameMisc.PlayerDetailState.id
local EMatchMode = GameMisc.MatchMode.id

---@type PlayerVariateS_U
local PlayerVariateS_U = includeGameCommon("PlayerVariate/PlayerVariateS_U.lua")

---@class PlayerMatchUtilS
local PlayerMatchUtilS = {}

-- * 获取玩家匹配数据
---@param player userdata? 玩家对象
---@param playerVariateKey string 玩家变量键
---@return integer
---@return boolean
local function getPlayerMatchData(player, playerVariateKey)
    if player == nil or objectModule:IsPlayer(player) == false then
        return 0, false
    end

    return playerModule:GetDefVar(player, playerVariateKey), true
end

-- * 设置玩家匹配数据
---@param player userdata? 玩家对象
---@param playerVariateKey string 玩家变量键
---@param value integer 玩家变量值
---@return boolean @是否设置成功，true表示成功，false表示失败
local function setPlayerMatchData(player, playerVariateKey, value)
    if player == nil or objectModule:IsPlayer(player) == false then
        return false
    end

    if value == nil or type(value) ~= "number" then
        return false
    end

    -- TODO Shyfan 上下线检查

    playerModule:SetDefVar(player, playerVariateKey, value)
    return true
end

-- * 获取玩家状态
---@param playerId string 玩家ID
---@return integer @玩家状态，见 EPlayerDetailState
function PlayerMatchUtilS:GetById_DetailState(playerId)
    local value, success = getPlayerMatchData(playerModule:GetPlayerByID(playerId), PlayerVariateS_U.DetailState)
    if success then
        return value
    else
        return EPlayerDetailState.Unknown
    end
end

-- * 获取玩家状态
---@param player userdata 玩家对象
---@return integer @玩家状态，见 EPlayerDetailState
function PlayerMatchUtilS:GetByPlayer_DetailState(player)
    local value, success = getPlayerMatchData(player, PlayerVariateS_U.DetailState)
    if success then
        return value
    else
        return EPlayerDetailState.Unknown
    end
end

-- * 设置玩家状态
---@param playerId string 玩家ID
---@param detailState integer 玩家状态，见 EPlayerDetailState
---@return boolean @是否设置成功，true表示成功，false表示失败
function PlayerMatchUtilS:SetById_DetailState(playerId, detailState)
    return setPlayerMatchData(playerModule:GetPlayerByID(playerId), PlayerVariateS_U.DetailState, detailState)
end

-- * 设置玩家状态
---@param player userdata 玩家对象
---@param detailState integer 玩家状态，见 EPlayerDetailState
---@return boolean @是否设置成功，true表示成功，false表示失败
function PlayerMatchUtilS:SetByPlayer_DetailState(player, detailState)
    return setPlayerMatchData(player, PlayerVariateS_U.DetailState, detailState)
end

-- * 获取玩家匹配模式
---@param playerId string 玩家ID
---@return integer @玩家匹配模式，见 EMatchMode
function PlayerMatchUtilS:GetById_MatchMode(playerId)
    local value, success = getPlayerMatchData(playerModule:GetPlayerByID(playerId), PlayerVariateS_U.MatchMode)
    if success then
        return value
    else
        return EMatchMode.None
    end
end

-- * 获取玩家匹配模式
---@param player userdata 玩家对象
---@return integer @玩家匹配模式，见 EMatchMode
function PlayerMatchUtilS:GetByPlayer_MatchMode(player)
    local value, success = getPlayerMatchData(player, PlayerVariateS_U.MatchMode)
    if success then
        return value
    else
        return EMatchMode.None
    end
end

-- * 设置玩家匹配模式
---@param playerId string 玩家ID
---@param matchMode integer 玩家匹配模式，见 EMatchMode
---@return boolean @是否设置成功，true表示成功，false表示失败
function PlayerMatchUtilS:SetById_MatchMode(playerId, matchMode)
    return setPlayerMatchData(playerModule:GetPlayerByID(playerId), PlayerVariateS_U.MatchMode, matchMode)
end

-- * 设置玩家匹配模式
---@param player userdata 玩家对象
---@param matchMode integer 玩家匹配模式，见 EMatchMode
---@return boolean @是否设置成功，true表示成功，false表示失败
function PlayerMatchUtilS:SetByPlayer_MatchMode(player, matchMode)
    return setPlayerMatchData(player, PlayerVariateS_U.MatchMode, matchMode)
end

-- * 获取玩家匹配房间Id
---@param playerId string 玩家ID
---@return integer @玩家匹配房间Id
function PlayerMatchUtilS:GetById_MatchRoomId(playerId)
    local value, success = getPlayerMatchData(playerModule:GetPlayerByID(playerId), PlayerVariateS_U.MatchRoomId)
    if success then
        return value
    else
        return 0
    end
end

-- * 获取玩家匹配房间Id
---@param player userdata 玩家对象
---@return integer @玩家匹配房间Id
function PlayerMatchUtilS:GetByPlayer_MatchRoomId(player)
    local value, success = getPlayerMatchData(player, PlayerVariateS_U.MatchRoomId)
    if success then
        return value
    else
        return 0
    end
end

-- * 设置玩家匹配房间Id
---@param playerId string 玩家ID
---@param matchRoomId integer 玩家匹配房间Id
---@return boolean @是否设置成功，true表示成功，false表示失败
function PlayerMatchUtilS:SetById_MatchRoomId(playerId, matchRoomId)
    return setPlayerMatchData(playerModule:GetPlayerByID(playerId), PlayerVariateS_U.MatchRoomId, matchRoomId)
end

-- * 设置玩家匹配房间Id
---@param player userdata 玩家对象
---@param matchRoomId integer 玩家匹配房间Id
function PlayerMatchUtilS:SetByPlayer_MatchRoomId(player, matchRoomId)
    return setPlayerMatchData(player, PlayerVariateS_U.MatchRoomId, matchRoomId)
end

-- * 获取玩家战场房间Id
---@param playerId string 玩家ID
---@return integer @玩家战场房间Id
function PlayerMatchUtilS:GetById_BattleRoomId(playerId)
    local value, success = getPlayerMatchData(playerModule:GetPlayerByID(playerId), PlayerVariateS_U.BattleRoomId)
    if success then
        return value
    else
        return 0
    end
end

-- * 获取玩家战场房间Id
---@param player userdata 玩家对象
---@return integer @玩家战场房间Id
function PlayerMatchUtilS:GetByPlayer_BattleRoomId(player)
    local value, success = getPlayerMatchData(player, PlayerVariateS_U.BattleRoomId)
    if success then
        return value
    else
        return 0
    end
end

-- * 设置玩家战场房间Id
---@param playerId string 玩家ID
---@param battleRoomId integer 玩家战场房间Id
---@return boolean @是否设置成功，true表示成功，false表示失败
function PlayerMatchUtilS:SetById_BattleRoomId(playerId, battleRoomId)
    return setPlayerMatchData(playerModule:GetPlayerByID(playerId), PlayerVariateS_U.BattleRoomId, battleRoomId)
end

-- * 设置玩家战场房间Id
---@param player userdata 玩家对象
---@param battleRoomId integer 玩家战场房间Id
---@return boolean @是否设置成功，true表示成功，false表示失败
function PlayerMatchUtilS:SetByPlayer_BattleRoomId(player, battleRoomId)
    return setPlayerMatchData(player, PlayerVariateS_U.BattleRoomId, battleRoomId)
end

return PlayerMatchUtilS
