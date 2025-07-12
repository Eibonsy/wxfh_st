-------------------------------------------------------------------
---文件: Framework\Module\SKY_Module_OperateControl.lua
---作者: shyfan
---日期: 2025/06/16 17:34:59
---功能: 操作控制模块
-------------------------------------------------------------------
local mathFloor = math.floor
local ipairs = ipairs

---@class SKY_Module_OperateControl 操作控制模块
---@field SkyConfig SKY_Module_Config @配置模块
local SKY_Module_OperateControl = {}

-- * 玩家详细状态转换为玩家状态
---@param playerDetailState integer @玩家详细状态Id，见 EPlayerDetailState
---@return integer @玩家状态Id，见 EPlayerState
function SKY_Module_OperateControl:DetailStateToState(playerDetailState)
    return mathFloor(playerDetailState / 100)
end

-- * 功能是否可用
---@param playerDetailState integer @玩家状态Id，见 EPlayerDetailState
---@param funcId integer @功能ID，见 EFuncId
---@return boolean @是否可用，true表示可用，false表示不可用
function SKY_Module_OperateControl:CanFunc(playerDetailState, funcId)
    local funcConfig = self.SkyConfig.allTables.TbFuncBase:GetData(funcId)
    if not funcConfig then
        -- ! 未找到功能配置，默认不可用
        return false
    end

    local playerState = self:DetailStateToState(playerDetailState)

    -- * 规则说明
    -- 1. 如果配置了允许规则，则只能在允许规则中的状态才能使用
    -- 2. 如果未配置允许规则，则查看是否配置了禁止规则
    -- 3. 如果配置了禁止规则，则不能在禁止规则中的状态使用
    -- 4. 如果未配置禁止规则，则默认可用
    if #funcConfig.AllowState > 0 then
        -- * 有允许规则
        for _, allowState in ipairs(funcConfig.AllowState) do
            if allowState == playerState then
                return true
            end
        end

        -- * 不在允许规则中，返回不可用
        return false
    end

    if #funcConfig.ForbidState > 0 then
        -- * 有禁止规则
        for _, forbidState in ipairs(funcConfig.ForbidState) do
            if forbidState == playerState then
                return false
            end
        end
    end

    -- * 未配置禁止规则，则默认可用
    return true
end

-- * 操作是否可用
---@param playerDetailState integer @玩家详细状态Id，见 EPlayerDetailState
---@param OperateId integer @操作ID，见 EOperateId
---@return boolean @是否可用，true表示可用，false表示不可用
function SKY_Module_OperateControl:CanOperate(playerDetailState, OperateId)
    local operateConfig = self.SkyConfig.allTables.TbOperateControl:GetData(OperateId)
    if not operateConfig then
        -- ! 未找到操作配置，默认不可用
        return false
    end

    -- * 规则说明
    -- 1. 如果配置对应的功能Id，则先判断功能是否可用
    -- 2. 如果配置了允许规则，则只能在允许规则中的状态才能使用
    -- 3. 如果未配置允许规则，则查看是否配置了禁止规则
    -- 4. 如果配置了禁止规则，则不能在禁止规则中的状态使用
    -- 5. 如果未配置禁止规则，则默认可用
    if operateConfig.FuncId > 0 then
        -- * 有对应的功能Id，先判断功能是否可用
        local canUseFunc = self:CanFunc(playerDetailState, operateConfig.FuncId)
        if not canUseFunc then
            return false
        end
    end

    if #operateConfig.AllowDetailState > 0 then
        -- * 有允许规则
        for _, allowDetailState in ipairs(operateConfig.AllowDetailState) do
            if allowDetailState == playerDetailState then
                return true
            end
        end

        -- * 不在允许规则中，返回不可用
        return false
    end

    if #operateConfig.ForbidDetailState > 0 then
        -- * 有禁止规则
        for _, forbidDetailState in ipairs(operateConfig.ForbidDetailState) do
            if forbidDetailState == playerDetailState then
                return false
            end
        end
    end

    -- * 未配置禁止规则，则默认可用
    return true
end

return SKY_Module_OperateControl
