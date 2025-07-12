-------------------------------------------------------------------
---文件: Server\Skywalker\Module\Skill\SkillStage\SkillStagePlayerS.lua
---作者: shyfan
---日期: 2025/06/25 15:41:17
---功能: 玩家技能阶段
-------------------------------------------------------------------
local libGlobalSafeDefine = Skywalker.GlobalSafeDefine

local skyModule = SKYS_Module
local utilTool = UtilTool
local ESkillTriggerStage = Skywalker.GameMisc.SkillTriggerStage.id

local logObject = Skywalker.Logger:GetLogObject("Module.Skill.Player")

-- * 自身使用技能触发
-- @param player userdata 玩家对象
-- @param skillId integer 技能ID
local function magselffunc(player, skillId)
    logObject:Info(utilTool.string.Format("magselffunc: player ID %s Name %s, skillId=%d",
        skyModule.object:GetID(player), skyModule.object:GetName(player), skillId))
    -- TODO Shyfan 技能处理
end
libGlobalSafeDefine("magselffunc", magselffunc)

-- * 对目标人物使用技能时自身触发
-- @param player userdata 玩家对象
---@param target userdata 目标对象
-- @param skillId integer 技能ID
local function magtagfunc(player, target, skillId)
    logObject:Info(utilTool.string.Format("magtagfunc: player ID %s Name %s, target ID %s Name %s, skillId=%d",
        skyModule.object:GetID(player), skyModule.object:GetName(player), skyModule.object:GetID(target),
        skyModule.object:GetName(target), skillId))
    -- TODO Shyfan 技能处理
    return true
end
libGlobalSafeDefine("magtagfunc", magtagfunc)

-- * 对目标怪物使用技能时自身触发
-- @param player userdata 玩家对象
---@param target userdata 目标对象
-- @param skillId integer 技能ID
local function magmonfunc(player, target, skillId)
    logObject:Info(utilTool.string.Format("magmonfunc: player ID %s Name %s, target ID %s Name %s, skillId=%d",
        skyModule.object:GetID(player), skyModule.object:GetName(player), skyModule.object:GetID(target),
        skyModule.object:GetName(target), skillId))
    -- TODO Shyfan 技能处理
end
libGlobalSafeDefine("magmonfunc", magmonfunc)

-- * 自身使用任意技能前触发
---@param player userdata 玩家对象
---@param skillId integer 技能ID
---@param skillName string 技能名称
---@param target userdata 目标对象
---@param posX integer 目标X坐标
---@param posY integer 目标Y坐标
---@return boolean 是否允许使用技能，false 则不允许使用技能
local function beginmagic(player, skillId, skillName, target, posX, posY)
    logObject:Info(utilTool.string.Format(
        "beginmagic: player ID %s Name %s, skillId=%d, skillName=%s, target ID %s Name %s, posX=%d, posY=%d",
        skyModule.object:GetID(player), skyModule.object:GetName(player), skillId, skillName,
        skyModule.object:GetID(target), skyModule.object:GetName(target), posX, posY))

    -- * 参数
    local param = skyModule.skill.SkillTrigger:GetParam()
    param.playerId = skyModule.object:GetID(player)
    param.targetId = target and skyModule.object:GetID(target) or ""
    param.SkillId = skillId
    param.Damage = 0
    param.Result = true

    -- * 触发
    skyModule.skill.SkillTrigger:Do(ESkillTriggerStage.UseBefore, param)

    return param.Result
end
libGlobalSafeDefine("beginmagic", beginmagic)

