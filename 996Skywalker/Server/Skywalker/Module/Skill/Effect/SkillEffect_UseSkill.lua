-------------------------------------------------------------------
---文件: Server\Skywalker\Module\Skill\Effect\SkillEffect_UseSkill.lua
---作者: shyfan
---日期: 2025/06/25 19:29:35
---功能: 技能效果-使用技能
-------------------------------------------------------------------
local skyModule = SKYS_Module
local utilTool = UtilTool

local logObject = Skywalker.Logger:GetLogObject("Module.Skill.Effect")

---@class SkillEffect_UseSkill
local SkillEffect_UseSkill = {}

---@param triggerStage integer 触发阶段
---@param triggerParam SkillTriggerSParam 参数
---@param effectConfig CfgS.SkillEffect 触发效果
function SkillEffect_UseSkill:Do(triggerStage, triggerParam, effectConfig)
    if effectConfig.paramList[1] == nil or effectConfig.paramList[1] <= 0 then
        logObject:Error("参数错误")
        return
    end

    -- 原技能继续执行
    triggerParam.Result = true

    local player = skyModule.player:GetPlayerByID(triggerParam.playerId)
    if player == nil then
        logObject:Error("执行效果错误: 玩家对象不存在, playerId = " .. triggerParam.playerId)
        return
    end

    if utilTool.string.IsValid(triggerParam.targetId) then
        local target = skyModule.object:GetObjectByID(player, triggerParam.targetId)
        if target then
            skyModule.skill:UseSkillToTarget(player, effectConfig.paramList[1], 1, 1, target, 0)
        end
    else
        skyModule.skill:UseSkill(player, effectConfig.paramList[1], 1, 1, 1, 0)
    end
end

return SkillEffect_UseSkill
