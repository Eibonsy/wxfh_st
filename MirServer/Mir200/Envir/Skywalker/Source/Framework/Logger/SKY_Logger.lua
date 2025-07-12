-------------------------------------------------------------------
---文件: Framework\Logger\SKY_Logger.lua
---作者: shyfan
---日期: 2025/06/11 14:41:49
---功能: Skywalker 日志模块
-------------------------------------------------------------------
local getDebugInfo = debug.getinfo
local osDate = os.date
local stringFormat = string.format
local ioOpen = io.open
local ioClose = io.close

-- * 只要一个为 true 就会打印，方便控制打印
local _DEBUG = Skywalker.DEBUG or false

---@class LogLevel 日志级别
local LogLevel = {
    DEBUG = 1, -- 调试打印
    INFO = 2, -- 信息打印
    WARN = 3, -- 警告打印
    ERROR = 4, -- 错误打印
    FATAL = 5 -- 致命错误打印
}

local LogLevelStr = {
    [LogLevel.DEBUG] = "[DEBUG     ]",
    [LogLevel.INFO] = "[INFO      ]",
    [LogLevel.WARN] = "[WARN      ]",
    [LogLevel.ERROR] = "[ERROR     ]",
    [LogLevel.FATAL] = "[FATAL     ]"
}

-- * 日志等级，低于这个等级的日志将不会被打印
local systemLogLevel = LogLevel.DEBUG

-- * 如果不是DEBUG模式，则日志等级至少为INFO
if not _DEBUG and systemLogLevel < LogLevel.INFO then
    systemLogLevel = LogLevel.INFO
end

-- * 格式化日志信息1
---@param level integer 日志等级
---@param logObject LogObject 日志对象
---@param msg string 日志内容
---@return string
local function logFormat1(level, logObject, msg)
    local debugInfo = getDebugInfo(4, "Sl")
    local fileName = debugInfo.short_src:match("([^/\\]+)$")
    if fileName ~= nil then
        fileName = fileName:gsub('[%]"“”‘’]', "") -- 去除所有引号和右中括号
    end
    if fileName == nil or fileName == "" then
        fileName = "unknown.lua"
    end

    return stringFormat("%s [%s:%d][%s]%s", LogLevelStr[level], fileName, debugInfo.currentline, logObject:GetName(),
        msg)
end

---@type boolean 是否启用日志文件
local isLogFileEnabled = true
local logFilePath = nil

-- * 写入日志到文件
---@param level integer 日志等级
---@param logObject LogObject 日志对象
---@param msg string 日志内容
local function WriteLogToFile(level, logObject, msg)
    local fullMsg = logFormat1(level, logObject, msg)

    if CLIENT_MODE then
        SL:release_print(fullMsg)
    elseif SERVER_MODE then
        release_print(fullMsg)
    end

    if not Skywalker.LOG_FILE or logFilePath == nil then
        return
    end

    local file = ioOpen(logFilePath, "a")
    if file then
        file:write(osDate("[%Y-%m-%d %H:%M:%S] ") .. fullMsg .. "\n")
        ioClose(file)
    end
end

---@class LogObject:Class 日志打印对象
---@field public new fun(...):LogObject 创建实例
---@field private name string 名称
---@field private logLevel integer 日志等级，大于等于这个等级的日志才会被打印，但是同时也受系统日志等级影响
---@field private independent boolean 是否独立，如果为true，日志等级不受系统日志等级影响，慎用，一般可以用来外网跟踪打印
local LogObject = Class("LogObject")

-- * 构造函数
---@param name string 名称
---@param logLevel integer 日志等级
---@param independent? boolean 是否独立
function LogObject:Ctor(name, logLevel, independent)
    self.name = name
    self:Update(logLevel, independent)
end

-- * 更新日志对象
---@param logLevel integer 日志等级
---@param independent? boolean 是否独立
function LogObject:Update(logLevel, independent)
    self.logLevel = logLevel or LogLevel.DEBUG
    self.independent = independent or true
end

-- * 获取日志等级
---@return integer 日志等级
function LogObject:GetLogLevel()
    return self.logLevel
