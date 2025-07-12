-------------------------------------------------------------------
---文件: Framework\Class\Class.lua
---作者: shyfan
---日期: 2025/02/23 10:52:17
---功能: 类的基类
-------------------------------------------------------------------
-- * 类函数
---@param className string 类名
---@param super? Class 父类
---@return Class
function Class(className, super)
    ---@class Class 类
    ---@field private __className string 类名
    ---@field protected super Class 父类
    ---@field new fun(...):Class 创建实例
    ---@field protected Ctor function 构造函数
    ---@field protected Dtor function 析构函数
    local class = {}
    class.__index = class
    class.__className = className

    -- 如果有父类，设置继承
    if super then
        setmetatable(class, {
            __index = super
        })
        -- 将父类方法绑定到子类实例的 super 字段，方便直接访问
        class.super = super
    end

    -- 创建实例的构造函数
    function class:new(...)
        local instance = setmetatable({}, self)
        if instance.Ctor then
            instance:Ctor(...) -- 调用构造函数
        end
        return instance
    end

    return class
end
