-------------------------------------------------------------------
---文件: Framework\Config\AllowedGlobals.lua
---作者: shyfan
---日期: 2025/06/11 18:04:01
---功能: 允许的全局变量配置
-------------------------------------------------------------------
-- TODO Shyfan 服务器和客户端的需要分离
local allowedGlobals = {}

-- Framework
allowedGlobals.Skywalker = true
allowedGlobals.Class = true -- 类
allowedGlobals.UtilTool = true -- 工具类

-- Server
allowedGlobals.SKYS_Module = true -- 模块
allowedGlobals.GameS = true -- 游戏服务器
allowedGlobals.MapInstanceS = true -- 地图实例

-- Client
allowedGlobals.SKY_UI = true -- UI 控件
allowedGlobals.SKYC_Module = true -- Skywalker 客户端模块
allowedGlobals.GameC = true -- 游戏客户端

return allowedGlobals
