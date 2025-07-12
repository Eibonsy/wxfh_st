include("Market_Def/zh.lua") --个人封装函数

local items = {
	{xqitem = {"九穗禾",5},jiangli = {{"金币",200000}},},
	{xqitem = {"怀梦草",5},jiangli = {{"金币",200000}},},
	{xqitem = {"紫罗兰",5},jiangli = {{"金币",200000}},},
	{xqitem = {"幽冥花",5},jiangli = {{"金币",200000}},},
	{xqitem = {"不死草",5},jiangli = {{"金币",200000}},},
	{xqitem = {"人参果树",5},jiangli = {{"金币",200000}},},
	{xqitem = {"护心莲",1},jiangli = {{"仙剑·酒葫芦",1},{"酒剑仙的推荐信",1}},},
}

function show(actor)
	if getsysint("合区次数") == 0 then
		sendmsg9(actor,"合区后开放")
		return
	end
	
	local renwujindu = getint(actor,"酒剑仙任务编号")
	local showid = renwujindu + 1
	if renwujindu >= 7 then
		sendmsg9(actor,"您已经拥有【仙剑·酒葫芦】")
		return
	end
	local msg = [[
	<Img|x=0.0|y=0.0|width=480|height=380|scale9t=30|scale9b=30|bg=1|scale9r=30|move=0|loadDelay=1|reset=1|scale9l=30|esc=1|img=zhangheng/176.png|show=0>
	<Button|x=480.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Text|ax=0.5|x=252.0|y=25.0|color=251|size=18|text=酒剑仙>
	<Text|x=23.0|y=55.0|color=161|size=16|text=我"酒剑仙"早年上蜀山学艺，因朋友南宫煌半人半妖的身份被>
	<RText|x=23.0|y=75.0|color=161|size=16|text=蜀山仙剑派驱逐下山，因此与师兄独孤宇云发生争执,  一气之>
	<Text|x=23.0|y=95.0|color=161|size=16|text=下下山云游，后因师兄苦劝而重回蜀山，但在师兄带领蜀山弟>
	<RText|x=23.0|y=115.0|color=161|size=16|text=子进七星塔历练时，被塔内妖魔全部歼灭后，我悲痛欲绝，黯>
	<RText|x=23.0|y=135.0|color=161|size=16|text=然下山云游，并立誓：尝遍天下美酒，杀尽无数妖魔>
	<RText|x=23.0|y=160.0|color=161|size=16|text=历练中来到这片神奇的大陆，即有斩不尽的妖魔，又有甘甜爽>
	<RText|x=23.0|y=180.0|color=161|size=16|text=口的美酒，如今我已是花甲之年，欲寻找传人，如果勇士你愿>
	<RText|x=23.0|y=200.0|color=161|size=16|text=意接受我的传承，<请每天来这里领取任务，总共完成七天/FCOLOR=250>，我>
	<RText|x=23.0|y=220.0|color=161|size=16|text=将赠送<超级神器>于你.......>
	<RText|x=65.0|y=270.0|size=16|color=70|text=所需物品 →>
	<RText|x=235.0|y=270.0|size=16|color=70|text=任务奖励 →>
	<Img|x=156.0|y=252.0|width=52|height=52|rotate=0|esc=0|img=zhangheng/104.png>
	]]
	msg = msg .."<RText|x=23.0|y=335.0|size=16|color=254|text=当前酒剑仙任务进度：(".. renwujindu .."/7)>"
	if getint(actor,"酒剑仙任务是否领取") == 0 then
		msg = msg .."<Text|x=317.0|y=334.0|color=250|size=18|text=领取任务|link=@lingqu>"
	else
		msg = msg .."<Text|x=317.0|y=334.0|color=250|size=18|text=提交任务|link=@tijiao>"	
	end
	--需求物品
	msg = msg .."<ItemShow|x=150.0|y=246.0|width=70|height=70|itemid=".. getidbyname(items[showid].xqitem[1]) .."|itemcount=".. items[showid].xqitem[2] .."|showtips=1|bgtype=0>"	
	--给的物品
	local give_t = items[showid].jiangli
	for i = 1,#give_t do
		msg = msg .."<Img|x=".. 326+(i-1)*70 .."|y=252.0|width=52|height=52|esc=0|img=zhangheng/104.png>"
		msg = msg .."<ItemShow|x=".. 320+(i-1)*70 .."|y=246.0|width=70|height=70|itemid=".. getidbyname(give_t[i][1]) .."|itemcount=".. give_t[i][2] .."|showtips=1|bgtype=0>"
	end
	say(actor,msg)
end

function lingqu(actor)
	if getdayint(actor,"今日酒剑仙任务") ~= 0 then
		sendmsg9(actor,"每天只能做一次任务，请明天再来")
		return
	end
	setdayint(actor,"今日酒剑仙任务",1)
	setint(actor,"酒剑仙任务是否领取",1)
	setint(actor,"酒剑仙任务杀怪数",0)
	callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --任务显示
	sendmsg9(actor,"接取成功")
	return show(actor)
end

function tijiao(actor)
	local renwujindu = getint(actor,"酒剑仙任务编号")
	local showid = renwujindu + 1
	local itemname = items[showid].xqitem[1]
	local sl = items[showid].xqitem[2]
	local give_t = items[showid].jiangli
	if itemcount(actor,itemname) < sl then
		sendmsg9(actor,"任务未完成")
		return
	end
	
	if getint(actor,"酒剑仙任务杀怪数") < 5 then
		sendmsg9(actor,"任务未完成")
		return
	end
	
	takeitem(actor,itemname,sl)
	for i = 1,#give_t  do
		if give_t[i][1] == "金币" then
			addbindgold(actor,200000)
		else
			local item = giveitem(actor,give_t[i][1],give_t[i][2],371)	
			if give_t[i][1] == "仙剑·酒葫芦" then
				local t = {
				open=1,  
				show=2,  
				name="酒气值：",  
				color=254,  
				imgcount=2,  
				cur=0, 
				max=3000, 
				level=0
				}
				setcustomitemprogressbar(actor,item,0,tbl2json(t))
				refreshitem(actor, item)
			end
		end
	end
	setint(actor,"酒剑仙任务是否领取",0)
	setint(actor,"酒剑仙任务编号",showid)
	sendmsg9(actor,"提交任务成功")
	callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --任务显示
	if showid == 7 then
		close()
		return
	end
	return show(actor)
end