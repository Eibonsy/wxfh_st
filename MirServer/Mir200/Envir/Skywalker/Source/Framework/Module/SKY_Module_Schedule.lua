-------------------------------------------------------------------
---文件: Framework\Module\SKY_Module_Schedule.lua
---作者: shyfan
---日期: 2025/03/03 22:04:23
---功能: SKY_Module_Schedule 定时器模块
-------------------------------------------------------------------
local pairs = pairs

local utilTool = UtilTool

-- * 定时器步长，单位毫秒
local scheduleStep = 100
if CLIENT_MODE then
    -- * 客户端定时器步长
    scheduleStep = 100
elseif SERVER_MODE then
    -- * 服务器端定时器步长
    scheduleStep = 1000
end

---@class ScheduleData 定时器数据
---@field callback fun(scheduleID:integer, repeatIndex:integer, backParam?:any) 回调函数
---@field backParam any 回调参数
---@field interval number 间隔时间
---@field intervalCost number 间隔时间消耗
---@field repeatCount integer 重复次数
---@field repeatIndex integer 重复次数索引
---@type table<integer, ScheduleData>
local scheduleMap = {}

---@type integer 定时器自增ID
local scheduleAddID = 0

-- * 定时器执行
local function scheduleUpdate()
    local removeList = {}

    for scheduleID, scheduleData in pairs(scheduleMap) do
        scheduleData.intervalCost = scheduleData.intervalCost + scheduleStep
        if scheduleData.intervalCost >= scheduleData.interval then
            -- * 数据重置
            scheduleData.intervalCost = 0
            scheduleData.repeatIndex = scheduleData.repeatIndex + 1

            -- * 执行回调
            scheduleData.callback(scheduleID, scheduleData.repeatIndex, scheduleData.backParam)

            -- * 重复次数
            if scheduleData.repeatCount > 0 then
                if scheduleData.repeatIndex >= scheduleData.repeatCount then
                    utilTool.table.Insert(removeList, scheduleID)
                end
            end
        end
    end

    -- * 移除定时器
    for _, removeID in ipairs(removeList) do
        scheduleMap[removeID] = nil
    end
end

-- * 服务器的定时器回调特殊一些
if SERVER_MODE then
    function ontimerex1()
        scheduleUpdate()
    end
end

-- * 创建 ScheduleData
---@param callback fun(scheduleID:integer, repeatIndex:integer, backParam?:any) 回调函数
---@param interval number 间隔时间
---@param backParam any 回调参数
---@param repeatCount? integer 重复次数
---@return ScheduleData
local function createScheduleData(callback, interval, backParam, repeatCount)
    return {
        callback = callback,
        backParam = backParam,
        interval = interval,
        intervalCost = 0,
        repeatCount = repeatCount or 0,
        repeatIndex = 0
    }
end

---@class SKY_Module_Schedule:Class 定时器模块
local SKY_Module_Schedule = Class("SKY_Module_Schedule")

-- * 构造函数
function SKY_Module_Schedule:Ctor()
    scheduleMap = {}
    scheduleAddID = 0
    scheduleAddID = scheduleAddID + 1

    -- * 注册定时器
    if CLIENT_MODE then
        SL:Schedule(scheduleUpdate, scheduleStep / 1000)
    elseif SERVER_MODE then
        setontimerex(scheduleAddID, scheduleStep / 1000, 0)
    end
end

-- * 注册定时器
---@param callback fun(scheduleID:integer, repeatIndex:integer, backParam?:any) 回调函数
---@param interval integer 间隔时间，单位毫秒
---@param backParam? any 回调参数
---@param repeatCount? integer 重复次数，nil或者0表示无限次
---@return integer 定时器ID
function SKY_Module_Schedule:RegisterSchedule(callback, interval, backParam, repeatCount)
    scheduleAddID = scheduleAddID + 1

    scheduleMap[scheduleAddID] = createScheduleData(callback, interval, backParam, repeatCount)
    return scheduleAddID
end

-- * 反注册定时器
---@param scheduleID integer 定时器ID
function SKY_Module_Schedule:UnRegisterSchedule(scheduleID)
    scheduleMap[scheduleID] = nil
end

-- * 定时器是否存在
---@param scheduleID integer 定时器ID
---@return boolean result true表示存在，false表示不存在
function SKY_Module_Schedule:IsScheduleExist(scheduleID)
    return scheduleMap[scheduleID] ~= nil
end

return SKY_Module_Schedule
