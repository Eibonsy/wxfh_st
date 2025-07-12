-------------------------------------------------------------------
---文件: Framework\Module\SKY_Module_Config.lua
---作者: shyfan
---日期: 2025/04/02 09:51:30
---功能: 配置模块
-------------------------------------------------------------------
local pairs = pairs

local includeGameConfig = Skywalker.RequireGameConfig

local utilTool = UtilTool

---@type LogObject
local logObject = Skywalker.Logger:GetLogObject("Module.Config")
local _DEBUG = Skywalker.DEBUG and true

-- * 预处理 SkillTrigger 配置
---@type table<integer, table<integer, CfgS.SkillTrigger[]>>
local tSkillTriggerConfig = {}
---@param configTable TbSSkillTrigger 技能触发器配置表
local function preprocessSkillTriggerConfig(configTable)
    tSkillTriggerConfig = {}

    for _, config in pairs(configTable.AllTables) do
        if config ~= nil then
            if tSkillTriggerConfig[config.Stage] == nil then
                tSkillTriggerConfig[config.Stage] = {}
            end

            if tSkillTriggerConfig[config.Stage][config.SkillId] == nil then
                tSkillTriggerConfig[config.Stage][config.SkillId] = {}
            end

            utilTool.table.Insert(tSkillTriggerConfig[config.Stage][config.SkillId], config)
        end
    end

    logObject:Debug("预处理技能触发器配置完成, 共计 " .. utilTool.table.Count(tSkillTriggerConfig) ..
                        " 个阶段配置")
end

---@class SKY_Module_Config 配置模块
local SKY_Module_Config = {}

-- * 加载配置
function SKY_Module_Config:LoadConfig()
    local tLuban = includeGameConfig("Src/schema.lua")

    ---@type GameConfig.AllTables
    local allTables = utilTool.table.SetReadonly(tLuban.createAllTables(function(fileName)
        logObject:Debug("加载配置表: " .. fileName)
        return includeGameConfig("Data/" .. fileName)
    end))

    SKY_Module_Config.allTables = allTables

    if SERVER_MODE then
        preprocessSkillTriggerConfig(SKY_Module_Config.allTables.TbSSkillTrigger)
    end
end

-- * 获取技能触发器配置
---@param stage integer 触发阶段
---@param skillId integer 技能ID
---@return CfgS.SkillTrigger[]|nil
function SKY_Module_Config:GetSkillTriggerConfig(stage, skillId)
    if tSkillTriggerConfig[stage] and tSkillTriggerConfig[stage][skillId] then
        return tSkillTriggerConfig[stage][skillId]
    end
    return nil
end

return SKY_Module_Config
