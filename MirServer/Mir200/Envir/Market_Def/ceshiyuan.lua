include("Market_Def/zh.lua") --个人封装函数

local shouhunbt = {
"反弹","屠魔者","侠肝义胆","天选之子","逝水","威势","减伤","毒上加伤","无义","强者恒强","情非得以","鼓舞","生财","枯木逢春","强攻","看破红尘","迟缓","神佑",
"疗伤","聚魔","诅咒术","正义之师","迷魂阵","同甘共苦","独揽大权","打宝者","赤膊上阵","强身健体","龙的传人","有舍有得","天星术","荣誉之光","暴伤减免","步步高升",
"蛊毒术","风驰电掣","法外狂徒","黎明","聚宝术","免疫","格挡术","噬魂决","早晚出事","救死扶伤","暗夜","争强好胜","相濡以沫","舍生取义","躲避术","为民除害",
"威摄","越死越强","利刃","多财多伤","等级压制","玉石俱焚",
"铁骨铮铮","雷霆一击","风之守护","召唤天火","震摄反杀","一手遮天","吸蓝大法","披荆斩棘","越战越勇","自作自受","称王称霸","高级格挡术",
"降维打击","沙城霸主","扫黑除恶","对怪麻痹","打野无忧","意外惊喜","唯我独尊","复仇之怒","绝处逢生","枊暗花明","有仇必报","百战之躯","斗转星移",
"自讨苦吃","金戈铁马","同根相煎","破伤之风","背水一战","转身压制","障眼之法","莽夫之怒","状态虚弱","破釜沉舟","年少得志","百炼成钢",
"横行霸道","职业克制","坚韧不拔","金刚不坏","酒后狂徒","流星之熵","逐日之熵","噬血之熵"
}


local wupins={
	"金木鱼","降魔杵","天机镜","玉虚杏黄旗","混天绫","玉如意","六魂幡","紫符天录","生死簿","魔灵印","九天息壤","夔牛鼓","无量尺","南明离火",
	"伏龙鼎","紫金葫","太极符印","九炎枪","绿玉环","昊天塔",
	"乾坤鼎","蜈蜂袋","五云离合圭","上古龙珠","混元金斗","补天石","孔雀翎","神农鼎","避水珠","蓝灵珠","日月珠","金光锉",
	"玉净瓶","闪电五连鞭","番天印","震天箭","日照香炉","玄武盾","东皇钟","昆仑镜",
	"断玉钩","混元凤凰珠","雷公锤","琉璃佩","妖魄之瞳","镇魂钟","崆峒印","炼妖壶",
}

function show1(actor)
	local msg = [[
		<Img|x=0|width=923|height=487|esc=1|loadDelay=1|bg=1|img=zhangheng/1.png|move=1|reset=1|show=4>
		<Button|x=919.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
	]]
	for i = 1,#wupins do
		if i >= 41 then
			msg = msg ..'<Text|x='.. 30 + (i-1)%7*125 ..'|y='.. 42+math.floor((i-1)/7) * 38 ..'|color=249|size=16|text='.. wupins[i] .."：" .. getint(actor,"抽奖数量"..wupins[i])  ..'>'
		elseif i >= 33 then
			msg = msg ..'<Text|x='.. 30 + (i-1)%7*125 ..'|y='.. 42+math.floor((i-1)/7) * 38 ..'|color=250|size=16|text='.. wupins[i] .."：" .. getint(actor,"抽奖数量"..wupins[i])  ..'>'
		else
			msg = msg ..'<Text|x='.. 30 + (i-1)%7*125 ..'|y='.. 42+math.floor((i-1)/7) * 38 ..'|color=255|size=16|text='.. wupins[i] .."：" .. getint(actor,"抽奖数量"..wupins[i])  ..'>'
		end
	end
	msg = msg ..'<Text|x=363.5|y=428.5|color=255|size=18|text=抽奖次数：'.. getint(actor,"印记抽奖次数") ..'|link=@qingling>'
	say(actor,msg)
end

function qingling()
	for i = 1,#wupins do
		setint(actor,"抽奖数量"..wupins[i],0)
	end
	setint(actor,"印记抽奖次数",0)
	return show(actor)
end

function show(actor)
	local msg = [[
		<Img|x=0|width=923|height=487|esc=1|loadDelay=1|bg=1|img=zhangheng/1.png|move=1|reset=1|show=4>
		<Button|x=919.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>

	]]
	for i = 1,#shouhunbt do
		msg = msg ..'<Button|x='.. 30 + (i-1)%10*86 ..'|y='.. 42+math.floor((i-1)/10) * 38 ..'|nimg=zhangheng/13.png|size=14|color=255|text='.. i .." " ..shouhunbt[i] ..'|link=@xiugai,'..i..'>'
	end
	
	msg = msg ..'<Text|x=133.5|y=428.5|color=255|size=18|text=魂技：'.. getshouhunbuffdata(actor)[1] ..'>'
	msg = msg ..'<Button|x=296.5|y=417.5|nimg=zhangheng/13.png|color=255|size=18|text=加冰冻|link=@setzhuangtai,冰冻测试,1>'
	msg = msg ..'<Button|x=391.5|y=417.5|size=18|nimg=zhangheng/13.png|color=255|text=清冰冻|link=@setzhuangtai,冰冻测试,0>'
	msg = msg ..'<Button|x=496.5|y=417.5|nimg=zhangheng/13.png|color=255|size=18|text=加麻痹|link=@setzhuangtai,麻痹测试,1>'
	msg = msg ..'<Button|x=591.5|y=417.5|size=18|nimg=zhangheng/13.png|color=255|text=清麻痹|link=@setzhuangtai,麻痹测试,0>'
	msg = msg ..'<Button|x=689.5|y=417.5|size=18|nimg=zhangheng/13.png|color=255|text=加蛛网|link=@setzhuangtai,蛛网测试,1>'
	msg = msg ..'<Button|x=789.5|y=416.5|size=18|nimg=zhangheng/13.png|color=255|text=清蛛网|link=@setzhuangtai,蛛网测试,0>'

	say(actor,msg)
end

function setzhuangtai(actor,bianliang,zhi)
	setint(actor,bianliang,tonumber(zhi))
	sendmsg9(actor,"设置成功")
end

function xiugai(actor,par)
	par = tonumber(par)
	local str = '["'.. shouhunbt[par] ..'","","","","",""]'
	setstr(actor,"兽魂buff数据",str)
	return show(actor)
end

function getshouhunbuffdata(actor) --获取兽魂buff数据
	local data = {"","","","","",""}
	local sh_str = getstr(actor,"兽魂buff数据")
	if sh_str ~= "" then
		data=json2tbl(sh_str)
	end
	return data
end