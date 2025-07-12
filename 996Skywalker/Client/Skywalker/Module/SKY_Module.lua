-------------------------------------------------------------------
---文件: Client\Skywalker\Module\SKY_Module.lua
---作者: shyfan
---日期: 2025/02/13 14:32:12
---功能: Skywalker 客户端模块
-------------------------------------------------------------------
local includeFramework = Skywalker.RequireFramework
local includeModule = Skywalker.RequireModule

---@class SKYC_Module Skywalker 客户端模块
---@field event SKY_Module_Event 事件模块
---@field schedule SKYC_Module_Schedule 定时器模块
---@field config SKY_Module_Config 配置模块
---@field operateControl SKY_Module_OperateControl 操作控制模块
---@field text SKYC_Module_Text 文本模块
---@field net SKYC_Module_Net 网络模块
---@field npc SKYC_Module_NPC NPC模块
SKYC_Module = {}

local skyModule = SKYC_Module

-- * 事件模块，放在日志模块之后
skyModule.event = includeFramework("Module/SKY_Module_Event.lua")

-- * 定时器模块，放在事件模块之后
skyModule.schedule = includeModule("Schedule/SKYC_Module_Schedule.lua"):new()

-- * 配置模块
skyModule.config = includeFramework("Module/SKY_Module_Config.lua")
skyModule.config:LoadConfig()

-- * 操作控制模块
skyModule.operateControl = includeFramework("Module/SKY_Module_OperateControl.lua")
skyModule.operateControl.SkyConfig = skyModule.config

-- * 文本模块
skyModule.text = includeModule("Text/SKYC_Module_Text.lua")

-- * 网络模块
skyModule.net = includeModule("Net/SKYC_Module_Net.lua")

-- * NPC模块
skyModule.npc = includeModule("NPC/SKYC_Module_NPC.lua")
