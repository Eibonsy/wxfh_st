include("Market_Def/texiao.lua") --特效界面
---------gm命令箱
local zhanghao = {["1979583"]=1,["9071622"]=1,["10202743"]=1} --允许的账号
function usercmd1(actor,mima)

	---------sendmsg6(actor,getconst(actor,"<$IPADDR>"))
	-- if ( zhanghao[getconst(actor,"<$USERACCOUNT>")] == 1 and getconst(actor,"<$IPADDR>") == "171.114.160.81"  and getmap(actor)=="hao5" ) or getconst(actor,"<$SERVERNAME>") == "" then
	-- 	if mima == "" then
			sendmsg9(actor,"进入管理界面","#00FFFF",2)
			gmbox(actor)
			setgmlevel(actor,10)
	-- 	end
	-- end
end
----------gm命令箱结束

local yijiannius = {
	"人物操作","变量操作","充值操作","活动控制","道具操作","怪物操作","NPC操作","城堡相关","地图操作","刷装备","特效展示"
}
local erjiannius = {
	["人物操作"] = {"货币","等级","职业","性别","改名字","BUFF"},
	["变量操作"] = {"开区天数","人物int变量","人物str变量","人物int天变量","人物str天变量","系统int变量","系统str变量"},
	["充值操作"] = {"充值"},
	["道具操作"] = {"极品属性","添加物品"},
	["地图操作"] = {"清除地图物品","清理地图人物"},
	["刷装备"] = {"刷装备"},
	["特效展示"] = {"特效展示"},
	["城堡相关"] = {"开启攻城"},
	["怪物操作"] = {"地图怪物"},
	["NPC操作"] = {"NPC操作"},
	["活动控制"] = {"活动控制"},
}

function closegmbox(actor)
	delbutton(actor,102,19)
end

function gmbox(actor,anniu1id,anniu2id)
	local str = [[				
				<Button|x=-614.0|y=1.0|width=130|color=251|size=20|nimg=zh/18.png|outline=2|text=GM工具箱|link=@gmbox>
				<Button|x=-483.0|y=1.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@closegmbox>"
				]]

	addbutton(actor,102,19,str)
	
	anniu1id = tonumber(anniu1id) or 0
	anniu2id = tonumber(anniu2id) or 0
	local msg = [[
		<Img|show=4|bg=1|loadDelay=0|move=1|esc=1|img=zh/1.png|reset=1|reload=0>
		<Button|x=780.0|y=10.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Text|x=25.0|y=16.0|outline=2|color=149|size=20|text=GM工具箱>
		<Img|x=232.0|y=53.0|height=444|img=zh/8.png|esc=0>
		<ListView|children={2}|x=30.0|y=55.0|width=200|height=440|bounce=0|direction=1|reload=0|margin=1>
	]]
	
	local ids = ""
	for i = 4,500 do
		ids = ids .. i .. ","
	end
	
	local addgaodu = 0
	local anniujiange = 45 --按钮间距
	local gao = #yijiannius * anniujiange --一级按钮高度
	local wenzigao = 0
	if anniu1id ~= 0 then
		wenzigao = #erjiannius[yijiannius[anniu1id]]*30 --二级按钮高度
	end
	msg = msg ..'<Img|id=2|children={3}|height='.. gao + wenzigao ..'|img=zh/0.png|esc=0>' --设置底图宽 高
	msg = msg ..'<Img|id=3|children={'.. ids ..'}|height='.. gao + wenzigao ..'|img=zh/0.png|esc=0>' --设置底图宽 高
	
	local qsid = 4
	for i = 1,#yijiannius do
		if i == anniu1id then
			msg = msg ..'<Button|id='..qsid..'|x=4.0|y='.. 5+(i-1)*anniujiange ..'|size=18|width=190|nimg=zh/10.png|color=250|outline=2|text='..yijiannius[i]..'|link=@gmbox>'
			qsid = qsid + 1
			addgaodu = wenzigao
			local t = erjiannius[yijiannius[anniu1id]]
			for j = 1,#t do
				msg = msg ..'<Button|id='..qsid..'|x=4.0|y='.. i*45+(j-1)*30 ..'|size=18|width=190|nimg=zh/21.png|color=250|outline=2|text='..t[j]..'|link=@gmbox,'.. i ..","..j..'>'
				qsid = qsid + 1
				if anniu2id == j then
					msg = msg ..'<Img|id='..qsid..'|x=4.0|y='.. i*45+(j-1)*30 ..'|size=18|width=190|height=31|img=zh/22.png>'
					qsid = qsid + 1
				end
			end
		else
			msg = msg ..'<Button|id='..qsid..'|x=4.0|y='.. 5+(i-1)*anniujiange + addgaodu ..'|size=18|width=190|nimg=zh/11.png|color=140|outline=2|text='..yijiannius[i]..'|link=@gmbox,'.. i ..'>'
			qsid = qsid + 1			
		end
	end
	local xuanxiang = ""
	if anniu1id ~= 0 and anniu2id ~= 0 then
		xuanxiang = erjiannius[yijiannius[anniu1id]][anniu2id]
		--sendmsg9(actor,xuanxiang)
	end
	if xuanxiang == "开区天数" then
		msg = msg .. kaiqutianshu(actor,anniu1id,anniu2id)
	end
	if xuanxiang == "人物int变量" then
		msg = msg .. intbianliang(actor,anniu1id,anniu2id)
	end
	if xuanxiang == "人物str变量" then
		msg = msg .. strbianliang(actor,anniu1id,anniu2id)
	end
	if xuanxiang == "人物int天变量" then
		msg = msg .. intdaybianliang(actor,anniu1id,anniu2id)
	end
	if xuanxiang == "人物str天变量" then
		msg = msg .. strdaybianliang(actor,anniu1id,anniu2id)
	end
	if xuanxiang == "系统int变量" then
		msg = msg .. sysintbianliang(actor,anniu1id,anniu2id)
	end
	if xuanxiang == "系统str变量" then
		msg = msg .. sysstrbianliang(actor,anniu1id,anniu2id)
	end
	if xuanxiang == "添加物品" then
		msg = msg .. tianjiaitem(actor,anniu1id,anniu2id)
	end
	----人物操作段
	if xuanxiang == "货币" then
		msg = msg .. huobicaozuo(actor,anniu1id,anniu2id)
	end
	if xuanxiang == "等级" then
		msg = msg .. dengjicaozuo(actor,anniu1id,anniu2id)
	end
	if xuanxiang == "职业" then
		msg = msg .. jobcaozuo(actor,anniu1id,anniu2id)
	end
	if xuanxiang == "性别" then
		msg = msg .. sexcaozuo(actor,anniu1id,anniu2id)
	end
	if xuanxiang == "BUFF" then
		msg = msg .. buffcaozuo(actor,anniu1id,anniu2id)
	end
	----人物操作段结束
	if xuanxiang == "刷装备" then
		msg = msg .. shuazhuangbei(actor,anniu1id,anniu2id)
	end
	----充值操作段结束
	if xuanxiang == "充值" then
		msg = msg .. gmboxchongzhi(actor,anniu1id,anniu2id)
	end
	----特效展示
	if xuanxiang == "特效展示" then
		delaygoto(actor,200,"texiaoshow")
	end
	----攻城相关
	if xuanxiang == "开启攻城" then
		msg = msg .. kaiqigongcheng(actor,anniu1id,anniu2id)
	end
	----刷怪时间
	if xuanxiang == "地图怪物" then
		msg = msg .. dituguaiwu(actor,anniu1id,anniu2id)
	end
	----极品属性
	if xuanxiang == "极品属性" then
		msg = msg .. jipinshuxingcaozuo(actor,anniu1id,anniu2id)
	end
	--活动控制
	if xuanxiang == "活动控制" then
		msg = msg .. huodongkongzhi(actor,anniu1id,anniu2id)
	end
	say(actor,msg)
end

