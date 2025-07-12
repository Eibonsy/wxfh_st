-------------------------------------------------------------------
---文件: Server\Skywalker\Module\Schedule\SKYS_Module_Schedule.lua
---作者: shyfan
---日期: 2025/03/03 22:00:19
---功能: SKYS_Module_Schedule 定时器模块
-------------------------------------------------------------------
local includeFramework = Skywalker.RequireFramework

local SKY_Module_Schedule = includeFramework("Module/SKY_Module_Schedule.lua")

---@class SKYS_Module_Schedule:SKY_Module_Schedule 定时器模块
---@field new fun():SKYS_Module_Schedule 创建定时器模块
local SKYS_Module_Schedule = Class("SKYS_Module_Schedule", SKY_Module_Schedule)

--* 构造函数
function SKYS_Module_Schedule:Ctor()
    self.super:Ctor()
end

return SKYS_Module_Schedule
