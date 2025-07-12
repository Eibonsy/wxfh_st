-------------------------------------------------------------------
---文件: Framework\Util\UtilString.lua
---作者: shyfan
---日期: 2025/02/28 17:08:56
---功能: String 工具
-------------------------------------------------------------------
local stringFormat = string.format
local stringGmatch = string.gmatch
local tableInsert = table.insert

---@class UtilString
local UtilString = {}

-- * 是不是有效字符串
---@param content? string 字符串
---@return boolean result 字符串 不为 nil 且 不是空字符串(== "")，返回true
function UtilString.IsValid(content)
    return content ~= nil and content ~= ""
end

-- * format字符串
---@param format string 格式
---@param ... any 可变参数
---@return string result 格式化后的字符串
function UtilString.Format(format, ...)
    return stringFormat(format, ...)
end

-- * 分解字符串
---@param content string 字符串
---@param sep? string 分隔符，默认为空格
---@return string[] result 分解后的字符串数组
function UtilString.Split(content, sep)
    sep = sep or " "
    local result = {}
    for str in stringGmatch(content, "([^" .. sep .. "]+)") do
        tableInsert(result, str)
    end
    return result
end

return UtilString
