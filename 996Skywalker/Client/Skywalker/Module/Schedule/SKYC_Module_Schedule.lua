-------------------------------------------------------------------
---文件: Client\Skywalker\Module\Schedule\SKYC_Module_Schedule.lua
---作者: shyfan
---日期: 2025/03/03 22:54:29
---功能: SKYC_Module_Schedule 定时器模块
-------------------------------------------------------------------
local includeFramework = Skywalker.RequireFramework

local SKY_Module_Schedule = includeFramework("Module/SKY_Module_Schedule.lua")

---@class SKYC_Module_Schedule:SKY_Module_Schedule 定时器模块
---@field new fun():SKYC_Module_Schedule 创建定时器模块
local SKYC_Module_Schedule = Class("SKYC_Module_Schedule", SKY_Module_Schedule)

--* 构造函数
function SKYC_Module_Schedule:Ctor()
    self.super:Ctor()
end

return SKYC_Module_Schedule
