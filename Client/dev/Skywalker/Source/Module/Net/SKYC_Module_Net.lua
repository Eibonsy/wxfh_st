-------------------------------------------------------------------
---文件: Client\Skywalker\Module\Net\SKYC_Module_Net.lua
---作者: shyfan
---日期: 2025/02/18 20:05:20
---功能: Skywalker 客户端网络模块
-------------------------------------------------------------------
local SL = SL

local stringUtil = UtilTool.string

local logObject = Skywalker.Logger:GetLogObject("Module.Net")

local _DEBUG = Skywalker.DEBUG and true

---@class SKYC_Module_Net
local SKYC_Module_Net = {}

---@type table<integer, function>    消息处理函数
local msgHandler = {}

-- * 注册网络消息
---@param msgID number 消息ID
---@param callFunc function 回调函数
---@return boolean 是否注册成功
function SKYC_Module_Net:RegisterNetMsg(msgID, callFunc)
    -- 参数检查
    if msgID == nil or callFunc == nil then
        logObject:Error("SKYC_Module_Net.RegisterNetMsg msgID == nil or callFunc == nil")
        return false
    end

    -- 是否重复注册
    if msgHandler[msgID] ~= nil then
        logObject:Error("SKYC_Module_Net.RegisterNetMsg msgID is already registered")
        return false
    end

    -- 注册消息
    msgHandler[msgID] = callFunc

    SL:RegisterLuaNetMsg(msgID, callFunc)

    return true
end

-- * 反注册网络消息
---@param msgID number 消息ID
function SKYC_Module_Net:UnRegisterNetMsg(msgID)
    -- 参数检查
    if msgID == nil then
        logObject:Error("SKYC_Module_Net.RemoveNetMsg msgID == nil")
        return
    end

    -- 是否已注册
    if msgHandler[msgID] == nil then
        return
    end

    SL:UnRegisterLuaNetMsg(msgID)

    -- 移除消息
    msgHandler[msgID] = nil
end

-- * 发送网络消息
---@param msgID number 消息ID
---@param arg1 any 参数1
---@param arg2 any 参数2
---@param arg3 any 参数3
---@param msgData any 消息数据
---@return boolean 是否发送成功
function SKYC_Module_Net:SendNetMsg(msgID, arg1, arg2, arg3, msgData)
    -- 参数检查
    if msgID == nil then
        logObject:Error("SKYC_Module_Net:SendNetMsg msgID == nil")
        return false
    end

    SL:SendLuaNetMsg(msgID, arg1, arg2, arg3, msgData)

    if _DEBUG then
        logObject:Debug(stringUtil.Format("SKYC_Module_Net:SendNetMsg msgID %d", msgID))
    end

    return true
end

return SKYC_Module_Net
