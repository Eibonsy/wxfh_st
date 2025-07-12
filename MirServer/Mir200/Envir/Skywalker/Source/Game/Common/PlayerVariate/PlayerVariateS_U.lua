-------------------------------------------------------------------
---文件: Server\Skywalker\Game\Common\PlayerVariate\PlayerVariateS_U.lua
---作者: shyfan
---日期: 2025/06/16 11:43:23
---功能: 玩家变量 U
-------------------------------------------------------------------
---@class PlayerVariateS_U 玩家变量 number 存放在SQL角色数据库，最大值21亿，最多255个(U0-U254)
local PlayerVariateS_U = {
    -- 玩家状态，见 EPlayerDetailState
    DetailState = "U0",
    -- 玩家匹配模式，见 EMatchMode
    MatchMode = "U1",
    -- 玩家匹配房间Id
    MatchRoomId = "U2",
    -- 玩家战场房间Id
    BattleRoomId = "U3"
}

return PlayerVariateS_U
