include("Market_Def/zh.lua") --个人封装函数

function show(actor,xianshi)
	xianshi = tonumber(xianshi) or 0
	local msg = [[
	<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
	<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
	<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
	<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=矿洞守卫>
	<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
	<RText|ax=0|ay=0.5|x=22.0|y=70.0|color=255|size=18|text=小子，我这里刚好差点铜矿石，紫金矿洞里面有还有几率挖到>
	<RText|ay=0.5|x=22.0|y=95.5|color=255|size=18|text=金矿石，不过我年纪大了，挖不动了，所以还是麻烦你帮我收>
	<RText|ay=0.5|x=22.0|y=120.5|color=255|size=18|text=集<50个铜矿/FCOLOR=250>，每天可帮助老夫<2次/FCOLOR=250>，当然我会给于一定的报酬>
	<RText|ay=0.5|x=22.0|y=158.5|color=251|size=18|text=任务奖励：>
	<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
	<Img|x=121.0|y=135.0|width=50|height=50|scale9r=5|scale9l=5|esc=0|img=zhangheng/104.png|scale9b=5|scale9t=5>
	<Img|x=186.0|y=135.0|width=50|height=50|scale9r=5|scale9l=5|esc=0|img=zhangheng/104.png|scale9b=5|scale9t=5>
	<Text|x=213.0|y=165.0|color=255|size=18|text=10>
	<Text|ay=0.5|x=333.0|y=214.5|size=18|color=250|text=紫金矿洞|link=@goto>
	]]
	
	if getint(actor,"挖矿任务") == 0 then
		msg=msg.."<Text|ay=0.5|x=122.0|y=214.5|size=18|color=250|text=领取任务||link=@lingqu>"
	else
		msg=msg.."<Text|ay=0.5|x=122.0|y=214.5|size=18|color=250|text=提交任务|link=@show,1>"
	end
	msg=msg.."<ItemShow|x=113.0|y=128.0|width=70|height=70|itemid=".. getidbyname("经验奖励") .."|itemcount=1|showtips=1|bgtype=0>"
	msg=msg.."<ItemShow|x=178.0|y=127.0|width=70|height=70|itemid=".. getidbyname("黑铁矿石") .."|itemcount=1|showtips=1|bgtype=0>"
	
	if xianshi == 1 then
		msg = msg ..[[
		<Layout|ay=0.5|x=-1000|y=-1000|width=3000|height=110|color=3000>|link=@laoren>
		<Img|ay=0.5|x=77.0|y=132.0|width=300|height=110|scale9l=10|esc=0|img=zh/7.png|scale9r=10|scale9t=10|scale9b=10>
		<RText|x=106.0|y=90.0|size=16|color=255|text=提交任务将收走所有锄头和铜矿石>
		<RText|x=106.0|y=115.0|size=16|color=255|text=你确定提交吗？>
		<Button|x=112.0|y=141.0|color=10051|nimg=zhangheng/13.png|size=18|text=确定提交|link=@tijiao>
		<Button|x=253.0|y=141.0|color=10051|nimg=zhangheng/13.png|size=18|text=不愿意|link=@show>
		]]
	end
	if xianshi == 2 then
		msg = msg ..[[
		<Layout|ay=0.5|x=-1000|y=-1000|width=3000|height=110|color=3000>|link=@laoren>
		<Img|ay=0.5|x=77.0|y=132.0|width=300|height=110|scale9l=10|esc=0|img=zh/7.png|scale9r=10|scale9t=10|scale9b=10>
		<RText|x=101.0|y=95.0|color=253|size=16|text=可在紫金矿洞寻找矿洞老人获得锄头>
		<Button|x=184.0|y=137.0|color=10051|nimg=zhangheng/13.png|size=18|text=我知道了|link=@show>


		]]
	end
	
	say(actor,msg)
end

function lingqu(actor)
	if getlevel(actor) >= 65 and getjingyan(actor)/getbaseinfo(actor, 14)*100 >= 95 then
		sendmsg9(actor,"为防止游戏数据出错导致等级错乱 当前经验值高于95%将不允许接受任务")
		return
	end
	
	
	if getdayint(actor,"挖矿领取") >= 2 then
		sendmsg9(actor,"每天只能接取2次任务")
		return
	end
	if getlevel(actor) < 50 then
		sendmsg9(actor,"提示：你太弱了，需要等级达到50级")
		return
	end
	setint(actor,"挖矿任务",1)
	sendmsg9(actor,"接取任务成功")
	setdayint(actor,"挖矿领取",getdayint(actor,"挖矿领取")+1)
	wakuang_xianshi(actor)
	return show(actor,2)
end

function goto(actor)
	if getlevel(actor) < 50 then
		sendmsg9(actor,"提示：你太弱了，需要等级达到50级")
		return
	end
	map(actor,"zjkd")
	
end