-- * 推动技能(野蛮冲撞/抗拒火环/气波功/自定义推动技能)施法前触发
---@param player userdata 玩家对象
---@param target userdata 目标对象
---@param attacker userdata 攻击者对象
---@param skillId integer 技能ID
---@return integer 0 不执行推动；1 执行推动；2 根据M2上的推动条件判断是否执行
local function canpush(player, target, attacker, skillId)
    logObject:Info(utilTool.string.Format(
        "canpush: player ID %s Name %s, target ID %s Name %s, attacker ID %s Name %s, skillId=%d",
        skyModule.object:GetID(player), skyModule.object:GetName(player), skyModule.object:GetID(target),
        skyModule.object:GetName(target), skyModule.object:GetID(attacker), skyModule.object:GetName(attacker), skillId))
    -- TODO Shyfan 技能处理
    return 2
end
libGlobalSafeDefine("canpush", canpush)

-- * 自定义技能处理伤害前触发
---@param player userdata 玩家对象
---@param target userdata 目标对象
---@param skillId integer 技能ID
---@return boolean true=正常施法;false=阻止施法(将不走后续伤害触发);可用于群攻类技能,阻止部分受击对象的伤害流程
local function custommagicdamage(player, target, skillId)
    logObject:Info(utilTool.string.Format("custommagicdamage: player ID %s Name %s, target ID %s Name %s, skillId=%d",
        skyModule.object:GetID(player), skyModule.object:GetName(player), skyModule.object:GetID(target),
        skyModule.object:GetName(target), skillId))
    -- TODO Shyfan 技能处理
    return true
end
libGlobalSafeDefine("custommagicdamage", custommagicdamage)

-- * 暴击触发
---@param player userdata 玩家对象
---@param target userdata 目标对象
---@param damage integer 暴击后伤害值
---@param skillId integer 技能ID
---@return integer 修改后的伤害值
local function crittrigger(player, target, damage, skillId)
    logObject:Info(utilTool.string.Format(
        "crittrigger: player ID %s Name %s, target ID %s Name %s, damage=%d, skillId=%d",
        skyModule.object:GetID(player), skyModule.object:GetName(player), skyModule.object:GetID(target),
        skyModule.object:GetName(target), damage, skillId))
    return damage
end
libGlobalSafeDefine("crittrigger", crittrigger)

-- * 伤害反弹触发
---@param player userdata 玩家对象
---@param attacker userdata 伤害来源对象
---@param damage integer 反弹伤害值
---@param skillId integer 技能ID
local function reboundhurt(player, attacker, damage, skillId)
    logObject:Info(utilTool.string.Format(
        "reboundhurt: player ID %s Name %s, attacker ID %s Name %s, damage=%d, skillId=%d",
        skyModule.object:GetID(player), skyModule.object:GetName(player), skyModule.object:GetID(attacker),
        skyModule.object:GetName(attacker), damage, skillId))
    return damage
end
libGlobalSafeDefine("reboundhurt", reboundhurt)

-- * 玩家攻击前触发
---@param player userdata 玩家对象
---@param target userdata 目标对象
---@param attacker userdata 攻击者对象
---@param skillId integer 技能ID
---@param damage integer 伤害值
---@param model integer 攻击模式：0 正常；1 暴击；2 格挡；3 切割
---@return integer 修改后的伤害值
local function attackdamage(player, target, attacker, skillId, damage, model)
    logObject:Info(utilTool.string.Format(
        "attackdamage: player ID %s Name %s, target ID %s Name %s, attacker ID %s Name %s, skillId=%d, damage=%d, model=%d",
        skyModule.object:GetID(player), skyModule.object:GetName(player), skyModule.object:GetID(target),
        skyModule.object:GetName(target), skyModule.object:GetID(attacker), skyModule.object:GetName(attacker), skillId,
        damage, model))

    -- * 参数
    local param = skyModule.skill.SkillTrigger:GetParam()
    param.playerId = skyModule.object:GetID(player)
    param.targetId = skyModule.object:GetID(target)
    param.SkillId = skillId
    param.Damage = damage
    param.Result = true

    -- * 触发
    skyModule.skill.SkillTrigger:Do(ESkillTriggerStage.DamageBefore, param)

    return param.Damage
