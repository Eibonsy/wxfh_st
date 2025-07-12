-------------------------------------------------------------------
---文件: Server\Skywalker\Module\Notice\SKYS_Module_Notice.lua
---作者: shyfan
---日期: 2025/02/28 16:29:38
---功能: SKYS_Module_Notice 通知模块
-------------------------------------------------------------------
---@class SKYS_Module_Notice
local SKYS_Module_Notice = {}

-- * 发送通知
---@param player userdata 玩家
---@param noticeId integer 通知ID
---@param pos? NoticePos 通知位置，默认 NoticePos.Normal
---@param type? NoticeType 通知类型，默认 NoticeType.Info
function SKYS_Module_Notice:SendNotice(player, noticeId, pos, type)
    -- TODO Shyfan 发送通知
end

return SKYS_Module_Notice
