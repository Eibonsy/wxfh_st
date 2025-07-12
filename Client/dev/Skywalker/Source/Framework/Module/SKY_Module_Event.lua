-------------------------------------------------------------------
---文件: Framework\Module\SKY_Module_Event.lua
---作者: shyfan
---日期: 2025/02/27 16:12:36
---功能: 事件模块
-------------------------------------------------------------------
local pairs = pairs

local utilTool = UtilTool
local gameMisc = Skywalker.GameMisc

---@type LogObject
local logObject = Skywalker.Logger:GetLogObject("Module.Event")

local isServer = true
if CLIENT_MODE then
    isServer = false
end

local _DEBUG = Skywalker.DEBUG and true

--- * 获取事件说明
---@param enumValue integer 枚举值
---@return string
local function getEventDesc(enumValue)
    if isServer then
        return gameMisc:GetEnumIdDesc(gameMisc.EventIDS, enumValue)
    else
        return gameMisc:GetEnumIdDesc(gameMisc.EventIDC, enumValue)
    end
end

---@class SKY_Module_Event 事件模块
local SKY_Module_Event = {}

---@class EventData 事件数据
---@field callback function 回调函数
---@field backParam any 回调参数
---@alias EventList table<string, EventData>
---@type table<integer, EventList> 事件处理函数列表
local eventHandler = {}

-- * 注册事件
---@param eventId integer 事件ID
---@param eventKey string 事件键
---@param callback function 回调函数
---@param backParam any 回调参数
function SKY_Module_Event:RegisterEvent(eventId, eventKey, callback, backParam)
    if eventHandler[eventId] == nil then
        eventHandler[eventId] = {}
    end
    local eventList = eventHandler[eventId]

    -- 是否已存在
    if eventList[eventKey] ~= nil then
        logObject:Error(utilTool.string.Format(
            "SKY_Module_Event.RegisterEvent event %s eventKey %s is already registered", getEventDesc(eventId), eventKey))
        return nil
    end

    eventList[eventKey] = {
        callback = callback,
        backParam = backParam
    }

    if _DEBUG then
        logObject:Debug(utilTool.string.Format("注册事件 event %d(%s) eventKey %s", eventId, getEventDesc(eventId),
            eventKey))
    end
end

-- * 反注册事件
---@param eventId integer 事件ID
---@param eventKey string 事件键
function SKY_Module_Event:UnRegisterEvent(eventId, eventKey)
    local eventList = eventHandler[eventId]
    if eventList == nil then
        return
    end

    eventList[eventKey] = nil

    if _DEBUG then
        logObject:Debug(utilTool.string.Format("反注册事件 event %d(%s) eventKey %s", eventId,
            getEventDesc(eventId), eventKey))
    end
end

-- * 触发事件
---@param eventId integer 事件ID
---@param eventParam? any 事件数据
function SKY_Module_Event:FireEvent(eventId, eventParam)
    local triggerCount = 0

    local eventList = eventHandler[eventId]
    if eventList ~= nil then
        for _, v in pairs(eventList) do
            if v.callback then
                v.callback(eventId, eventParam, v.backParam)
                triggerCount = triggerCount + 1
            end
        end
    end

    if _DEBUG then
        logObject:Debug(utilTool.string.Format("触发事件 event %d(%s) triggerCount %d", eventId,
            getEventDesc(eventId), triggerCount))
    end
end

return SKY_Module_Event
