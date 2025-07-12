include("Market_Def/zh.lua") --个人封装函数
function show(actor,xianshi)
	xianshi = tonumber(xianshi) or 0
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=320|scale9t=30|img=zhangheng/176.png|move=0|loadDelay=1|reset=1|scale9l=30|scale9b=30|show=0|bg=1|scale9r=30|esc=1>
	<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Text|x=214.0|y=25.0|color=251|size=18|text=武林至尊>
	<Text|x=28.0|y=60.0|color=161|size=16|text=武林素来以强者为尊，江湖腥风血雨只为争夺"天下第一"，而>
	<RText|x=28.0|y=80.0|color=161|size=16|text=各位精英角逐时，早已知根知底，举行"武林至尊"争夺赛已势>
	<Text|x=28.0|y=100.0|color=161|size=16|text=在必行，谁将号令群雄，一统武林，让我们拭目以待吧？人物>
	<RText|x=28.0|y=120.0|color=161|size=16|text=等级达到60级可申请，获得<"死亡掉装概率减少10%"/FCOLOR=250>>
	
	<Img|x=134.0|y=28.0|img=zhangheng/177.png|esc=0>
	<Img|x=298.0|y=27.0|img=zhangheng/178.png|esc=0>
	]]
	
	msg = msg .."<RText|x=28.0|y=150.0|color=70|size=16|text=武林至尊：<".. getsysstr("武林至尊名字") .."/FCOLOR=254>>"
	if getlevel(actor) < 75 then
		msg = msg .."<Text|x=195.0|y=265.0|color=250|size=18|text=申请武林至尊|link=@shenqing>"
		msg = msg .."<RText|x=28.0|y=175.0|color=70|size=16|text=当前等级：<".. getsysint("武林至尊等级") .."/FCOLOR=254>　　　　　当前经验：<".. getsysstr("武林至尊经验") .."/FCOLOR=254>>"
	else
		msg = msg .."<RText|x=28.0|y=175.0|color=70|size=16|text=当前等级：<".. getsysint("武林至尊等级") .."/FCOLOR=254>>"
	end
	local hanghui = "无行会"
	if getsysstr("武林至尊行会") ~= "" then
		hanghui = getsysstr("武林至尊行会")
	end
	msg = msg .."<RText|x=28.0|y=200.0|color=70|size=16|text=所属行会：<".. hanghui .."/FCOLOR=254>>"
	
	if getlevel(actor) >= 75 then
		msg = msg .."<RText|x=266.0|y=150.0|color=70|size=16|text=当前捐献兽魂值为：<0/FCOLOR=254>>"
		msg = msg .."<RText|x=28.0|y=230.0|color=150|size=16|text=你当前捐献的兽魂值数量为　<".. getdayint(actor,"捐献兽魂值") .."/FCOLOR=253>>"
		msg = msg .."<Text|x=95.0|y=265.0|color=250|size=18|text=申请武林至尊|link=@shenqing>"
		msg = msg .."<Text|x=301.0|y=265.0|color=250|size=18|submitInput=1|text=捐献兽魂值|link=@juanxian>"
		msg = msg .."<Button|x=14.0|y=274.0|color=255|size=18|pimg=zhangheng/8.png|nimg=zhangheng/8.png|link=@show,1>"
		msg = msg .."<Img|x=302.0|y=229.0|width=90|scale9r=5|scale9l=5|scale9t=5|img=zh/30.png|scale9b=5|esc=0>"
		msg = msg .."<Input|x=307.0|y=232.0|width=80|height=25|inputid=1|type=3|mincount=3|maxcount=4|errortips=1|color=255|size=14|place=输入兽魂值>"
	end
	if xianshi == 1 then
		msg = msg..'<Layout|x=-1000.0|y=-1001.0|width=3000|height=3000|color=255>|link=@show>'
		msg = msg..[[
		<Img|ay=0.5|x=45.0|y=250.0|width=350|height=120|scale9t=10|esc=0|img=zh/7.png|scale9r=10|scale9l=10|scale9b=10>
		<RText|ay=0.5|x=53.0|y=215.5|color=255|size=16|text=当人物等级处于同级别的情况下,需要通过>
		<RText|ay=0.5|x=53.0|y=236.5|color=255|size=16|text="捐献兽魂值"，来争夺"武林至尊">
		<RText|ay=0.5|x=52.0|y=256.5|color=255|size=16|text=每次捐献不能少于100点，即可获得封号>
		<RText|ay=0.5|x=53.0|y=281.5|color=250|size=16|text=每天0点后兽魂值清除，需从新申请"武林至尊"!>
		]]
	end
	say(actor,msg)