function goumai(actor,par)
	if par == "1" then
		if not subingot(actor,500,"购买锄头") then
			sendmsg9(actor,"元宝不足500")
			return
		end
	else
		if itemcount(actor,"紫水晶矿") < 250 then
			sendmsg9(actor,"紫水晶矿不足")
			return
		end
		takeitem(actor,"紫水晶矿",250)
	end
	giveitem(actor,"鹤嘴锄",1,371)
	setint(actor,"有鹤嘴锄",1)
	return laoren(actor)
end
function kong(actor)
end


function wakuang_xianshi(actor)
	setint(actor,"挖矿任务显示",1) --
	callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --挖矿任务显示
end

function tijiao(actor)
	if getint(actor,"挖矿任务") == 0 then
		sendmsg9(actor,"你没有接取任务")
		return
	end
	
	if itemcount(actor,"铜矿石") < 50 then
		sendmsg9(actor,"铜矿石不足50个")
		return
	end
	takeitem(actor,"铜矿石",50)
	if itemcount(actor,"鹤嘴锄") > 0 then
		takeitem(actor,"鹤嘴锄",itemcount(actor,"鹤嘴锄"))
	end
	local item = linkbodyitem(actor,1)
	if item ~= "0" then
		if getitemname(actor,item) == "鹤嘴锄" then
			callscriptex(actor, "takew", "鹤嘴锄")
		end
	end
	setint(actor,"有鹤嘴锄",0)
	local jingyan = math.floor(getbaseinfo(actor,14)*0.025)
	if getdayint(actor,"日充") > 0 then
		jingyan = jingyan * 2
	end
	if getlevel(actor) < 75 then
		changeexp(actor,"+",jingyan,false)
		callscriptex(actor, "CallLua", "QFunction-0", "@getexp,"..jingyan) --经验触发
	end
	giveitem(actor,"黑铁矿石",10)
	setint(actor,"挖矿任务",0)
	setint(actor,"挖矿任务显示",0) --
	callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --挖矿任务显示
	if getlevel(actor) < 75 then
		sendmsg9(actor,"提交任务成功，获得经验".. jingyan ..",黑铁矿石*10")
	else
		sendmsg9(actor,"提交任务成功，获得黑铁矿石*10")
	end
	return show(actor)
end

function laoren(actor,xianshi)
	xianshi = tonumber(xianshi) or 0
	if xianshi == 1 and getint(actor,"有鹤嘴锄") == 1 then
		sendmsg9(actor,"你已经有鹤嘴锄了，无需重复购买")
		return
	end
	
	if getint(actor,"挖矿任务") == 0 then
		sendmsg9(actor,"勇士，请先领取挖矿任务在来找我吧....","#00FF00")
		return
	end
	
	local msg = [[
	<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
	<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
	<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
	<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=守矿老人>
	<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
	<RText|ax=0|ay=0.5|x=45.0|y=70.5|color=255|size=18|text=勇士，想要获得矿石则需要一把趁手的锄头，刚好老夫>
	<RText|ay=0.5|x=45.0|y=95.5|color=255|size=18|text=这里有不过你需要给我一些报酬!>
	<RText|ay=0.5|x=45.0|y=120.5|color=255|size=18|text=听说获得<日充/FCOLOR=253>的勇士提交任务时可获得<双倍/FCOLOR=253>经验值>
	<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
	<Img|x=121.0|y=135.0|width=50|height=50|scale9r=5|scale9t=5|scale9l=5|img=zhangheng/104.png|scale9b=5|esc=0>
	<Text|ay=0.5|x=333.0|y=160.5|size=18|color=250|text=获取锄头|link=@laoren,1>
	<RText|ay=0.5|x=45.0|y=215.5|color=255|size=18|text=<温馨提示：><挖矿时为防止武器爆出，请尽量把武器存仓/FCOLOR=254>>

	]]
	msg=msg.."<ItemShow|x=113.0|y=128.0|width=70|height=70|itemid=".. getidbyname("鹤嘴锄") .."|itemcount=1|showtips=1|bgtype=0>"
	if xianshi == 1 then
		msg=msg..[[
		<Layout|ay=0.5|x=-1000|y=-1000|width=3000|height=110|color=3000>|link=@laoren>
		<Img|ay=0.5|x=77.0|y=132.0|width=400|height=110|scale9r=10|scale9l=10|scale9b=10|img=zh/7.png|scale9t=10|esc=0>
		<RText|x=106.0|y=90.0|size=16|color=255|text=需向老夫交<500元宝/FCOLOR=250>或<250个紫水晶矿/FCOLOR=253>你可愿意？>
		<RText|x=106.0|y=110.0|color=255|size=16|text=但我会赠送你一把<神奇的锄头/FCOLOR=249>>
		<Button|x=157.0|y=140.0|color=10051|nimg=zhangheng/13.png|size=18|text=交元宝|link=@goumai,1>
		<Button|x=312.0|y=140.0|color=10051|nimg=zhangheng/13.png|size=18|text=交紫水晶矿|link=@goumai,2>

		]]
	end
	say(actor,msg)
end