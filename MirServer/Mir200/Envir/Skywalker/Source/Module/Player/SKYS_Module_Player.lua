-------------------------------------------------------------------
---文件: Server\Skywalker\Module\Player\SKYS_Module_Player.lua
---作者: shyfan
---日期: 2025/02/28 16:18:06
---功能: SKYS_Module_Player 玩家模块
-------------------------------------------------------------------
local includeModule = Skywalker.RequireModule

includeModule("Player/PlayerProxyS.lua")

---@class SKYS_Module_Player
local SKYS_Module_Player = {}

-- * 设置玩家变量
---@param player userdata 玩家
---@param key string 键
---@param value any 值
function SKYS_Module_Player:SetDefVar(player, key, value)
    setplaydef(player, key, value)
end

-- * 获取玩家变量
---@param player userdata 玩家
---@param key string 键
---@return any
function SKYS_Module_Player:GetDefVar(player, key)
    return getplaydef(player, key)
end

-- * 通过唯一ID获取玩家
---@param id string? 唯一ID
---@return userdata?
function SKYS_Module_Player:GetPlayerByID(id)
    if id == nil or id == "" then
        return nil
    end

    return getplayerbyid(id)
end

return SKYS_Module_Player
