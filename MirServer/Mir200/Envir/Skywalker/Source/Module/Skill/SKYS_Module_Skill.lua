-------------------------------------------------------------------
---文件: Server\Skywalker\Module\Damage\SKYS_Module_Skill.lua
---作者: shyfan
---日期: 2025/06/12 15:17:17
---功能: SKYS_Module_Skill 伤害模块
-------------------------------------------------------------------
local releasemagic = releasemagic
local releasemagic_target = releasemagic_target

local includeModule = Skywalker.RequireModule

local skyModule = SKYS_Module

includeModule("Skill/SkillStage/SkillStagePlayerS.lua")

local logObject = Skywalker.Logger:GetLogObject("Module.Skill")

local _DEBUG = Skywalker.DEBUG and true

---@class SKYS_Module_Skill
local SKYS_Module_Skill = {}

---@type SkillTriggerS
SKYS_Module_Skill.SkillTrigger = includeModule("Skill/SkillTriggerS.lua")

---@type SkillEffectS
SKYS_Module_Skill.SkillEffect = includeModule("Skill/SkillEffectS.lua")

-- * 释放技能
---@param player userdata 玩家对象
---@param skillId integer 技能ID
---@param skillType integer 技能类型 1 普通技能 2 强化技能
---@param skillLevel integer 技能等级
---@param targetType integer 目标类型 1 攻击目标 2 自身
---@param showAction integer 是否显示施法动作 0 不显示 1 显示
function SKYS_Module_Skill:UseSkill(player, skillId, skillType, skillLevel, targetType, showAction)
    logObject:Debug("UseSkill: playerId = " .. skyModule.object:GetID(player) .. ", skillId = " .. skillId ..
                        ", skillType = " .. skillType .. ", skillLevel = " .. skillLevel .. ", targetType = " ..
                        targetType .. ", showAction = " .. showAction)
    releasemagic(player, skillId, skillType, skillLevel, targetType, showAction)
end

-- * 对目标释放技能
---@param player userdata 玩家对象
---@param skillId integer 技能ID
---@param skillType integer 技能类型 1 普通技能 2 强化技能
---@param skillLevel integer 技能等级
---@param target userdata 目标
---@param showAction integer 是否显示施法动作 0 不显示 1 显示
function SKYS_Module_Skill:UseSkillToTarget(player, skillId, skillType, skillLevel, target, showAction)
    logObject:Debug("UseSkillToTarget: playerId = " .. skyModule.object:GetID(player) .. ", skillId = " .. skillId ..
                        ", skillType = " .. skillType .. ", skillLevel = " .. skillLevel .. ", targetId = " ..
                        skyModule.object:GetID(target) .. ", showAction = " .. showAction)

    releasemagic_target(player, skillId, skillType, skillLevel, target, showAction)
end

return SKYS_Module_Skill
