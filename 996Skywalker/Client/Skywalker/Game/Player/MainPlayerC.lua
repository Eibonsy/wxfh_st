-------------------------------------------------------------------
---文件: Client\Skywalker\Game\Player\MainPlayerC.lua
---作者: shyfan
---日期: 2025/06/23 15:02:23
---功能: 主玩家
-------------------------------------------------------------------
local gameMisc = Skywalker.GameMisc

local EPlayerDetailState = gameMisc.PlayerDetailState
local EMatchMode = gameMisc.MatchMode

local logObject = Skywalker.Logger:GetLogObject("Game.MainPlayer")

---@class MainPlayerC 主玩家
---@field public Valid boolean @是否有效
---@field public DetailState integer @主玩家状态
---@field public MatchMode integer @匹配模式
---@field public MatchStartTime integer @匹配开始时间
local mainPlayer = {}

-- * 重置主玩家
local function resetMainPlayer()
    mainPlayer.Valid = false

    mainPlayer.DetailState = EPlayerDetailState.id.Normal

    -- * 匹配相关
    mainPlayer.MatchMode = EMatchMode.id.None
    mainPlayer.MatchStartTime = 0
end

function mainPlayer:Init()
    resetMainPlayer()
end

-- * 主玩家登录
---@param data NetMessage.Player_LoginInfo
function mainPlayer:Login(data)
    if self.Valid then
        logObject:Error("主玩家重复登录")
        self:Init()
    end

    self.Valid = true

    self.DetailState = data.DetailState
    self.MatchMode = data.MatchMode
    self.MatchStartTime = data.MatchStartTime
end

return mainPlayer
