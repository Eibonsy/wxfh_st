-------------------------------------------------------------------
---文件: Client\Skywalker\Game\MainUI\MainUI.lua
---作者: shyfan
---日期: 2025/02/22 12:50:39
---功能: 主界面
-------------------------------------------------------------------
local logObject = Skywalker.Logger:GetLogObject("Game.MainUI")

local skyUI = SKY_UI
local skyModule = SKYC_Module
local GameMisc = Skywalker.GameMisc

local game = GameC

local EEventIDC = GameMisc.EventIDC.id
local EMatchMode = GameMisc.MatchMode.id

---@class MainUI 主界面
local MainUI = {}

---@type SKY_UIButton? 匹配按钮
local matchUIButton = nil
---@type SKY_UIText? 匹配时间
local matchTimeUIText = nil

-- * 刷新匹配按钮
local function refreshMatchButton()
    if not matchUIButton then
        logObject:Error("matchButton is nil")
        return
    end

    if not matchUIButton:IsValid() then
        logObject:Error("matchUIButton not Valid")
        return
    end

    local mainPlayer = game.playerMgr:GetMainPlayer()
    if not mainPlayer or not mainPlayer.Valid then
        logObject:Error("主玩家无效，无法刷新匹配按钮")
        return
    end

    local matchStartTime = mainPlayer.MatchStartTime
    if matchStartTime and matchStartTime > 0 then
        -- 正在匹配中
        matchUIButton:SetText("取消匹配", 15)
        matchUIButton:SetOnClickEvent(function()
            GameC.matchMgr:ReqCancelMatch()
        end)

        -- 设置匹配时间
        if matchTimeUIText and matchTimeUIText:IsValid() then
            matchTimeUIText:SetString("匹配时间：" .. matchStartTime)
        else
            logObject:Error("matchTimeUIText not Valid")
        end
    else
        -- 未匹配
        matchUIButton:SetText("开始匹配", 15)
        matchUIButton:SetOnClickEvent(function()
            GameC.matchMgr:ReqMatch(EMatchMode.Normal)
        end)

        -- 设置匹配时间
        if matchTimeUIText and matchTimeUIText:IsValid() then
            matchTimeUIText:SetString("")
        else
            logObject:Error("matchTimeUIText not Valid")
        end
    end
end

-- * 匹配成功
local function onMatchSuccess()
    if matchTimeUIText and matchTimeUIText:IsValid() then
        matchTimeUIText:SetString("匹配成功，等待进入战场")
    else
        logObject:Error("matchTimeUIText not Valid")
    end
end

-- * 创建匹配按钮
local function createMatchButton()
    local parent = GUI:Win_FindParent(107)
    if parent == nil then
        logObject:Error("MatchUI:Init parent is nil")
        return
    end

    matchUIButton = skyUI.UIButton:new(parent, "Button_Match", -445, 60 + 145, "res/public/1900000652.png")
    if matchUIButton and matchUIButton:IsValid() then
        matchTimeUIText = skyUI.UIText:new(matchUIButton:GetInstance(), "Text_MatchTime", 0, -20, 16, "#FFFFFF", "")
        if matchTimeUIText and matchTimeUIText:IsValid() then
            matchTimeUIText:EnableOutline("#000000", 1)
        else
            logObject:Error("创建 Text_MatchTime 失败了")
        end
    else
        logObject:Error("创建 Button_Match 失败了")
    end

    refreshMatchButton()

    skyModule.event:RegisterEvent(EEventIDC.Match_Status_Refresh, "MainUI.Match_Status_Refresh", refreshMatchButton)
    skyModule.event:RegisterEvent(EEventIDC.Match_Success, "MainUI.Match_Success", onMatchSuccess)
end

-- * 初始化
function MainUI:Init()
    -- 延迟创建
    skyModule.schedule:RegisterSchedule(function(scheduleID, repeatIndex, backParam)
        -- createMatchButton()
    end, 1000, nil, 1)
end

return MainUI
