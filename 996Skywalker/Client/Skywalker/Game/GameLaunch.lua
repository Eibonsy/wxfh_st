-------------------------------------------------------------------
---文件: Client\Skywalker\Game\GameLaunch.lua
---作者: shyfan
---日期: 2025/02/17 16:48:15
---功能: Skywalker 客户端游戏启动
-------------------------------------------------------------------
local includeGame = Skywalker.RequireGame

---@class GameC 游戏
---@field public matchMgr MatchMgrC 匹配管理
---@field public uiMgr UIMgr UI管理
---@field public operateControlMgr OperateControlMgrC 操作控制管理
---@field public playerMgr PlayerMgrC 玩家管理
---@field public dreamMgr DreamMgrC 梦境管理器
GameC = {}

-- * 匹配
GameC.matchMgr = includeGame("Match/MatchMgrC.lua")

-- * UI 放在最后加载
GameC.uiMgr = includeGame("UI/UIMgr.lua")

-- * 操作控制管理
GameC.operateControlMgr = includeGame("OperateControl/OperateControlMgrC.lua")

-- * 玩家管理
GameC.playerMgr = includeGame("Player/PlayerMgrC.lua")

-- * 梦境管理器
GameC.dreamMgr = includeGame("Dream/DreamMgrC.lua")
