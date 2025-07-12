-------------------------------------------------------------------
---文件: Server\Skywalker\Module\Map\MapInstance.lua
---作者: shyfan
---日期: 2025/03/09 11:14:45
---功能: 地图实例
-------------------------------------------------------------------
local skyModule = SKYS_Module
local logObject = Skywalker.Logger:GetLogObject("Game.MapInstance")

---@class MapInstanceS:Class
---@field public new fun(self:MapInstanceS, staticID:string, dynamicID:string):MapInstanceS 构造函数
---@field public sID string 地图静态ID
---@field public dID string 地图动态ID
MapInstanceS = Class("MapInstanceS")

--* 构造函数
---@param staticID string 静态ID
---@param dynamicID string 动态ID
function MapInstanceS:Ctor(staticID, dynamicID)
    self.sID = staticID
    self.dID = dynamicID

    logObject:Debug("创建地图实例，静态ID " .. staticID .. "  动态ID " .. dynamicID)
end

--* 析构函数
function MapInstanceS:Dtor()
    logObject:Debug("销毁地图实例，静态ID " .. self.sID .. "  动态ID " .. self.dID)
end

--* 地图释放
function MapInstanceS:Release()
    logObject:Debug("释放地图实例，静态ID " .. self.sID .. "  动态ID " .. self.dID)

    self:Dtor()
end

--* 获取地图静态ID
---@return string 静态ID
function MapInstanceS:GetStaticID()
    return self.sID
end

--* 获取地图动态ID
---@return string 动态ID
function MapInstanceS:GetDynamicID()
    return self.dID
end

--* 玩家进入地图
---@param player userdata 玩家对象
---@param mapID string 地图ID
---@param x integer x坐标
---@param y integer y坐标
function MapInstanceS:OnPlayerEnter(player, mapID, x, y)
    logObject:Debug("玩家 " .. skyModule.object:GetName(player) .. " 进入地图 " .. mapID .. " (" .. x .. ", " .. y .. ")")
end

--* 玩家离开地图
---@param player userdata 玩家对象
---@param mapID string 地图ID
---@param x integer x坐标
---@param y integer y坐标
function MapInstanceS:OnPlayerLeave(player, mapID, x, y)
    logObject:Debug("玩家 " .. skyModule.object:GetName(player) .. " 离开地图 " .. mapID .. " (" .. x .. ", " .. y .. ")")
end

--* 镜像地图销毁
---@param map userdata 地图对象
---@param mapID string 地图ID
function MapInstanceS:OnMirrorMapDestroy(map, mapID)
    logObject:Debug("镜像地图销毁 " .. mapID)
end

--* 进入地图传送点前
---@param player userdata 玩家对象
---@param mapID string 地图ID
---@param x integer x坐标
---@param y integer y坐标
---@return boolean 是否可以传送
function MapInstanceS:OnBeforeEnterTeleport(player, mapID, x, y)
    logObject:Debug("玩家 " .. skyModule.object:GetName(player) .. " 准备传送到地图 " .. mapID .. " (" .. x .. ", " .. y .. ")")
    return true
end

--* 击杀玩家
---@param killer userdata 击杀者
---@param player userdata 死亡玩家
function MapInstanceS:OnKillPlayer(killer, player)
    logObject:Debug("地图 " .. self:GetDynamicID() ..
        " 对象 " .. skyModule.object:GetName(killer) .. " 击杀了玩家 " .. skyModule.object:GetName(player))
end

--* 玩家死亡
---@param player userdata 死亡玩家
---@param killer userdata 击杀者
function MapInstanceS:OnPlayerDie(player, killer)
    logObject:Debug("地图 " .. self:GetDynamicID() ..
        " 玩家 " .. skyModule.object:GetName(player) .. " 被对象 " .. skyModule.object:GetName(killer) .. " 击杀")
end
