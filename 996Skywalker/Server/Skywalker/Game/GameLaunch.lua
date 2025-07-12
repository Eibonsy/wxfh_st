-------------------------------------------------------------------
---文件: Server\Skywalker\Game\GameLaunch.lua
---作者: shyfan
---日期: 2025/02/17 17:03:25
---功能: Skywalker 服务端游戏启动
-------------------------------------------------------------------
local includeGame = Skywalker.RequireGame

---@class GameS 游戏
---@field public matchMgr MatchMgrS 匹配管理
---@field public battlefieldMgr BattlefieldMgrS 战斗管理
---@field public operateControlMgr OperateControlMgrS 操作控制管理
---@field public playerMgr PlayerMgrS 玩家管理器
---@field public dreamMgr DreamMgrS 梦境管理器
GameS = {}

GameS.matchMgr = includeGame("Match/MatchMgrS.lua")

GameS.battlefieldMgr = includeGame("Battlefield/BattlefieldMgrS.lua")

GameS.operateControlMgr = includeGame("OperateControl/OperateControlMgrS.lua")

GameS.playerMgr = includeGame("Player/PlayerMgrS.lua")

GameS.dreamMgr = includeGame("Dream/DreamMgrS.lua")
