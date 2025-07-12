-------------------------------------------------------------------
---文件: Server\Skywalker\Module\Object\SKYS_Module_Object.lua
---作者: shyfan
---日期: 2025/03/14 21:52:10
---功能: SKYS_Module_Object 对象模块
-------------------------------------------------------------------
local getvisibleactor = getvisibleactor

local utilTool = UtilTool

local objectInfoID = Skywalker.GameMisc.ObjectInfoID.id

---@class SKYS_Module_Object
local SKYS_Module_Object = {}

-- * 获取唯一ID
---@param object userdata 玩家
---@return string
function SKYS_Module_Object:GetID(object)
    return getbaseinfo(object, objectInfoID.ID)
end

-- * 获取名称
---@param object userdata 玩家
---@return string
function SKYS_Module_Object:GetName(object)
    return getbaseinfo(object, objectInfoID.Name)
end

-- * 是否玩家
---@param object userdata 对象
---@return boolean true 表示是玩家，false表示不是玩家
function SKYS_Module_Object:IsPlayer(object)
    if object == nil then
        return false
    end

    return isplayer(object)
end

-- 获取所在地图ID
---@param object userdata 对象
---@return string 地图ID
function SKYS_Module_Object:GetMapID(object)
    if object == nil then
        return ""
    end

    return getbaseinfo(object, objectInfoID.MapID)
end

-- * 获取视野内的目标对象
---@param player userdata 对象
---@param targetId string 目标ID
---@return userdata? 目标对象
function SKYS_Module_Object:GetObjectByID(player, targetId)
    if player == nil or not utilTool.string.IsValid(targetId) then
        return nil
    end

    return getvisibleactor(player, targetId)
end

return SKYS_Module_Object
