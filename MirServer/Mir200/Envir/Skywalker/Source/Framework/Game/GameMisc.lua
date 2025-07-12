-------------------------------------------------------------------
---文件: Framework\Game\GameMisc.lua
---作者: shyfan
---日期: 2025/06/18 16:15:09
---功能: 游戏杂项
-------------------------------------------------------------------
local tGameMisc = Skywalker.RequireSkywalker("GameMisc/schema.lua")
local tNetMessage = Skywalker.RequireSkywalker("NetMessage/schema.lua")
local tConfig = Skywalker.RequireGameConfig("Src/schema.lua")

---@class GameMisc
local GameMisc = {}
Skywalker.GameMisc = GameMisc

-- * 获取枚举Id字符串
---@generic T
---@param enum T 枚举
---@param enumValue integer 枚举值
---@return string
function GameMisc:GetEnumIdString(enum, enumValue)
    if enum and enum.desc and enum.desc[enumValue] then
        return enum.desc[enumValue][1]
    end
    return "Unknown"
end

--- * 获取枚举说明
---@generic T
---@param enum T 枚举
---@param enumValue integer 枚举值
---@return string
function GameMisc:GetEnumIdDesc(enum, enumValue)
    if enum and enum.desc and enum.desc[enumValue] then
        return enum.desc[enumValue][2]
    end
    return "未知"
end

-- ! region NetMessage

-- * 网络协议Id
---@class NetMessageId
---@field id ENetMessageId 网络消息ID
---@field desc ENetMessageId_Desc 网络消息描述
local NetMessageId = {}
NetMessageId.id = tNetMessage.enums.ENetMessageId
NetMessageId.desc = tNetMessage.enums.ENetMessageId_Desc
GameMisc.NetMessageId = NetMessageId

---@type NetMessage.LubanBean
GameMisc.NetMessageData = tNetMessage.beans

-- ! endregion NetMessage

-- ! region GameMisc

-- * 事件ID
---@class EventIDC
---@field id EEventIDC 事件ID
---@field desc EEventIDC_Desc 事件描述
local EventIDC = {}
EventIDC.id = tGameMisc.enums.EEventIDC
EventIDC.desc = tGameMisc.enums.EEventIDC_Desc
GameMisc.EventIDC = EventIDC
---@class EventIDS
---@field id EEventIDS 事件ID
---@field desc EEventIDS_Desc 事件描述
local EventIDS = {}
EventIDS.id = tGameMisc.enums.EEventIDS
EventIDS.desc = tGameMisc.enums.EEventIDS_Desc
GameMisc.EventIDS = EventIDS

-- * ObjectInfoID
---@class ObjectInfoID
---@field id EObjectInfoID 对象信息ID
---@field desc EObjectInfoID_Desc 对象信息描述
local ObjectInfoID = {}
ObjectInfoID.id = tGameMisc.enums.EObjectInfoID
ObjectInfoID.desc = tGameMisc.enums.EObjectInfoID_Desc
GameMisc.ObjectInfoID = ObjectInfoID

-- ! endregion GameMisc

-- ! region Config

-- * NoticeId
---@class NoticeId
---@field id ENoticeId 通知ID
---@field desc ENoticeId_Desc 通知描述
local NoticeId = {}
NoticeId.id = tConfig.enums.ENoticeId
NoticeId.desc = tConfig.enums.ENoticeId_Desc
GameMisc.NoticeId = NoticeId

-- * MatchMode
---@class MatchMode
---@field id EMatchMode 匹配模式ID
---@field desc EMatchMode_Desc 匹配模式描述
local MatchMode = {}
MatchMode.id = tConfig.enums.EMatchMode
MatchMode.desc = tConfig.enums.EMatchMode_Desc
GameMisc.MatchMode = MatchMode

-- * PlayerState
---@class PlayerState
---@field id EPlayerState 玩家状态ID
---@field desc EPlayerState_Desc 玩家状态描述
local PlayerState = {}
PlayerState.id = tConfig.enums.EPlayerState
PlayerState.desc = tConfig.enums.EPlayerState_Desc
GameMisc.PlayerState = PlayerState

-- * PlayerDetailState
---@class PlayerDetailState
---@field id EPlayerDetailState 玩家详细状态ID
---@field desc EPlayerDetailState_Desc 玩家详细状态描述
local PlayerDetailState = {}
PlayerDetailState.id = tConfig.enums.EPlayerDetailState
PlayerDetailState.desc = tConfig.enums.EPlayerDetailState_Desc
GameMisc.PlayerDetailState = PlayerDetailState

-- * FuncId
---@class FuncId
---@field id EFuncId 功能ID
---@field desc EFuncId_Desc 功能描述
local FuncId = {}
FuncId.id = tConfig.enums.EFuncId
FuncId.desc = tConfig.enums.EFuncId_Desc
GameMisc.FuncId = FuncId

-- * OperateId
---@class OperateId
---@field id EOperateId 操作ID
---@field desc EOperateId_Desc 操作描述
local OperateId = {}
OperateId.id = tConfig.enums.EOperateId
OperateId.desc = tConfig.enums.EOperateId_Desc
GameMisc.OperateId = OperateId

-- * SkillTriggerStage
---@class SkillTriggerStage
---@field id ESkillTriggerStage 技能触发阶段ID
---@field desc ESkillTriggerStage_Desc 技能触发阶段描述
local SkillTriggerStage = {}
SkillTriggerStage.id = tConfig.enums.ESkillTriggerStage
SkillTriggerStage.desc = tConfig.enums.ESkillTriggerStage_Desc
GameMisc.SkillTriggerStage = SkillTriggerStage

-- * SkillTriggerEffect
---@class SkillTriggerEffect
---@field id ESkillTriggerEffect 技能触发效果ID
---@field desc ESkillTriggerEffect_Desc 技能触发效果描述
local SkillTriggerEffect = {}
SkillTriggerEffect.id = tConfig.enums.ESkillTriggerEffect
SkillTriggerEffect.desc = tConfig.enums.ESkillTriggerEffect_Desc
GameMisc.SkillTriggerEffect = SkillTriggerEffect

-- * NPCFuncType
---@class NPCFuncType
---@field id ENPCFuncType NPC功能类型ID
---@field desc ENPCFuncType_Desc NPC功能类型描述
local NPCFuncType = {}
NPCFuncType.id = tConfig.enums.ENPCFuncType
NPCFuncType.desc = tConfig.enums.ENPCFuncType_Desc
GameMisc.NPCFuncType = NPCFuncType

-- ! endregion Config
