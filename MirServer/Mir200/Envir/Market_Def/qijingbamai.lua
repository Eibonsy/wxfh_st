include("Market_Def/zh.lua") --个人封装函数
local dian_t = {
	{x=191.5,y=66.5},
	{x=191.5,y=100.5},
	{x=137.5,y=167.5},
	{x=243.5,y=167.5},
	{x=174.5,y=217.5},
	{x=208.5,y=232.5},
}

local data = {
	[0]={path=116,tupo={{"疏筋活络丸",1}},xiaohao={"一级金针",1},jilv=30,jingmai="任脉",xuewei={"商曲","气海","通谷","四满","幽门","横骨"},sxshow={"生命值+1","防御下限+1","生命值+1","魔防下限+1",{"攻击下限+1","魔法下限+1","道术下限+1"},{"攻击上限+1","魔法上限+1","道术上限+1"}}},
	{path=117,tupo={{"疏筋活络丸",2},{"金币",100000}},xiaohao={"二级金针",1},jilv=40,jingmai="督脉",xuewei={"睛明","交信","然谷","神道","盘缺","照海"},sxshow={"生命值+2","防御下限+1","生命值+2","魔防下限+1",{"攻击下限+1","魔法下限+1","道术下限+1"},{"攻击上限+1","魔法上限+1","道术上限+1"}}},
	{path=118,tupo={{"疏筋活络丸",3},{"金币",200000}},xiaohao={"三级金针",1},jilv=50,jingmai="冲脉",xuewei={"丘墟","廉泉","冲门","筑宾","期门","府舍"},sxshow={"生命值+3","防御下限+1","生命值+3","魔防下限+1",{"攻击下限+1","魔法下限+1","道术下限+1"},{"攻击上限+1","魔法上限+1","道术上限+1"}}},
	{path=119,tupo={{"疏筋活络丸",4},{"金币",300000}},xiaohao={"四级金针",1},jilv=60,jingmai="带脉",xuewei={"天突","气海","承浆","急脉","鸠尾","曲骨"},sxshow={"生命值+3","防御下限+1","生命值+3","魔防下限+1",{"攻击下限+1","魔法下限+1","道术下限+1"},{"攻击上限+1","魔法上限+1","道术上限+1"}}},
	{path=120,tianfudian=1,tupo={{"疏筋活络丸",5},{"金币",500000}},xiaohao={"五级金针",1},jilv=70,jingmai="阳跷脉",xuewei={"云门","中府","列缺","经渠","太渊","鱼际"},sxshow={"生命值+4","防御下限+1","生命值+4","魔防下限+1",{"攻击下限+1","魔法下限+1","道术下限+1"},{"攻击上限+1","魔法上限+1","道术上限+1"}}},
	{path=121,tianfudian=1,tupo={{"疏筋活络丸",6},{"金条",1}},xiaohao={"六级金针",1},jilv=80,jingmai="阴跷脉",xuewei={"天鼎","商阳","温溜","曲池","扶突","巨骨"},sxshow={"生命值+4","防御上限+1","生命值+4","魔防上限+1",{"攻击下限+1","魔法下限+1","道术下限+1"},{"攻击上限+1","魔法上限+1","道术上限+1"}}},
	{path=122,tianfudian=1,tupo={{"疏筋活络丸",7},{"金条",2}},xiaohao={"七级金针",1},jilv=90,jingmai="阳维脉",xuewei={"大迎","内庭","承满","缺盆","下关","地仓"},sxshow={"生命值+5","防御上限+2","生命值+5","魔防上限+2",{"攻击下限+1","魔法下限+1","道术下限+1"},{"攻击上限+1","魔法上限+1","道术上限+1"}}},	
	{path=123,tianfudian=1,tupo={{"疏筋活络丸",8},{"金条",3}},xiaohao={"八级金针",1},jilv=100,jingmai="阴维脉",xuewei={"聚泉","天溪","大横","商丘","周荣","隐白"},sxshow={"生命值+5","防御上限+2","生命值+5","魔防上限+2",{"攻击下限+1","魔法下限+1","道术下限+1"},{"攻击上限+1","魔法上限+1","道术上限+1"}}},	
	{path=124,tianfudian=1,tupo={{"疏筋活络丸",9},{"金条",4}},xiaohao={"九级金针",1},jilv=100,jingmai="少阴脉",xuewei={"神门","灵道","通里","少海","青灵","极泉"},sxshow={"生命值+5","防御上限+3","生命值+5","魔防上限+3",{"攻击下限+1","魔法下限+1","道术下限+1"},{"攻击上限+1","魔法上限+1","道术上限+1"}}},
	{path=125,tianfudian=1,tupo={{"疏筋活络丸",10},{"金砖",1}},xiaohao={"十级金针",1},jilv=100,jingmai="足阳脉",xuewei={"天宗","肩贞","秉风","少泽","曲恒","前谷"},sxshow={"生命值+5","防御上限+3","生命值+5","魔防上限+3",{"攻击下限+1","魔法下限+1","道术下限+1"},{"攻击上限+1","魔法上限+1","道术上限+1"}}},
	{path=125,tianfudian=1,tupo={{"疏筋活络丸",10},{"金砖",1}},xiaohao={"十级金针",1},jilv=100,jingmai="足阳脉",xuewei={"天宗","肩贞","秉风","少泽","曲恒","前谷"},sxshow={"生命值+5","防御上限+3","生命值+5","魔防上限+3",{"攻击下限+1","魔法下限+1","道术下限+1"},{"攻击上限+1","魔法上限+1","道术上限+1"}}},
	
	}
	
