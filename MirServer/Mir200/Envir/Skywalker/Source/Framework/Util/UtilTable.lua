-------------------------------------------------------------------
---文件: Framework\Util\UtilTable.lua
---作者: shyfan
---日期: 2025/03/03 22:46:02
---功能: UtilTable 工具类
-------------------------------------------------------------------
local tableInsert = table.insert
local tableRemove = table.remove
local ipairs = ipairs
local pairs = pairs
local type = type
local next = next
local setmetatable = setmetatable

---@class UtilTable 工具类
local UtilTable = {}

-- * table insert
---@param t table
---@param v any
function UtilTable.Insert(t, v)
    tableInsert(t, v)
end

-- * table remove
---@param t table
---@param index? integer
function UtilTable.Remove(t, index)
    tableRemove(t, index)
end

-- * 数组table 长度
---@param t table
---@return integer
function UtilTable.ArrayLength(t)
    return #t
end

-- * table count
---@param t table
---@return integer
function UtilTable.Count(t)
    local count = 0
    for _ in pairs(t) do
        count = count + 1
    end
    return count
end

-- * 递归 table 下所有的值，找到 table 类型的值设置元表，使其不可以修改
---@generic T
---@param t T
---@return T
function UtilTable.SetReadonly(t)
    local readOnly
    readOnly = function(orig)
        -- 先递归处理子表
        local proxy = {}
        for k, v in pairs(orig) do
            if type(v) == "table" then
                proxy[k] = readOnly(v)
            else
                proxy[k] = v
            end
        end

        setmetatable(proxy, {
            __index = proxy,
            __newindex = function()
            end,
            __pairs = function()
                return next, proxy, nil
            end,
            __ipairs = function()
                local function ipairs_iter(t, i)
                    i = i + 1
                    local v = t[i]
                    if v ~= nil then
                        return i, v
                    end
                end
                return ipairs_iter, proxy, 0
            end
        })

        return proxy
    end

    return readOnly(t)
end

-- * 打印 table
-- * 打印 table（带缩进，显示结构）
---@param t table
---@param printFunc fun(content:string):void
---@param indent? string
function UtilTable.Print(t, printFunc, indent)
    indent = indent or ""
    for k, v in pairs(t) do
        if type(v) == "table" then
            printFunc(indent .. tostring(k) .. " = {")
            UtilTable.Print(v, printFunc, indent .. "  ")
            printFunc(indent .. "}")
        else
            printFunc(indent .. tostring(k) .. " = " .. tostring(v))
        end
    end
end

return UtilTable
