-------------------------------------------------------------------
---文件: Client\Skywalker\Game\UI\UIMgr.lua
---作者: shyfan
---日期: 2025/02/22 21:37:56
---功能: UI管理
-------------------------------------------------------------------
local includeGame = Skywalker.RequireGame

---* 加载UI
local function includeUI(luaPath)
    return includeGame("UI/" .. luaPath)
end

---@type MainUI
local mainUI = includeUI("MainUI.lua")

---@class UIMgr:Class UI管理
---@field public new fun(...):UIMgr 创建实例
local UIMgr = Class("UIMgr")

-- * 构造函数
function UIMgr:Ctor()
    mainUI:Init()
end

-- * 析构函数
function UIMgr:Dtor()
end

return UIMgr:new()
