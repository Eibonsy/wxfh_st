-------------------------------------------------------------------
---文件: Client\Skywalker\UIControl\Button\SKY_UIButton.lua
---作者: shyfan
---日期: 2025/02/22 20:37:46
---功能: 按钮
-------------------------------------------------------------------
local GUI = GUI

local includeUIControl = Skywalker.RequireUIControl

local SKY_UIControl = includeUIControl("Base/SKY_UIControl.lua")

---@class SKY_UIButton:SKY_UIControl 按钮
---@field new fun(...):SKY_UIButton 创建实例
local SKY_UIButton = Class("SKY_UIButton", SKY_UIControl)

-- * 构造函数
---@param parent? userdata 父节点，如果为空则默认为self
---@param name string 控件名称
---@param x integer x坐标
---@param y integer y坐标
---@param pngPath string 图片路径
---@param clickFunc? function 点击回调
function SKY_UIButton:Ctor(parent, name, x, y, pngPath, clickFunc)
    self.super:Ctor(parent, name, x, y, pngPath, clickFunc)

    if name == nil or x == nil or y == nil or pngPath == nil then
        self:Print("创建按钮参数错误")
        return
    end

    parent = parent or self:GetInstance()

    if parent == nil then
        self:Print("创建按钮 " .. name .. " 失败，父节点为空")
        return
    end

    local button = GUI:Button_Create(parent, name, x, y, pngPath)
    if button == nil then
        self:Print("创建按钮 " .. name .. " 失败")
        return
    end

    if clickFunc then
        self:SetOnClickEvent(clickFunc)
    end

    self.instance = button
end

-- * 设置单击回调
---@param clickFunc function 点击回调
function SKY_UIButton:SetOnClickEvent(clickFunc)
    if not self:IsValid() then
        self:Print("设置单击回调失败，控件不存在")
        return
    end

    GUI:addOnClickEvent(self:GetInstance(), clickFunc)
end

-- * 设置按钮显示文字
---@param text? string 文字
---@param fontSize? integer 字体大小
function SKY_UIButton:SetText(text, fontSize)
    if not self:IsValid() then
        self:Print("设置按钮文字失败，控件不存在")
        return
    end

    -- 设置按钮文字
    if text then
        GUI:Button_setTitleText(self:GetInstance(), text)
    end

    -- 设置按钮文字大小
    if fontSize then
        GUI:Button_setTitleFontSize(self:GetInstance(), fontSize)
    end
end

return SKY_UIButton
