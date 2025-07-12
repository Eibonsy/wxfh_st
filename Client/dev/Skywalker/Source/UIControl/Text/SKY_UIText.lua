-------------------------------------------------------------------
---文件: Client\Skywalker\UIControl\Text\SKY_UIText.lua
---作者: shyfan
---日期: 2025/02/23 17:43:13
---功能: UI 文本
-------------------------------------------------------------------
local GUI = GUI

local includeUIControl = Skywalker.RequireUIControl

local SKY_UIControl = includeUIControl("Base/SKY_UIControl.lua")

---@class SKY_UIText:SKY_UIControl 文本
---@field new fun(...):SKY_UIText 创建实例
local SKY_UIText = Class("SKY_UIText", SKY_UIControl)

-- * 构造函数
---@param parent? userdata 父节点，如果为空则默认为self
---@param name string 名称
---@param x integer x坐标
---@param y integer y坐标
---@param fontSize integer 字体大小
---@param fontColor string 颜色
---@param content string 文本内容
function SKY_UIText:Ctor(parent, name, x, y, fontSize, fontColor, content)
    self.super:Ctor(parent, name, x, y, fontSize, fontColor, content)

    if name == nil or x == nil or y == nil or fontSize == nil or fontColor == nil or content == nil then
        self:Print("创建文本参数错误")
        return
    end

    parent = parent or self:GetInstance()

    if parent == nil then
        self:Print("创建文本 " .. name .. " 失败，父节点为空")
        return
    end

    local text = GUI:Text_Create(parent, name, x, y, fontSize, fontColor, content)
    if text == nil then
        self:Print("创建文本 " .. name .. " 失败")
        return
    end

    self.instance = text
end

-- * 设置 outline
---@param outlineColor string 颜色
---@param outlineSize integer 大小
function SKY_UIText:EnableOutline(outlineColor, outlineSize)
    if not self:IsValid() then
        self:Print("设置 outline 失败，控件不存在")
        return
    end

    GUI:Text_enableOutline(self:GetInstance(), outlineColor, outlineSize)
end

-- * 设置内容
---@param content string 文本内容
function SKY_UIText:SetString(content)
    if not self:IsValid() then
        self:Print("设置内容失败，控件不存在")
        return
    end

    GUI:Text_setString(self:GetInstance(), content)
end

return SKY_UIText
