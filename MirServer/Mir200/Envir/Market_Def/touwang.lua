include("Market_Def/zh.lua") --个人封装函数
function show(actor,xianshi,jianglishow)
	setint(actor,"可摇骰子",1)
	if getsysint("合区次数") < 1 then
		sendmsg9(actor,"此功能合区后开放")
		return
	end
	xianshi = tonumber(xianshi) or 0
	jianglishow = tonumber(jianglishow) or 0
	local msg = [[
	<Img|x=0|width=726|height=524|bg=1|scale9l=50|scale9t=50|scale9r=50|scale9b=50|reset=0|move=1|img=zhangheng/1.png|esc=1|show=4>
	<Button|x=724.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
	<Img|x=16.0|y=39.5|img=zhangheng/192.png|esc=0>
	
	<Button|x=109.0|y=440.5|nimg=zhangheng/13.png|color=10051|size=18|clickInterval=1000|text=金条投骰|link=@yaosaizi,1>
	<Button|x=274.0|y=440.5|nimg=zhangheng/13.png|color=10051|size=18|clickInterval=1000|text=元宝投骰|link=@yaosaizi,2>
	<Button|x=18.0|y=465.5|nimg=zhangheng/8.png|color=255|size=18|pimg=zhangheng/8.png|link=@show,1>
	
	<Text|x=328.0|y=387.5|color=161|size=18|text=查看奖励分配|link=@show,0,1>
	<Text|x=465.0|y=93.5|color=161|size=18|text=打怪爆率+10%>
	<Text|x=465.0|y=140.5|color=161|size=18|text=骰王专属buff：>
	<Text|x=465.0|y=165.5|color=161|size=18|text=攻击满血怪物以及人物时>
	<Text|x=465.0|y=190.5|color=161|size=18|text=额外斩杀8%最大生命值伤害>
	<Text|x=460.0|y=265.5|color=161|size=18|text=⒈获得"骰王666"的玩家>
	<Text|x=479.0|y=290.5|color=161|size=18|text=可领取奖池60%的金币>
	<Text|x=460.0|y=315.5|color=161|size=18|text=⒉获得"武林至尊"的玩家>
	<Text|x=479.0|y=340.5|color=161|size=18|text=可领取奖池20%的金币>
	<Text|x=460.0|y=365.5|color=161|size=18|text=⒊沙城主领取奖池20%的金币>
	<Button|x=535.0|y=390.5|color=255|size=18|nimg=zhangheng/199.png|link=@lingjiang>
	]]
	
	msg=msg.."<RText|x=28.0|y=387.5|color=161|size=18|text=当前骰王奖池金币总数量：".. getsysint("骰王奖池")/10000 .."万>"
	local tupian_t = {193,194,195,196,197,198}
	for i = 1,6 do
		msg=msg.."<Img|x=".. 25+(i-1)%3 * 142 .."|y=".. 44.5 + math.floor((i-1)/3) * 168 .."|img=zhangheng/".. tupian_t[i] ..".png|esc=0>"
		local name = "无人获得"
		local yanse = 250
		if getsysstr("骰王"..i) ~= "" then
			name = getsysstr("骰王"..i)
			yanse = 251
		end
		if #name > 14 then
			msg=msg.."<Text|ax=0.5|ay=0.5|x=".. 91+(i-1)%3 * 142 .."|y=".. 190.5 + math.floor((i-1)/3) * 168 .."|color="..yanse.."|size=18|scrollWidth=112|text="..name..">"
		else
			msg=msg.."<Text|ax=0.5|ay=0.5|x=".. 91+(i-1)%3 * 142 .."|y=".. 190.5 + math.floor((i-1)/3) * 168 .."|color="..yanse.."|size=18|text="..name..">"
		end
		
	end

	if xianshi == 1 then
		msg = msg..'<Layout|x=-1000.0|y=-1001.0|width=3000|height=3000|color=255>|link=@show>'
		msg = msg..[[
		<Img|ay=0.5|x=50.0|y=408.0|width=328|height=180|scale9t=10|scale9b=10|img=zh/7.png|scale9r=10|scale9l=10|esc=0>
		<RText|ay=0.5|x=58.0|y=338.5|color=255|size=16|text=消耗一根<金条/FCOLOR=250>或<1000元宝/FCOLOR=250><必中骰王/FCOLOR=253>，系统将>
		<RText|ay=0.5|x=58.0|y=358.5|color=255|size=16|text=纳入<50万金币/FCOLOR=250>进入奖池，符合领奖的玩家需>
		<RText|ay=0.5|x=58.0|y=378.5|color=255|size=16|text=要在规定时间内领取奖励，每天领奖时间为>
		<RText|ay=0.5|x=58.0|y=398.5|color=250|size=16|text=0.0--0.10　3.0--3.10　6.0--6.10　9.0--9.10>
		<RText|ay=0.5|x=58.0|y=418.5|color=250|size=16|text=12.0--12.10　　15.0--15.10　　18.0--18.10>
		<RText|ay=0.5|x=58.0|y=438.5|color=255|size=16|text=<21.0-21.10/FCOLOR=250> 请玩家牢记领奖时间， 领取奖励>
		<RText|ay=0.5|x=58.0|y=458.5|color=255|size=16|text=时间段不可掷骰子，过时不候，奖励清零。>
		<RText|ay=0.5|x=58.0|y=478.5|color=255|size=16|text=领取的奖励系统将通过邮件的方式发放>
		]]
	end
	if jianglishow == 1 then
		msg = msg..'<Layout|x=-1000.0|y=-1001.0|width=3000|height=3000|color=255>|link=@show>'
		msg = msg..[[
		<Img|ay=0.5|x=80.0|y=294.0|width=310|height=140|scale9t=10|esc=0|img=zh/7.png|scale9r=10|scale9l=10|scale9b=10>
		<RText|ay=0.5|x=200.0|y=246.5|color=251|size=16|text=奖励分配>
		]]
		msg = msg..'<RText|ay=0.5|x=114.0|y=274.5|color=255|size=16|text=骰王666领取金币：'.. getsysint("骰王奖池")*0.6 ..'>'
		msg = msg..'<RText|ay=0.5|x=114.0|y=304.5|color=255|size=16|text=武林至尊领取金币：'.. getsysint("骰王奖池")*0.2 ..'>'
		msg = msg..'<RText|ay=0.5|x=114.0|y=334.5|color=255|size=16|text=沙城城主领取金币：'.. getsysint("骰王奖池")*0.2 ..'>'
	end
	
	say(actor,msg)
