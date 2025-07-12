-------------------------------------------------------------------
---文件: Framework\Base\Misc.lua
---作者: shyfan
---日期: 2025/06/25 09:08:00
---功能: Skywalker Misc
-------------------------------------------------------------------
-- ! lua5.1 版本 __newindex 不支持 重复赋值，所以使用这种方式来检查重复的全局定义
function Skywalker.GlobalSafeDefine(key, value)
    if _G[key] then
        Skywalker.PrintMsg("[Global Error] 全局key '" .. key .. "' 已经存在，无法重新定义")
        return
    end
    rawset(_G, key, value)
end
