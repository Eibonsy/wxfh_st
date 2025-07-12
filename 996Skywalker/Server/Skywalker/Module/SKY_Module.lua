-------------------------------------------------------------------
---文件: Server\Skywalker\Module\SKY_Module.lua
---作者: shyfan
---日期: 2025/02/13 14:37:03
---功能: Skywalker 服务端模块
-------------------------------------------------------------------
local includeFramework = Skywalker.RequireFramework
local includeModule = Skywalker.RequireModule

---@class SKYS_Module Skywalker 服务端模块
---@field event SKY_Module_Event 事件模块
---@field schedule SKYS_Module_Schedule 定时器模块
---@field config SKY_Module_Config 配置模块
---@field net SKYS_Module_Net 网络模块
---@field notice SKYS_Module_Notice 通知模块
---@field object SKYS_Module_Object 对象模块
---@field player SKYS_Module_Player 玩家模块
---@field operateControl SKY_Module_OperateControl 操作控制模块
---@field map SKYS_Module_Map 地图模块
---@field bag SKYS_Module_Bag 背包模块
---@field skill SKYS_Module_Skill 伤害模块
SKYS_Module = {}

local skyModule = SKYS_Module

-- * 事件模块，放在日志模块之后
skyModule.event = includeFramework("Module/SKY_Module_Event.lua")

-- * 定时器模块，放在事件模块之后
skyModule.schedule = includeModule("Schedule/SKYS_Module_Schedule.lua"):new()

-- * 配置模块
skyModule.config = includeFramework("Module/SKY_Module_Config.lua")
skyModule.config:LoadConfig()

-- * 网络模块
skyModule.net = includeModule("Net/SKYS_Module_Net.lua")

-- * 通知模块
skyModule.notice = includeModule("Notice/SKYS_Module_Notice.lua")

-- * 对象模块
skyModule.object = includeModule("Object/SKYS_Module_Object.lua")

-- * 玩家模块
skyModule.player = includeModule("Player/SKYS_Module_Player.lua")

-- * 操作控制模块
skyModule.operateControl = includeFramework("Module/SKY_Module_OperateControl.lua")
skyModule.operateControl.SkyConfig = skyModule.config

-- * 地图模块
skyModule.map = includeModule("Map/SKYS_Module_Map.lua")

-- * 背包模块
skyModule.bag = includeModule("Bag/SKYS_Module_Bag.lua")

-- * 技能模块
skyModule.skill = includeModule("Skill/SKYS_Module_Skill.lua")
