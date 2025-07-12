-------------------------------------------------------------------
---文件: Server\Skywalker\Game\Battlefield\battlefieldMgrS.lua
---作者: shyfan
---日期: 2025/03/01 22:13:53
---功能: 战场管理
-------------------------------------------------------------------
local includeGame = Skywalker.RequireGame

local logObject = Skywalker.Logger:GetLogObject("Game.Battlefield")

---@type BattlefieldRoomS 战场房间
local battlefieldRoomClass = includeGame("Battlefield/BattlefieldRoomS.lua")

---@class BattlefieldMgrS:Class 战斗管理
---@field public new fun(...):BattlefieldMgrS 创建实例
local BattlefieldMgrS = Class("BattlefieldMgrS")

---@type table<integer, BattlefieldRoomS> 战场房间
local battlefieldRoomMap = {}

---@type integer 战场房间自增ID
local battlefieldRoomAddID = 0

--* 构造函数
function BattlefieldMgrS:Ctor()
    battlefieldRoomMap = {}

    logObject:Debug("战场管理器创建")
end

--* 析构函数
function BattlefieldMgrS:Dtor()
    for _, battlefieldRoom in pairs(battlefieldRoomMap) do
        battlefieldRoom:Dtor()
    end
    battlefieldRoomMap = {}

    logObject:Debug("战场管理器销毁")
end

--* 创建战场
---@param matchRoomID integer 匹配房间ID
---@return integer battlefieldRoomID 战场房间ID
function BattlefieldMgrS:CreateBattlefield(matchRoomID)
    battlefieldRoomAddID = battlefieldRoomAddID + 1

    local battlefieldRoom = battlefieldRoomClass:new(matchRoomID, battlefieldRoomAddID)
    battlefieldRoomMap[battlefieldRoomAddID] = battlefieldRoom

    return battlefieldRoomAddID
end

--* 获取战场房间
---@param battlefieldRoomID integer 战场房间ID
---@return BattlefieldRoomS 战场房间
function BattlefieldMgrS:GetBattlefieldRoom(battlefieldRoomID)
    return battlefieldRoomMap[battlefieldRoomID]
end

return BattlefieldMgrS:new()