end

-- * 获取日志名称
---@return string 日志名称
function LogObject:GetName()
    return self.name
end

-- * 打印调试日志
---@param msg string 日志内容
function LogObject:Debug(msg)
    -- 判断日志等级
    if self.logLevel > LogLevel.DEBUG then
        return
    end

    -- 系统日志等级，需要判断是否独立
    if not self.independent then
        if systemLogLevel > LogLevel.DEBUG then
            return
        end
    end

    WriteLogToFile(LogLevel.DEBUG, self, msg)
end

-- * 打印信息日志
---@param msg string 日志内容
function LogObject:Info(msg)
    -- 判断日志等级
    if self.logLevel > LogLevel.INFO then
        return
    end

    -- 系统日志等级，需要判断是否独立
    if not self.independent then
        if systemLogLevel > LogLevel.INFO then
            return
        end
    end

    WriteLogToFile(LogLevel.INFO, self, msg)
end

-- * 打印警告日志
---@param msg string 日志内容
function LogObject:Warn(msg)
    -- 判断日志等级
    if self.logLevel > LogLevel.WARN then
        return
    end

    -- 系统日志等级，需要判断是否独立
    if not self.independent then
        if systemLogLevel > LogLevel.WARN then
            return
        end
    end

    WriteLogToFile(LogLevel.WARN, self, msg)
end

-- * 打印错误日志
---@param msg string 日志内容
function LogObject:Error(msg)
    -- 判断日志等级
    if self.logLevel > LogLevel.ERROR then
        return
    end

    -- 系统日志等级，需要判断是否独立
    if not self.independent then
        if systemLogLevel > LogLevel.ERROR then
            return
        end
    end

    WriteLogToFile(LogLevel.ERROR, self, msg)
end

-- * 打印致命错误日志
---@param msg string 日志内容
function LogObject:Fatal(msg)
    -- 判断日志等级
    if self.logLevel > LogLevel.FATAL then
        return
    end

    -- 系统日志等级，需要判断是否独立
    if not self.independent then
        if systemLogLevel > LogLevel.FATAL then
            return
        end
    end

    WriteLogToFile(LogLevel.FATAL, self, msg)
end

---@class SKY_Logger 日志模块
local SKY_Logger = {}

---@type table<string, LogObject> 日志对象集合
local logObjectMap = {}

-- * 获取日志对象
---@param name string 名称
---@param logLevel? integer 日志等级
---@param independent? boolean 是否独立
---@return LogObject
function SKY_Logger:GetLogObject(name, logLevel, independent)
    logLevel = logLevel or LogLevel.DEBUG

    -- 如果不存在，则创建
    if not logObjectMap[name] then
        logObjectMap[name] = LogObject:new(name, logLevel, independent)
    end

    -- 启用更低的日志等级

    local logObject = logObjectMap[name]
    local oldLevel = logObject:GetLogLevel()
    if oldLevel > logLevel then
        oldLevel = logLevel
    end
    logObject:Update(oldLevel, independent)

    return logObject
end

local logObject = SKY_Logger:GetLogObject("Skywalker")

-- * 创建日志文件
if Skywalker.LOG_FILE then
    if logFilePath == nil then

        logFilePath = stringFormat("Skywalker/Log/Skywalker-%s.log", osDate("%Y-%m-%d-%H-%M-%S"))
        if CLIENT_MODE then
            logFilePath = stringFormat("dev/Skywalker/Log/Skywalker-%s.log", osDate("%Y-%m-%d-%H-%M-%S"))

        end

        local file, errorMsg = ioOpen(logFilePath, "w")
        if file then
            ioClose(file)

            logObject:Info("日志文件路径: " .. logFilePath)
            logObject:Info("创建时间: " .. osDate("%Y-%m-%d %H:%M:%S"))
        else
            logObject:Error("无法创建日志文件：" .. logFilePath)
            logObject:Error("错误信息: " .. (errorMsg or "未知错误"))
            logFilePath = nil

        end
    else
        logObject:Info("日志文件路径已设置: " .. logFilePath)
    end
end

return SKY_Logger
