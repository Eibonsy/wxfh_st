-------------------------------------------------------------------
---文件: Client\Skywalker\UIControl\Base\SKY_UIControl.lua
---作者: shyfan
---日期: 2025/02/22 20:34:45
---功能: UI控件
-------------------------------------------------------------------
local SL = SL
local GUI = GUI

---@class SKY_UIControl:Class UI控件
---@field private instance userdata 实例
local SKY_UIControl = Class("SKY_UIControl")

-- * 构造函数
function SKY_UIControl:Ctor(...)
    self.instance = nil
end

-- * 打印
function SKY_UIControl:Print(msg)
    SL:release_print("[SKY_UIControl] " .. msg)
end

-- * 获取实例
---@return userdata
function SKY_UIControl:GetInstance()
    return self.instance
end

-- * 是否有效
---@return boolean
function SKY_UIControl:IsValid()
    return self.instance ~= nil
end

-- * 移除全部子节点
function SKY_UIControl:RemoveAllChildren()
    if not self:IsValid() then
        self:Print("移除全部子节点失败，实例为空")
        return
    end

    GUI:removeAllChildren(self.instance)
end

return SKY_UIControl
