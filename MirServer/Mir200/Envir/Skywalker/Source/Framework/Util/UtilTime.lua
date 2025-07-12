-------------------------------------------------------------------
---文件: Framework\Util\UtilTime.lua
---作者: shyfan
---日期: 2025/03/06 16:34:45
---功能: UtilTime 工具类
-------------------------------------------------------------------
local osTime = os.time
local osDate = os.date

---@class UtilTime 工具类
local UtilTime = {}

-- * 获取当前时间戳，格林尼治时间
---@return integer result 时间戳
function UtilTime.Now()
    return osTime()
end

-- * os.date
---@param format string 格式字符串
function UtilTime.Date(format)
    return osDate(format)
end

return UtilTime