local shuju= {
[0]={tpxhaohao={item={{"疏筋活络丸",1}}},xiaohao={"一级金针",1},jilv=30,					buff={{10012,1},{20086,1},{10012,1},{20087,1},{{10015,1},{10017,1},{10019,1}},{{10016,1},{10018,1},{10020,1}}} },
	{tpxhaohao={item={{"疏筋活络丸",2}},jinbi=100000},xiaohao={"二级金针",1},jilv=40,					buff={{10012,2},{20086,1},{10012,2},{20087,1},{{10015,1},{10017,1},{10019,1}},{{10016,1},{10018,1},{10020,1}}} },
	{tpxhaohao={item={{"疏筋活络丸",3}},jinbi=200000},xiaohao={"三级金针",1},jilv=50,					buff={{10012,3},{20086,1},{10012,3},{20087,1},{{10015,1},{10017,1},{10019,1}},{{10016,1},{10018,1},{10020,1}}} },
	{tpxhaohao={item={{"疏筋活络丸",4}},jinbi=300000},xiaohao={"四级金针",1},jilv=60,					buff={{10012,3},{20086,1},{10012,3},{20087,1},{{10015,1},{10017,1},{10019,1}},{{10016,1},{10018,1},{10020,1}}} },
	{tianfudian=1,tpxhaohao={item={{"疏筋活络丸",5}},jinbi=500000},xiaohao={"五级金针",1},jilv=70,	buff={{10012,4},{20086,1},{10012,4},{20087,1},{{10015,1},{10017,1},{10019,1}},{{10016,1},{10018,1},{10020,1}}} },	
	{tianfudian=1,tpxhaohao={item={{"疏筋活络丸",6},{"金条",1}}},xiaohao={"六级金针",1},jilv=80,		buff={{10012,4},{10013,1},{10012,4},{10014,1},{{10015,1},{10017,1},{10019,1}},{{10016,1},{10018,1},{10020,1}}} },
	{tianfudian=1,tpxhaohao={item={{"疏筋活络丸",7},{"金条",2}}},xiaohao={"七级金针",1},jilv=90,		buff={{10012,5},{10013,2},{10012,5},{10014,2},{{10015,1},{10017,1},{10019,1}},{{10016,1},{10018,1},{10020,1}}} },
	{tianfudian=1,tpxhaohao={item={{"疏筋活络丸",8},{"金条",3}}},xiaohao={"八级金针",1},jilv=100,	buff={{10012,5},{10013,2},{10012,5},{10014,2},{{10015,1},{10017,1},{10019,1}},{{10016,1},{10018,1},{10020,1}}} },
	{tianfudian=1,tpxhaohao={item={{"疏筋活络丸",9},{"金条",4}}},xiaohao={"九级金针",1},jilv=100,	buff={{10012,5},{10013,3},{10012,5},{10014,3},{{10015,1},{10017,1},{10019,1}},{{10016,1},{10018,1},{10020,1}}} },
	{tianfudian=1,tpxhaohao={item={{"疏筋活络丸",10},{"金砖",1}}},xiaohao={"十级金针",1},jilv=100,	buff={{10012,5},{10013,3},{10012,5},{10014,3},{{10015,1},{10017,1},{10019,1}},{{10016,1},{10018,1},{10020,1}}} },
	}

