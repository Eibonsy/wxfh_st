math.randomseed(tostring(os.time()):reverse():sub(1, 7)) -- 随机数种子

GlobalPreprocess = {}

include("Market_Def/old.lua")
include("Skywalker/Source/SkywalkerS.lua")

if GlobalPreprocess.entermap then
    SKYS_Module.event:RegisterEvent(Skywalker.GameMisc.EventIDS.id.Map_Enter, "GlobalPreprocess.entermap",
        function(eventId, eventParam, backParam)
            if GlobalPreprocess.entermap then
                GlobalPreprocess.entermap(unpack(eventParam))
            end
        end)
end

if GlobalPreprocess.handlerequest then
    SKYS_Module.net:RegisterNetMsg(0, GlobalPreprocess.handlerequest)
end

if GlobalPreprocess.login then
    SKYS_Module.event:RegisterEvent(Skywalker.GameMisc.EventIDS.id.Player_Login, "GlobalPreprocess.login",
        function(eventId, eventParam, backParam)
            if GlobalPreprocess.login then
                GlobalPreprocess.login(eventParam)
            end
        end)
end

if GlobalPreprocess.resetday then
    SKYS_Module.event:RegisterEvent(Skywalker.GameMisc.EventIDS.id.Player_CrossDayLogin, "GlobalPreprocess.resetday",
        function(eventId, eventParam, backParam)
            if GlobalPreprocess.resetday then
                GlobalPreprocess.resetday(eventParam)
            end
        end)
end

if GlobalPreprocess.playdie then
    SKYS_Module.event:RegisterEvent(Skywalker.GameMisc.EventIDS.id.Player_Die, "GlobalPreprocess.playdie",
        function(eventId, eventParam, backParam)
            if GlobalPreprocess.playdie then
                GlobalPreprocess.playdie(unpack(eventParam))
            end
        end)
end

