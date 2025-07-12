-------------------------------------------------------------------
---文件: Server\Skywalker\Module\Skill\SkillTriggerS.lua
---作者: shyfan
---日期: 2025/06/25 17:01:27
---功能: 技能触发模块
-------------------------------------------------------------------
local pairs = pairs

local skyModule = SKYS_Module

local logObject = Skywalker.Logger:GetLogObject("Module.Skill.Trigger")

---@class SkillTriggerS
local SkillTriggerS = {}

---@return SkillTriggerSParam
function SkillTriggerS:GetParam()
    ---@class SkillTriggerSParam
    local param = {
        playerId = "", -- 玩家ID
        targetId = "", -- 目标ID
        SkillId = 0, -- 技能ID
        Damage = 0, -- 伤害值
        Result = false -- 结果
    }

    return param
end

-- * 触发
---@param triggerStage integer 触发阶段
---@param triggerParam SkillTriggerSParam 参数
function SkillTriggerS:Do(triggerStage, triggerParam)
    local configArr = skyModule.config:GetSkillTriggerConfig(triggerStage, triggerParam.SkillId)
    if configArr == nil or #configArr == 0 then
        return
    end

    local skillEffect = skyModule.skill.SkillEffect
    for _, config in pairs(configArr) do
        for _, effectId in pairs(config.EffectList) do
            if effectId > 0 then
                skillEffect:Do(triggerStage, effectId, triggerParam)
            end
        end
    end
end

return SkillTriggerS