end

function juanxian(actor)
	local shuru = tonumber(getconst(actor,"<$NPCINPUT(1)>"))
	if not shuru then
		sendmsg9(actor,"请输入兽魂值")
		return
	end
	if shuru < 100 then
		sendmsg9(actor,"每次捐献不得少于100点")
		return
	end
	if not subshouhunzhi(actor,shuru) then
		sendmsg9(actor,"你的兽魂值不足"..shuru)
		return
	end
	setdayint(actor,"捐献兽魂值",getdayint(actor,"捐献兽魂值")+shuru)
	sendmsg9(actor,"捐献兽魂值成功")
	return show(actor)
end

function shenqing(actor)
	local wl_name = getsysstr("武林至尊名字")
	local wl_lv = getsysint("武林至尊等级")
	local wl_jingyan = tonumber(getsysstr("武林至尊经验"))
	local shouhundian = getsysint("武林至尊兽魂值")
	if getname(actor) == wl_name then
		sendmsg9(actor,"您已经是武林至尊了")
		return
	end
	local dengji = getlevel(actor) --等级
	local jingyan = getjingyan(actor) --经验
	local juanxiandian = getdayint(actor,"捐献兽魂值")
	if dengji < 60 then
		sendmsg9(actor,"等级不足60级，无法申请")
		return
	end	
		
	if wl_lv < 75 then
		if dengji > wl_lv then
			setsysstr("武林至尊名字",getname(actor))
			setsysint("武林至尊等级",dengji)
			setsysstr("武林至尊经验",tostring(jingyan))
			setsysstr("武林至尊行会",getbaseinfo(actor,36))
			sendmsg9(actor,"恭喜你成为武林至尊")
			local t=getplayerlst()
			for k, v  in ipairs(t) do
				wulinzhizunchuli(v) --武林至尊BUFF处理
			end
		elseif dengji == wl_lv and jingyan > wl_jingyan then
			setsysstr("武林至尊名字",getname(actor))
			setsysint("武林至尊等级",dengji)
			setsysstr("武林至尊经验",tostring(jingyan))
			setsysstr("武林至尊行会",getbaseinfo(actor,36))
			sendmsg9(actor,"恭喜你成为武林至尊")
			local t=getplayerlst()
			for k, v  in ipairs(t) do
				wulinzhizunchuli(v) --武林至尊BUFF处理
			end
		else
			sendmsg9(actor,"条件不满足")
			return
		end
	else
		if dengji > wl_lv then
			setsysstr("武林至尊名字",getname(actor))
			setsysint("武林至尊等级",dengji)
			setsysint("武林至尊兽魂值",juanxiandian)
			setsysstr("武林至尊行会",getbaseinfo(actor,36))
			sendmsg9(actor,"恭喜你成为武林至尊")
			local t=getplayerlst()
			for k, v  in ipairs(t) do
				wulinzhizunchuli(v) --武林至尊BUFF处理
			end
		elseif dengji == wl_lv and juanxiandian > shouhundian then
			setsysstr("武林至尊名字",getname(actor))
			setsysint("武林至尊等级",dengji)
			setsysint("武林至尊兽魂值",juanxiandian)
			setsysstr("武林至尊行会",getbaseinfo(actor,36))
			sendmsg9(actor,"恭喜你成为武林至尊")
			local t=getplayerlst()
			for k, v  in ipairs(t) do
				wulinzhizunchuli(v) --武林至尊BUFF处理
			end
		else
			sendmsg9(actor,"条件不满足")
			return
		end
	end
	return show(actor)
end

