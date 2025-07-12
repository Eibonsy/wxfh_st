include("Market_Def/zh.lua") --个人封装函数
local shousha_anniu = {"首杀奖励","升级奖励","掉落查询","重金奖励"}

local shousha_t = {
	{mapid="d609",mapname="蜈蚣洞穴",	monname="暗之触龙神",	yb=1000},
	{mapid="d024",mapname="沃玛寺庙",	monname="蚩尤之主",		yb=1000},
	{mapid="d021",mapname="沃玛神殿",	monname="盘丝大仙",		yb=3000},
	{mapid="d515",mapname="祖玛寺庙",	monname="远古祖玛教父",	yb=1000},
	{mapid="zmjt",mapname="祖玛祭坛",	monname="玛法判官",		yb=3000},
	{mapid="jxdt",mapname="石墓猪洞",	monname="镜像魔王",		yb=1000},
	{mapid="jxdt",mapname="石墓猪洞",	monname="镜像之主",		yb=3000},
	{mapid="d2079",mapname="牛魔寺庙",	monname="谛听兽",		yb=1000},
	{mapid="qlsy",mapname="潜龙深渊",	monname="上古谛听",		yb=3000},
	{mapid="d2067",mapname="骨魔洞穴",	monname="不朽帝皇",		yb=1000},
	{mapid="hqsy",mapname="黄泉深渊",	monname="不朽大帝",		yb=3000},
	{mapid="d2013",mapname="封魔殿堂",	monname="封魔冥界教父",	yb=1000},
	{mapid="d2001",mapname="通天之路",	monname="通天教主",		yb=3000},
	{mapid="dm002",mapname="国王陵墓",	monname="秦始皇",		yb=5000},
	{mapid="d10062",mapname="赤月峡谷",	monname="远古赤月恶魔",	yb=1000},
	{mapid="yhsd",mapname="烟花神殿",	monname="烟花教主",		yb=5000},
	{mapid="66",mapname="魔龙岭",		monname="暗之魔龙教主",	yb=1000},
	{mapid="mld",mapname="魔龙殿",		monname="邪魔统帅",		yb=3000},
	{mapid="pgjd",mapname="盘古禁地",	monname="盘古大帝",		yb=3000},
	{mapid="hlsd",mapname="火龙神殿",	monname="火龙神",		yb=5000},
	{mapid="h204",mapname="沙藏宝阁",	monname="地藏魔王",		yb=3000},
	{mapid="d10071",mapname="万恶之源",	monname="万恶之主",		yb=3000},
	{mapid="maya4",mapname="玛雅皇宫",	monname="玛雅守护神",	yb=3000},
	{mapid="wlsz",mapname="卧龙山庄",	monname="卧龙庄主",		yb=5000},
	{mapid="qxt5",mapname="七星塔",		monname="七星神王",		yb=5000},
	{mapid="wzad",mapname="未知暗殿",	monname="未知巨魔",		yb=1000},
	{mapid="wzad",mapname="未知暗殿",	monname="未知教主",		yb=1000},
	{mapid="wzad",mapname="未知暗殿",	monname="破面",			yb=5000},
	{mapid="mhyj3",mapname="蛮荒遗迹",	monname="蛮荒永恒剑圣",	yb=5000},
	{mapid="lzsy3",mapname="龙之神域",	monname="神域审判者",	yb=5000},
	{mapid="txmk3",mapname="铁血魔窟",	monname="洪荒烛九阴",	yb=5000},
	{mapid="dlsy4",mapname="堕落深渊",	monname="深渊裂天兕",	yb=5000},
	{mapid="thg4",mapname="桃花谷",		monname="桃花恶魔领袖",	yb=5000},
	{mapid="ymgm3",mapname="幽冥古墓",	monname="幽冥暗月魔尊",	yb=10000},
	{mapid="rydy4",mapname="熔岩地狱",	monname="地狱炎魔霸主",	yb=10000},
	
}

local shengjijiangli_t = {
	{dengji=40,jinbi=10000,item={"一级金针",5}},
	{dengji=42,jinbi=20000,item={"神兽之角",5}},
	{dengji=44,jinbi=40000,item={"书页",2}},
	{dengji=46,jinbi=60000,item={"疏筋活络丸",2}},
	{dengji=48,jinbi=80000,item={"兽魂蛋",2}},
	{dengji=50,jinbi=100000,item={"紫水晶矿",40}},
	{dengji=52,jinbi=120000,item={"紫水晶矿",60}},
	{dengji=54,jinbi=150000,item={"紫水晶矿",80}},
	{dengji=56,jinbi=200000,item={"紫水晶矿",100}},
}

