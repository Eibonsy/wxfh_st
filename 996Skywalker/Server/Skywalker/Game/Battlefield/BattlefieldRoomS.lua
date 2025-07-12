-------------------------------------------------------------------
---文件: Server\Skywalker\Game\Battlefield\BattlefieldRoomS.lua
---作者: shyfan
---日期: 2025/03/02 17:58:38
---功能: 战场房间
-------------------------------------------------------------------
local skyModule = SKYS_Module
local logObject = Skywalker.Logger:GetLogObject("Game.Battlefield")

---@class BattlefieldRoomS:Class 战场房间
---@field public new fun(self:BattlefieldRoomS, matchRoomID:integer, battlefieldRoomID:integer):BattlefieldRoomS 创建实例
---@field private mRoomID integer 匹配房间ID
---@field private bRoomID integer 战场房间ID
---@field private mapID string 地图ID
local BattlefieldRoomS = Class("BattlefieldRoomS")

--* 构造函数
---@param matchRoomID integer 匹配房间ID
---@param battlefieldRoomID integer 战场房间ID
function BattlefieldRoomS:Ctor(matchRoomID, battlefieldRoomID)
    self.mRoomID = matchRoomID
    self.bRoomID = battlefieldRoomID

    self.mapID = "Battlefield_" .. battlefieldRoomID

    skyModule.map:CreateMirrorMap("1", self.mapID, "战场 " .. self.bRoomID, 60 * 60, "0")

    logObject:Debug("创建战场 " .. battlefieldRoomID .. " 地图 " .. self.mapID .. " 匹配房间 " .. matchRoomID)
end

--* 析构函数
function BattlefieldRoomS:Dtor()
    skyModule.map:DeleteMirrorMap(self.mapID)

    logObject:Debug("销毁战场 " .. self.bRoomID .. " 地图 " .. self.mapID .. " 匹配房间 " .. self.mRoomID)
end

--* 获取战场地图ID
---@return string 地图ID
function BattlefieldRoomS:GetMapID()
    return self.mapID
end

return BattlefieldRoomS
