-------------------------------------------------------------------
---文件: Framework\Util\UtilTool.lua
---作者: shyfan
---日期: 2025/02/28 17:14:02
---功能: 工具类
-------------------------------------------------------------------
local includeFramework = Skywalker.RequireFramework

--* 加载工具
local function includeUtil(luaPath)
    return includeFramework("Util/" .. luaPath)
end

---@class UtilTool
---@field string UtilString 字符串工具
---@field table UtilTable 表格工具
---@field time UtilTime 时间工具
UtilTool = {}

--* 字符串
UtilTool.string = includeUtil("UtilString.lua")

--* 表格
UtilTool.table = includeUtil("UtilTable.lua")

--* 时间
UtilTool.time = includeUtil("UtilTime.lua")