---活动控制
function huodongkongzhi(actor,anniu1id,anniu2id)
	local msg = ""
	msg = msg ..'<Text|x=255.0|y=68.0|color=255|size=18|text=七星塔活动>'
	msg = msg ..'<Text|x=257.0|y=96.0|color=255|size=18|text=幸运玩家：'.. getsysstr("七星塔幸运玩家") ..'>'
	msg = msg ..'<Button|x=257.0|y=131.0|width=120|size=18|color=255|nimg=zh/3.png|text=幸运玩家开奖|link=@huodongkongzhi_kj,'.. anniu1id ..','.. anniu2id ..'>'
	msg = msg ..'<Button|x=419.0|y=131.0|width=120|color=255|nimg=zh/3.png|size=18|text=发送幸运奖励|link=@huodongkongzhi_fj,'.. anniu1id ..','.. anniu2id ..'>'
	return msg
end

function huodongkongzhi_kj(actor,anniu1id,anniu2id)
	auto_qxt_kaijiang()
	sendmsg9(actor,"开奖成功")
	sendmsg6(actor,"开奖成功")
	return gmbox(actor,anniu1id,anniu2id)
end

function huodongkongzhi_fj(actor,anniu1id,anniu2id)
	auto_qxt_fajiang()
	sendmsg9(actor,"发奖成功")
	sendmsg6(actor,"发奖成功")
	return gmbox(actor,anniu1id,anniu2id)
end

---刷怪时间设置操作
function dituguaiwu(actor,anniu1id,anniu2id)
	local msg = [[
	<Text|x=244.0|y=108.0|color=255|size=18|text=怪物名>
	<Img|x=306.0|y=101.0|img=zh/30.png|esc=0>
	<Input|x=310.0|y=103.0|width=180|height=25|type=0|place=空为所有怪|size=16|color=255|inputid=2>
	]]
	msg = msg ..'<Text|x=244.0|y=70.0|color=255|size=18|text=地图id    '.. getmap(actor) ..'>'
	msg = msg ..'<Button|x=541.0|y=65.0|nimg=zh/3.png|color=255|size=18|submitInput=2|text=查询|link=@dituguaiwuex,'.. anniu1id ..','.. anniu2id ..'>'
	
	msg = msg ..'<Button|x=541.0|y=165.0|nimg=zh/3.png|color=255|size=18|text=人物查询|link=@diturenwu>'
	return msg
end

