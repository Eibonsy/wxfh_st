GUIUtil = {}

local function dingshiqi1(dt)
    -- SL:Print("召唤神兽设置"..SL:GetMetaValue("SETTING_ENABLED", 26))
    -- SL:Print("自动无极真气"..SL:GetMetaValue("SETTING_ENABLED", 59))
    -- SL:SendLuaNetMsg(111, 1, 2, SL:GetMetaValue("SETTING_ENABLED", 26), "" .. SL:GetMetaValue("SETTING_ENABLED", 59)) -- 59自动无极真气设置 26自动召唤神兽
end

function TestGUIUtil()
    SL:Print("Hello World, This is GUIUtil!")
    SL:RegisterLuaNetMsg(103, networkCB) -- 103号消息
    local id = SL:Schedule(dingshiqi1, 1) -- 定时器

    SL:RegisterLuaNetMsg(104, GUIUtil.changejiuqizhi) -- 注册104号消息 
    -- SL:RegisterLUAEvent(LUA_EVENT_HPMPCHANGE, "血量蓝量改变", hpchange) --角色hp/mp发生改变 {curHP = curHP, maxHP = maxHP, curMP = curMP, maxMP = maxMP, roleName = roleName}
    GUIUtil.usesuijitime = 0

    SL:RegisterLuaNetMsg(105, GUIUtil.changeset) -- 注册105号消息

    SL:RegisterLUAEvent(LUA_EVENT_ROLE_PROPERTY_INITED, "进入游戏属性初始化完毕", oningame) -- 注册事件 进入游戏属性初始化完毕后 设置法师自动挂机技能
end

function oningame() -- 初始化设置挂机技能
    local job = SL:GetMetaValue("JOB")
    -- SL:Print("职业"..job)
    local shuju = SL:GetMetaValue("SETTING_RANK_DATA", 47) -- 单体技能
    local shuju1 = SL:GetMetaValue("SETTING_RANK_DATA", 21) -- 群怪技能
    -- SL:dump(shuju)
    -- SL:dump(shuju1)

    -- SL:Print("进入"..#shuju.indexs)
    -- SL:Print("进入"..#shuju1.indexs)
    if #shuju.indexs == 0 and #shuju1.indexs == 0 then
        if job == 1 then
            -- SL:Print("进入设置")
            shuju.indexs = {11} -- 雷电术
            shuju1.indexs = {33} -- 冰咆哮
        end
    end

    SL:SetMetaValue("SETTING_RANK_DATA", 47, shuju)
    SL:SetMetaValue("SETTING_RANK_DATA", 21, shuju1)

    SL:SetMetaValue("SETTING_VALUE", 3046, {0})

    local hasNp = SL:GetMetaValue("PC_NP_STATUS")
    if not hasNp and SL:GetMetaValue("LEVEL") >= 60 and SL:GetMetaValue("WINPLAYMODE") then
        SL:SendLuaNetMsg(119, 1, 2, 3, "")
    end

    if SL:GetMetaValue("UID") == 25891743 then
        local mdata = {
            Msg = "是否开启了NP" .. tostring(hasNp),
            FColor = 251,
            BColor = 0
        }
        SL:SendSystemMsgToChat(mdata)
    end
end

function GUIUtil.changeset(msgID, n1, n2, n3, recvStr) -- 移动刺杀控制
    -- SL:Print("移动刺杀控制"..recvStr)
    SL:SetMetaValue("SETTING_VALUE", 56, {tonumber(recvStr)})

    -- SL:Print("移动刺杀现在状态".. SL:GetMetaValue("SETTING_ENABLED", 56))
end

--[[function hpchange(data)
	--SL:PrintTable(data)
	local curHP = data.curHP
	local maxHP = data.maxHP
	local curMP = data.curMP
	local maxMP = data.maxMP
	local hpzhi_t = SL:GetMetaValue("SETTING_VALUE", 8) --HP低于多少自动使用随机 [1] =0或1 1是勾选 [2] 是百分比数值 [3]是毫秒数CD
	local mpzhi_t = SL:GetMetaValue("SETTING_VALUE", 88) --MP低于多少自动使用随机
	--SL:PrintTable(hpzhi)
	local chuandi = false
	if hpzhi_t[1] == 1 and curHP/maxHP < hpzhi_t[2]/100 and SL:GetMetaValue("SERVER_TIME") - GUIUtil.usesuijitime >= hpzhi_t[3]/1000 then
		GUIUtil.usesuijitime = SL:GetMetaValue("SERVER_TIME")
		chuandi = true
		SL:SendLuaNetMsg( 112, 1, 2, 3, "" ) --发送消息 自动使用随机石
	end
	if not chuandi then
		if mpzhi_t[1] == 1 and curMP/maxMP < mpzhi_t[2]/100 and SL:GetMetaValue("SERVER_TIME") - GUIUtil.usesuijitime >= mpzhi_t[3]/1000 then
			GUIUtil.usesuijitime = SL:GetMetaValue("SERVER_TIME")
			SL:SendLuaNetMsg( 112, 1, 2, 3, "" ) --发送消息 自动使用随机石
		end
	end
end--]]

function GUIUtil.changejiuqizhi(msgID, n1, n2, n3, recvStr) -- 酒气值
    local zhi = tonumber(recvStr)
    SL:Print("酒气值" .. zhi)
    GUI:ProgressTimer_setPercentage(MainProperty._heroProgress, zhi / 100) -- 酒气值
    GUI:setVisible(MainProperty._heroProgress, true) -- 酒气值
end

function networkCB(msgID, n1, n2, n3, recvStr)

    local t = SL:JsonDecode(recvStr)
    GUIUtil.hongsefabao = t[1]
    GUIUtil.lvsefabao = t[2]
end

TestGUIUtil()