end

function yaosaizi(actor,par) --摇骰子
	if getint(actor,"可摇骰子") == 0 then
		sendmsg9(actor,"请耐心等待掷骰子结果")
		return
	end
	local hour = tonumber(os.date("%H",os.time())) --小时
	local fen = tonumber(os.date("%M",os.time())) --分钟
	if (hour == 0 or hour == 3 or hour == 6 or hour == 9 or hour == 12 or hour == 15 or hour == 18 or hour == 21) and fen < 11 then
		sendmsg9(actor,"领取奖励时间段内不可掷骰子，请耐心等待")
		return
	end
	if par == "1" then
		if itemcount(actor,"金条") < 1 then
			sendmsg9(actor,"你没有金条")
			return
		end
		takeitem(actor, "金条", 1)
		post(actor,"骰王金条消耗*1")
	else
		if getingot(actor) < 1000 then
			sendmsg9(actor,"你没有1000元宝")
			return
		end
		subingot(actor,1000,"骰王")
	end
	setsysint("骰王奖池",getsysint("骰王奖池")+500000)
	local dianshu = 0
	
	local dianshu_t = {1,2,3,4,5,6}
	for i = 1,#dianshu_t do
		if getsysstr("骰王"..i) == getname(actor) then
			table.remove(dianshu_t,i)
			break
		end
	end
	
	dianshu = dianshu_t[math.random(1,#dianshu_t)]

	
	if getint(actor,"骰王点数") > 0 then
		dianshu = getint(actor,"骰王点数")
		setint(actor,"骰王点数",0)
	end
	
	setplaydef(actor, "D0",dianshu)
	setplaydef(actor, "D1",dianshu)
	setplaydef(actor, "D2",dianshu)
	callscriptex(actor, "playdice", 3, "@yaoend")
	for i = 1,6 do
		if getsysstr("骰王"..i) == getname(actor) then
			setsysstr("骰王"..i,"")
		end
	end
	setsysstr("骰王"..dianshu,getname(actor))
	setint(actor,"可摇骰子",0)
	local t=getplayerlst()
	for k, v  in ipairs(t) do
		touwangchuli(v) --骰王处理
	end
end

function yaoend(actor)
	sendmsg9(actor,"恭喜你成为骰王")
	return show(actor)
end

function lingjiang(actor)
	local hour = tonumber(os.date("%H",os.time())) --小时
	local fen = tonumber(os.date("%M",os.time())) --分钟
	if (hour == 0 or hour == 3 or hour == 6 or hour == 9 or hour == 12 or hour == 15 or hour == 18 or hour == 21) and fen < 11 then
	else
		sendmsg9(actor,"当前时间不可领取奖励")
		return
	end
	
	local gold = getsysint("骰王奖池")
	if gold == 0 then
		sendmsg9(actor,"奖池暂无奖励")
		return
	end
	jiangli1 = gold * 0.6 --骰王666
	jiangli2 = gold * 0.2 --武林至尊
	jiangli3 = gold * 0.2 --沙老大
	if getsysstr("骰王6") == getname(actor) and getsysint("骰王666领取") == 0 then
		sendmsg9(actor,"领取骰王666奖励成功，请在邮件领取")
		sendmail("#"..getname(actor),1,"骰王奖励","恭喜你获得骰王666奖励，金币*"..jiangli1,"金币#"..jiangli1)
		setsysint("骰王666领取",1)
		return
	end
	if getsysstr("武林至尊名字") == getname(actor) and getsysint("骰王武林至尊领取") == 0 then --武林至尊
		sendmsg9(actor,"领取骰王武林至尊奖励成功，请在邮件领取")
		sendmail("#"..getname(actor),1,"骰王奖励","恭喜你获得骰王武林至尊奖励，金币*"..jiangli2,"金币#"..jiangli2)
		setsysint("骰王武林至尊领取",1)
		return
	end
	if castleidentity(actor) == 2 and getsysint("骰王沙老大领取") == 0 then --沙老大
		sendmsg9(actor,"领取骰王沙老大奖励成功，请在邮件领取")
		sendmail("#"..getname(actor),1,"骰王奖励","恭喜你获得骰王沙老大奖励，金币*"..jiangli3,"金币#"..jiangli3)
		setsysint("骰王沙老大领取",1)
		return
	end
	sendmsg9(actor,"您不符合条件")
end