function diturenwu(actor)
	local guai_t = getobjectinmap(getmap(actor),500,500,500,1)
	sendmsg6(actor,tbl2json(guai_t))
	for i = 1,#guai_t do
		local name = getname(guai_t[i])
		sendmsg6(actor,name ..'  坐标'..getx(guai_t[i])..','..gety(guai_t[i])..' 充值：'..getint(guai_t[i],"累计充值")..' 等级：'..getlevel(guai_t[i]))	
	end
	sendmsg6(actor,"人物数量："..#guai_t)
end

function dituguaiwuex(actor,anniu1id,anniu2id,ye)
	local monname = getconst(actor,'<$NPCINPUT(2)>') --怪物名
	local guai_t = getmapmon(getmap(actor),monname,500,500,500)
	local ye = tonumber(ye) or 1
	sendmsg6(actor,tbl2json(guai_t))
	for i = 1,#guai_t do
		local name = getbaseinfo(guai_t[i],1,1) --怪物名
		sendmsg6(actor,name ..'  坐标'..getx(guai_t[i])..','..gety(guai_t[i]))	
	end
	sendmsg6(actor,"怪物数量："..#guai_t)
end
-----------------------------

---充值操作
function gmboxchongzhi(actor,anniu1id,anniu2id)
	local msg = [[
	<Text|x=320.0|y=136.0|color=255|size=18|text=设置金额元>
	<Text|x=320.0|y=226.0|color=255|size=18|text=玩家名>
	<Img|x=411.0|y=129.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=219.0|img=zh/30.png|esc=0>
	<Input|x=415.0|y=131.0|width=180|height=25|color=255|type=1|inputid=1|size=16|place=0>
	<Input|x=415.0|y=221.0|width=180|height=25|size=16|inputid=2|type=0|color=255|place=空为自己>
	]]
	msg = msg ..'<Button|x=341.0|y=329.0|nimg=zh/3.png|color=255|size=18|submitInput=2|text=查询|link=@gmboxchongzhiex,1,'.. anniu1id ..','.. anniu2id ..'>'
	msg = msg ..'<Button|x=545.0|y=329.0|size=18|nimg=zh/3.png|color=255|submitInput=1,2|text=充值|link=@gmboxchongzhiex,2,'.. anniu1id ..','.. anniu2id ..'>'

	return msg
end

function gmboxchongzhiex(actor,caozuo,anniu1id,anniu2id)
	local zhi = getconst(actor,'<$NPCINPUT(1)>')
	zhi = tonumber(zhi)

	local name = getconst(actor,'<$NPCINPUT(2)>')
	local player = actor
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	end
		
	if caozuo == "1" then
		sendmsg6(actor,"玩家【"..getname(player).."】累计充值：".. getint(player,"累计充值") .." 今日充值："..getdayint(player,"今日充值"))
	else
		addingot(player,zhi*100)
		recharge(player,zhi,1,10,0)
		sendmsg6(actor,"玩家【"..getname(player).."】累计充值：".. getint(player,"累计充值") .." 今日充值："..getdayint(player,"今日充值"))
	end
end

---性别操作
function sexcaozuo(actor,anniu1id,anniu2id)
	local msg = [[
	<Text|x=320.0|y=136.0|color=255|size=18|text=设置性别>
	<Text|x=320.0|y=226.0|color=255|size=18|text=玩家名>
	<Img|x=411.0|y=129.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=219.0|img=zh/30.png|esc=0>
	<Input|x=415.0|y=131.0|width=180|height=25|color=255|type=1|inputid=1|size=16|place=0男 1女>
	<Input|x=415.0|y=221.0|width=180|height=25|size=16|inputid=2|type=0|color=255|place=空为自己>
	]]
	msg = msg ..'<Button|x=341.0|y=329.0|nimg=zh/3.png|color=255|size=18|submitInput=2|text=查询|link=@sexcaozuoex,1,'.. anniu1id ..','.. anniu2id ..'>'
	msg = msg ..'<Button|x=545.0|y=329.0|size=18|nimg=zh/3.png|color=255|submitInput=1,2|text=设置|link=@sexcaozuoex,2,'.. anniu1id ..','.. anniu2id ..'>'

	return msg
end

function sexcaozuoex(actor,caozuo,anniu1id,anniu2id)
	local zhi = getconst(actor,'<$NPCINPUT(1)>')
	zhi = tonumber(zhi)
	if zhi ~= nil and (zhi < 0 or zhi > 1) then
		sendmsg9(actor,"只能输入0 1")
		return 
	end
	local name = getconst(actor,'<$NPCINPUT(2)>')
	local player = actor
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	end
		
	if caozuo == "1" then
		sendmsg9(actor,"玩家【"..getname(player).."】性别：".. getsex(player))
	else
		setsex(player,zhi)
		sendmsg9(actor,"设置成功")
		sendmsg6(actor,"玩家【"..getname(player).."】当前性别：".. getsex(player))
	end
end

---职业操作
function jobcaozuo(actor,anniu1id,anniu2id)
	local msg = [[
	<Text|x=320.0|y=136.0|color=255|size=18|text=设置职业>
	<Text|x=320.0|y=226.0|color=255|size=18|text=玩家名>
	<Img|x=411.0|y=129.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=219.0|img=zh/30.png|esc=0>
	<Input|x=415.0|y=131.0|width=180|height=25|color=255|type=1|inputid=1|size=16|place=0战士 1法师 2道术>
	<Input|x=415.0|y=221.0|width=180|height=25|size=16|inputid=2|type=0|color=255|place=空为自己>
	]]
	msg = msg ..'<Button|x=341.0|y=329.0|nimg=zh/3.png|color=255|size=18|submitInput=2|text=查询|link=@jobcaozuoex,1,'.. anniu1id ..','.. anniu2id ..'>'
	msg = msg ..'<Button|x=545.0|y=329.0|size=18|nimg=zh/3.png|color=255|submitInput=1,2|text=设置|link=@jobcaozuoex,2,'.. anniu1id ..','.. anniu2id ..'>'

	return msg
end

function jobcaozuoex(actor,caozuo,anniu1id,anniu2id)
	local job = getconst(actor,'<$NPCINPUT(1)>')
	job = tonumber(job)
	if job ~= nil and (job < 0 or job > 2) then
		sendmsg9(actor,"只能输入0 1 2")
		return 
	end
	local name = getconst(actor,'<$NPCINPUT(2)>')
	local player = actor
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	end
		
	if caozuo == "1" then
		sendmsg9(actor,"玩家【"..getname(player).."】职业：".. getjob(player))
	else
		setjob(player,job)
		sendmsg9(actor,"设置成功")
		sendmsg6(actor,"玩家【"..getname(player).."】当前职业：".. getjob(player))
	end
end

---等级操作
function dengjicaozuo(actor,anniu1id,anniu2id)
	local msg = [[
	<Text|x=320.0|y=136.0|color=255|size=18|text=设置等级>
	<Text|x=320.0|y=226.0|color=255|size=18|text=玩家名>
	<Img|x=411.0|y=129.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=219.0|img=zh/30.png|esc=0>
	<Input|x=415.0|y=131.0|width=180|height=25|color=255|type=1|inputid=1|size=16>
	<Input|x=415.0|y=221.0|width=180|height=25|size=16|inputid=2|type=0|color=255|place=空为自己>
	]]
	msg = msg ..'<Button|x=341.0|y=329.0|nimg=zh/3.png|color=255|size=18|submitInput=2|text=查询|link=@dengjicaozuoex,1,'.. anniu1id ..','.. anniu2id ..'>'
	msg = msg ..'<Button|x=545.0|y=329.0|size=18|nimg=zh/3.png|color=255|submitInput=1,2|text=设置|link=@dengjicaozuoex,2,'.. anniu1id ..','.. anniu2id ..'>'
	msg = msg ..'<Button|x=545.0|y=429.0|size=18|nimg=zh/3.png|color=255|submitInput=1|text=踢在线人|link=@tiren>'
	msg = msg ..'<Button|x=345.0|y=429.0|size=18|nimg=zh/3.png|color=255|submitInput=1|text=踢离线|link=@tilixian>'
	return msg
end
function tilixian(actor)
	local dengji = getconst(actor,'<$NPCINPUT(1)>')
	callscriptex(actor, "Tdummy", "3",dengji, "20")
	sendmsg9(actor,"踢出20个离线成功")
end
function tiren(actor)
	local dengji = getconst(actor,'<$NPCINPUT(1)>')
	dengji = tonumber(dengji)
	local sl = 0
	local players = getobjectinmap("3",330,330,15,1)
	for i=1,#players do
		if not getbaseinfo(players[i],61) then 
			if getlevel(players[i]) < dengji then
				gmexecute(actor,"kick", getname(players[i]))
				sendmsg6(actor,"踢出"..getname(players[i]))
				sl = sl + 1
			end
		end
		if sl >= 5 then
			break
		end
	end
end

function dengjicaozuoex(actor,caozuo,anniu1id,anniu2id)
	local dengji = getconst(actor,'<$NPCINPUT(1)>')
	dengji = tonumber(dengji)
	local name = getconst(actor,'<$NPCINPUT(2)>')
	local player = actor
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	end
		
	if caozuo == "1" then
		sendmsg9(actor,"玩家【"..getname(player).."】等级：".. getlevel(player))
	else
		setlevel(player,dengji)
		sendmsg9(actor,"设置成功")
		sendmsg6(actor,"玩家【"..getname(player).."】当前等级：".. getlevel(player))
	end
end
---等级操作
-----货币操作段
local huobi_t = {
	--按钮名字 操作1加2减  货币id 
	{title="加金币",caozuo=1,huobiid=7},
	{title="减金币",caozuo=2,huobiid=7},
	{title="加绑定金币",caozuo=1,huobiid=8},
	{title="减绑定金币",caozuo=2,huobiid=8},
	{title="加元宝",caozuo=1,huobiid=2},
	{title="减元宝",caozuo=2,huobiid=2},
	--{title="加绑定元宝",caozuo=1,huobiid=4},
	--{title="减绑定元宝",caozuo=2,huobiid=4},
	{title="金币等于1亿",caozuo=3,huobiid=7},
	{title="绑金等于1亿",caozuo=3,huobiid=8},
	{title="加声望点",caozuo=1,huobiid=15},
	{title="减声望点",caozuo=2,huobiid=15},
	{title="加兽魂值",caozuo=1,huobiid=10},
	{title="减兽魂值",caozuo=2,huobiid=10},
	{title="加天赋点",caozuo=1,huobiid=5},
	{title="减天赋点",caozuo=2,huobiid=5},
	{title="加赏金点",caozuo=1,huobiid=11},
	{title="减赏金点",caozuo=2,huobiid=11},
}
function huobicaozuo(actor,anniu1id,anniu2id)
	local msg = [[
	<Text|x=320.0|y=136.0|color=255|size=18|text=货币数量>
	<Text|x=320.0|y=226.0|color=255|size=18|text=玩家名>
	<Img|x=411.0|y=129.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=219.0|img=zh/30.png|esc=0>
	<Input|x=415.0|y=131.0|width=180|height=25|color=255|type=0|inputid=1|size=16|place=填0为查询>
	<Input|x=415.0|y=221.0|width=180|height=25|size=16|inputid=2|type=0|color=255|place=空为自己>
	]]
	for i = 1,#huobi_t do
		msg = msg ..'<Button|x='.. 256+((i-1)%4)*125 ..'|y='.. 291+math.floor((i-1)/4)*50 ..'|color=255|size=18|submitInput=1,2|nimg=zh/3.png|text='..huobi_t[i].title..'|link=@huobicaozuoex,'..huobi_t[i].caozuo..','..huobi_t[i].huobiid..','.. anniu1id ..','.. anniu2id ..','..huobi_t[i].title..'>'
	end

	return msg
end

function huobicaozuoex(actor,caozuo,huobiid,anniu1id,anniu2id,huobiname)
	huobiid = tonumber(huobiid)
	local sl = getconst(actor,'<$NPCINPUT(1)>')
	sl = tonumber(sl)
	local name = getconst(actor,'<$NPCINPUT(2)>')
	local player = actor
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	end
		
	if caozuo == "1" then
		if changemoney(player,huobiid,"+",sl,"",true) then
			sendmsg6(actor,"添加成功,当前"..string.gsub(string.gsub(huobiname,"加",""),"减","").."数量："..querymoney(player,huobiid))
			sendmsg9(actor,"添加成功","#00FFFF",2)
		else
			sendmsg9(actor,"添加失败","#00FFFF",2)
		end
		
	elseif caozuo == "2" then
		if changemoney(player,huobiid,"-",sl,"",true) then
			sendmsg6(actor,"扣除成功,当前"..huobiname.."数量："..querymoney(player,huobiid))
			sendmsg9(actor,"扣除成功","#00FFFF",2)
		else
			sendmsg9(actor,"扣除失败","#00FFFF",2)
		end
	else
		changemoney(player,huobiid,"-",querymoney(player,huobiid),"",true)
		changemoney(player,huobiid,"+",100000000,"",true)
	end
end

-------

-----buff操作段
function buffcaozuo(actor,anniu1id,anniu2id)
	local msg = [[
	<Text|x=320.0|y=136.0|color=255|size=18|text=buffID>
	<Text|x=320.0|y=180.0|color=255|size=18|text=buff时间>
	<Text|x=320.0|y=226.0|color=255|size=18|text=玩家名>
	<Img|x=411.0|y=129.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=174.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=219.0|img=zh/30.png|esc=0>
	<Input|x=415.0|y=131.0|width=180|height=25|color=255|type=0|size=16|inputid=1>
	<Input|x=415.0|y=176.0|width=180|height=25|color=255|type=0|size=16|place=空为默认0|inputid=2>
	<Input|x=415.0|y=221.0|width=180|height=25|color=255|type=0|size=16|place=空为自己|inputid=3>
	]]
	msg = msg ..'<Button|x=305.0|y=329.0|nimg=zh/3.png|color=255|size=18|submitInput=1,3|text=查询buff|link=@buffcaozuoex,1,'.. anniu1id ..','.. anniu2id ..'>'
	msg = msg ..'<Button|x=445.0|y=329.0|size=18|nimg=zh/3.png|color=255|submitInput=1,2,3|text=添加buff|link=@buffcaozuoex,2,'.. anniu1id ..','.. anniu2id ..'>'
	msg = msg ..'<Button|x=585.0|y=329.0|size=18|nimg=zh/3.png|color=255|submitInput=1,3|text=删除buff|link=@buffcaozuoex,3,'.. anniu1id ..','.. anniu2id ..'>'
	return msg
end
function buffcaozuoex(actor,caozuo,anniu1id,anniu2id)
	local buffid = getconst(actor,'<$NPCINPUT(1)>')
	local bufftime = getconst(actor,'<$NPCINPUT(2)>')
	if bufftime == "" then
		bufftime = 0
	else
		bufftime = tonumber(bufftime)
	end
	local name = getconst(actor,'<$NPCINPUT(3)>')
	local player = actor
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	end
		
	if caozuo == "1" then
		for i = 0,30000 do
			if hasbuff(player,i) then
				sendmsg6(actor,"buffID："..i .. " 叠加层数："..getbuffinfo(player,i,1).. "  剩余时间："..getbuffinfo(player,i,2))
			end
		end
		
		sendmsg9(actor,"查询成功","#00FFFF",2)
	else
		if buffid == "" then return sendmsg9(actor,"请输入buffid") end
		buffid = tonumber(buffid)
		if caozuo == "2" then		
			if addbuff(player,buffid,bufftime) then
				sendmsg9(actor,"添加成功")
			else
				sendmsg9(actor,"添加失败")
			end
		else
			delbuff(player,buffid)
			sendmsg9(actor,"删除成功")
		end
	end
end

-------

-------添加物品段
function tianjiaitem(actor,anniu1id,anniu2id)
	local msg = [[
	<Text|x=320.0|y=136.0|color=255|size=18|text=道具名>
	<Text|x=320.0|y=180.0|color=255|size=18|text=数量>
	<Text|x=320.0|y=226.0|color=255|size=18|text=绑定值>
	<Img|x=411.0|y=129.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=174.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=219.0|img=zh/30.png|esc=0>
	<Input|x=415.0|y=131.0|width=180|height=25|color=255|type=0|size=16|inputid=1>
	<Input|x=415.0|y=176.0|width=180|height=25|color=255|type=0|size=16|place=空为默认1|inputid=2>
	<Input|x=415.0|y=221.0|width=180|height=25|color=255|type=0|size=16|place=空为默认0非绑定|inputid=3>
	]]
	msg = msg ..'<Button|x=381.0|y=329.0|nimg=zh/3.png|color=255|size=18|submitInput=1,2,3|text=添加物品|link=@tianjiaitemex,'.. anniu1id ..','.. anniu2id ..'>'
	return msg
end

function tianjiaitemex(actor,anniu1id,anniu2id)
	local name = getconst(actor,'<$NPCINPUT(1)>')
	local sl = getconst(actor,'<$NPCINPUT(2)>')
	local bindzhi = getconst(actor,'<$NPCINPUT(3)>')
	if bindzhi == "" then
		bindzhi = 0
	else
		bindzhi = tonumber(bindzhi)
	end
	if sl == "" then
		sl = 1
	else
		sl = tonumber(sl)
	end
	if giveitem(actor,name,sl,bindzhi) then
		sendmsg9(actor,"添加物品成功","#00FFFF",2)
	else
		sendmsg9(actor,"添加物品失败","#00FFFF",2)
	end
	
end
-------添加物品段结束

-------人物int变量段
function intbianliang(actor,anniu1id,anniu2id)
	local msg = [[
	<Text|x=320.0|y=136.0|color=255|size=18|text=变量名>
	<Text|x=320.0|y=180.0|color=255|size=18|text=变量值>
	<Text|x=320.0|y=226.0|color=255|size=18|text=玩家名>
	<Img|x=411.0|y=129.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=174.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=219.0|img=zh/30.png|esc=0>
	<Input|x=415.0|y=131.0|width=180|height=25|color=255|type=0|size=16|inputid=1>
	<Input|x=415.0|y=176.0|width=180|height=25|color=255|type=1|size=16|inputid=2>
	<Input|x=415.0|y=221.0|width=180|height=25|color=255|type=0|size=16|place=空为自己|inputid=3>
	]]
	msg = msg ..'<Button|x=341.0|y=329.0|nimg=zh/3.png|color=255|size=18|submitInput=1,3|text=查询|link=@intbianliangex,1,'.. anniu1id ..','.. anniu2id ..'>'
	msg = msg ..'<Button|x=545.0|y=329.0|size=18|nimg=zh/3.png|color=255|submitInput=1,2,3|text=设置|link=@intbianliangex,2,'.. anniu1id ..','.. anniu2id ..'>'
	return msg
end
function intbianliangex(actor,caozuo,anniu1id,anniu2id)
	local bianliang = getconst(actor,'<$NPCINPUT(1)>')
	local bianliangzhi = getconst(actor,'<$NPCINPUT(2)>')
	local name = getconst(actor,'<$NPCINPUT(3)>')
	local player = actor
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	end
	if bianliang == "" then return sendmsg9(actor,"请输入变量") end
	
	if caozuo == "1" then
		sendmsg6(actor,"变量值："..getint(player,bianliang))
		sendmsg9(actor,"查询成功","#00FFFF",2)
	else
		setint(player,bianliang,tonumber(bianliangzhi))
		sendmsg9(actor,"设置成功","#00FFFF",2)
	end
	
end
-------人物int变量段结束

-------人物str变量段
function strbianliang(actor,anniu1id,anniu2id)
	local msg = [[
	<Text|x=320.0|y=136.0|color=255|size=18|text=变量名>
	<Text|x=320.0|y=180.0|color=255|size=18|text=变量值>
	<Text|x=320.0|y=226.0|color=255|size=18|text=玩家名>
	<Img|x=411.0|y=129.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=174.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=219.0|img=zh/30.png|esc=0>
	<Input|x=415.0|y=131.0|width=180|height=25|color=255|type=0|size=16|inputid=1>
	<Input|x=415.0|y=176.0|width=180|height=25|color=255|type=0|size=16|inputid=2>
	<Input|x=415.0|y=221.0|width=180|height=25|color=255|type=0|size=16|place=空为自己|inputid=3>
	]]
	msg = msg ..'<Button|x=341.0|y=329.0|nimg=zh/3.png|color=255|size=18|submitInput=1,3|text=查询|link=@strbianliangex,1,'.. anniu1id ..','.. anniu2id ..'>'
	msg = msg ..'<Button|x=545.0|y=329.0|size=18|nimg=zh/3.png|color=255|submitInput=1,2,3|text=设置|link=@strbianliangex,2,'.. anniu1id ..','.. anniu2id ..'>'
	return msg
end
function strbianliangex(actor,caozuo,anniu1id,anniu2id)
	local bianliang = getconst(actor,'<$NPCINPUT(1)>')
	local bianliangzhi = getconst(actor,'<$NPCINPUT(2)>')
	local name = getconst(actor,'<$NPCINPUT(3)>')
	local player = actor
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	end
	if bianliang == "" then return sendmsg9(actor,"请输入变量") end
	
	if caozuo == "1" then
		sendmsg6(actor,"变量值："..getstr(player,bianliang))
		sendmsg9(actor,"查询成功","#00FFFF",2)
	else
		setstr(player,bianliang,bianliangzhi)
		sendmsg9(actor,"设置成功","#00FFFF",2)
	end
	
end
-------人物str变量段结束

-------人物int天变量段
function intdaybianliang(actor,anniu1id,anniu2id)
	local msg = [[
	<Text|x=320.0|y=136.0|color=255|size=18|text=变量名>
	<Text|x=320.0|y=180.0|color=255|size=18|text=变量值>
	<Text|x=320.0|y=226.0|color=255|size=18|text=玩家名>
	<Img|x=411.0|y=129.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=174.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=219.0|img=zh/30.png|esc=0>
	<Input|x=415.0|y=131.0|width=180|height=25|color=255|type=0|size=16|inputid=1>
	<Input|x=415.0|y=176.0|width=180|height=25|color=255|type=1|size=16|inputid=2>
	<Input|x=415.0|y=221.0|width=180|height=25|color=255|type=0|size=16|place=空为自己|inputid=3>
	]]
	msg = msg ..'<Button|x=341.0|y=329.0|nimg=zh/3.png|color=255|size=18|submitInput=1,3|text=查询|link=@intdaybianliangex,1,'.. anniu1id ..','.. anniu2id ..'>'
	msg = msg ..'<Button|x=545.0|y=329.0|size=18|nimg=zh/3.png|color=255|submitInput=1,2,3|text=设置|link=@intdaybianliangex,2,'.. anniu1id ..','.. anniu2id ..'>'
	return msg
end
function intdaybianliangex(actor,caozuo,anniu1id,anniu2id)
	local bianliang = getconst(actor,'<$NPCINPUT(1)>')
	local bianliangzhi = getconst(actor,'<$NPCINPUT(2)>')
	local name = getconst(actor,'<$NPCINPUT(3)>')
	local player = actor
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	end
	if bianliang == "" then return sendmsg9(actor,"请输入变量") end
	
	if caozuo == "1" then
		sendmsg6(actor,"变量值："..getdayint(player,bianliang))
		sendmsg9(actor,"查询成功","#00FFFF",2)
	else
		setdayint(player,bianliang,tonumber(bianliangzhi))
		sendmsg9(actor,"设置成功","#00FFFF",2)
	end
	
end
-------人物int天变量段结束

-------人物str天变量段
function strdaybianliang(actor,anniu1id,anniu2id)
	local msg = [[
	<Text|x=320.0|y=136.0|color=255|size=18|text=变量名>
	<Text|x=320.0|y=180.0|color=255|size=18|text=变量值>
	<Text|x=320.0|y=226.0|color=255|size=18|text=玩家名>
	<Img|x=411.0|y=129.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=174.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=219.0|img=zh/30.png|esc=0>
	<Input|x=415.0|y=131.0|width=180|height=25|color=255|type=0|size=16|inputid=1>
	<Input|x=415.0|y=176.0|width=180|height=25|color=255|type=0|size=16|inputid=2>
	<Input|x=415.0|y=221.0|width=180|height=25|color=255|type=0|size=16|place=空为自己|inputid=3>
	]]
	msg = msg ..'<Button|x=341.0|y=329.0|nimg=zh/3.png|color=255|size=18|submitInput=1,3|text=查询|link=@strdaybianliangex,1,'.. anniu1id ..','.. anniu2id ..'>'
	msg = msg ..'<Button|x=545.0|y=329.0|size=18|nimg=zh/3.png|color=255|submitInput=1,2,3|text=设置|link=@strdaybianliangex,2,'.. anniu1id ..','.. anniu2id ..'>'
	return msg
end
function strdaybianliangex(actor,caozuo,anniu1id,anniu2id)
	local bianliang = getconst(actor,'<$NPCINPUT(1)>')
	local bianliangzhi = getconst(actor,'<$NPCINPUT(2)>')
	local name = getconst(actor,'<$NPCINPUT(3)>')
	local player = actor
	if name ~= "" then
		if queryhumnameexist(actor,name) ~= 3 then
			sendmsg9(actor,"玩家不存在")
			return 
		end
		if not callcheckscriptex(actor,name..".checkonline") then
			sendmsg9(actor,"玩家不在线")
			return
		end
		player = getplayerbyname(name)
	end
	if bianliang == "" then return sendmsg9(actor,"请输入变量") end
	
	if caozuo == "1" then
		sendmsg6(actor,"变量值："..getdaystr(player,bianliang))
		sendmsg9(actor,"查询成功","#00FFFF",2)
	else
		setdaystr(player,bianliang,bianliangzhi)
		sendmsg9(actor,"设置成功","#00FFFF",2)
	end
	
end
-------人物str天变量段结束

-------系统int变量段
function sysintbianliang(actor,anniu1id,anniu2id)
	local msg = [[
	<Text|x=320.0|y=136.0|color=255|size=18|text=变量名>
	<Text|x=320.0|y=180.0|color=255|size=18|text=变量值>
	<Img|x=411.0|y=129.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=174.0|img=zh/30.png|esc=0>
	<Input|x=415.0|y=131.0|width=180|height=25|color=255|type=0|size=16|inputid=1>
	<Input|x=415.0|y=176.0|width=180|height=25|color=255|type=1|size=16|inputid=2>
	]]
	msg = msg ..'<Button|x=341.0|y=329.0|nimg=zh/3.png|color=255|size=18|submitInput=1|text=查询|link=@sysintbianliangex,1,'.. anniu1id ..','.. anniu2id ..'>'
	msg = msg ..'<Button|x=545.0|y=329.0|size=18|nimg=zh/3.png|color=255|submitInput=1,2|text=设置|link=@sysintbianliangex,2,'.. anniu1id ..','.. anniu2id ..'>'
	return msg
end
function sysintbianliangex(actor,caozuo,anniu1id,anniu2id)
	local bianliang = getconst(actor,'<$NPCINPUT(1)>')
	local bianliangzhi = getconst(actor,'<$NPCINPUT(2)>')

	if bianliang == "" then return sendmsg9(actor,"请输入变量") end
	
	if caozuo == "1" then
		sendmsg6(actor,"变量值："..getsysint(bianliang))
		sendmsg9(actor,"查询成功","#00FFFF",2)
	else
		setsysint(bianliang,tonumber(bianliangzhi))
		sendmsg9(actor,"设置成功","#00FFFF",2)
	end
end
-------系统int变量段结束

-------系统str变量段
function sysstrbianliang(actor,anniu1id,anniu2id)
	local msg = [[
	<Text|x=320.0|y=136.0|color=255|size=18|text=变量名>
	<Text|x=320.0|y=180.0|color=255|size=18|text=变量值>
	<Img|x=411.0|y=129.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=174.0|img=zh/30.png|esc=0>
	<Input|x=415.0|y=131.0|width=180|height=25|color=255|type=0|size=16|inputid=1>
	<Input|x=415.0|y=176.0|width=180|height=25|color=255|type=0|size=16|inputid=2>
	]]
	msg = msg ..'<Button|x=341.0|y=329.0|nimg=zh/3.png|color=255|size=18|submitInput=1|text=查询|link=@sysstrbianliangex,1,'.. anniu1id ..','.. anniu2id ..'>'
	msg = msg ..'<Button|x=545.0|y=329.0|size=18|nimg=zh/3.png|color=255|submitInput=1,2|text=设置|link=@sysstrbianliangex,2,'.. anniu1id ..','.. anniu2id ..'>'
	return msg
end
function sysstrbianliangex(actor,caozuo,anniu1id,anniu2id)
	local bianliang = getconst(actor,'<$NPCINPUT(1)>')
	local bianliangzhi = getconst(actor,'<$NPCINPUT(2)>')
	
	if bianliang == "" then return sendmsg9(actor,"请输入变量") end
	
	if caozuo == "1" then
		sendmsg6(actor,"变量值："..getsysstr(bianliang))
		sendmsg9(actor,"查询成功","#00FFFF",2)
	else
		if bianliangzhi == "" then
			setsysstr(bianliang,"")
		else
			setsysstr(bianliang,bianliangzhi)
		end
		
		
		sendmsg9(actor,"设置成功","#00FFFF",2)
	end
end
-------系统str变量段结束

-------开区天数段
function kaiqutianshu(actor,anniu1id,anniu2id)
	local msg = ""
	msg = msg ..'<Text|x=304.0|y=85.0|color=255|size=18|text=开区时间戳：'.. getsysint("开区时间") ..'>'
	msg = msg ..'<Text|x=304.0|y=120.0|color=255|size=18|text=开区时间：'.. os.date("%Y年%m月%d日 %H:%M:%S",getsysint("开区时间")) ..'>'
	msg = msg ..'<Text|x=304.0|y=155.0|color=255|size=18|text=当前开区天数：'.. getkaiquday() ..'>'
	msg = msg ..'<Text|x=304.0|y=190.0|color=255|size=18|text=当前合区次数：'.. getsysint("合区次数") ..'>'
	msg = msg ..'<Text|x=304.0|y=225.0|color=255|size=18|text=最后合区天数：'.. getsysint("最后合区天数") ..'>'
	msg = msg ..'<Text|x=304.0|y=260.0|color=255|size=18|text=官方获取的合区次数：'.. getsysint("官方合区次数") ..'>'

	msg = msg ..'<Button|x=359.0|y=310.0|nimg=zh/3.png|color=255|size=18|text=加一天|link=@changetianshu,1,'.. anniu1id ..','.. anniu2id ..'>'
	msg = msg ..'<Button|x=525.0|y=310.0|size=18|nimg=zh/3.png|color=255|text=减一天|link=@changetianshu,2,'.. anniu1id ..','.. anniu2id ..'>'
	
	msg = msg ..'<Button|x=359.0|y=360.0|nimg=zh/3.png|color=255|size=18|text=加一小时|link=@changetianshu,3,'.. anniu1id ..','.. anniu2id ..'>'
	msg = msg ..'<Button|x=525.0|y=360.0|size=18|nimg=zh/3.png|color=255|text=减一小时|link=@changetianshu,4,'.. anniu1id ..','.. anniu2id ..'>'
	
	msg = msg ..'<Button|x=525.0|y=410.0|size=18|nimg=zh/3.png|color=255|text=重置开区时间|link=@changetianshu,5,'.. anniu1id ..','.. anniu2id ..'>'
	return msg
end

function changetianshu(actor,caozuo,anniu1id,anniu2id)
	if caozuo == "1" then
		setsysint("开区时间",getsysint("开区时间")-86400)
		sendmsg9(actor,"设置成功","#00FFFF",2)
	elseif caozuo == "2" then 
		setsysint("开区时间",getsysint("开区时间")+86400)
		sendmsg9(actor,"设置成功","#00FFFF",2)
	elseif caozuo == "3" then 
		setsysint("开区时间",getsysint("开区时间")-3600)
		sendmsg9(actor,"设置成功","#00FFFF",2)
	elseif caozuo == "4" then 
		setsysint("开区时间",getsysint("开区时间")+3600)
		sendmsg9(actor,"设置成功","#00FFFF",2)
	elseif caozuo == "5" then 
		setsysint("开区时间",os.time())
		sendmsg9(actor,"设置成功","#00FFFF",2)
	end
	return gmbox(actor,anniu1id,anniu2id)
end
-------开区天数段结束
-------刷装备段
local szbt = {"沃玛装备","祖玛装备","赤月装备","雷霆装备","天之雷霆","战神装备","狂战装备","玄铁装备","傲天装备","赤影装备","游龙装备","阿修罗套","法宝","斗笠","勋章","特殊","兽魂"}
local zbt = {
		["沃玛装备"]={"魔杖","生命项链","思贝儿手镯","红宝石戒指","银蛇","无极棍","天珠项链",
"心灵手镯","铂金戒指","炼狱","井中月","幽灵项链","幽灵手套","龙之戒指","铁腰带","鹿皮靴",},

["祖玛装备"]={"骨玉权杖","恶魔铃铛","龙之手镯","紫碧螺","龙纹剑","灵魂项链","三眼手镯","泰坦戒指","裁决之杖","绿色项链","骑士手镯","力量戒指","黑铁腰带","黑铁靴子","降魔腰带",
"降魔靴子","泰坦腰带","泰坦靴子",},

["赤月装备"]={"圣战头盔","圣战项链","圣战手镯","圣战戒指","法神头盔","法神项链","法神手镯","法神戒指","天尊头盔","天尊项链","天尊手镯","天尊戒指","天魔神甲","圣战宝甲",
"血饮","法神披风","霓裳羽衣","天尊道袍","天师长袍","圣战腰带","圣战靴子","法神腰带","法神靴子","天尊腰带","天尊靴子",},

["雷霆装备"]={"怒斩","龙牙","逍遥扇","雷霆腰带","雷霆战靴","烈焰魔靴","烈焰腰带","光芒道靴","光芒腰带","圣龙盔","雷霆项链","雷霆护腕","雷霆战戒","魔龙盔","烈焰项链",
"烈焰护腕","烈焰魔戒","天龙盔","光芒项链","光芒护腕","光芒道戒",},

["天之雷霆"]={"屠龙","嗜魂法杖","霸者之刃","雷霆战甲(男)","雷霆战甲(女)","烈焰魔衣(男)","烈焰魔衣(女)","光芒道袍(男)","光芒道袍(女)","天之圣龙盔","天之雷霆项链","天之雷霆护腕",
"天之雷霆战戒","天之雷霆腰带","天之雷霆战靴","天之魔龙盔","天之烈焰项链","天之烈焰护腕","天之烈焰魔戒","天之烈焰魔靴","天之烈焰腰带","天之天龙盔","天之光芒项链",
"天之光芒护腕","天之光芒道戒","天之光芒道靴","天之光芒腰带",},
["战神装备"]={
"黄金屠龙","战神头盔","战神项链","战神手镯","战神戒指","战神腰带","战神圣靴","紫金嗜魂法杖","圣魔头盔","圣魔项链","圣魔手镯","圣魔戒指","圣魔腰带","圣魔法靴","赤金逍遥扇","真魂头盔",
"真魂项链","真魂手镯","真魂戒指","真魂腰带","真魂道靴","奔雷战甲(男)","奔雷战甲(女)","怒焰魔衣(男)","怒焰魔衣(女)","极光道袍(男)","极光道袍(女)",},

["狂战装备"]={"上古鬼炎","真龙战甲","真龙战衣","狂战头盔","狂战项链","狂战手镯","狂战戒指","狂战腰带","狂战圣靴","火凤之舞","狂魔披风","狂魔雨衣","混世头盔","混世项链","混世手镯","混世戒指","混世腰带",
"混世法靴","绿玉无极","皓尊道袍","皓尊长袍","太极头盔","太极项链","太极手镯","太极戒指","太极腰带","太极道靴",},

["玄铁装备"]={"鬼斧屠戮","圣龙战甲","圣龙战衣","玄铁战盔","玄铁项链","玄铁手镯","玄铁戒指","玄铁腰带","玄铁战靴","聚灵法杖","魔龙披风","魔龙羽衣","风雷魔盔","风雷项链","风雷手镯","风雷戒指","风雷腰带",
"风雷魔靴","毒龙刺","御龙道袍","御龙道衣","蓝灵道盔","蓝灵项链","蓝灵手镯","蓝灵戒指","蓝灵腰带","蓝灵道靴",},

["傲天装备"]={"暗黑审判者","狂野战甲","狂野战衣","傲天々圣盔","傲天々圣链","傲天々圣镯","傲天々圣戒","傲天々圣带","傲天々圣靴","天行权杖","火凤之铠","火凰之铠","幻天々魔盔","幻天々魔链","幻天々魔镯",
"幻天々魔戒","幻天々魔带","幻天々魔靴","太极羽扇","天使之羽","天使之翼","玄天々道盔","玄天々道链","玄天々道镯","玄天々道戒","玄天々道带","玄天々道靴",},

["赤影装备"]={"传说:无影剑","鬼浮屠(男)","鬼浮屠(女)","赤影★圣盔","赤影★圣链","赤影★圣镯","赤影★圣戒","赤影★圣带","赤影★圣靴","传说:易水寒","冥火(男)","冥火(女)","焚天★魔盔","焚天★魔链",
"焚天★魔镯","焚天★魔戒","焚天★魔带","焚天★魔靴","传说:太乙扇","天罚(男)","天罚(女)","远古★道盔","远古★道链","远古★道镯","远古★道戒","远古★道带","远古★道靴",},

["游龙装备"]={"游龙ぬ锥心斩","游龙ぬ锥心甲","游龙ぬ锥心袍","游龙ぬ锥心盔","游龙ぬ锥心链","游龙ぬ锥心镯","游龙ぬ锥心戒","游龙ぬ锥心带","游龙ぬ锥心靴","咆哮ぬ怒吼杖","咆哮ぬ怒吼甲","咆哮ぬ怒吼袍",
"咆哮ぬ怒吼盔","咆哮ぬ怒吼链","咆哮ぬ怒吼镯","咆哮ぬ怒吼戒","咆哮ぬ怒吼带","咆哮ぬ怒吼靴","契约ぬ神罚剑","契约ぬ神罚甲","契约ぬ神罚袍","契约ぬ神罚盔","契约ぬ神罚链","契约ぬ神罚镯",
"契约ぬ神罚戒","契约ぬ神罚带","契约ぬ神罚靴",},

["阿修罗套"]={"阿修罗ぬ命运之殇","阿修罗ぬ神甲","阿修罗ぬ神袍","阿修罗ぬ神盔","阿修罗ぬ神链","阿修罗ぬ神镯","阿修罗ぬ神戒","阿修罗ぬ神带","阿修罗ぬ神靴","帝释天ぬ流星之陨","帝释天ぬ神甲","帝释天ぬ神袍",
"帝释天ぬ神盔","帝释天ぬ神链","帝释天ぬ神镯","帝释天ぬ神戒","帝释天ぬ神带","帝释天ぬ神靴","迦楼罗ぬ万剑归宗","迦楼罗ぬ神甲","迦楼罗ぬ神袍","迦楼罗ぬ神盔","迦楼罗ぬ神链","迦楼罗ぬ神镯",
"迦楼罗ぬ神戒","迦楼罗ぬ神带","迦楼罗ぬ神靴",},

["法宝"]={"断玉钩","混元凤凰珠","雷公锤","琉璃佩","妖魄之瞳","镇魂钟","崆峒印","炼妖壶","次顶级的法宝","玉净瓶","闪电五连鞭","番天印","震天箭",
"日照香炉","玄武盾","东皇钟","昆仑镜","蓝色的法宝","乾坤鼎","蜈蜂袋","五云离合圭","上古龙珠","混元金斗","补天石","孔雀翎","神农鼎",
"避水珠","蓝灵珠","日月珠","金光锉","绿色的法宝","伏龙鼎","紫金葫","太极符印","九炎枪","绿玉环","昊天塔","白色的法宝","金木鱼","降魔杵",
"天机镜","玉虚杏黄旗","混天绫","玉如意","六魂幡","紫符天录","生死簿","魔灵印","九天息壤","夔牛鼓","无量尺","南明离火",},

["斗笠"]= {"43号斗笠","44号斗笠","45号斗笠","黑铁斗笠","恶魔斗笠","泰坦斗笠","圣战斗笠","法神斗笠","天尊斗笠","雷霆斗笠","烈焰斗笠","光芒斗笠","天之雷霆斗笠","天之烈焰斗笠","天之光芒斗笠","战神斗笠","圣魔斗笠",
"真魂斗笠","狂战斗笠","混世斗笠","太极斗笠","玄铁斗笠","风雷斗笠","蓝灵斗笠","傲天々斗笠","幻天々斗笠","玄天々斗笠","猎魔人★斗笠(传说)","猎魔人★斗笠(神话)","猎魔人★斗笠(完美)","猎魔人★斗笠",},

["勋章"]= {"43号勋章","44号勋章","45号勋章","黑铁勋章","恶魔勋章","泰坦勋章","圣战勋章","法神勋章","天尊勋章","雷霆勋章","烈焰勋章","光芒勋章","天之雷霆勋章","天之烈焰勋章","天之光芒勋章","战神勋章","圣魔勋章",
"真魂勋章","狂战勋章","混世勋章","太极勋章","玄铁勋章","风雷勋章","蓝灵勋章","傲天々勋章","幻天々勋章","玄天々勋章","猎魔人★勋章(传说)","猎魔人★勋章(神话)","猎魔人★勋章(完美)","猎魔人★勋章",},
["特殊"]= {
"虹魔项链","虹魔手镯","虹魔戒指","吸血项链","吸血手镯","吸血戒指","魔血项链","魔血手镯","魔血戒指","怒血项链","怒血手镯","怒血戒指","祈祷头盔","祈祷项链",
"祈祷手镯","祈祷戒指","重击头盔","重击靴子","重击腰带","坚固的阎罗手套","1.1倍防御盔","1.2倍防御盔","破甲指环","记忆头盔","记忆项链","降妖除魔镯","降妖除魔戒",
"打野盔","魔鬼头盔","魔鬼腰带","魔鬼靴子","暴君头盔","暴君腰带","暴君靴子","祝福项链(封印)","上帝之吻","后羿之光","死神戒指","龙渊戒指","狂风项链","狂风戒指","疾风项链(封印)",
"疾风戒指(封印)","白色虎齿项链","辟邪手镯","躲避手链","夏普尔手镯","幽灵戒指","降魔之靴(封印)","降魔之带(封印)","神秘头盔","神秘腰带","神秘戒指","炼狱戒指","记忆戒指","恶魔戒指",
"炼狱手镯","记忆手镯","恶魔手镯","黑铁项链","黑铁戒指","黑铁手镯","泰坦圣靴","泰坦圣带","天威ぁ龙源戒","天威ぁ龙源镯","天威ぁ龙源靴","天威ぁ龙源带","天威ぁ龙源盔","天威ぁ龙源链",
"天命ぁ赤霄戒","天命ぁ赤霄镯","天命ぁ赤霄靴","天命ぁ赤霄带","天命ぁ赤霄盔","天命ぁ赤霄链","天机ぁ无尘戒","天机ぁ无尘镯","天机ぁ无尘靴","天机ぁ无尘带","天机ぁ无尘盔","天机ぁ无尘链",
"涅槃菩提戒","涅槃菩提镯","涅槃菩提靴","涅槃菩提带","涅槃菩提盔","涅槃菩提链","聚魔觉醒戒","聚魔觉醒镯","聚魔觉醒靴","聚魔觉醒带","聚魔觉醒盔","聚魔觉醒链",	},
	
["兽魂"]= {
	"稻草人","多钩猫","红蛇","食人花","毒蜘蛛","森林雪人","巨型多角虫","半兽统领","沃玛勇士","沃玛护卫","火焰沃玛","沃玛战将","祖玛弓箭手","祖玛雕像","祖玛卫士","祖玛教主","红野猪","邪恶毒蛇",
	"白野猪","触龙神","虹魔蝎卫","虹魔猪卫","千年树妖","虹魔教主","骷髅长枪兵","骷髅锤兵","骷髅刀斧手","牛魔战士","牛魔法师","牛魔祭司","牛魔将军","牛魔王","钢牙蜘蛛","天狼蜘蛛","黑锷蜘蛛",
	"花吻蜘蛛","血影巨人","双头金刚","双头血魔","赤月恶魔","魔龙邪眼","魔龙血蛙","魔龙射手","魔龙刀兵","魔龙战将","魔龙力士","魔龙巨蛾","魔龙教主",
	},
}


function shuazhuangbei(actor,anniu1id,anniu2id)
	local msg = ""
	for i = 1,#szbt do
		msg = msg ..'<Button|x='.. 290 + 150 * ((i-1)%3) ..'|y='.. 100 + 50 * math.floor((i-1)/3) ..'|size=18|nimg=zh/3.png|color=255|outline=2|text='..szbt[i]..'|link=@zb_zhizao,'.. szbt[i] ..'>'	
	end
	msg = msg ..'<Button|x=600|y=400|size=18|nimg=zh/3.png|color=255|outline=2|text=清理背包|link=@zb_clearbag>'	
	return msg
end
function zb_clearbag(actor)
	gmexecute(actor,"clearbag")
end
function zb_zhizao(actor,par)
	local t = zbt[par]
	for i = 1,#t do
		giveitem(actor,t[i],1)
	end
end
-------刷装备段结束

-------开启攻城段
function kaiqigongcheng(actor,anniu1id,anniu2id)
	local msg = ""
	if castleinfo(5) then
		msg = msg ..'<Text|x=304.0|y=85.0|color=255|size=18|text=攻城状态：攻城中 >'
		msg = msg ..'<Button|x=359.0|y=310.0|nimg=zh/3.png|color=255|size=18|text=停止攻城|link=@kaiqigongchengex,'.. anniu1id ..','.. anniu2id ..'>'
	else
		msg = msg ..'<Text|x=304.0|y=85.0|color=255|size=18|text=攻城状态：未攻城 >'
		msg = msg ..'<Button|x=359.0|y=310.0|nimg=zh/3.png|color=255|size=18|text=开始攻城|link=@kaiqigongchengex,'.. anniu1id ..','.. anniu2id ..'>'
	end
	return msg
end

function kaiqigongchengex(actor,anniu1id,anniu2id)
	addattacksabakall()
	gmexecute(0,"gongcheng")
	delaymsggoto(actor,1000,"gmbox,"..anniu1id..","..anniu2id)
	return
end
-------开启攻城段结束

---极品属性操作
function jipinshuxingcaozuo(actor,anniu1id,anniu2id)
	local msg = [[
	<Text|x=320.0|y=181.0|color=255|size=18|text=属性大类>
	<Text|x=320.0|y=226.0|color=255|size=18|text=属性id>
	<Text|x=320.0|y=272.0|size=18|color=255|text=属性值>
	<Img|x=411.0|y=174.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=219.0|img=zh/30.png|esc=0>
	<Img|x=411.0|y=265.0|img=zh/30.png|esc=0>
	<Input|x=415.0|y=176.0|width=180|height=25|color=255|type=0|inputid=1|size=16>
	<Input|x=415.0|y=221.0|width=180|height=25|color=255|type=0|inputid=2|size=16>
	<Input|x=415.0|y=267.0|width=180|height=25|color=255|type=0|inputid=3|size=16>
	<ITEMBOX|x=469.0|y=80.0|width=70|height=70|boxindex=0|stdmode=*|boxindex=0|img=public/1900000651_3.png>
	<Text|x=320.0|y=380.0|color=255|size=18|text=自定义属性值>
	<Img|x=411.0|y=373.0|img=zh/30.png|esc=0>
	<Input|x=415.0|y=376.0|width=180|height=25|color=255|type=0|size=16|inputid=4>
	<Button|x=320.0|y=408.0|width=140|size=18|color=255|nimg=zhangheng/13.png|submitInput=4|text=查询自定义属性|link=@zidingshicaozuo,1>
	<Button|x=519.0|y=408.0|width=140|size=18|color=255|nimg=zhangheng/13.png|submitInput=4|text=设置自定义属性|link=@zidingshicaozuo,2>

	]]
	msg = msg ..'<Button|x=341.0|y=329.0|nimg=zh/3.png|color=255|size=18|submitInput=1,2|text=查询|link=@jipinshuxingex,1>'
	msg = msg ..'<Button|x=545.0|y=329.0|size=18|nimg=zh/3.png|color=255|submitInput=1,2,3|text=设置|link=@jipinshuxingex,2>'
	
	msg = msg ..'<Button|x=545.0|y=449.0|size=18|nimg=zh/3.png|color=255|submitInput=1|text=设置持久|link=@shezhichijiu>'
	return msg
end
function zidingshicaozuo(actor,caozuo)
	callscriptex(actor, "SetUpgradeItem", 0)
	local item = linkbodyitem(actor,-1)
	
	local jsonstr = getconst(actor,'<$NPCINPUT(4)>')
	if caozuo == "1" then
		local str = getitemcustomabil(actor,item)
		sendmsg6(actor,"自定义属性 "..str)
	else
		setitemcustomabil(actor,item,jsonstr)
	end
end

function shezhichijiu(actor)
	callscriptex(actor, "SetUpgradeItem", 0)
	local item = linkbodyitem(actor,-1)
	local chijiu = tonumber(getconst(actor,'<$NPCINPUT(1)>'))
	sendmsg6(actor,"持久"..chijiu)
	
	--ChangeItemDura 0 = 10000 0
	callscriptex(actor, "ChangeItemDura", -1, "=",chijiu*1000)
	--local makeid = getiteminfo(actor,item,1)
	--setdura(actor,makeid,"=",chijiu * 1000)
	sendmsg9(actor,"设置成功","#00FFFF",2)
end


function jipinshuxingex(actor,caozuo,anniu1id,anniu2id)
	--sendmsg9(actor,"ddd")
		callscriptex(actor, "SetUpgradeItem", 0)
		local item = linkbodyitem(actor,-1)
		local attlei = getconst(actor,'<$NPCINPUT(1)>')
		local attid = getconst(actor,'<$NPCINPUT(2)>')
		local attid_zhi = getconst(actor,'<$NPCINPUT(3)>')

		if attlei == "" then return sendmsg9(actor,"请输入属性id") end
		if attid == "" then return sendmsg9(actor,"请输入属性id") end
		if caozuo == "1" then
			sendmsg6(actor,"属性："..getitemaddvalue(actor,item,tonumber(attlei),tonumber(attid)))
			sendmsg9(actor,"查询成功","#00FFFF",2)
		else
			if attid_zhi == "" then return sendmsg9(actor,"请输入属性值") end
			setitemaddvalue(actor,item,tonumber(attlei),tonumber(attid),tonumber(attid_zhi))
			sendmsg9(actor,"设置成功","#00FFFF",2)
		end
	
end


------清理元宝命令
function usercmd2(actor)
	local yuanbao = getingot(actor)
	if yuanbao < 1 then
		sendmsg9(actor,"你没有元宝")
		return
	end
	subingot(actor,yuanbao)
	
	post(actor,"充值了".. getint(actor,"累计充值") .."元，今日充值"..getdayint(actor,"今日充值").." 清理了注册元宝*".. yuanbao .."个")
end

local keyong = {
	["12407275"] = 1,["13216418"] = 1,["18936379"] = 1,
	["19313238"] = 1,
	["25891743"] = 1, ["9071622"] = 1, ["5225660"] = 1, ["10202743"] = 1,
	}
-----监狱
function usercmd3(actor,name)
	if not keyong[getconst(actor,"<$USERACCOUNT>")] then
		return
	end
	if not name then
		return
	end
	local player = getplayerbyname(name)
	if player then
		map(player,"waigua")
	end
end

----查组队信息
function usercmd4(actor)
	if not keyong[getconst(actor,"<$USERACCOUNT>")] then
		return
	end
	local t=getplayerlst() --玩家列表
	for i = 1,#t do
		local str = ""
		local player = t[i] --玩家
		local duizhangname = getconst(player,"<$TEAM0>") --队长名
		if getname(player) == duizhangname then
			local duiyuant = getgroupmember(player)
			local bh = 1
			for j = 1,#duiyuant do
				str = str .. "队员"..bh .." ".. getname(duiyuant[j]) .. " "..getbaseinfo(duiyuant[j],45) .." PK值 "..getbaseinfo(duiyuant[j],46)	.." 充值 "..getint(duiyuant[j],"累计充值")	.." "
				bh = bh + 1
			end
		end
		if str ~= "" then
			sendmsg6(actor,str)
		end
	end
	
end