-------------------------------------------------------------------
---文件: Server\Skywalker\Module\Skill\SkillEffectS.lua
---作者: shyfan
---日期: 2025/06/25 17:01:27
---功能: 技能效果模块
-------------------------------------------------------------------
local includeModule = Skywalker.RequireModule

local gameMisc = Skywalker.GameMisc
local shyModule = SKYS_Module

local ESkillTriggerEffect = gameMisc.SkillTriggerEffect.id

local tAllTriggerEffect = {
    [ESkillTriggerEffect.ReplaceSkill] = includeModule("Skill/Effect/SkillEffect_ReplaceSkill.lua"),
    [ESkillTriggerEffect.UseSkill] = includeModule("Skill/Effect/SkillEffect_UseSkill.lua")
}

local logObject = Skywalker.Logger:GetLogObject("Module.Skill.Effect")

---@class SkillEffectS
local SkillEffectS = {}

-- * 触发
---@param triggerStage integer 触发阶段
---@param effectId integer 触发效果
---@param triggerParam SkillTriggerSParam 参数
function SkillEffectS:Do(triggerStage, effectId, triggerParam)
    local effectConfig = shyModule.config.allTables.TbSSkillEffect:GetData(effectId)
    if effectConfig == nil then
        logObject:Error("执行效果错误: 技能效果配置不存在, effectId = " .. effectId)
        return
    end

    local effectHandler = tAllTriggerEffect[effectConfig.EffectId]
    if effectHandler then
        effectHandler:Do(triggerStage, triggerParam, effectConfig)
    end
end

return SkillEffectS