function show(actor,anniuid,curye,xianshi)
	xianshi = tonumber(xianshi) or 0
	anniuid = tonumber(anniuid) or 1
	curye = tonumber(curye) or 1
	local msg = [[
	<Img|x=0|width=646|height=473|show=4|scale9r=50|scale9t=50|bg=1|scale9b=50|move=1|scale9l=50|loadDelay=0|esc=1|img=zhangheng/1.png|reset=0>
	<Button|x=642.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
	]]
	
	if anniuid == 1 then
		local zongye = math.ceil(#shousha_t/6)
		msg = msg ..'<Img|x=16.5|y=38.5|img=zhangheng/246.png|esc=0>'
		msg = msg ..'<Img|x=128.5|y=39.5|width=498|esc=0|img=zhangheng/247.png>'
		msg = msg ..'<Text|ay=0.5|x=258.5|y=424.5|color=250|size=18|text=上一页|link=@fanye,'.. curye - 1 ..'>'
		msg = msg ..'<Text|ax=0.5|ay=0.5|x=374.5|y=424.5|color=255|size=18|text='.. curye ..'/'.. zongye ..'>'
		msg = msg ..'<Text|ay=0.5|x=432.0|y=425.0|color=250|size=18|text=下一页|link=@fanye,'.. curye + 1 ..'>'
		
		local xuhao = 1
		local pyy = 39.5
		for i = 1+(curye-1)*6,6+(curye-1)*6 do
			local t = shousha_t[i]
			if t then	
				msg = msg ..'<RText|a=4|x=191|y='.. 173+13 +(xuhao-1)*pyy ..'|size=16|color=255|outline=1|text=<'.. shousha_t[i].mapname ..'/FCOLOR=161>>'
				msg = msg ..'<RText|a=4|x=315|y='.. 173+13 +(xuhao-1)*pyy ..'|size=16|color=255|outline=1|text=<'.. shousha_t[i].monname ..'/FCOLOR=150>>'	
				msg = msg ..'<RText|a=4|x=437|y='.. 173+13 +(xuhao-1)*pyy ..'|size=16|color=255|outline=1|text=<'.. shousha_t[i].yb ..'/FCOLOR=242>>'	
				if getsysint(shousha_t[i].monname) == 1 then
					msg = msg ..'<RText|a=4|x=561.0|y='.. 173+13 +(xuhao-1)*pyy ..'|size=16|color=255|outline=1|text=<已击杀/FCOLOR=249>>'
				else
					msg = msg ..'<RText|a=4|x=561.0|y='.. 173+13 +(xuhao-1)*pyy ..'|size=16|color=255|outline=1|text=<未击杀/FCOLOR=250>>'
				end
				xuhao = xuhao + 1
			end
		end
	end
	if anniuid == 2 then
		msg = msg ..'<Img|x=16.5|y=38.5|img=zhangheng/249.png|esc=0>'
		msg = msg ..'<Img|x=128.5|y=39.5|width=498|esc=0|img=zhangheng/250.png>'
		msg = msg ..'<ListView|children={1,2,3,4,5,6,7,8,9,10}|x=129.0|y=128.5|width=500|height=318|bounce=0|reload=0|margin=2|direction=1|loadDelay=0>'
		for i = 1,9 do
			local zis = "name"..i..",".."kuang1"..i..",".."wupin1"..i..",".."kuang2"..i..",".."wupin2"..i..",".."anniu"..i
			msg = msg ..'<Img|id='.. i ..'|children={'..zis..'}|img=zhangheng/251.png>'
			--msg = msg ..'<Img|id=name'.. i ..'|img=zhangheng/251.png>'
			msg = msg ..'<Text|ay=0.5|id=name'.. i ..'|x=30|y=14|outline=2|text=人物'.. shengjijiangli_t[i].dengji ..'级奖励|color=250|size=16>'
			msg = msg ..'<Img|id=kuang1'.. i ..'|x=138.0|y=31.0|img=zhangheng/231.png|esc=0>'
			msg = msg ..'<ItemShow|id=wupin1'.. i ..'|x=132.0|y=26.0|width=70|height=70|itemid='.. getidbyname("金币") ..'|itemcount='.. shengjijiangli_t[i].jinbi ..'|showtips=1|bgtype=0>'
			msg = msg ..'<Img|id=kuang2'.. i ..'|x=236.0|y=31.0|img=zhangheng/231.png|esc=0>'
			msg = msg ..'<ItemShow|id=wupin2'.. i ..'|x=230.0|y=26.0|width=70|height=70|itemid='.. getidbyname(shengjijiangli_t[i].item[1]) ..'|itemcount='.. shengjijiangli_t[i].item[2] ..'|showtips=1|bgtype=0>'
			if getint(actor,"等级奖励"..shengjijiangli_t[i].dengji) == 1 then
				msg = msg ..'<Button|id=anniu'.. i ..'|x=372.0|y=41.0|color=10051|size=18|nimg=zhangheng/13.png|text=已领取>'
			else
				msg = msg ..'<Button|id=anniu'.. i ..'|x=372.0|y=41.0|color=10051|size=18|nimg=zhangheng/13.png|text=领取奖励|link=@lingqudengji,'.. i ..'>'
			end
		end
		
	end
	if anniuid == 3 then
		local geshu = 6
		local diaoluot = getdiaoluodata()
		local zongye = math.ceil(#diaoluot/geshu)
		if zongye == 0 then
			zongye = 1
		end
		msg = msg ..'<Img|x=16.5|y=38.5|img=zhangheng/323.png>'
		msg = msg ..'<Img|x=128.5|y=39.5|width=498|esc=0|img=zhangheng/322.png>'
		msg = msg ..'<Text|ay=0.5|x=258.5|y=424.5|color=250|size=18|text=上一页|link=@fanye1,'.. curye - 1 ..'>'
		msg = msg ..'<Text|ax=0.5|ay=0.5|x=374.5|y=424.5|color=255|size=18|text='.. curye ..'/'.. zongye ..'>'
		msg = msg ..'<Text|ay=0.5|x=432.0|y=425.0|color=250|size=18|text=下一页|link=@fanye1,'.. curye + 1 ..'>'
		msg = msg ..'<Button|x=589.0|y=411.5|nimg=zhangheng/8.png|pimg=zhangheng/8.png|link=@show,'..anniuid..','..curye..',1>'

		local xuhao = 1
		local pyy = 39.5
		for i = 1+(curye-1)*geshu,geshu+(curye-1)*geshu do
			local t = diaoluot[i]
			if t then
				--msg = msg ..'<RText|x=134.0|y='.. 132 +(xuhao-1)*pyy ..'|color='..t.yanse..'|size=16|text='..t.shijian..' '..t.ditu..'的'..t.guaiwu..'爆出了'..t.wupin..'>'
				msg = msg ..'<RText|a=4|x=180|y='.. 173+13 +(xuhao-1)*pyy ..'|size=16|color=255|outline=1|text=<'.. t.shijian ..'/FCOLOR=161>>'
				msg = msg ..'<RText|a=4|x=286|y='.. 173+13 +(xuhao-1)*pyy ..'|size=16|color=255|outline=1|text=<'.. t.ditu ..'/FCOLOR=150>>'	
				msg = msg ..'<RText|a=4|x=390|y='.. 173+13 +(xuhao-1)*pyy ..'|size=16|color=255|outline=1|text=<'.. t.guaiwu ..'/FCOLOR=242>>'	
				if #t.wupin > 8 then
					msg = msg ..'<RText|a=4|x=581.0|y='.. 173+13 +(xuhao-1)*pyy ..'|size=16|color=255|scrollWidth=64|outline=1|text=<'..t.wupin..'/FCOLOR='.. t.yanse ..'>>'
				else
					msg = msg ..'<RText|a=4|x=581.0|y='.. 173+13 +(xuhao-1)*pyy ..'|size=16|color=255|outline=1|text=<'..t.wupin..'/FCOLOR='.. t.yanse ..'>>'
				end
				if t.name then
					--msg = msg ..'<RText|a=4|x=691.0|y='.. 173+13 +(xuhao-1)*pyy ..'|size=16|color=255|outline=1|text=<'..t.name..'/FCOLOR=251>>'
					if #t.name > 10 then				
						msg = msg ..'<RText|a=4|x=490.0|y='.. 173+13 +(xuhao-1)*pyy ..'|size=16|color=255|scrollWidth=90|outline=1|text=<'..t.name..'/FCOLOR=251>>'
					else
						msg = msg ..'<RText|a=4|x=490.0|y='.. 173+13 +(xuhao-1)*pyy ..'|size=16|color=255|outline=1|text=<'..t.name..'/FCOLOR=251>>'
					end
				end
				xuhao = xuhao + 1
			end
		end
	end
	
	if anniuid == 4 then
		msg = msg ..'<Img|x=16.5|y=38.5|img=zhangheng/249.png|esc=0>'
		msg = msg ..'<Img|x=128.5|y=38.5|width=498|esc=0|img=zhangheng/325.png>'	
		msg = msg ..[[
		
		<RText|x=145.0|y=145.0|width=480|size=18|color=255|text=如发现有玩家通过私聊或者<交流几天感情后进行洗脑诱导/FCOLOR=254>，>
		<RText|x=145.0|y=175.0|width=480|size=18|color=255|text=诋毁，抹黑本服务器的方式然后喊你一起换服的切勿相信。>
		<RText|x=145.0|y=205.0|width=480|size=18|color=255|text=下载对方提供的游戏链接会导致支付宝微信中<木马病毒/FCOLOR=250>.>
		<RText|x=145.0|y=235.0|width=480|size=18|color=255|text=里面的钱财会被洗劫一空，甚至有的拉个微信群几十个人>
		<RText|x=145.0|y=265.0|width=480|size=18|color=255|text=里面其实只有自己一个真人，<其他都是骗子/FCOLOR=253>，发现此类情>
		<RText|x=145.0|y=295.0|width=480|size=18|color=255|text=况向专属客服举报可获得被举报者身上50%价值的物品奖>
		<RText|x=145.0|y=325.0|width=480|size=18|color=255|text=励，请玩家切勿上当受骗>
		]]
		
		if getint(actor,"重大奖励红点") == 1 then
			setint(actor,"重大奖励红点",0)
			callscriptex(actor, "CallLua", "QFunction-0", "@tubiaoxianshi")
		end
	end
	
	for i = 1,#shousha_anniu do
		if i == anniuid then
			msg = msg ..'<Button|x=20.0|y='.. 40+(i-1)*50 ..'|width=104|size=18|nimg=zhangheng/248.png|pimg=zhangheng/248.png|color=250|outline=2|text='..shousha_anniu[i]..'>'
		else
			msg = msg ..'<Button|x=20.0|y='.. 40+(i-1)*50 ..'|width=104|size=18|nimg=zhangheng/248.png|pimg=zhangheng/248.png|color=7|outline=2|text='..shousha_anniu[i]..'|link=@show,'.. i ..'>'
		end
		if i == 2 and dengjihongdian(actor) then
			msg = msg .. '<Img|x=110.0|y='.. 40+(i-1)*50 ..'|img=zh/100.png|esc=0>'
		end
		if i == 4 and getint(actor,"重大奖励红点") == 1 then
			msg = msg .. '<Img|x=110.0|y='.. 40+(i-1)*50 ..'|img=zh/100.png|esc=0>'
		end
	end
	
	if xianshi == 1 then
		msg=msg..'<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@show,'..anniuid..','..curye..'>'
		msg =msg..[[
		<Img|ay=0.5|x=233.0|y=371.5|width=350|height=140|scale9t=10|scale9l=10|img=zh/7.png|scale9r=10|esc=0|scale9b=10>
<RText|x=245.0|y=315.5|width=344|size=16|color=255|text=⒈<掉落物品/FCOLOR=250>显示是根据<怪物击杀者/FCOLOR=251>来显示的>
<RText|x=261.0|y=337.5|width=344|size=16|color=255|text=<并不代表装备拾取者/FCOLOR=254>，击杀后可能出现掉>
<RText|x=261.0|y=359.5|width=344|size=16|color=255|text=线被抢，未拾取等情况，所以特此声明....>
<RText|x=245.0|y=390.5|width=344|size=16|color=255|text=⒉本服<所有BOSS均可掉落终极装备/FCOLOR=253>以及特殊>
<RText|x=261.0|y=412.5|width=344|size=16|color=255|text=顶级装备，一切装备凭运气获得，公平公正>

		]]
	end
	
	
	say(actor,msg)
end

function lingqudengji(actor,par)
	par = tonumber(par)
	if getint(actor,"等级奖励"..shengjijiangli_t[par].dengji) == 1 then
		sendmsg9(actor,"你已经领取过此等级奖励")
		return
	end
	if getlevel(actor) < shengjijiangli_t[par].dengji then
		sendmsg9(actor,"等级不足")
		return
	end
	addbindgold(actor,shengjijiangli_t[par].jinbi)
	giveitem(actor,shengjijiangli_t[par].item[1],shengjijiangli_t[par].item[2],370)
	setint(actor,"等级奖励"..shengjijiangli_t[par].dengji,1)
	sendmsg9(actor,"领取成功")
	callscriptex(actor, "CallLua", "youshangtubiao", "@tubiaoxianshi")
	return show(actor,2)
end

function fanye(actor,par)
	par = tonumber(par)
	local zongye = math.ceil(#shousha_t/6)
	if par < 1 or par > zongye then
		return
	end
	return show(actor,1,par)
end

function fanye1(actor,par)
	local geshu = 6
	par = tonumber(par)
	local diaoluot = getdiaoluodata()
	local zongye = math.ceil(#diaoluot/geshu)
	if zongye == 0 then
		zongye = 1
	end
	if par < 1 or par > zongye then
		return
	end
	return show(actor,3,par)
end