function show(actor)
	local jingmailv = getint(actor,"经脉等级")
	local xueweidengji = getint(actor,"穴位等级")
	if getint(actor,"完成任务id") == 2 then
		newdeletetask(actor,3) --删除任务2
		setint(actor,"完成任务id",3)
		addbindgold(actor,10000)
		changeexp(actor,"+",5000,false)
		callscriptex(actor, "CallLua", "QFunction-0", "@getexp,5000") --经验触发
		sendmsg9(actor,"了解奇经八脉完成，获得金币*10000，经验5000")
		callscriptex(actor, "CallLua", "QFunction-0", "@renwupanduan") --任务系统
	end
	
	if getint(actor,"完成任务id") == 7 and jingmailv > 0 then
		newdeletetask(actor,8) --删除任务2
		setint(actor,"完成任务id",8)
		addbindgold(actor,10000)
		changeexp(actor,"+",15000,false)
		callscriptex(actor, "CallLua", "QFunction-0", "@getexp,15000") --经验触发
		sendmsg9(actor,"疏通任脉完成，获得金币*10000，经验15000")
		callscriptex(actor, "CallLua", "QFunction-0", "@renwupanduan") --任务系统
	end
	
	
	local msg = [[
		<Img|x=0|width=643|height=457|esc=1|bg=1|img=zhangheng/1.png|move=1|reset=0|show=4>
		<Button|x=639.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
		<Img|x=16.5|y=39.5|img=zhangheng/113.png|esc=0>
		<Text|x=27.5|y=368.5|color=103|size=16|text=提示：每次使用金针穿刺成功后可获得额外属性加成>
		<Text|x=112.5|y=398.5|color=31|size=16|text=还原复古经典 本服并无内功>
		<Img|x=422.5|y=45.5|img=zhangheng/62.png|esc=0>
		<Img|x=414.5|y=236.5|width=200|esc=0|img=zhangheng/99.png>
		
	]]
	
	local t = data[jingmailv]
	local xw_show = 0
	msg=msg.."<Img|x=90.5|y=69.5|img=zhangheng/"..t.path..".png|esc=0>"
	
	for i = 1,6 do
		xw_show = i
		if xueweidengji >= i then
			msg=msg.."<Img|x="..dian_t[i].x.."|y="..dian_t[i].y.."|img=zhangheng/114.png|esc=0>"
		else
			msg=msg.."<Frames|x="..dian_t[i].x.."|y="..dian_t[i].y.."|speed=50|prefix=qijingbamai/dian_|count=2|loop=-1|suffix=.png>"
			break
		end
	end
	msg=msg.."<RText|ax=0.5|ay=0.5|x=546.5|y=61.5|width=100|height=20|size=18|color=95|text="..t.jingmai..">"
	
	if xueweidengji >= 6 then
	-----突破界面
		
		if t.tianfudian then
			msg=msg.."<RText|x=419.5|y=104.5|size=16|color=103|text=使用<“疏筋活络丸”/FCOLOR=70><可突破/FCOLOR=103>>"
			msg=msg.."<RText|ax=0.5|x=514.5|y=145.5||color=250|size=18|text=".. t.jingmai ..">"
			msg=msg.."<RText|x=419.5|y=185.5|size=16|color=103|text=成功后可获得<“1点天赋”/FCOLOR=116>>"
		else
			msg=msg.."<RText|x=419.5|y=131.5|color=103|size=16|text=使用<“疏筋活络丸”/FCOLOR=70>可突破>"
			msg=msg.."<RText|ax=0.5|x=514.5|y=170.5||color=250|size=18|text=".. t.jingmai ..">"
		end
		if jingmailv >= 10 then
			msg=msg..[[
				<RText|x=460.5|y=278.5|color=161|size=18|text=<奇经八脉已满/FCOLOR=249>>
				<RText|x=432.5|y=316.5|color=161|size=18|text=想要突破65级请前往>
				<RText|x=432.5|y=343.5|size=18|color=161|text=比奇省高级武士之家>
				<Text|x=478.5|y=370.5|size=18|color=250|text=进行转生|link=@gotogaojiwushi>
			]]
		else
			--msg=msg.."<RText|x=422.5|y=258.5|color=161|size=16|text=所需材料：>"
			for i = 1,#t.tupo do
				if i == 1 then
					msg=msg.."<RText|x=422.5|y=".. 268.5+(i-1)*40 - 10 .."|color=70|size=16|text=<"..t.tupo[i][1].."：/FCOLOR=116>>"
					msg=msg.."<ItemShow|x=503.5|y=".. 244.5+(i-1)*40 - 10 .."|width=70|height=70|itemid=".. getidbyname(t.tupo[i][1]) .."|itemcount=1|scale=0.75|showtips=1|bgtype=0>"
					msg=msg.."<RText|x=558.5|y=".. 268.5+(i-1)*40 - 10 .."|color=255|size=18|text=<".. itemcount(actor,t.tupo[i][1]) .."/FCOLOR=249>/<".. t.tupo[i][2] .."/FCOLOR=250>>"
				else
					msg=msg.."<RText|x=422.5|y=".. 268.5+(i-1)*40 - 10 .."|color=161|size=16|text=<"..t.tupo[i][1].."：/FCOLOR=251>>"		
					if t.tupo[i][1] == "金币" then
						msg=msg.."<ItemShow|x=453.5|y=".. 244.5+(i-1)*40 - 10 .."|width=70|height=70|itemid=".. getidbyname(t.tupo[i][1]) .."|itemcount=1|scale=0.75|showtips=0|bgtype=0>"
						msg=msg.."<RText|x=508.5|y=".. 268.5+(i-1)*40 - 10 .."|color=255|size=18|simplenum=1|text=<".. jianhuanum(getbindgold(actor)) .."/FCOLOR=249>/<".. jianhuanum(t.tupo[i][2]) .."/FCOLOR=250>>"
					else
						msg=msg.."<ItemShow|x=453.5|y=".. 244.5+(i-1)*40 - 10 .."|width=70|height=70|itemid=".. getidbyname(t.tupo[i][1]) .."|itemcount=1|scale=0.75|showtips=1|bgtype=0>"
						msg=msg.."<RText|x=508.5|y=".. 268.5+(i-1)*40 - 10 .."|color=255|size=18|text=<".. itemcount(actor,t.tupo[i][1]) .."/FCOLOR=249>/<".. t.tupo[i][2] .."/FCOLOR=250>>"
					end
				end
			end
			--msg=msg.."<RText|x=422.5|y=283.5|color=161|size=16|text=<"..t.tupo.."/FCOLOR=251>>"
			
			--msg=msg.."<RText|x=422.5|y=338.5|color=161|size=16|text=<突破概率：/FCOLOR=161><100%/FCOLOR=254>>"
			msg=msg.."<Button|x=472.5|y=375.5|color=10051|mimg=zhangheng/13.png|size=18|nimg=zhangheng/13.png|text=确定突破|link=@tupoxuewei>"
		end
	else
	-----穿刺界面
		msg=msg.."<RText|x=422.5|y=101.5|color=161|size=16|text=穴位：<"..t.xuewei[xw_show].."/FCOLOR=128>>"
		local job = getjob(actor)
		if type(t.sxshow[xw_show]) == "table" then
			msg=msg.."<RText|x=422.5|y=141.5|color=161|size=16|text=属性：<"..t.sxshow[xw_show][job+1].."/FCOLOR=128>>"
		else
			msg=msg.."<RText|x=422.5|y=141.5|color=161|size=16|text=属性：<"..t.sxshow[xw_show].."/FCOLOR=128>>"
		end
		msg=msg.."<RText|x=422.5|y=181.5|color=161|size=16|text=当前可打通穴位：<"..t.xuewei[xw_show].."/FCOLOR=128>>"
		msg=msg.."<RText|x=422.5|y=268.5|color=70|size=16|text=<"..t.xiaohao[1].."：/FCOLOR=116>>"
		msg=msg.."<ItemShow|x=483.5|y=244.5|width=70|height=70|itemid=".. getidbyname(t.xiaohao[1]) .."|itemcount=1|scale=0.75|showtips=1|bgtype=0>"
		msg=msg.."<RText|x=538.5|y=268.5|color=255|size=18|text=<".. itemcount(actor,t.xiaohao[1]) .."/FCOLOR=249>/<".. t.xiaohao[2] .."/FCOLOR=250>>"
		msg=msg.."<RText|x=422.5|y=316.5|color=161|size=16|text=<穿刺概率：/FCOLOR=161><"..t.jilv.."%/FCOLOR=254>>"
		msg=msg.."<Button|x=472.5|y=370.5|color=10051|mimg=zhangheng/13.png|size=18|nimg=zhangheng/13.png|text=确定穿刺|link=@chuanci>"
	end
	say(actor,msg)
