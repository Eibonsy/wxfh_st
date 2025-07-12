-------------------------------------------------------------------
---文件: Server\Skywalker\Game\Player\PlayerMgrS.lua
---作者: shyfan
---日期: 2025/06/23 14:38:50
---功能: 玩家管理器 S
-------------------------------------------------------------------
local includeGame = Skywalker.RequireGame

includeGame("Player/PlayerEventS.lua")

local logObject = Skywalker.Logger:GetLogObject("Game.Player")

---@class PlayerMgrS:Class 玩家管理器
---@field public new fun(...):PlayerMgrS 创建实例
local PlayerMgrS = Class("PlayerMgrS")

-- * 构造函数
function PlayerMgrS:ctor()
    -- 初始化玩家管理器
    logObject:Debug("玩家管理器 S 创建")
end

-- * 析构函数
function PlayerMgrS:dtor()
    logObject:Debug("玩家管理器 S 销毁")
end

return PlayerMgrS:new()