end
libGlobalSafeDefine("attackdamage", attackdamage)

-- * 玩家物理攻击后
---@param player userdata 玩家对象
---@param target userdata 目标对象
---@param attacker userdata 攻击者对象
---@param skillId integer 技能ID
local function attack(player, target, attacker, skillId)
    logObject:Info(utilTool.string.Format(
        "attack: player ID %s Name %s, target ID %s Name %s, attacker ID %s Name %s, skillId=%d",
        skyModule.object:GetID(player), skyModule.object:GetName(player), skyModule.object:GetID(target),
        skyModule.object:GetName(target), skyModule.object:GetID(attacker), skyModule.object:GetName(attacker), skillId))
    -- TODO Shyfan 技能处理
end
libGlobalSafeDefine("attack", attack)

-- * 玩家魔法攻击后
---@param player userdata 玩家对象
---@param target userdata 目标对象
---@param attacker userdata 攻击者对象
---@param skillId integer 技能ID
local function magicattack(player, target, attacker, skillId)
    logObject:Info(utilTool.string.Format(
        "magicattack: player ID %s Name %s, target ID %s Name %s, attacker ID %s Name %s, skillId=%d",
        skyModule.object:GetID(player), skyModule.object:GetName(player), skyModule.object:GetID(target),
        skyModule.object:GetName(target), skyModule.object:GetID(attacker), skyModule.object:GetName(attacker), skillId))
    -- TODO Shyfan 技能处理
end
libGlobalSafeDefine("magicattack", magicattack)

-- * 玩家受击前触发
---@param player userdata 玩家对象
---@param attacker userdata 攻击者对象
---@param target userdata 目标对象
---@param skillId integer 技能ID
---@param damage integer 伤害值
---@param model integer 攻击模式：0 正常；1 暴击；2 格挡；3 切割
---@return integer 修改后的伤害值
local function struckdamage(player, attacker, target, skillId, damage, model)
    logObject:Info(utilTool.string.Format(
        "struckdamage: player ID %s Name %s, attacker ID %s Name %s, target ID %s Name %s, skillId=%d, damage=%d, model=%d",
        skyModule.object:GetID(player), skyModule.object:GetName(player), skyModule.object:GetID(attacker),
        skyModule.object:GetName(attacker), skyModule.object:GetID(target), skyModule.object:GetName(target), skillId,
        damage, model))
    return damage
end
libGlobalSafeDefine("struckdamage", struckdamage)

-- * 玩家受物理攻击后
---@param player userdata 玩家对象
---@param attacker userdata 攻击者对象
---@param target userdata 目标对象
---@param skillId integer 技能ID
local function struck(player, attacker, target, skillId)
    logObject:Info(utilTool.string.Format(
        "struck: player ID %s Name %s, attacker ID %s Name %s, target ID %s Name %s, skillId=%d",
        skyModule.object:GetID(player), skyModule.object:GetName(player), skyModule.object:GetID(attacker),
        skyModule.object:GetName(attacker), skyModule.object:GetID(target), skyModule.object:GetName(target), skillId))
    -- TODO Shyfan 技能处理
end
libGlobalSafeDefine("struck", struck)

-- * 玩家受魔法攻击后
---@param player userdata 玩家对象
---@param attacker userdata 攻击者对象
---@param target userdata 目标对象
---@param skillId integer 技能ID
local function magicstruck(player, attacker, target, skillId)
    logObject:Info(utilTool.string.Format(
        "magicstruck: player ID %s Name %s, attacker ID %s Name %s, target ID %s Name %s, skillId=%d",
        skyModule.object:GetID(player), skyModule.object:GetName(player), skyModule.object:GetID(attacker),
        skyModule.object:GetName(attacker), skyModule.object:GetID(target), skyModule.object:GetName(target), skillId))
    -- TODO Shyfan 技能处理
end
libGlobalSafeDefine("magicstruck", magicstruck)
