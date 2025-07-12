-------------------------------------------------------------------
---文件: Framework\Base\Require.lua
---作者: shyfan
---日期: 2025/06/18 15:44:49
---功能: Skywalker Require
-------------------------------------------------------------------
local requireFile = Skywalker.RequireSkywalker

-- * require Skywalker/Framework Lua 文件
---@param luaPath   string    Lua文件路径
---@return any
function Skywalker.RequireFramework(luaPath)
    return requireFile("Source/Framework/" .. luaPath)
end

-- * require Skywalker/Game下的 Lua 文件
---@param luaPath   string    Lua文件路径
---@return any
function Skywalker.RequireGame(luaPath)
    return requireFile("Source/Game/" .. luaPath)
end

-- * require Skywalker/Game/Common下的 Lua 文件
---@param luaPath   string    Lua文件路径
---@return any
function Skywalker.RequireGameCommon(luaPath)
    return requireFile("Source/Game/Common/" .. luaPath)
end

-- * require Skywalker/Game/Util下的 Lua 文件
---@param luaPath   string    Lua文件路径
---@return any
function Skywalker.RequireGameUtil(luaPath)
    return requireFile("Source/Game/Util/" .. luaPath)
end

-- * require Skywalker/Module下的 Lua 文件
---@param luaPath   string    Lua文件路径
---@return any
function Skywalker.RequireModule(luaPath)
    return requireFile("Source/Module/" .. luaPath)
end

-- * require Skywalker/UIControl下的 Lua 文件
---@param luaPath   string    Lua文件路径
---@return any
function Skywalker.RequireUIControl(luaPath)
    if not CLIENT_MODE then
        return nil
    end

    return requireFile("Source/UIControl/" .. luaPath)
end

-- * require Skywalker/GameConfig下的 Lua 文件
---@param luaPath   string    Lua文件路径
---@return any
function Skywalker.RequireGameConfig(luaPath)
    return requireFile("GameConfig/" .. luaPath)
end

