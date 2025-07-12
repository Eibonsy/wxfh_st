-------------------------------------------------------------------
---文件: Framework\Launch\SystemLaunch.lua
---作者: shyfan
---日期: 2025/06/11 14:58:20
---功能: 系统启动入口文件
-------------------------------------------------------------------
-- * 都为 true 才会打印，方便控制打印
local _DEBUG = Skywalker.DEBUG and false

-- * UI控件
Skywalker.RequireUIControl("SKY_UI.lua")

-- * Skywalker 模块
Skywalker.RequireModule("SKY_Module.lua")

-- * 游戏
Skywalker.RequireGame("GameLaunch.lua")

-- 解除严格模式
setmetatable(_G, nil)
