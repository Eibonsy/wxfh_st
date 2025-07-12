-------------------------------------------------------------------
---文件: Client\Skywalker\Module\NPC\NPCEventC.lua
---作者: shyfan
---日期: 2025/06/27 11:40:21
---功能: NPC事件处理器
-------------------------------------------------------------------
---@type SL
local SL = SL

local includeGame = Skywalker.RequireGame

local utilTool = UtilTool
local skyModule = SKYC_Module

local ENPCFuncType = Skywalker.GameMisc.NPCFuncType.id

local logObject = Skywalker.Logger:GetLogObject("Module.NPC")

local strKey = "NPCEventC"

---@param eventData LuaEvent_TalkToNpc_Data 事件数据
local function Event_TalkToNPC(eventData)
    local npcFuncConfig = skyModule.config.allTables.TbCNPCFunc:GetData(eventData.index)
    if not npcFuncConfig then
        return
    end

    if npcFuncConfig.FuncType == ENPCFuncType.OpenView then
        local viewPath = npcFuncConfig.StrParamList[1]
        if not utilTool.string.IsValid(viewPath) then
            logObject:Error("无效的NPC功能配置路径: " .. viewPath)
            return
        end
        local view = includeGame(viewPath)
        view:main()
    end
end

-- * 注册事件
local function registerEvent()
    SL:RegisterLUAEvent(LUA_EVENT_TALKTONPC, strKey, Event_TalkToNPC)
end

-- * 反注册事件
local function unregisterEvent()
    SL:UnRegisterLUAEvent(LUA_EVENT_TALKTONPC, strKey)
end

unregisterEvent()
registerEvent()
