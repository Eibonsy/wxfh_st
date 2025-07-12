-------------------------------------------------------------------
---文件: Server\Skywalker\Game\Map\Map_Battlefield.lua
---作者: shyfan
---日期: 2025/03/09 14:16:55
---功能: 战场地图
-------------------------------------------------------------------
local ipairs = ipairs

local utilTool = UtilTool

local skyModule = SKYS_Module
local logObject = Skywalker.Logger:GetLogObject("Game.Map.Battlefield")

--* 战场状态
---@class BattlefieldMapStatus
local BattlefieldMapStatus = {
    --* 准备中
    Ready = 1,
    --* 战斗中
    Fighting = 2,
    --* 结算中
    Settlement = 3,
    --* 结束
    End = 4
}

---@class Map_Battlefield:MapInstanceS
---@field super MapInstanceS
---@field public new fun(self:Map_Battlefield, staticID:string, dynamicID:string):Map_Battlefield 构造函数
local Map_Battlefield = Class("Map_Battlefield", MapInstanceS)

--* 战场结算
---@param mapInstance Map_Battlefield
local function battlefieldSettlement(mapInstance)
    if mapInstance:IsSettlement() then
        logObject:Warn("战场地图 " .. mapInstance:GetDynamicID() .. " 重复结算")
        return
    end

    logObject:Debug("战场地图 " .. mapInstance:GetDynamicID() .. " 开始结算")

    -- TODO 将所有未死亡的玩家杀死

    -- TODO 战场结算
    mapInstance:SetSettlement()
end

--* 构造函数
---@param staticID string 静态ID
---@param dynamicID string 动态ID
function Map_Battlefield:Ctor(staticID, dynamicID)
    self.super:Ctor(staticID, dynamicID)

    --* 是否已结算
    self.settlement = false

    ---@type string[] 存活玩家列表
    self.alivePlayers = {}
end

--* 析构函数
function Map_Battlefield:Dtor()
    self.super:Dtor()
end

--* 玩家进入地图
---@param player userdata 玩家对象
---@param mapID string 地图ID
---@param x integer x坐标
---@param y integer y坐标
function Map_Battlefield:OnPlayerEnter(player, mapID, x, y)
    self.super:OnPlayerEnter(player, mapID, x, y)

    -- 添加存活玩家
    utilTool.table.Insert(self.alivePlayers, skyModule.object:GetID(player))
end

--* 玩家离开地图
---@param player userdata 玩家对象
---@param mapID string 地图ID
---@param x integer x坐标
---@param y integer y坐标
function Map_Battlefield:OnPlayerLeave(player, mapID, x, y)
    self.super:OnPlayerLeave(player, mapID, x, y)

    -- 移除存活玩家
    for i, v in ipairs(self.alivePlayers) do
        if v == skyModule.object:GetID(player) then
            utilTool.table.Remove(self.alivePlayers, i)
            break
        end
    end
end

--* 玩家死亡
---@param player userdata 死亡玩家
---@param killer userdata 击杀者
function Map_Battlefield:OnPlayerDie(player, killer)
    self.super:OnPlayerDie(player, killer)

    -- 死亡全掉落
    skyModule.bag:BagDropAll(player)
    skyModule.bag:EquipDropAll(player)

    -- TODO 弹结算界面

    logObject:Debug("战场地图 " .. self:GetDynamicID() .. " 剩余存活玩家数量：" .. utilTool.table.ArrayLength(self.alivePlayers))

    -- 判断当前地图存活玩家数量，如果全部死亡则战场结算
    if not self:IsSettlement() then
        if utilTool.table.ArrayLength(self.alivePlayers) == 0 then
            battlefieldSettlement(self)
        end
    end
end

--* 是否已结算
---@return boolean
function Map_Battlefield:IsSettlement()
    return self.settlement
end

--* 设置结算
function Map_Battlefield:SetSettlement()
    self.settlement = true
end

return Map_Battlefield
