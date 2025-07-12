-------------------------------------------------------------------
---文件: Server\Skywalker\Module\Net\SKYS_Module_Net.lua
---作者: shyfan
---日期: 2025/02/23 22:29:24
---功能: Skywalker 服务端网络模块
-------------------------------------------------------------------
local libGlobalSafeDefine = Skywalker.GlobalSafeDefine

local utilTool = UtilTool

local logObject = Skywalker.Logger:GetLogObject("Module.Net")

local _DEBUG = Skywalker.DEBUG and true

---@class SKYS_Module_Net
local SKYS_Module_Net = {}

---@type table<integer, function>    消息处理函数
local msgHandler = {}

-- * 所有发送给服务端的网络消息触发
---@param player userdata 玩家对象
---@param msgID integer 消息ID
---@param arg1 integer 参数1
---@param arg2 integer 参数2
---@param arg3 integer 参数3
---@param msgData string 消息数据
local function handlerequest(player, msgID, arg1, arg2, arg3, msgData)
    if msgHandler[0] then
        msgHandler[0](player, msgID, arg1, arg2, arg3, msgData)
    end

    local handler = msgHandler[msgID]
    if handler == nil then
        return
    end

    handler(player, msgID, arg1, arg2, arg3, msgData)
end
libGlobalSafeDefine("handlerequest", handlerequest)

-- * 注册网络消息
---@param msgID number 消息ID
---@param callFunc function 回调函数
---@return boolean 是否注册成功
function SKYS_Module_Net:RegisterNetMsg(msgID, callFunc)
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

    return true
end

-- * 反注册网络消息
---@param msgID number 消息ID
function SKYS_Module_Net:UnRegisterNetMsg(msgID)
    -- 参数检查
    if msgID == nil then
        logObject:Error("SKYC_Module_Net.RemoveNetMsg msgID == nil")
        return
    end

    -- 是否已注册
    if msgHandler[msgID] == nil then
        return
    end

    -- 移除消息
    msgHandler[msgID] = nil
end

-- * 发送网络消息
---@param player userdata 玩家对象
---@param msgID integer 消息ID
---@param arg1 any 参数1
---@param arg2 any 参数2
---@param arg3 any 参数3
---@param msgData any 消息数据
---@return boolean 是否发送成功
function SKYS_Module_Net:SendNetMsg(player, msgID, arg1, arg2, arg3, msgData)
    -- 参数检查
    if msgID == nil then
        logObject:Error("SKYC_Module_Net:SendNetMsg msgID == nil")
        return false
    end

    sendluamsg(player, msgID, arg1, arg2, arg3, msgData)

    if _DEBUG then
        logObject:Debug(utilTool.string.Format("SKYC_Module_Net:SendNetMsg msgID %d", msgID))
    end

    return true
end

return SKYS_Module_Net
