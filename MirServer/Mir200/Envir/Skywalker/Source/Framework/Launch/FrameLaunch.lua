-------------------------------------------------------------------
---文件: Framework\Launch\FrameLaunch.lua
---作者: shyfan
---日期: 2025/06/11 14:24:55
---功能: Skywalker 启动入口文件
-------------------------------------------------------------------
-- * 打印
local printMsg = nil
if CLIENT_MODE then
    printMsg = function(...)
        SL:release_print(...)
    end
elseif SERVER_MODE then
    printMsg = release_print
end

---@class Skywalker 
---@field Logger SKY_Logger 日志对象
---@field Json Json 库
Skywalker = {}

-- * require Skywalker下的 Lua 文件
---@param luaPath   string    Lua文件路径
---@return any
function Skywalker.RequireSkywalker(luaPath)
    if CLIENT_MODE then
        return SL:Require("Skywalker/" .. luaPath, true)
    elseif SERVER_MODE then
        return include("Skywalker/" .. luaPath)
    end
end

-- * 打印
Skywalker.PrintMsg = printMsg

local requireFile = Skywalker.RequireSkywalker
requireFile("Source/Framework/Base/Require.lua")
requireFile("Source/Framework/Base/Misc.lua")

-- * 严格模式，除允许的全局变量外，禁止访问未声明的全局变量
local OpenStrictMode = true
local allowed_globals = requireFile("Source/Framework/Config/AllowedGlobals.lua")
do
    local declared = {}
    for k, v in pairs(_G) do
        declared[k] = true
    end -- 记录已有的全局变量

    local mt = {
        __newindex = function(_, key, value)
            local isAllowed = allowed_globals[key] ~= nil
            local isDeclared = declared[key] ~= nil
            if not isDeclared and not isAllowed then
                printMsg("[Global Error] 创建新的全局变量 " .. key)
            elseif isDeclared then
                printMsg("[Global Error] 重新赋值全局变量 '" .. key)
            end

            if allowed_globals[key] or not OpenStrictMode then
                rawset(_G, key, value)
                declared[key] = true
            end
        end
    }
    setmetatable(_G, mt)
end

-- * FrameConfig
Skywalker.RequireFramework("Config/FrameConfig.lua")

-- * GameMisc
Skywalker.RequireFramework("Game/GameMisc.lua")

-- * Util
Skywalker.RequireFramework("Util/UtilTool.lua")

-- * Class
Skywalker.RequireFramework("Class/Class.lua")

-- * Logger
Skywalker.Logger = Skywalker.RequireFramework("Logger/SKY_Logger.lua")

local logObject = Skywalker.Logger:GetLogObject("Skywalker")
logObject:Info("Skywalker 版本 1.0.0")
if Skywalker.DEBUG then
    logObject:Info("DEBUG 开启")
end

-- * Json
-- * json.lua 中使用了error函数，可能会导致日志输出异常，所以这里重新定义error函数
error = function(...)
    logObject:Error(...)
end
---@class Json
---@field encode fun(data: any): string
---@field decode fun(jsonStr: string): any
Skywalker.Json = Skywalker.RequireFramework("Json/json.lua")
