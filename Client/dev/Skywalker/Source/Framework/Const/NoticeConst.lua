-------------------------------------------------------------------
---文件: Framework\Const\NoticeConst.lua
---作者: shyfan
---日期: 2025/02/28 16:35:05
---功能: 通知常量
-------------------------------------------------------------------
---@class NoticePos 通知位置
local NoticePos = {
    Normal = 1, -- 普通
}

---@class NoticeType
local NoticeType = {
    Info = 1,    -- 信息
    Warning = 2, -- 警告
    Error = 3,   -- 错误
}

---@class NoticeConst 通知常量
---@field pos NoticePos 通知位置
---@field type NoticeType 通知类型
local NoticeConst = {
    pos = NoticePos,
    type = NoticeType,
}

return NoticeConst