end


	
function chuanci(actor)
	local jingmailv = getint(actor,"经脉等级")
	local xueweidengji = getint(actor,"穴位等级")
	if xueweidengji >= 6 then
		sendmsg9(actor,"此脉穴位已点满")
		return
	end
	local xiaohaot = shuju[jingmailv].xiaohao
	local jilv = shuju[jingmailv].jilv
	
	if itemcount(actor,xiaohaot[1]) < xiaohaot[2] then
		sendmsg9(actor,"材料不足")
		return
	end
	takeitem(actor, xiaohaot[1], xiaohaot[2],0)
	if jingmailv == 0 and getint(actor,"经脉0失败次数"..xueweidengji) >= 2 then
	else
		if math.random(1,100) > jilv then
			sendmsg9(actor,"穿刺失败")
			if jingmailv == 0 then
				setint(actor,"经脉0失败次数"..xueweidengji,getint(actor,"经脉0失败次数"..xueweidengji)+1)
			end
			return show(actor)
		end
	end
	setint(actor,"穴位等级",xueweidengji+1)
	
	local bufft = shuju[jingmailv].buff[xueweidengji+1] --{10012,5}
	local buffid = bufft
	local job = getjob(actor)
	if type(bufft[1]) == "table" then
		buffid = bufft[job+1]
	end
	for i = 1,buffid[2] do
		addbuff(actor,buffid[1])
	end
	playeffect(actor,20007,0,0,1,0,0)
	sendmsg9(actor,"穿刺成功")
	return show(actor)
