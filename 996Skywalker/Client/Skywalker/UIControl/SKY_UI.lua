-------------------------------------------------------------------
---文件: Client\Skywalker\UIControl\SKY_UI.lua
---作者: shyfan
---日期: 2025/02/22 20:34:45
---功能: UI控件
-------------------------------------------------------------------
local includeUIControl = Skywalker.RequireUIControl

---@class SKY_UI Skywalker UI 控件集合
---@field UIButton SKY_UIButton 按钮控件
---@field UIText SKY_UIText 文本控件
SKY_UI = {}

local skyUI = SKY_UI

-- * Button 控件
skyUI.UIButton = includeUIControl("Button/SKY_UIButton.lua")

-- * Text 控件
skyUI.UIText = includeUIControl("Text/SKY_UIText.lua")
