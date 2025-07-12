-------------------------------------------------------------------
---文件: Client\Skywalker\Game\Player\PlayerMgrC.lua
---作者: shyfan
---日期: 2025/06/19 17:54:18
---功能: 玩家管理器 C
-------------------------------------------------------------------
local includeGame = Skywalker.RequireGame

includeGame("Player/PlayerNetMessageC.lua")

local logObject = Skywalker.Logger:GetLogObject("Game.Player")

local mainPlayer = includeGame("Player/MainPlayerC.lua")

---@class PlayerMgrC:Class 玩家管理器
---@field public new fun(...):PlayerMgrC 创建实例
local PlayerMgrC = Class("PlayerMgrC")

-- * 构造函数
function PlayerMgrC:Ctor()
end

-- * 析构函数
function PlayerMgrC:Dtor()
end

-- * 获取主玩家
---@return MainPlayerC
function PlayerMgrC:GetMainPlayer()
    return mainPlayer
end

return PlayerMgrC:new()