end

function tupoxuewei(actor)
	local jingmailv = getint(actor,"经脉等级")
	local xueweidengji = getint(actor,"穴位等级")
	if jingmailv >= 10 then
		sendmsg9(actor,"经脉已点满")
		return
	end
	
	local xh_t = shuju[jingmailv].tpxhaohao

	if xh_t.jinbi then
		if getbindgold(actor) < xh_t.jinbi then
			sendmsg9(actor,"条件不足")
			return
		end
	end
	
	for i = 1,#xh_t.item do
		if itemcount(actor,xh_t.item[i][1],2) < xh_t.item[i][2] then
			sendmsg9(actor,"条件不足")
			return
		end
	end
	for i = 1,#xh_t.item do
		takeitem(actor, xh_t.item[i][1], xh_t.item[i][2],0)
	end
	
	if xh_t.jinbi then
		subbindgold(actor,xh_t.jinbi)
	end
	
	setint(actor,"经脉等级",jingmailv+1)
	if jingmailv < 9 then
		setint(actor,"穴位等级",0)
	end
	if shuju[jingmailv].tianfudian then
		addtianfudian(actor,1)
	end

	sendmsg9(actor,"突破成功")
	return show(actor)
end

function gotogaojiwushi(actor)
	map(actor,"0114")
end