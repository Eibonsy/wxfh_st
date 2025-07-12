include("Market_Def/zh.lua") --个人封装函数
local juanxian_t = {{"承包凭证",1},{"一级金针",1},{"二级金针",2},{"1万经验卷",3},{"书页",10},{"疏筋活络丸",50},{"神兽之角",50},{"神兽之血",200}}
-----------------------------大殿密使NPC
function ddms_show(actor,xianshi)
	xianshi = tonumber(xianshi) or 0
	local msg = ""
	if getint(actor,"会员等级") > 2 then
		if getsysint("合区次数") > 0 then
			msg = msg .."<Img|x=0.0|y=0.0|width=490|height=300|bg=1|esc=1|scale9r=30|scale9t=30|scale9b=30|move=0|reset=1|loadDelay=1|scale9l=30|img=zhangheng/176.png|show=0>"
			local dizhu = getsysstr("沃玛神庙地主")
			if dizhu == "" then
				dizhu = "无"
			end
			msg=msg..'<RText|x=22.0|y=264.0|size=16|color=161|text=属性获得者：>'
			if #dizhu > 14 then
				msg=msg..'<RText|x=118.0|y=264.0|size=16|color=70|scrollWidth=112|text='.. dizhu ..'>'
			else
				msg=msg..'<RText|x=118.0|y=264.0|size=16|color=70|text='.. dizhu ..'>'
			end
			msg=msg..'<RText|x=250.0|y=264.0|size=16|color=161|text=捐献点数：<'.. getsysint("沃玛神庙捐献点") ..'/FCOLOR=70>>'
			msg=msg..'<Text|x=385.0|y=264.0|size=18|color=250|text=点击捐献|link=@ddms_show,1>'
		else
			msg = msg .."<Img|x=0.0|y=0.0|width=490|height=280|bg=1|esc=1|scale9r=30|scale9t=30|scale9b=30|move=0|reset=1|loadDelay=1|scale9l=30|img=zhangheng/176.png|show=0>"
		end
		msg = msg.."<Text|ax=0.5|x=248|y=207.0|color=250|size=18|text=进入神庙|link=@ddms_jinru>"

		if getint(actor,"会员等级") == 3 then
			msg = msg.."<RText|x=24.0|y=237.0|color=161|size=16|text=温馨提示 → <投资达人/FCOLOR=253>每天可免费进入1次，当前进入次数：".. getdayint(actor,"进入沃玛神庙次数") .."/1>"
		else
			msg = msg.."<RText|x=24.0|y=237.0|color=161|size=16|text=温馨提示 → <投资专家/FCOLOR=253>每天可免费进入3次，当前进入次数：".. getdayint(actor,"进入沃玛神庙次数") .."/3>"
		end
	else
		if getsysint("合区次数") > 0 then
			msg = msg .."<Img|x=0.0|y=0.0|width=490|height=300|bg=1|esc=1|scale9r=30|scale9t=30|scale9b=30|move=0|reset=1|loadDelay=1|scale9l=30|img=zhangheng/176.png|show=0>"
			local dizhu = getsysstr("沃玛神庙地主")
			if dizhu == "" then
				dizhu = "无"
			end
			msg=msg..'<RText|x=22.0|y=264.0|size=16|color=161|text=属性获得者：>'
			if #dizhu > 14 then
				msg=msg..'<RText|x=118.0|y=264.0|size=16|color=70|scrollWidth=112|text='.. dizhu ..'>'
			else
				msg=msg..'<RText|x=118.0|y=264.0|size=16|color=70|text='.. dizhu ..'>'
			end
			msg=msg..'<RText|x=250.0|y=264.0|size=16|color=161|text=捐献点数：<'.. getsysint("沃玛神庙捐献点") ..'/FCOLOR=70>>'
			msg=msg..'<Text|x=385.0|y=263.0|size=18|color=250|text=点击捐献|link=@ddms_show,1>'
		else
			msg = msg .."<Img|x=0.0|y=0.0|width=490|height=280|bg=1|esc=1|scale9r=30|scale9t=30|scale9b=30|move=0|reset=1|loadDelay=1|scale9l=30|img=zhangheng/176.png|show=0>"
		end
		msg = msg.."<Text|ax=0.5|x=248|y=207.0|color=250|size=18|text=进入神庙|link=@ddms_jinru>"
		msg = msg.."<RText|x=24.0|y=237.0|color=161|size=16|text=温馨提示 → <投资达人/FCOLOR=253>以及<投资专家/FCOLOR=253>每日可获得免费进入次数>"
	end
	msg = msg .."<RText|x=120.0|y=163.0|size=16|color=161|text=进入条件：>"
	msg = msg .."<Img|x=220.0|y=145.0|img=zhangheng/231.png|esc=0>"
	msg = msg .."<ItemShow|x=215.0|y=140.0|width=70|height=70|itemid=".. getidbyname("沃玛密函") .."|itemcount=1|showtips=1|bgtype=0>"
	msg = msg .."<RText|x=288.0|y=163.0|size=16|color=161|text=(<".. itemcount(actor,"沃玛密函") .."/FCOLOR=249>/<1/FCOLOR=250>)>"
	
	msg = msg ..[[
		<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
		<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=246.0|y=34.5|color=251|size=18|text=大殿密使>
		<Text|x=22.0|y=55.0|color=161|size=16|text=沃玛大殿里面确实隐藏了一个秘密，老夫寻找多年，终寻得此处>
		<RText|x=22.0|y=77.0|color=161|size=16|text=当年玛法战神将妖族首领<"盘丝大仙"/FCOLOR=249>封印于沃玛神庙中，由于老>
		<Text|x=22.0|y=99.0|color=161|size=16|text=夫实力弱小，不敢窥探其中秘密，不知你可敢一试？>
	]]
	
	if xianshi == 1 then
		msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@ddms_show>"
		msg = msg ..'<Img|x=0|width=490|height=300|show=0|scale9r=50|scale9l=50|scale9b=50|move=1|esc=1|reset=0|img=zhangheng/7.png|scale9t=50>'
		msg = msg ..'<Img|x=13.0|y=220.0|img=zhangheng/203.png|esc=0>'
		msg = msg ..'<RText|x=23.0|y=236.0|color=161|size=18|text=你当前已捐献：<'.. getdayint(actor,"沃玛神庙捐献点") ..'/FCOLOR=254>点>'
		msg = msg ..'<RText|x=304.0|y=236.0|color=250|size=18|text=每天0点清除捐献点>'
		msg = msg ..'<RText|x=23.0|y=267.0|color=253|size=16|text=<地图属性加成：/FCOLOR=151>生命值+30%　攻击伤害+10%　<沃玛神庙/FCOLOR=251>生效>'
		for i = 1,#juanxian_t do
			msg = msg.."<Img|x=".. 40.5-2+8 + (i-1)%4*115 .."|y=".. 17.5-0 + math.floor((i-1)/4)*100 .."|width=50|height=50|img=zhangheng/205.png|esc=0>"
			msg = msg.."<ItemShow|x=".. 38-2+3 + (i-1)%4*115 .."|y=".. 11-0 + math.floor((i-1)/4)*100 .."|width=70|height=70|itemid=".. getidbyname(juanxian_t[i][1]) .."|itemcount=1|showtips=1|bgtype=0>"
			msg = msg .."<RText|ax=0.5|ay=0.5|x=".. 40.5+32 + (i-1)%4*115 .."|y=".. 56-0 + math.floor((i-1)/4)*100 .."|color=255|size=18|text=<".. itemcount(actor,juanxian_t[i][1]) .."/FCOLOR=249>/<1/FCOLOR=250>>"
			msg = msg.."<Button|x=".. 4.5+10+3 + (i-1)%4*115 .."|y=".. 72.5-0 + math.floor((i-1)/4)*100 .."|width=110|nimg=zh/20.png|color=150|size=16|text=捐献".. juanxian_t[i][2] .."点|link=@ddms_juanxian,".. i ..">"
		end
	end
	
	say(actor,msg)
end

function ddms_juanxian(actor,par)
	par = tonumber(par)
	if itemcount(actor,juanxian_t[par][1]) < 1 then
		sendmsg9(actor,"你没有"..juanxian_t[par][1])
		return
	end
	takeitem(actor,juanxian_t[par][1],1)
	setdayint(actor,"沃玛神庙捐献点",getdayint(actor,"沃玛神庙捐献点")+juanxian_t[par][2])
	if getdayint(actor,"沃玛神庙捐献点") > getsysint("沃玛神庙捐献点") then
		setsysint("沃玛神庙捐献点",getdayint(actor,"沃玛神庙捐献点"))
		setsysstr("沃玛神庙地主",getname(actor))
	end
	sendmsg9(actor,"捐献成功")
	return ddms_show(actor,1)
end

function ddms_jinru(actor)
	local cs = getdayint(actor,"进入沃玛神庙次数")
	local mfcs = 0
	if getint(actor,"会员等级") == 3 then
		mfcs = 1
	elseif  getint(actor,"会员等级") == 4 then
		mfcs = 3
	end
	if cs < mfcs then
		mapmove(actor,"d021",66,27,2)
		setdayint(actor,"进入沃玛神庙次数",cs+1)
		return
	end
	if itemcount(actor,"沃玛密函") < 1 then
		sendmsg9(actor,"你没有沃玛密函")
		return
	end
	takeitem(actor,"沃玛密函")
	mapmove(actor,"d021",66,27,2)
end

-----------------------------许褚NPC
function xc_show(actor,xianshi)
	xianshi = tonumber(xianshi) or 0
	local msg = [[
		<Img|x=0.0|y=0.0|width=490|height=240|scale9t=30|scale9b=30|bg=1|scale9r=30|move=0|loadDelay=1|esc=1|reset=1|scale9l=30|img=zhangheng/176.png|show=0>
<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
<RText|ax=0.5|ay=0.5|x=246.0|y=34.5|color=251|size=18|text=镜像殿堂>
<RText|x=22.0|y=55.0|color=161|size=16|text=玛法历126年，镜像之主派遣多钩猫王以美貌迷惑众生, 比奇国>
<RText|x=22.0|y=77.0|size=16|color=161|text=王敕封<"许褚"/FCOLOR=70>为镇魔大将军诛邪扶道，最终"镜像之主"大败,逃>
<RText|x=22.0|y=99.0|size=16|color=161|text=至"镜像殿堂"，<为方便单混散人追梦，中小BOSS不定点刷新/FCOLOR=70>>
<RText|x=22.0|y=131.0|color=161|size=16|text=民间传闻，击杀<钉耙猫王/FCOLOR=253>有几率穿梭至<"镜像殿堂"/FCOLOR=250>，成为<投资>>
<RText|x=22.0|y=153.0|color=161|size=16|text=<专家>穿梭的几率会很高，听说有人在他们身上寻到了终极装备？>
	
	]]

	if getsysint("合区次数") > 0 then
		local dizhu = getsysstr("镜像殿堂地主")
		if dizhu == "" then
			dizhu = "无"
		end
		msg=msg..'<RText|x=22.0|y=194.0|size=16|color=161|text=属性获得者：>'
		if #dizhu > 14 then
			msg=msg..'<RText|x=118.0|y=194.0|size=16|color=70|scrollWidth=112|text='.. dizhu ..'>'
		else
			msg=msg..'<RText|x=118.0|y=194.0|size=16|color=70|text='.. dizhu ..'>'
		end
		msg=msg..'<RText|x=250.0|y=194.0|size=16|color=161|text=捐献点数：<'.. getsysint("镜像殿堂捐献点") ..'/FCOLOR=70>>'
		msg=msg..'<Text|x=385.0|y=193.0|size=18|color=250|text=点击捐献|link=@xc_show,1>'
	end
	
	if xianshi == 1 then
		msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@xc_show>"
		msg = msg ..'<Img|x=0|width=490|height=300|show=0|scale9r=50|scale9l=50|scale9b=50|move=1|esc=1|reset=0|img=zhangheng/7.png|scale9t=50>'
		msg = msg ..'<Img|x=13.0|y=220.0|img=zhangheng/203.png|esc=0>'
		msg = msg ..'<RText|x=23.0|y=236.0|color=161|size=18|text=你当前已捐献：<'.. getdayint(actor,"镜像殿堂捐献点") ..'/FCOLOR=254>点>'
		msg = msg ..'<RText|x=304.0|y=236.0|color=250|size=18|text=每天0点清除捐献点>'
		msg = msg ..'<RText|x=23.0|y=267.0|color=253|size=16|text=<地图属性加成：/FCOLOR=151>生命值+30%　攻击伤害+10%　<镜像殿堂/FCOLOR=251>生效>'

		for i = 1,#juanxian_t do
			msg = msg.."<Img|x=".. 40.5-2+8 + (i-1)%4*115 .."|y=".. 17.5-0 + math.floor((i-1)/4)*100 .."|width=50|height=50|img=zhangheng/205.png|esc=0>"
			msg = msg.."<ItemShow|x=".. 38-2+3 + (i-1)%4*115 .."|y=".. 11-0 + math.floor((i-1)/4)*100 .."|width=70|height=70|itemid=".. getidbyname(juanxian_t[i][1]) .."|itemcount=1|showtips=1|bgtype=0>"
			msg = msg .."<RText|ax=0.5|ay=0.5|x=".. 40.5+32 + (i-1)%4*115 .."|y=".. 56-0 + math.floor((i-1)/4)*100 .."|color=255|size=18|text=<".. itemcount(actor,juanxian_t[i][1]) .."/FCOLOR=249>/<1/FCOLOR=250>>"
			msg = msg.."<Button|x=".. 4.5+10+3 + (i-1)%4*115 .."|y=".. 72.5-0 + math.floor((i-1)/4)*100 .."|width=110|nimg=zh/20.png|color=150|size=16|text=捐献".. juanxian_t[i][2] .."点|link=@xc_juanxian,".. i ..">"
		end
	end
	say(actor,msg)
end

function xc_juanxian(actor,par)
	par = tonumber(par)
	if itemcount(actor,juanxian_t[par][1]) < 1 then
		sendmsg9(actor,"你没有"..juanxian_t[par][1])
		return
	end
	takeitem(actor,juanxian_t[par][1],1)
	setdayint(actor,"镜像殿堂捐献点",getdayint(actor,"镜像殿堂捐献点")+juanxian_t[par][2])
	if getdayint(actor,"镜像殿堂捐献点") > getsysint("镜像殿堂捐献点") then
		setsysint("镜像殿堂捐献点",getdayint(actor,"镜像殿堂捐献点"))
		setsysstr("镜像殿堂地主",getname(actor))
	end
	sendmsg9(actor,"捐献成功")
	return xc_show(actor,1)
end

-----------------------------封魔道人NPC
function fmdr_show(actor,xianshi)
	xianshi = tonumber(xianshi) or 0
	local msg = [[
		<Img|x=0.0|y=0.0|width=490|height=240|bg=1|loadDelay=1|scale9r=30|scale9t=30|scale9b=30|move=0|reset=1|esc=1|scale9l=30|img=zhangheng/176.png|show=0>
<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
<RText|ax=0.5|ay=0.5|x=246.0|y=34.5|color=251|size=18|text=封魔道人>
<RText|x=22.0|y=55.0|color=161|size=16|text=历年来，玛法大陆流传着一个古老的传说，谁能打开通天之路>
<RText|x=22.0|y=77.0|size=16|color=161|text=将获得无尽宝藏，你只需帮我击杀<300只怪物/FCOLOR=250>，老夫可免费送>
<RText|x=23.0|y=99.0|size=16|color=161|text=你进入通天之路，<为方便单混散人追梦,中小BOSS不定点刷新/FCOLOR=70>>
<RText|x=280.0|y=159.0|color=253|size=16|text=成为投资达人可直接进入>
<Text|ax=0.5|ay=0.5|x=246.0|y=139.5|size=18|color=250|text=通天之路|link=@fmdr_jinru>

	]]
	msg=msg..'<RText|x=21.0|y=159.0|size=16|color=161|text=你当前已击杀怪物：<'.. getint(actor,"封魔殿杀怪数量") ..'/FCOLOR=254>>'
	
	if getsysint("合区次数") > 0 then
		local dizhu = getsysstr("封魔殿地主")
		if dizhu == "" then
			dizhu = "无"
		end
		msg=msg..'<RText|x=22.0|y=194.0|size=16|color=161|text=属性获得者：>'
		if #dizhu > 14 then
			msg=msg..'<RText|x=118.0|y=194.0|size=16|color=70|scrollWidth=112|text='.. dizhu ..'>'
		else
			msg=msg..'<RText|x=118.0|y=194.0|size=16|color=70|text='.. dizhu ..'>'
		end
		
		msg=msg..'<RText|x=250.0|y=194.0|size=16|color=161|text=捐献点数：<'.. getsysint("封魔殿捐献点") ..'/FCOLOR=70>>'
		msg=msg..'<Text|x=385.0|y=193.0|size=18|color=250|text=点击捐献|link=@fmdr_show,1>'
	end
	
	if xianshi == 1 then
		msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@fmdr_show>"
		msg = msg ..'<Img|x=0|width=490|height=300|show=0|scale9r=50|scale9l=50|scale9b=50|move=1|esc=1|reset=0|img=zhangheng/7.png|scale9t=50>'
		msg = msg ..'<Img|x=13.0|y=220.0|img=zhangheng/203.png|esc=0>'
		msg = msg ..'<RText|x=23.0|y=236.0|color=161|size=18|text=你当前已捐献：<'.. getdayint(actor,"封魔殿捐献点") ..'/FCOLOR=254>点>'
		msg = msg ..'<RText|x=304.0|y=236.0|color=250|size=18|text=每天0点清除捐献点>'
		msg = msg ..'<RText|x=23.0|y=267.0|color=253|size=16|text=<地图属性加成：/FCOLOR=151>生命值+30%　攻击伤害+10%　<通天之路/FCOLOR=251>生效>'

		for i = 1,#juanxian_t do
			msg = msg.."<Img|x=".. 40.5-2+8 + (i-1)%4*115 .."|y=".. 17.5-0 + math.floor((i-1)/4)*100 .."|width=50|height=50|img=zhangheng/205.png|esc=0>"
			msg = msg.."<ItemShow|x=".. 38-2+3 + (i-1)%4*115 .."|y=".. 11-0 + math.floor((i-1)/4)*100 .."|width=70|height=70|itemid=".. getidbyname(juanxian_t[i][1]) .."|itemcount=1|showtips=1|bgtype=0>"
			msg = msg .."<RText|ax=0.5|ay=0.5|x=".. 40.5+32 + (i-1)%4*115 .."|y=".. 56-0 + math.floor((i-1)/4)*100 .."|color=255|size=18|text=<".. itemcount(actor,juanxian_t[i][1]) .."/FCOLOR=249>/<1/FCOLOR=250>>"
			msg = msg.."<Button|x=".. 4.5+10+3 + (i-1)%4*115 .."|y=".. 72.5-0 + math.floor((i-1)/4)*100 .."|width=110|nimg=zh/20.png|color=150|size=16|text=捐献".. juanxian_t[i][2] .."点|link=@fmdr_juanxian,".. i ..">"
		end
	end
	say(actor,msg)
end

function fmdr_juanxian(actor,par)
	par = tonumber(par)
	if itemcount(actor,juanxian_t[par][1]) < 1 then
		sendmsg9(actor,"你没有"..juanxian_t[par][1])
		return
	end
	takeitem(actor,juanxian_t[par][1],1)
	setdayint(actor,"封魔殿捐献点",getdayint(actor,"封魔殿捐献点")+juanxian_t[par][2])
	if getdayint(actor,"封魔殿捐献点") > getsysint("封魔殿捐献点") then
		setsysint("封魔殿捐献点",getdayint(actor,"封魔殿捐献点"))
		setsysstr("封魔殿地主",getname(actor))
	end
	sendmsg9(actor,"捐献成功")
	return fmdr_show(actor,1)
end

function fmdr_jinru(actor)
	if getint(actor,"会员等级") >= 3 then
		mapmove(actor,"d2001",257,263,1)
		return
	end
	if getint(actor,"封魔殿杀怪数量") < 300 then
		sendmsg9(actor,"当前地图杀怪数量不足300只")
		return
	end
	setint(actor,"封魔殿杀怪数量",0)
	mapmove(actor,"d2001",257,263,1)
end

-----------------------------守墓者NPC
function smz_show(actor)
	local msg = [[
		<Img|x=0.0|y=0.0|width=490|height=240|scale9r=30|bg=1|scale9t=30|scale9b=30|move=0|reset=1|scale9l=30|loadDelay=1|img=zhangheng/176.png|esc=1|show=0>
		<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
		<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
		<RText|ax=0.5|ay=0.5|x=246.0|y=34.5|color=251|size=18|text=守陵武将>
		<RText|x=22.0|y=55.0|size=16|color=161|text=勇士你能来到这里，说明你天赋异禀，实力胜于常人，只要你能>
		<RText|x=22.0|y=77.0|size=16|color=161|text=击败<"通天教主"/FCOLOR=250>获取通关文牒，老夫即可放你进入国王陵墓，寻>
		<RText|x=22.0|y=99.0|size=16|color=161|text=找那无尽宝藏..........>
	]]
	--msg = msg.."<RText|x=160.0|y=141.0|color=161|size=16|text=进入条件：<通关文牒/FCOLOR=70>(<".. itemcount(actor,"通关文牒") .."/FCOLOR=249>/<1/FCOLOR=250>)>"
	msg = msg .."<RText|x=120.0|y=143.0|size=16|color=161|text=进入条件：>"
	msg = msg .."<Img|x=220.0|y=125.0|img=zhangheng/231.png|esc=0>"
	msg = msg .."<ItemShow|x=215.0|y=120.0|width=70|height=70|itemid=".. getidbyname("通关文牒") .."|itemcount=1|showtips=1|bgtype=0>"
	msg = msg .."<RText|x=288.0|y=143.0|size=16|color=161|text=(<".. itemcount(actor,"通关文牒") .."/FCOLOR=249>/<1/FCOLOR=250>)>"
	if getint(actor,"累计充值") > 0 then
		msg = msg.."<Text|ax=0.5|x=146.0|y=193.0|color=250|size=18|text=进入陵墓|link=@smz_jinru>"
		msg = msg.."<Text|ax=0.5|x=346.0|y=193.0|color=250|size=18|text=通关文牒|link=@smz_wendie>"
	else
		msg = msg.."<Text|ax=0.5|x=246|y=193.0|color=250|size=18|text=进入陵墓|link=@smz_jinru>"
	end

	say(actor,msg)
end

function smz_wendie(actor)
	if getint(actor,"会员等级") < 2 then
		sendmsg9(actor,"成为投资大使才能查看")
		return
	end
	messagebox(actor,"\n通关文牒需200元宝一个，是否购买\n\n请尽量通过击杀通天教主获取","@smz_goumai","@smz_kong")
end

function smz_kong(actor)
end

function smz_goumai(actor)
	if not subingot(actor,200) then
		sendmsg9(actor,"元宝不足200")
		return
	end
	giveitem(actor,"通关文牒",1)
	sendmsg9(actor,"购买成功")
	return smz_show(actor)
end

function smz_jinru(actor)
	if itemcount(actor,"通关文牒") < 1 then
		sendmsg9(actor,"没有通关文牒")
		return
	end
	takeitem(actor,"通关文牒",1)
	mapmove(actor,"dm002",9,26,2)
end

-----------------------------祖玛族长老NPC
function zmzzl_show(actor,xianshi)
	xianshi = tonumber(xianshi)
	local msg = ""
	if getint(actor,"会员等级") > 2 then
		if getsysint("合区次数") > 0 then
			msg = msg .."<Img|x=0.0|y=0.0|width=490|height=300|bg=1|esc=1|scale9r=30|scale9t=30|scale9b=30|move=0|reset=1|loadDelay=1|scale9l=30|img=zhangheng/176.png|show=0>"
			local dizhu = getsysstr("祖玛祭坛地主")
			if dizhu == "" then
				dizhu = "无"
			end
			msg=msg..'<RText|x=22.0|y=264.0|size=16|color=161|text=属性获得者：>'
			if #dizhu > 14 then
				msg=msg..'<RText|x=118.0|y=264.0|size=16|color=70|scrollWidth=112|text='.. dizhu ..'>'
			else
				msg=msg..'<RText|x=118.0|y=264.0|size=16|color=70|text='.. dizhu ..'>'
			end
			msg=msg..'<RText|x=250.0|y=264.0|size=16|color=161|text=捐献点数：<'.. getsysint("祖玛祭坛捐献点") ..'/FCOLOR=70>>'
			msg=msg..'<Text|x=385.0|y=264.0|size=18|color=250|text=点击捐献|link=@zmzzl_show,1>'
		else
			msg = msg .."<Img|x=0.0|y=0.0|width=490|height=280|bg=1|esc=1|scale9r=30|scale9t=30|scale9b=30|move=0|reset=1|loadDelay=1|scale9l=30|img=zhangheng/176.png|show=0>"
		end
		msg = msg.."<Text|ax=0.5|x=248|y=207.0|color=250|size=18|text=进入祭坛|link=@zmzzl_jinru>"

		if getint(actor,"会员等级") == 3 then
			msg = msg.."<RText|x=24.0|y=237.0|color=161|size=16|text=温馨提示 → <投资达人/FCOLOR=253>每天可免费进入1次，当前进入次数：".. getdayint(actor,"进入祖玛祭坛次数") .."/1>"
		else
			msg = msg.."<RText|x=24.0|y=237.0|color=161|size=16|text=温馨提示 → <投资专家/FCOLOR=253>每天可免费进入3次，当前进入次数：".. getdayint(actor,"进入祖玛祭坛次数") .."/3>"
		end
	else
		if getsysint("合区次数") > 0 then
			msg = msg .."<Img|x=0.0|y=0.0|width=490|height=300|bg=1|esc=1|scale9r=30|scale9t=30|scale9b=30|move=0|reset=1|loadDelay=1|scale9l=30|img=zhangheng/176.png|show=0>"
			local dizhu = getsysstr("祖玛祭坛地主")
			if dizhu == "" then
				dizhu = "无"
			end
			msg=msg..'<RText|x=22.0|y=264.0|size=16|color=161|text=属性获得者：>'
			if #dizhu > 14 then
				msg=msg..'<RText|x=118.0|y=264.0|size=16|color=70|scrollWidth=112|text='.. dizhu ..'>'
			else
				msg=msg..'<RText|x=118.0|y=264.0|size=16|color=70|text='.. dizhu ..'>'
			end
			msg=msg..'<RText|x=250.0|y=264.0|size=16|color=161|text=捐献点数：<'.. getsysint("祖玛祭坛捐献点") ..'/FCOLOR=70>>'
			msg=msg..'<Text|x=385.0|y=263.0|size=18|color=250|text=点击捐献|link=@zmzzl_show,1>'
		else
			msg = msg .."<Img|x=0.0|y=0.0|width=490|height=280|bg=1|esc=1|scale9r=30|scale9t=30|scale9b=30|move=0|reset=1|loadDelay=1|scale9l=30|img=zhangheng/176.png|show=0>"
		end
		msg = msg.."<Text|ax=0.5|x=248|y=207.0|color=250|size=18|text=进入祭坛|link=@zmzzl_jinru>"
		msg = msg.."<RText|x=24.0|y=237.0|color=161|size=16|text=温馨提示 → <投资达人/FCOLOR=253>以及<投资专家/FCOLOR=253>每日可获得免费进入次数>"
	end
	msg = msg..[[
			<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
			<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
			<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
			<RText|ax=0.5|ay=0.5|x=246.0|y=34.5|color=251|size=18|text=祖玛族长老>
			<RText|x=22.0|y=55.0|color=161|size=16|text=当年魔族军团进攻"祖玛族"比奇国王派遣<"玛法判官"/FCOLOR=250>镇压魔族>
			<RText|x=22.0|y=77.0|color=161|size=16|text=于祖玛大厅全面抗击魔军，历时数年终击溃魔军，此役后祖玛>
			<RText|x=22.0|y=99.0|color=161|size=16|text=族修建祭坛，祭祀玛法判官，近日，祭坛传来异动， 如勇士寻>
			<RText|x=22.0|y=121.0|color=161|size=16|text=得我族圣物<"祖玛头像"/FCOLOR=250>可进去帮老夫查看下异动的来源....>
		]]
	--msg = msg .."<RText|x=160.0|y=156.0|size=16|color=161|text=进入条件：<祖玛头像/FCOLOR=70>(<".. itemcount(actor,"祖玛头像") .."/FCOLOR=249>/<1/FCOLOR=250>)>"
	msg = msg .."<RText|x=120.0|y=163.0|size=16|color=161|text=进入条件：>"
	msg = msg .."<Img|x=220.0|y=145.0|img=zhangheng/231.png|esc=0>"
	msg = msg .."<ItemShow|x=215.0|y=140.0|width=70|height=70|itemid=".. getidbyname("祖玛头像") .."|itemcount=1|showtips=1|bgtype=0>"
	msg = msg .."<RText|x=288.0|y=163.0|size=16|color=161|text=(<".. itemcount(actor,"祖玛头像") .."/FCOLOR=249>/<1/FCOLOR=250>)>"
	
	if xianshi == 1 then
		msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@zmzzl_show>"
		msg = msg ..'<Img|x=0|width=490|height=300|show=0|scale9r=50|scale9l=50|scale9b=50|move=1|esc=1|reset=0|img=zhangheng/7.png|scale9t=50>'
		msg = msg ..'<Img|x=13.0|y=220.0|img=zhangheng/203.png|esc=0>'
		msg = msg ..'<RText|x=23.0|y=236.0|color=161|size=18|text=你当前已捐献：<'.. getdayint(actor,"祖玛祭坛捐献点") ..'/FCOLOR=254>点>'
		msg = msg ..'<RText|x=304.0|y=236.0|color=250|size=18|text=每天0点清除捐献点>'
		msg = msg ..'<RText|x=23.0|y=267.0|color=253|size=16|text=<地图属性加成：/FCOLOR=151>生命值+30%　攻击伤害+10%　<祖玛祭坛/FCOLOR=251>生效>'

		for i = 1,#juanxian_t do
			msg = msg.."<Img|x=".. 40.5-2+8 + (i-1)%4*115 .."|y=".. 17.5-0 + math.floor((i-1)/4)*100 .."|width=50|height=50|img=zhangheng/205.png|esc=0>"
			msg = msg.."<ItemShow|x=".. 38-2+3 + (i-1)%4*115 .."|y=".. 11-0 + math.floor((i-1)/4)*100 .."|width=70|height=70|itemid=".. getidbyname(juanxian_t[i][1]) .."|itemcount=1|showtips=1|bgtype=0>"
			msg = msg .."<RText|ax=0.5|ay=0.5|x=".. 40.5+32 + (i-1)%4*115 .."|y=".. 56-0 + math.floor((i-1)/4)*100 .."|color=255|size=18|text=<".. itemcount(actor,juanxian_t[i][1]) .."/FCOLOR=249>/<1/FCOLOR=250>>"
			msg = msg.."<Button|x=".. 4.5+10+3 + (i-1)%4*115 .."|y=".. 72.5-0 + math.floor((i-1)/4)*100 .."|width=110|nimg=zh/20.png|color=150|size=16|text=捐献".. juanxian_t[i][2] .."点|link=@zmzzl_juanxian,".. i ..">"
		end
	end
	say(actor,msg)
end

function zmzzl_juanxian(actor,par)
	par = tonumber(par)
	if itemcount(actor,juanxian_t[par][1]) < 1 then
		sendmsg9(actor,"你没有"..juanxian_t[par][1])
		return
	end
	takeitem(actor,juanxian_t[par][1],1)
	setdayint(actor,"祖玛祭坛捐献点",getdayint(actor,"祖玛祭坛捐献点")+juanxian_t[par][2])
	if getdayint(actor,"祖玛祭坛捐献点") > getsysint("祖玛祭坛捐献点") then
		setsysint("祖玛祭坛捐献点",getdayint(actor,"祖玛祭坛捐献点"))
		setsysstr("祖玛祭坛地主",getname(actor))
	end
	sendmsg9(actor,"捐献成功")
	return zmzzl_show(actor,1)
end

function zmzzl_jinru(actor)
	local cs = getdayint(actor,"进入祖玛祭坛次数")
	local mfcs = 0
	if getint(actor,"会员等级") == 3 then
		mfcs = 1
	elseif  getint(actor,"会员等级") == 4 then
		mfcs = 3
	end
	if cs < mfcs then
		map(actor,"zmjt")
		setdayint(actor,"进入祖玛祭坛次数",cs+1)
		return
	end
	
	if itemcount(actor,"祖玛头像") < 1 then
		sendmsg9(actor,"没有祖玛头像")
		return
	end
	takeitem(actor,"祖玛头像",1)
	map(actor,"zmjt")
end

function zmzzl_mianfeijinru(actor)
	
end
-----------------------------荆轲NPC
function jk_show(actor,xianshi)
	xianshi = tonumber(xianshi)
	local msg = ""
	if getint(actor,"会员等级") > 2 then
		if getsysint("合区次数") > 0 then
			msg = msg .."<Img|x=0.0|y=0.0|width=490|height=300|bg=1|esc=1|scale9r=30|scale9t=30|scale9b=30|move=0|reset=1|loadDelay=1|scale9l=30|img=zhangheng/176.png|show=0>"
			local dizhu = getsysstr("黄泉深渊地主")
			if dizhu == "" then
				dizhu = "无"
			end
			msg=msg..'<RText|x=22.0|y=264.0|size=16|color=161|text=属性获得者：>'
			if #dizhu > 14 then
				msg=msg..'<RText|x=118.0|y=264.0|size=16|color=70|scrollWidth=112|text='.. dizhu ..'>'
			else
				msg=msg..'<RText|x=118.0|y=264.0|size=16|color=70|text='.. dizhu ..'>'
			end
			msg=msg..'<RText|x=250.0|y=264.0|size=16|color=161|text=捐献点数：<'.. getsysint("黄泉深渊捐献点") ..'/FCOLOR=70>>'
			msg=msg..'<Text|x=385.0|y=264.0|size=18|color=250|text=点击捐献|link=@jk_show,1>'
		else
			msg = msg .."<Img|x=0.0|y=0.0|width=490|height=280|bg=1|esc=1|scale9r=30|scale9t=30|scale9b=30|move=0|reset=1|loadDelay=1|scale9l=30|img=zhangheng/176.png|show=0>"
		end
		msg = msg.."<Text|ax=0.5|x=248|y=207.0|color=250|size=18|text=奈何桥|link=@jk_jinru>"

		if getint(actor,"会员等级") == 3 then
			msg = msg.."<RText|x=24.0|y=237.0|color=161|size=16|text=温馨提示 → <投资达人/FCOLOR=253>每天可免费进入1次，当前进入次数：".. getdayint(actor,"进入奈何桥次数") .."/1>"
		else
			msg = msg.."<RText|x=24.0|y=237.0|color=161|size=16|text=温馨提示 → <投资专家/FCOLOR=253>每天可免费进入3次，当前进入次数：".. getdayint(actor,"进入奈何桥次数") .."/3>"
		end
	else
		if getsysint("合区次数") > 0 then
			msg = msg .."<Img|x=0.0|y=0.0|width=490|height=300|bg=1|esc=1|scale9r=30|scale9t=30|scale9b=30|move=0|reset=1|loadDelay=1|scale9l=30|img=zhangheng/176.png|show=0>"
			local dizhu = getsysstr("黄泉深渊地主")
			if dizhu == "" then
				dizhu = "无"
			end
			msg=msg..'<RText|x=22.0|y=264.0|size=16|color=161|text=属性获得者：>'
			if #dizhu > 14 then
				msg=msg..'<RText|x=118.0|y=264.0|size=16|color=70|scrollWidth=112|text='.. dizhu ..'>'
			else
				msg=msg..'<RText|x=118.0|y=264.0|size=16|color=70|text='.. dizhu ..'>'
			end
			msg=msg..'<RText|x=250.0|y=264.0|size=16|color=161|text=捐献点数：<'.. getsysint("黄泉深渊捐献点") ..'/FCOLOR=70>>'
			msg=msg..'<Text|x=385.0|y=263.0|size=18|color=250|text=点击捐献|link=@jk_show,1>'
		else
			msg = msg .."<Img|x=0.0|y=0.0|width=490|height=280|bg=1|esc=1|scale9r=30|scale9t=30|scale9b=30|move=0|reset=1|loadDelay=1|scale9l=30|img=zhangheng/176.png|show=0>"
		end
		msg = msg.."<Text|ax=0.5|x=248|y=207.0|color=250|size=18|text=奈何桥|link=@jk_jinru>"
		msg = msg.."<RText|x=24.0|y=237.0|color=161|size=16|text=温馨提示 → <投资达人/FCOLOR=253>以及<投资专家/FCOLOR=253>每日可获得免费进入次数>"
	end
	msg = msg..[[		
			<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
			<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
			<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
			<RText|ax=0.5|ay=0.5|x=246.0|y=34.5|color=251|size=18|text=孟婆>
			<RText|x=22.0|y=55.0|color=161|size=16|text=勇士，你终于来了，老太已等待几千年了，当年黄泉教主耗尽>
			<RText|x=22.0|y=77.0|color=161|size=16|text=毕生功力开辟了<奈何桥/FCOLOR=250>的通道，只为让封印在"黄泉深渊"的诸>
			<RText|x=22.0|y=99.0|color=161|size=16|text=多高级装备重见天日，你只需寻得<孟婆汤/FCOLOR=250>我就可以送你进入那>
			<RText|x=22.0|y=121.0|color=161|size=16|text=通往黄泉深渊的桥梁...>
		]]
	msg = msg .."<RText|x=120.0|y=163.0|size=16|color=161|text=进入条件：>"
	msg = msg .."<Img|x=220.0|y=145.0|img=zhangheng/231.png|esc=0>"
	msg = msg .."<ItemShow|x=215.0|y=140.0|width=70|height=70|itemid=".. getidbyname("孟婆汤") .."|itemcount=1|showtips=1|bgtype=0>"
	msg = msg .."<RText|x=288.0|y=163.0|size=16|color=161|text=(<".. itemcount(actor,"孟婆汤") .."/FCOLOR=249>/<1/FCOLOR=250>)>"
	--msg = msg .."<RText|x=160.0|y=156.0|size=16|color=161|text=进入条件：<孟婆汤/FCOLOR=70>(<".. itemcount(actor,"孟婆汤") .."/FCOLOR=249>/<1/FCOLOR=250>)>"
	if xianshi == 1 then
		msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@jk_show>"
		msg = msg ..'<Img|x=0|width=490|height=300|show=0|scale9r=50|scale9l=50|scale9b=50|move=1|esc=1|reset=0|img=zhangheng/7.png|scale9t=50>'
		msg = msg ..'<Img|x=13.0|y=220.0|img=zhangheng/203.png|esc=0>'
		msg = msg ..'<RText|x=23.0|y=236.0|color=161|size=18|text=你当前已捐献：<'.. getdayint(actor,"黄泉深渊捐献点") ..'/FCOLOR=254>点>'
		msg = msg ..'<RText|x=304.0|y=236.0|color=250|size=18|text=每天0点清除捐献点>'
		msg = msg ..'<RText|x=23.0|y=267.0|color=253|size=16|text=<地图属性加成：/FCOLOR=151>生命值+30%　攻击伤害+10%　<黄泉深渊/FCOLOR=251>生效>'

		for i = 1,#juanxian_t do
			msg = msg.."<Img|x=".. 40.5-2+8 + (i-1)%4*115 .."|y=".. 17.5-0 + math.floor((i-1)/4)*100 .."|width=50|height=50|img=zhangheng/205.png|esc=0>"
			msg = msg.."<ItemShow|x=".. 38-2+3 + (i-1)%4*115 .."|y=".. 11-0 + math.floor((i-1)/4)*100 .."|width=70|height=70|itemid=".. getidbyname(juanxian_t[i][1]) .."|itemcount=1|showtips=1|bgtype=0>"
			msg = msg .."<RText|ax=0.5|ay=0.5|x=".. 40.5+32 + (i-1)%4*115 .."|y=".. 56-0 + math.floor((i-1)/4)*100 .."|color=255|size=18|text=<".. itemcount(actor,juanxian_t[i][1]) .."/FCOLOR=249>/<1/FCOLOR=250>>"
			msg = msg.."<Button|x=".. 4.5+10+3 + (i-1)%4*115 .."|y=".. 72.5-0 + math.floor((i-1)/4)*100 .."|width=110|nimg=zh/20.png|color=150|size=16|text=捐献".. juanxian_t[i][2] .."点|link=@jk_juanxian,".. i ..">"
		end
	end
	say(actor,msg)
end

function jk_juanxian(actor,par)
	par = tonumber(par)
	if itemcount(actor,juanxian_t[par][1]) < 1 then
		sendmsg9(actor,"你没有"..juanxian_t[par][1])
		return
	end
	takeitem(actor,juanxian_t[par][1],1)
	setdayint(actor,"黄泉深渊捐献点",getdayint(actor,"黄泉深渊捐献点")+juanxian_t[par][2])
	if getdayint(actor,"黄泉深渊捐献点") > getsysint("黄泉深渊捐献点") then
		setsysint("黄泉深渊捐献点",getdayint(actor,"黄泉深渊捐献点"))
		setsysstr("黄泉深渊地主",getname(actor))
	end
	sendmsg9(actor,"捐献成功")
	return jk_show(actor,1)
end

function jk_jinru(actor)
	local cs = getdayint(actor,"进入奈何桥次数")
	local mfcs = 0
	if getint(actor,"会员等级") == 3 then
		mfcs = 1
	elseif  getint(actor,"会员等级") == 4 then
		mfcs = 3
	end
	if cs < mfcs then
		mapmove(actor,"nhq",83,18,1)
		setdayint(actor,"进入奈何桥次数",cs+1)
		return
	end
	
	if itemcount(actor,"孟婆汤") < 1 then
		sendmsg9(actor,"没有孟婆汤")
		return
	end
	takeitem(actor,"孟婆汤",1)
	mapmove(actor,"nhq",83,18,1)
end

-----------------------------孟婆NPC
function mp_show(actor)
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=240|bg=1|scale9l=30|scale9r=30|scale9t=30|scale9b=30|move=0|loadDelay=1|reset=1|esc=1|img=zhangheng/176.png|show=0>
	<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
	<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
	<RText|ax=0.5|ay=0.5|x=246.0|y=34.5|color=251|size=18|text=孟婆>
	<RText|x=22.0|y=55.0|color=161|size=16|text=今生过眼前尘事，归兮，归兮，走吧，该过桥了，难道阁下是>
	<RText|x=22.0|y=77.0|color=161|size=16|text=心有执念，不愿入这轮回了，那我们做个交易如何，若阁下愿>
	<RText|x=22.0|y=99.0|color=161|size=16|text=意，我就免费送你进入那"黄泉深渊"挑战不朽大帝，博得一线>
	<RText|x=22.0|y=121.0|size=16|color=161|text=生机..........>
	<Text|ax=0.5|x=146.0|y=187.0|color=250|size=18|text=愿意|link=@mp_jinru>
	<Text|ax=0.5|x=346.0|y=187.0|color=250|size=18|text=不愿意|link=@exit>
	]]
	
	say(actor,msg)
end

function mp_jinru(actor)
	map(actor,"hqsy")
end

-----------------------------牛魔王的信使NPC
function nmw_show(actor,xianshi)
	xianshi = tonumber(xianshi)
	local msg = ""
	if getint(actor,"会员等级") > 2 then
		if getsysint("合区次数") > 0 then
			msg = msg .."<Img|x=0.0|y=0.0|width=490|height=300|bg=1|esc=1|scale9r=30|scale9t=30|scale9b=30|move=0|reset=1|loadDelay=1|scale9l=30|img=zhangheng/176.png|show=0>"
			local dizhu = getsysstr("潜龙深渊地主")
			if dizhu == "" then
				dizhu = "无"
			end
			msg=msg..'<RText|x=22.0|y=264.0|size=16|color=161|text=属性获得者：>'
			if #dizhu > 14 then
				msg=msg..'<RText|x=118.0|y=264.0|size=16|color=70|scrollWidth=112|text='.. dizhu ..'>'
			else
				msg=msg..'<RText|x=118.0|y=264.0|size=16|color=70|text='.. dizhu ..'>'
			end
			msg=msg..'<RText|x=250.0|y=264.0|size=16|color=161|text=捐献点数：<'.. getsysint("潜龙深渊捐献点") ..'/FCOLOR=70>>'
			msg=msg..'<Text|x=385.0|y=264.0|size=18|color=250|text=点击捐献|link=@nmw_show,1>'
		else
			msg = msg .."<Img|x=0.0|y=0.0|width=490|height=280|bg=1|esc=1|scale9r=30|scale9t=30|scale9b=30|move=0|reset=1|loadDelay=1|scale9l=30|img=zhangheng/176.png|show=0>"
		end
		msg = msg.."<Text|ax=0.5|x=248|y=207.0|color=250|size=18|text=潜龙深渊|link=@nmw_jinru>"

		if getint(actor,"会员等级") == 3 then
			msg = msg.."<RText|x=24.0|y=237.0|color=161|size=16|text=温馨提示 → <投资达人/FCOLOR=253>每天可免费进入1次，当前进入次数：".. getdayint(actor,"进入潜龙深渊次数") .."/1>"
		else
			msg = msg.."<RText|x=24.0|y=237.0|color=161|size=16|text=温馨提示 → <投资专家/FCOLOR=253>每天可免费进入3次，当前进入次数：".. getdayint(actor,"进入潜龙深渊次数") .."/3>"
		end
	else
		if getsysint("合区次数") > 0 then
			msg = msg .."<Img|x=0.0|y=0.0|width=490|height=300|bg=1|esc=1|scale9r=30|scale9t=30|scale9b=30|move=0|reset=1|loadDelay=1|scale9l=30|img=zhangheng/176.png|show=0>"
			local dizhu = getsysstr("潜龙深渊地主")
			if dizhu == "" then
				dizhu = "无"
			end
			msg=msg..'<RText|x=22.0|y=264.0|size=16|color=161|text=属性获得者：>'
			if #dizhu > 14 then
				msg=msg..'<RText|x=118.0|y=264.0|size=16|color=70|scrollWidth=112|text='.. dizhu ..'>'
			else
				msg=msg..'<RText|x=118.0|y=264.0|size=16|color=70|text='.. dizhu ..'>'
			end
			msg=msg..'<RText|x=250.0|y=264.0|size=16|color=161|text=捐献点数：<'.. getsysint("潜龙深渊捐献点") ..'/FCOLOR=70>>'
			msg=msg..'<Text|x=385.0|y=263.0|size=18|color=250|text=点击捐献|link=@nmw_show,1>'
		else
			msg = msg .."<Img|x=0.0|y=0.0|width=490|height=280|bg=1|esc=1|scale9r=30|scale9t=30|scale9b=30|move=0|reset=1|loadDelay=1|scale9l=30|img=zhangheng/176.png|show=0>"
		end
		msg = msg.."<Text|ax=0.5|x=248|y=207.0|color=250|size=18|text=潜龙深渊|link=@nmw_jinru>"
		msg = msg.."<RText|x=24.0|y=237.0|color=161|size=16|text=温馨提示 → <投资达人/FCOLOR=253>以及<投资专家/FCOLOR=253>每日可获得免费进入次数>"
	end
	msg = msg..[[		
			<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
			<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
			<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
			<RText|ax=0.5|ay=0.5|x=246.0|y=34.5|color=251|size=18|text=铁扇公主>
			<RText|x=22.0|y=65.0|color=161|size=16|text=小子，想进入"潜龙深渊"寻宝，你可有我族大王的"推荐信"呀！>
			<RText|x=22.0|y=92.0|size=16|color=161|text=<为方便单混散人追梦，中小BOSS不定点刷新.../FCOLOR=70>>
		]]
	--msg = msg .."<RText|x=160.0|y=126.0|size=16|color=161|text=进入条件：<推荐信/FCOLOR=70>(<".. itemcount(actor,"牛魔王的推荐信") .."/FCOLOR=249>/<1/FCOLOR=250>)>"
	msg = msg .."<RText|x=120.0|y=163.0|size=16|color=161|text=进入条件：>"
	msg = msg .."<Img|x=220.0|y=145.0|img=zhangheng/231.png|esc=0>"
	msg = msg .."<ItemShow|x=215.0|y=140.0|width=70|height=70|itemid=".. getidbyname("牛魔王的推荐信") .."|itemcount=1|showtips=1|bgtype=0>"
	msg = msg .."<RText|x=288.0|y=163.0|size=16|color=161|text=(<".. itemcount(actor,"牛魔王的推荐信") .."/FCOLOR=249>/<1/FCOLOR=250>)>"
	if xianshi == 1 then
		msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@nmw_show>"
		msg = msg ..'<Img|x=0|width=490|height=300|show=0|scale9r=50|scale9l=50|scale9b=50|move=1|esc=1|reset=0|img=zhangheng/7.png|scale9t=50>'
		msg = msg ..'<Img|x=13.0|y=220.0|img=zhangheng/203.png|esc=0>'
		msg = msg ..'<RText|x=23.0|y=236.0|color=161|size=18|text=你当前已捐献：<'.. getdayint(actor,"潜龙深渊捐献点") ..'/FCOLOR=254>点>'
		msg = msg ..'<RText|x=304.0|y=236.0|color=250|size=18|text=每天0点清除捐献点>'
		msg = msg ..'<RText|x=23.0|y=267.0|color=253|size=16|text=<地图属性加成：/FCOLOR=151>生命值+30%　攻击伤害+10%　<潜龙深渊/FCOLOR=253>生效>'

		for i = 1,#juanxian_t do
			msg = msg.."<Img|x=".. 40.5-2+8 + (i-1)%4*115 .."|y=".. 17.5-0 + math.floor((i-1)/4)*100 .."|width=50|height=50|img=zhangheng/205.png|esc=0>"
			msg = msg.."<ItemShow|x=".. 38-2+3 + (i-1)%4*115 .."|y=".. 11-0 + math.floor((i-1)/4)*100 .."|width=70|height=70|itemid=".. getidbyname(juanxian_t[i][1]) .."|itemcount=1|showtips=1|bgtype=0>"
			msg = msg .."<RText|ax=0.5|ay=0.5|x=".. 40.5+32 + (i-1)%4*115 .."|y=".. 56-0 + math.floor((i-1)/4)*100 .."|color=255|size=18|text=<".. itemcount(actor,juanxian_t[i][1]) .."/FCOLOR=249>/<1/FCOLOR=250>>"
			msg = msg.."<Button|x=".. 4.5+10+3 + (i-1)%4*115 .."|y=".. 72.5-0 + math.floor((i-1)/4)*100 .."|width=110|nimg=zh/20.png|color=150|size=16|text=捐献".. juanxian_t[i][2] .."点|link=@nmw_juanxian,".. i ..">"
		end
	end
	say(actor,msg)
end

function nmw_juanxian(actor,par)
	par = tonumber(par)
	if itemcount(actor,juanxian_t[par][1]) < 1 then
		sendmsg9(actor,"你没有"..juanxian_t[par][1])
		return
	end
	takeitem(actor,juanxian_t[par][1],1)
	setdayint(actor,"潜龙深渊捐献点",getdayint(actor,"潜龙深渊捐献点")+juanxian_t[par][2])
	if getdayint(actor,"潜龙深渊捐献点") > getsysint("潜龙深渊捐献点") then
		setsysint("潜龙深渊捐献点",getdayint(actor,"潜龙深渊捐献点"))
		setsysstr("潜龙深渊地主",getname(actor))
	end
	sendmsg9(actor,"捐献成功")
	return nmw_show(actor,1)
end

function nmw_jinru(actor)
	local cs = getdayint(actor,"进入潜龙深渊次数")
	local mfcs = 0
	if getint(actor,"会员等级") == 3 then
		mfcs = 1
	elseif  getint(actor,"会员等级") == 4 then
		mfcs = 3
	end
	if cs < mfcs then
		mapmove(actor,"qlsy",25,19,2)
		setdayint(actor,"进入潜龙深渊次数",cs+1)
		return
	end
	
	
	if itemcount(actor,"牛魔王的推荐信") < 1 then
		sendmsg9(actor,"没有牛魔王的推荐信")
		return
	end
	takeitem(actor,"牛魔王的推荐信",1)
	mapmove(actor,"qlsy",25,19,2)
end


-----------------------------镇魔司使者NPC
function zmssz_show(actor)
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=280|reset=1|scale9r=30|scale9t=30|bg=1|scale9b=30|move=0|scale9l=30|loadDelay=1|esc=1|img=zhangheng/176.png|show=0>
	<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
	<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
	<RText|ax=0.5|ay=0.5|x=246.0|y=34.5|color=251|size=18|text=镇魔司使者>
	<RText|x=22|y=55.0|size=16|color=161|text=传闻击杀<"远古赤月恶魔"/FCOLOR=253>后，烟花神殿的<烟花教主/FCOLOR=249>会自动复活>
	<RText|x=22|y=77.0|size=16|color=161|text=在赤月巢穴释放<"九珠连环炮"/FCOLOR=250>有很大几率进入<烟花迷宫/FCOLOR=250>>
	<RText|x=22|y=107.0|color=161|size=16|text=由于"魔兽军团"过于狡猾，在神殿外设有"迷宫"以此迷惑寻宝>
	<RText|x=22|y=129.0|color=161|size=16|text=者，经老夫多年研究，烟花迷宫有四个角落，每个角落都可通>
	<RText|x=22|y=151.0|color=161|size=16|text=往<"烟花神殿"/FCOLOR=253>不知<烟花教主"/FCOLOR=253>率领的魔兽军团隐藏于那个角落>
	<RText|x=22.0|y=181.0|color=161|size=16|text=远古赤月恶魔，120分钟复活一次，击杀它可爆出<"九珠连/FCOLOR=253><环炮"/FCOLOR=253>>
	<RText|x=22.0|y=203.0|color=161|size=16|text=老夫在此多年，有些存货，只要20万金币或100元宝>
	<Text|x=131.0|y=235.0|color=250|size=18|text=金币购买|link=@zmssz_goumai,1>
	<Text|x=285.0|y=235.0|color=250|size=18|text=元宝购买|link=@zmssz_goumai,2>
	]]
	say(actor,msg)
end

function zmssz_goumai(actor,par)
	if par == "1" then
		if getbindgold(actor) < 200000 then
			sendmsg9(actor,"金币不足20万")
			return
		end
		subbindgold(actor,200000)
	else
		if not subingot(actor,100) then
			sendmsg9(actor,"元宝不足100")
			return
		end
	end
	giveitem(actor,"九珠连环炮",1)
	sendmsg9(actor,"购买成功")
end


-----------------------------魔龙城传说NPC
function mlccs_show(actor)
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=280|scale9t=30|img=zhangheng/176.png|move=0|loadDelay=1|reset=1|scale9l=30|scale9b=30|show=0|bg=1|scale9r=30|esc=1>
	<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
	<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
	<RText|ax=0.5|ay=0.5|x=246.0|y=34.5|color=251|size=18|text=魔龙城传说>
	<Text|x=22|y=55.0|color=161|size=16|text=相传在玛法大陆的东端，有一个强大的帝国，直到有一天赤月恶>
	<RText|x=22.0|y=77.0|color=161|size=16|text=魔降临神龙帝国，让其无尽的邪恶之火，燃遍全城众多神将被强>
	<RText|x=22.0|y=99.0|color=161|size=16|text=大的魔族力量所侵蚀，彻底沦落，曾经守护帝国的神龙，最后也>
	<RText|x=22.0|y=121.0|color=161|size=16|text=堕落成魔龙，蛰伏在魔龙血域，昔日跟神龙一起征战的<"统帅"/FCOLOR=250>却>
	<RText|x=22.0|y=143.0|color=161|size=16|text=不知所踪？>
	<RText|x=22.0|y=173.0|color=161|size=16|text=本地图刷新一真一假2只<暗之魔龙教主/FCOLOR=253>,真教主可爆所有<高级装备/FCOLOR=254>>
	<RText|x=22.0|y=195.0|color=161|size=16|text=假教主有几率爆出魔教信物，因魔教信物戾气太重，切记不可久>
	<RText|x=22.0|y=217.0|size=16|color=161|text=留，在魔龙城使用<魔教信物/FCOLOR=70>可召唤<"邪魔/FCOLOR=250><统帅"/FCOLOR=250>有几率爆出本服所>
	<RText|x=22.0|y=239.0|size=16|color=161|text=有顶级装备!>
	]]
	say(actor,msg)
end

-----------------------------藏宝阁老道NPC
function cbgld_show(actor)
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=240|scale9t=30|scale9b=30|bg=1|scale9r=30|move=0|loadDelay=1|esc=1|reset=1|scale9l=30|img=zhangheng/176.png|show=0>
<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
<RText|ax=0.5|ay=0.5|x=246.0|y=34.5|color=251|size=18|text=藏宝阁>
<RText|x=22.0|y=55.0|color=161|size=16|text=沙巴克的宝藏到底有多少.........这个就不用我废话了吧？老道最>
<RText|x=22.0|y=77.0|color=161|size=16|text=近观察到<"地藏魔王"/FCOLOR=250>与<"奴隶教主"/FCOLOR=250>有所异动不知它们在密谋什>
<RText|x=22.0|y=99.0|color=161|size=16|text=么？还请勇士进去帮我查看查看!>
<RText|x=22.0|y=129.0|size=16|color=161|text=不过藏宝阁危险重重，勇士你需开启<"龙的传人"/FCOLOR=70>才能有必胜的>
<RText|x=22.0|y=151.0|size=16|color=161|text=把握!>
<Text|ax=0.5|x=246|y=187.0|color=250|size=18|text=进入藏宝阁|link=@cbgld_jinru>

	]]
	say(actor,msg)
end

function cbgld_jinru(actor)
	if not hasbuff(actor,10001) and not hasbuff(actor,20083) then
		sendmsg9(actor,"进入此地图需要开启“龙的传人”")
		return
	end
	map(actor,"h204")
end

-----------------------------白日门来客NPC
function brmlk_show(actor)
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=240|scale9t=30|scale9b=30|bg=1|scale9r=30|move=0|loadDelay=1|esc=1|reset=1|scale9l=30|img=zhangheng/176.png|show=0>
	<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
	<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
	<RText|ax=0.5|ay=0.5|x=246.0|y=34.5|color=251|size=18|text=藏宝阁>
	<RText|x=22.0|y=55.0|size=16|color=161|text=当年"万恶之主"带着各大怪物首领和各路小妖一起围攻玛法大陆>
	<RText|x=22.0|y=77.0|size=16|color=161|text=这场战斗最终以人类三英雄重创<"万恶之主"/FCOLOR=250>之后告一段落，最近>
	<RText|x=22.0|y=99.0|size=16|color=161|text=<"万恶之源"/FCOLOR=250>的邪气已蔓延至不归路，不久将会侵蚀整个桃园之门>
	<RText|x=22.0|y=121.0|size=16|color=161|text=现需勇士潜入不归路，抵达万恶之源诛灭此魔，不知你可愿意拯>
	<RText|x=22.0|y=143.0|size=16|color=161|text=救这玛法大陆？>

	<Text|ax=0.5|x=164.0|y=187|color=250|size=18|text=愿意|link=@brmlk_jinru>
	<Text|ax=0.5|x=328.0|y=187.0|color=250|size=18|text=不愿意|link=@exit>

	]]
	say(actor,msg)
end

function brmlk_jinru(actor)
	mapmove(actor,"bgl",32,85,1)
end

-----------------------------镇魔老头NPC
function zhenmolaotou_show(actor)
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=200|scale9t=30|img=zhangheng/176.png|move=0|loadDelay=1|reset=1|scale9l=30|scale9b=30|show=0|bg=1|scale9r=30|esc=1>
	<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
	<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
	<RText|ax=0.5|ay=0.5|x=246.0|y=34.5|size=18|color=251|text=镇魔老头>
	<RText|x=22.0|y=65.0|size=16|color=161|text=勇士，你能来到此处，说明你实力非凡，如能击杀触龙神老夫>
	<RText|x=22.0|y=92.0|size=16|color=161|text=愿意帮你开启通往神龙石窟的传送阵，里面封印着超级BOSS，>
	<RText|x=22.0|y=119.0|size=16|color=161|text=可爆本服一切装备以及珍稀材料>
	]]
	say(actor,msg)
end

-----------------------------酆都钦天监NPC
function fdqtj_show(actor)
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=220|bg=1|loadDelay=1|scale9r=30|scale9t=30|scale9b=30|move=0|scale9l=30|reset=1|esc=1|img=zhangheng/176.png|show=0>
<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
<RText|ax=0.5|ay=0.5|x=246.0|y=35.5|color=251|size=18|text=酆都钦天监>
<RText|x=22.0|y=55.0|color=161|size=16|text=老夫在此观测星象已很久很久了，发现玛法大陆英雄辈出总有一>
<RText|x=22.0|y=77.0|color=161|size=16|text=天会窥视这<"酆都古域"/FCOLOR=250>的诸多宝藏，虽有<"黑白无常孟婆"/FCOLOR=250>镇守在>
<RText|x=22.0|y=99.0|color=161|size=16|text=酆都城，恐无法抵挡玛法的精锐，故在此设立祭坛，如阎罗王战>
<RText|x=22.0|y=121.0|color=161|size=16|text=败，老夫有<50%/FCOLOR=250>的概率使它复活在<"戳仙楼阁, 海市蜃楼, 隔世花/FCOLOR=254>>
<RText|x=22.0|y=143.0|color=161|size=16|text=<园,西烈荒原"/FCOLOR=254>其中的一个地图, 需勇士们自行寻找....>
<Text|ax=0.5|ay=1|x=384.0|y=174.0|size=18|color=250|text=前往寻找阎罗王分身|link=@fdqtj_jinru>
<RText|ax=0|ay=1|x=23.0|y=174.0|size=18|color=255|text=进入条件：<100个紫水晶矿/FCOLOR=253>|link=@smshz_jinru>


	]]
	say(actor,msg)
end

local fdjt_t = {"cxgl","hssl","gshy","xlhy"}
function fdqtj_jinru(actor)
	if itemcount(actor,"紫水晶矿") < 100 then
		sendmsg9(actor,"紫水晶矿不足")
		return
	end
	takeitem(actor,"紫水晶矿",100)
	map(actor,fdjt_t[math.random(1,#fdjt_t)])
end

-----------------------------神庙守护者NPC
function smshz_show(actor)
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=220|scale9t=30|scale9b=30|bg=1|scale9r=30|move=0|loadDelay=1|reset=1|scale9l=30|esc=1|img=zhangheng/176.png|show=0>
<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
<RText|ax=0.5|ay=0.5|x=246.0|y=35.5|color=251|size=18|text=神庙守护者>
<RText|x=22.0|y=55.0|color=161|size=16|text=勇士，你是哪位呀？是不是走错路了，居然想闯这<"寂静神庙"/FCOLOR=250>>
<RText|x=22.0|y=77.0|color=161|size=16|text=这里不是你该来的地方，请速速离去，以免打扰本陵至尊强者>
<RText|x=23.0|y=100.0|size=16|color=161|text=<"帝王主宰之神"/FCOLOR=250>修炼，除非你已突破枷锁，但能否战胜它就看>
<RText|x=22.0|y=121.0|size=16|color=161|text=你的实力如何了..........>
<RText|ax=0|ay=1|x=23.0|y=169.0|size=18|color=255|text=进入条件：<150个紫水晶矿/FCOLOR=253>|link=@smshz_jinru>
<Text|ax=0.5|ay=1|x=375.0|y=170.0|size=18|color=250|text=寂静神庙|link=@smshz_jinru>



	]]
	say(actor,msg)
end

function smshz_jinru(actor)
	if getlevel(actor) < 75 then
		sendmsg9(actor,"勇士，你当前实力不够 ")
		return
	end
	if getlevel(actor) < 76 then
		sendmsg9(actor,"请在比奇城找到无崖子提升自己的实力再来找我")
		return
	end
	if itemcount(actor,"紫水晶矿") < 150 then
		sendmsg9(actor,"紫水晶矿不足")
		return
	end
	takeitem(actor,"紫水晶矿",150)
	
	map(actor,"jjhl6")
end


-----------------------------七星塔二层NPC
function qxt2ceng_show(actor)
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=220|scale9t=30|scale9b=30|bg=1|scale9r=30|move=0|loadDelay=1|reset=1|scale9l=30|esc=1|img=zhangheng/176.png|show=0>
	<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
	<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
	<RText|ax=0.5|ay=0.5|x=246.0|y=35.5|size=18|color=251|text=七星塔二层>
	<RText|x=22.0|y=70.0|size=16|color=161|text=想要进入下一层，必须要有足够的实力。。。>

	<RText|x=22.0|y=121.0|size=16|color=161|text=进入下一层需要交付我<30万金币/FCOLOR=253>或者<40个紫水晶矿/FCOLOR=253>>

	<Text|ax=0.5|x=160.0|y=170.0|color=250|size=18|text=金币挑战|link=@qxt2ceng_jinru,1>
	<Text|ax=0.5|x=334.0|y=170.0|color=250|size=18|text=紫水晶挑战|link=@qxt2ceng_jinru,2>

	]]
	say(actor,msg)
end

function qxt2ceng_jinru(actor,par)
	--[[local guai_t = getmapmon("qxt1","*",28,24,50)
	if #guai_t > 0 then
		sendmsg9(actor,"本地图还有怪物没有清理完成")
		return
	end--]]
	if getsysstr("七星塔幸运玩家") == getname(actor) then	
	else
		if par == "1" then
			if getbindgold(actor) < 300000 then
				sendmsg9(actor,"金币不足30万")
				return
			end
			subbindgold(actor,300000)
		else
			if itemcount(actor,"紫水晶矿") < 40 then
				sendmsg9(actor,"紫水晶矿不足40个")
				return
			end
			takeitem(actor,"紫水晶矿",40)
		end
		setsysint("七星塔幸运奖池",getsysint("七星塔幸运奖池")+150000*0.4)
		setsysint("七星塔击杀奖池",getsysint("七星塔击杀奖池")+150000*0.6)
	end
	map(actor,"qxt2")
	callscriptex(actor, "SENDDELAYMSG", "还剩余%s离开本地图",3600, 251,1,"@huicheng")
	setstr(actor,"限时地图","qxt2")
	setint(actor,"限时地图进入时间",os.time())
	setint(actor,"限时时间",3600)
end

-----------------------------七星塔三层NPC
function qxt3ceng_show(actor)
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=220|scale9t=30|scale9b=30|bg=1|scale9r=30|move=0|loadDelay=1|reset=1|scale9l=30|esc=1|img=zhangheng/176.png|show=0>
	<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
	<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
	<RText|ax=0.5|ay=0.5|x=246.0|y=35.5|size=18|color=251|text=七星塔三层>
	<RText|x=22.0|y=70.0|size=16|color=161|text=想要进入下一层，必须要有足够的实力。。。>
	<RText|x=22.0|y=121.0|size=16|color=161|text=进入下一层需要交付我<30万金币/FCOLOR=253>或者<40个紫水晶矿/FCOLOR=253>>
	<Text|ax=0.5|x=160.0|y=170.0|color=250|size=18|text=金币挑战|link=@qxt3ceng_jinru,1>
	<Text|ax=0.5|x=334.0|y=170.0|color=250|size=18|text=紫水晶挑战|link=@qxt3ceng_jinru,2>

	]]
	say(actor,msg)
end

function qxt3ceng_jinru(actor,par)
	--[[local guai_t = getmapmon("qxt2","*",28,24,50)
	if #guai_t > 0 then
		sendmsg9(actor,"本地图还有怪物没有清理完成")
		return
	end--]]
	if getsysstr("七星塔幸运玩家") == getname(actor) then	
	else
		if par == "1" then
			if getbindgold(actor) < 300000 then
				sendmsg9(actor,"金币不足30万")
				return
			end
			subbindgold(actor,300000)
		else
			if itemcount(actor,"紫水晶矿") < 40 then
				sendmsg9(actor,"紫水晶矿不足40个")
				return
			end
			takeitem(actor,"紫水晶矿",40)
		end
		setsysint("七星塔幸运奖池",getsysint("七星塔幸运奖池")+150000*0.4)
		setsysint("七星塔击杀奖池",getsysint("七星塔击杀奖池")+150000*0.6)
	end
	map(actor,"qxt3")
	callscriptex(actor, "SENDDELAYMSG", "还剩余%s离开本地图",3600, 251,1,"@huicheng")
	setstr(actor,"限时地图","qxt3")
	setint(actor,"限时地图进入时间",os.time())
	setint(actor,"限时时间",3600)
end

-----------------------------七星塔四层NPC
function qxt4ceng_show(actor)
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=220|scale9t=30|scale9b=30|bg=1|scale9r=30|move=0|loadDelay=1|reset=1|scale9l=30|esc=1|img=zhangheng/176.png|show=0>
	<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
	<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
	<RText|ax=0.5|ay=0.5|x=246.0|y=35.5|size=18|color=251|text=七星塔四层>
	<RText|x=22.0|y=70.0|size=16|color=161|text=想要进入下一层，必须要有足够的实力。。。>
	<RText|x=22.0|y=121.0|size=16|color=161|text=进入下一层需要交付我<30万金币/FCOLOR=253>或者<40个紫水晶矿/FCOLOR=253>>
	<Text|ax=0.5|x=160.0|y=170.0|color=250|size=18|text=金币挑战|link=@qxt4ceng_jinru,1>
	<Text|ax=0.5|x=334.0|y=170.0|color=250|size=18|text=紫水晶挑战|link=@qxt4ceng_jinru,2>

	]]
	say(actor,msg)
end

function qxt4ceng_jinru(actor,par)
	--[[local guai_t = getmapmon("qxt3","*",28,24,50)
	if #guai_t > 0 then
		sendmsg9(actor,"本地图还有怪物没有清理完成")
		return
	end--]]
	if getsysstr("七星塔幸运玩家") == getname(actor) then	
	else
		if par == "1" then
			if getbindgold(actor) < 300000 then
				sendmsg9(actor,"金币不足30万")
				return
			end
			subbindgold(actor,300000)
		else
			if itemcount(actor,"紫水晶矿") < 40 then
				sendmsg9(actor,"紫水晶矿不足40个")
				return
			end
			takeitem(actor,"紫水晶矿",40)
		end
		setsysint("七星塔幸运奖池",getsysint("七星塔幸运奖池")+150000*0.4)
		setsysint("七星塔击杀奖池",getsysint("七星塔击杀奖池")+150000*0.6)
	end
	map(actor,"qxt4")
	callscriptex(actor, "SENDDELAYMSG", "还剩余%s离开本地图",3600, 251,1,"@huicheng")
	setstr(actor,"限时地图","qxt4")
	setint(actor,"限时地图进入时间",os.time())
	setint(actor,"限时时间",3600)
end

-----------------------------七星塔顶层NPC
function qxt5ceng_show(actor)
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=220|scale9t=30|scale9b=30|bg=1|scale9r=30|move=0|loadDelay=1|reset=1|scale9l=30|esc=1|img=zhangheng/176.png|show=0>
	<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
	<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
	<RText|ax=0.5|ay=0.5|x=246.0|y=35.5|size=18|color=251|text=七星塔顶层>
	<RText|x=22.0|y=70.0|size=16|color=161|text=想要进入下一层，必须要有足够的实力。。。>
	<RText|x=22.0|y=121.0|size=16|color=161|text=进入下一层需要交付我<30万金币/FCOLOR=253>或者<40个紫水晶矿/FCOLOR=253>>
	<Text|ax=0.5|x=160.0|y=170.0|color=250|size=18|text=金币挑战|link=@qxt5ceng_jinru,1>
	<Text|ax=0.5|x=334.0|y=170.0|color=250|size=18|text=紫水晶挑战|link=@qxt5ceng_jinru,2>

	]]
	say(actor,msg)
end

function qxt5ceng_jinru(actor,par)
	--[[local guai_t = getmapmon("qxt4","*",28,24,50)
	if #guai_t > 0 then
		sendmsg9(actor,"本地图还有怪物没有清理完成")
		return
	end--]]
	if getsysstr("七星塔幸运玩家") == getname(actor) then	
	else
		if par == "1" then
			if getbindgold(actor) < 300000 then
				sendmsg9(actor,"金币不足30万")
				return
			end
			subbindgold(actor,300000)
		else
			if itemcount(actor,"紫水晶矿") < 40 then
				sendmsg9(actor,"紫水晶矿不足40个")
				return
			end
			takeitem(actor,"紫水晶矿",40)
		end
		setsysint("七星塔幸运奖池",getsysint("七星塔幸运奖池")+150000*0.4)
		setsysint("七星塔击杀奖池",getsysint("七星塔击杀奖池")+150000*0.6)
	end
	map(actor,"qxt5")
	callscriptex(actor, "SENDDELAYMSG", "还剩余%s离开本地图",3600, 251,1,"@huicheng")
	setstr(actor,"限时地图","qxt5")
	setint(actor,"限时地图进入时间",os.time())
	setint(actor,"限时时间",3600)
end

-----------------------------宝藏守护人NPC
function bzshr_show(actor)
	local msg = [[
	<Img|x=0.0|y=0.0|width=480|height=230|scale9t=30|img=zhangheng/176.png|move=0|loadDelay=1|reset=1|scale9l=30|scale9b=30|show=0|bg=1|scale9r=30|esc=1>
	<Button|x=480.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
	<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
	<Text|ax=0.5|ay=0.5|x=245.0|y=34.0|color=251|size=18|text=宝藏守护人>
	<Text|x=24.0|y=55.0|color=161|size=16|text=隶属白日门的一些勇士经不起绝顶重宝的诱惑，携宝叛离了>
	<RText|x=24.0|y=77.0|color=161|size=16|text=白日门，并联合邪教势力组成白日门叛军，在白日门某处开>
	<RText|x=24.0|y=99.0|color=161|size=16|text=辟基地"无间炼狱"，妄图借重宝之威能，控制整个玛法大陆>
	<RText|x=24.0|y=121.0|color=161|size=16|text=剿灭叛军，夺回重宝，刻不容缓....>
	<RText|x=24.0|y=148.0|size=16|color=161|text=第二天开始，每天下午<13点/FCOLOR=254>，晚上<23点/FCOLOR=254>，邪教势力会在坐标>
	<RText|x=92.0|y=170.0|size=16|color=161|text=派出"僵尸"查探详情，勇士们可通过<"洞口"/FCOLOR=254>进入无>
	<Text|x=24.0|y=169.0|color=250|outline=1|size=16|text=174 334|link=@bzshr_move>
	<RText|x=24.0|y=192.0|color=161|size=16|text=间炼狱....>
	]]
	say(actor,msg)
end

function bzshr_move(actor)
	mapmove(actor,"11",174,331,1)
end

-----------------------------卧龙山庄NPC
local mzhj_sxtab = {"金","木","水","火","土"}
function wlsz_show(actor,xianshi)
	xianshi = tonumber(xianshi) or 0
	if getsysint("卧龙山庄进图属性") == 0 then --初始化为金
		setsysint("卧龙山庄进图属性",1)
	end
	local msg = [[
	<Img|x=0.0|y=0.0|width=480|height=320|scale9t=30|scale9b=30|bg=1|scale9r=30|move=0|loadDelay=1|reset=1|scale9l=30|esc=1|img=zhangheng/176.png|show=0>
	<Button|x=480.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
	<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
	<Text|ax=0.5|ay=0.5|x=245.0|y=34.0|color=251|size=18|text=卧龙山庄>
	<Text|x=24.0|y=55.0|color=161|size=16|text=数百年前，一支神龙军队无意中发现了一处神秘宝藏，为防止>
	<RText|x=24.0|y=75.0|color=161|size=16|text=宝藏被魔族军团掳走，从而威胁玛法大陆的命运，这支军队奉>
	<RText|x=24.0|y=95.0|color=161|size=16|text=命担负起守卫宝藏的重任，并建立了一座山庄从此与世隔绝..>
	<RText|x=24.0|y=125.0|color=161|size=16|text=经过探秘者艰辛的摸索，终于解开了"卧龙山庄"的惊天秘密，>
	<RText|x=24.0|y=145.0|color=161|size=16|text=此图随五行之力变幻而变化，<360分钟/FCOLOR=250>随机变幻<"金、木、水、/FCOLOR=250>>
	<RText|x=24.0|y=165.0|color=161|size=16|text=<火、土"/FCOLOR=250>其中一种探宝方式，此图危险与机遇并存...>
	<RText|x=24.0|y=195.0|size=16|color=254|text=久闻卧龙庄主生性残暴，卧龙夫人已苦不堪言，万万小心....>
	<Text|x=180.0|y=272.0|color=250|outline=1|size=18|text=前往解救卧龙夫人|link=@wlsz_move>
	<Button|x=13.0|y=275.0|nimg=zhangheng/8.png|pimg=zhangheng/8.png|link=@wlsz_show,1>
	]]
	msg=msg.."<RText|x=60.0|y=235.0|size=16|color=161|text=进图要求：<40个紫水晶矿/FCOLOR=251>      五行之力需切换至：<".. mzhj_sxtab[getsysint("卧龙山庄进图属性")] .."/FCOLOR=253>>"
	if xianshi == 1 then
		msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@wlsz_show>"
		msg =msg..[[
		<Img|ay=0.5|x=47.0|y=250.0|width=370|height=110|scale9t=10|scale9b=10|img=zh/7.png|scale9r=10|esc=0|scale9l=10>
<RText|x=74.0|y=277.0|width=344|color=149|size=16|text=山庄，无需紫水晶矿以及转换五行属性>
<RText|x=58.0|y=257.0|width=344|size=16|color=149|text=⒉合区后每天晚上<19.30分--21点/FCOLOR=250>可免费进入卧龙>
<RText|x=74.0|y=228.0|width=344|size=16|color=149|text=合区后<卧龙夫人/FCOLOR=253>将会解开神秘面纱>
<RText|x=58.0|y=208.0|width=380|size=16|color=149|text=⒈<卧龙庄主/FCOLOR=250>每四个小时携带大量宝物现身<卧龙山庄/FCOLOR=254>>

		]]
	end
	say(actor,msg)
end

function wlsz_move(actor)
	if getlevel(actor) < 55 then
		sendmsg9(actor,"需等级达到55级才能解救")
		return
	end
	if getint(actor,"五行当前属性") == 0 then
		sendmsg9(actor,"需有五行属性才能进入")
		return
	end
	local hour = tonumber(os.date("%H",os.time()))
	local fen = tonumber(os.date("%M",os.time()))
	if getsysint("合区次数") > 0 and ((hour == 19 and fen >= 30) or hour == 20) then
		mapmove(actor,"wlsz",128,120,3)
	else	
		if getint(actor,"五行当前属性") ~= getsysint("卧龙山庄进图属性") then
			sendmsg9(actor,"进入地图需切换五行属性到【".. mzhj_sxtab[getsysint("卧龙山庄进图属性")] .."】")
			return
		end
		if itemcount(actor,"紫水晶矿") < 40 then
			sendmsg9(actor,"紫水晶矿不足")
			return
		end
		takeitem(actor,"紫水晶矿",40)
		mapmove(actor,"wlsz",220,206,3)
	end
	
	callscriptex(actor, "SENDDELAYMSG", "探宝剩余时间：%s",7200, 251,1,"@huicheng")
	setstr(actor,"限时地图","wlsz")
	setint(actor,"限时地图进入时间",os.time())
	setint(actor,"限时时间",7200)
end

-----------------------------谜之幻境NPC
function mzhj_show(actor)
	if getsysint("谜之幻境进图属性") == 0 then --初始化为金
		setsysint("谜之幻境进图属性",1)
	end
	local msg = [[
	<Img|x=0.0|y=0.0|width=480|height=320|bg=1|loadDelay=1|scale9r=30|scale9t=30|scale9b=30|move=0|scale9l=30|reset=1|esc=1|img=zhangheng/176.png|show=0>
<Button|x=480.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Text|ax=0.5|ay=0.5|x=245.0|y=34.0|color=251|size=18|text=迷之幻境>
<RText|x=24.0|y=55.0|color=161|size=16|text=玛法大陆任意地图的BOSS死亡后都有几率在此地图<复活/FCOLOR=250>，此>
<RText|x=24.0|y=77.0|color=161|size=16|text=图非常之大，散人追梦之地，刷新不定点。您再也不用担心被>
<RText|x=24.0|y=99.0|color=161|size=16|text=包场、被追杀，至于谁能碰上就是谁的运气了。土豪能打的任>
<RText|x=24.0|y=121.0|color=161|size=16|text=何怪物你均可打到，再也不用担心你与土豪的差距了。>
<RText|x=24.0|y=148.0|size=16|color=161|text=经过探秘者艰辛的摸索，终于解开了<"迷之幻境"/FCOLOR=250>的惊天秘密。>
<RText|x=24.0|y=170.0|size=16|color=161|text=此图随五行之力变幻而变化，<360分钟/FCOLOR=149>随机变幻<"金、木、水、/FCOLOR=253>>
<RText|x=24.0|y=192.0|size=16|color=161|text=<火、土"/FCOLOR=253>其中一种探宝方式，追梦者的天堂，<可爆一切物品/FCOLOR=249>>
<Text|x=180.0|y=272.0|color=250|outline=1|size=18|text=探索 → 迷之幻境|link=@mzhj_move>
<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>


	]]
	msg=msg.."<RText|x=60.0|y=235.0|size=16|color=161|text=进图要求：<40个紫水晶矿/FCOLOR=251>      五行之力需切换至：<".. mzhj_sxtab[getsysint("谜之幻境进图属性")] .."/FCOLOR=253>>"

	say(actor,msg)
end

function mzhj_move(actor)
	if getlevel(actor) < 55 then
		sendmsg9(actor,"需等级达到55级才能探索")
		return
	end
	if getint(actor,"五行当前属性") ~= getsysint("谜之幻境进图属性") then
		sendmsg9(actor,"进入地图需切换五行属性到【".. mzhj_sxtab[getsysint("谜之幻境进图属性")] .."】")
		return
	end
	if itemcount(actor,"紫水晶矿") < 40 then
		sendmsg9(actor,"紫水晶矿不足")
		return
	end
	takeitem(actor,"紫水晶矿",40)
	mapmove(actor,"mzhj",170,174)
	callscriptex(actor, "SENDDELAYMSG", "探宝剩余时间：%s",7200, 251,1,"@huicheng")
	setstr(actor,"限时地图","mzhj")
	setint(actor,"限时地图进入时间",os.time())
	setint(actor,"限时时间",7200)
end
--1 客服部 2 材料组 3 场控组 4 气氛组 5 项目部
local fangjiahao = {
	["12407275"] = {"hao1","黄峰","客服部门"},["15262095"] = {"hao1","王伟","客服部"},["13216418"] = {"hao1","汪荣丽","客服部"},["18936379"] = {"hao1","舒泰","客服部"},
	["30497613"] = {"hao2","汪朗新","材料部门"},
	["19313238"] = {"hao3","魏亚伟","场控部门"},
	["16748966"] = {"hao4","王益豪","气氛部门"},
	["25891743"] = {"hao5","张恒","项目部门"}, ["9071622"] = {"hao5","杜鹏","项目部门"}, ["5225660"] = {"hao5","祁玮","项目部门"}, ["10202743"] = {"hao5","李金伦","项目部门"},
}
-----------------------------引路人NPC
function yinluren_show(actor)
	local msg = [[
	<Img|width=528|height=220|reset=1|bg=1|scale9r=20|scale9t=20|show=0|scale9b=20|esc=1|move=0|img=public/bg_npc_04.jpg|scale9l=20|loadDelay=1>
<Button|x=527.0|y=1.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=8.0|y=8.0|img=zhangheng/210.png|esc=0>
<Img|x=152.0|y=28.0|img=zhangheng/177.png|esc=0>
<Img|x=321.0|y=27.0|img=zhangheng/178.png|esc=0>
<Text|ax=0.5|ay=0.5|x=270.0|y=34.5|color=251|size=18|text=引路人>
<Text|x=65.0|y=131.0|outline=1|color=255|size=18|outline=1|text=时代在变，传奇永不变，经典三职业传奇欢迎您...>
<Text|ay=0.5|x=216.0|y=177.5|outline=1|color=250|size=18|text=开启，玛法之旅|link=@yinluren_kaiqi>
<Img|x=190.0|y=171.0|img=zhangheng/211.png|esc=0>
<Text|x=167.0|y=66.0|color=249|size=18|outline=1|text=乾坤未定　你我皆是黑马>
<Text|x=167.0|y=99.0|color=249|size=18|outline=1|text=一切靠打　方显传奇本色>

	]]

	say(actor,msg)
end



function yinluren_kaiqi(actor)
	if getsysint("合区次数") > 0 and not fangjiahao[getconst(actor,"<$USERACCOUNT>")] then
		sendmsg9(actor,"亲爱的玩家，为了给您更好的体验，请前往最新区服进行游戏")
		return
	end
	
	map(actor,"xszc")
end

function mingyunzhuzaizhe_show(actor)
	local zslv = getbaseinfo(actor,39)
	if zslv < 6 then
		sendmsg9(actor,"年轻人，请不要打扰老夫苦修..........")
		return
	end
	if zslv < 10 then
		sendmsg9(actor,"年轻人，请把转生修炼至10转在来找我吧.....")
		return
	end
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=220|scale9r=30|bg=1|scale9t=30|scale9b=30|move=0|scale9l=30|esc=1|loadDelay=1|img=zhangheng/176.png|reset=1|show=0>
<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
<RText|ax=0.5|ay=0.5|x=246.0|y=35.5|color=251|size=18|text=命运主宰者>
<RText|x=22.0|y=55.0|color=161|size=16|text=勇士，你能来到这里，说明实力已达到登峰造极之境，老夫在此>
<RText|x=22.0|y=80.0|color=161|size=16|text=等候上千年。传闻，只有得到酒修剑的真传才能消灭此怪物，俗>
<RText|x=22.0|y=105.0|color=161|size=16|text=话说：酒壮英雄胆，除魔天地间，欲除此怪需达到<醉酒状态/FCOLOR=250>....>
<RText|x=43.0|y=135.0|size=16|color=254|text=此图刷新的玛法神王爆率非常之高，挑战时还请勇士小心>
<Text|ax=0.5|ay=1|x=242.0|y=170.0|size=18|color=250|text=挑战  →  玛法之巅|link=@mingyunzhuzaizhe_jinru>

	]]
	say(actor,msg)
end

function mingyunzhuzaizhe_jinru(actor)
	if getlevel(actor) < 76 then
		sendmsg9(actor,"人物等级需达到76级才能挑战","#00FF00")
		return
	end
	mapmove(actor,"mfzd",26,50,2)
end

function wzad_show(actor)
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=360|scale9r=30|bg=1|scale9t=30|scale9b=30|move=0|scale9l=30|esc=1|loadDelay=1|img=zhangheng/176.png|reset=1|show=0>
<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
<RText|ax=0.5|ay=0.5|x=246.0|y=35.5|color=251|size=18|text=未知暗殿>
<RText|x=22.0|y=55.0|color=161|size=16|text=从此地活着回来的勇士曾经告诉我未知暗殿因为遭受了魔影危>
<RText|x=22.0|y=78.0|color=161|size=16|text=机以后, 怪物居然学会了分身之术....>
<RText|x=22.0|y=104.0|color=161|size=16|text=散人的追梦之地,此图BOSS异常之多,3只才有1只是真的,另外2>
<RText|x=22.0|y=127.0|color=161|size=16|text=只都是假的，假的只爆祝福油，真的爆率非常之高,<可爆一切物/FCOLOR=250>>
<RText|x=22.0|y=150.0|color=161|size=16|text=<品/FCOLOR=250>,也是<神秘水晶/FCOLOR=253>和<神秘装备/FCOLOR=253>的唯一获取之处。据说神秘装备有>
<RText|x=22.0|y=199.0|color=161|size=16|text=此地图异常漆黑,所以想要进去得先给我一个<火把/FCOLOR=70>,不然会寸步>
<RText|x=22.0|y=222.0|color=161|size=16|text=难行,虽然只能<照亮一些范围/FCOLOR=254>,但也可以防止被你的仇人发现..>
<Text|ax=0.5|ay=1|x=242.0|y=317.0|size=18|color=250|text=探索 → 未知暗殿|link=@wzad_jinru>
<Text|x=51.0|y=266.0|color=161|size=16|text=进图要求：>
<Img|x=143.0|y=250.0|img=zhangheng/231.png|esc=0>
<Img|x=283.0|y=250.0|img=zhangheng/231.png|esc=0>
<RText|x=22.0|y=173.0|size=16|color=161|text=几率出超强悍属性，并且<每半小时刷新3只虎卫/FCOLOR=251>>


	]]
	msg=msg.."<ItemShow|x=138.0|y=245.0|width=70|height=70|itemid=".. getidbyname("火把") .."|itemcount=1|showtips=1|bgtype=0>"
	msg=msg.."<RText|x=207.0|y=267.0|color=255|size=16|text=(<".. itemcount(actor,"火把") .."/FCOLOR=249>/<1/FCOLOR=250>)>"
	
	msg=msg.."<ItemShow|x=278.0|y=245.0|width=70|height=70|itemid=".. getidbyname("紫水晶矿") .."|itemcount=1|showtips=1|bgtype=0>"
	msg=msg.."<RText|x=347.0|y=267.0|color=255|size=16|text=(<".. itemcount(actor,"紫水晶矿") .."/FCOLOR=249>/<100/FCOLOR=250>)>"
	

	say(actor,msg)
end

function wzad_jinru(actor)
	if getlevel(actor) < 48 then
		sendmsg9(actor,"人物等级需达到48级才能探索","#FF00FF")
		return
	end
	if itemcount(actor,"火把") < 1 then
		sendmsg9(actor,"需要火把1个才能进入")
		return
	end
	if itemcount(actor,"紫水晶矿") < 100 then
		sendmsg9(actor,"需要紫水晶矿100个才能进入")
		return
	end
	local item = linkbodyitem(actor,2)
	if item == "0" then
		sendmsg9(actor,"请佩戴任意勋章进入")
		return
	end
	
	takeitem(actor,"火把",1)
	takeitem(actor,"紫水晶矿",100)
	mapmove(actor,"wzad",200,10,3)
	callscriptex(actor, "SENDDELAYMSG", "探宝剩余时间：%s",7200, 251,1,"@huicheng")
	setstr(actor,"限时地图","wzad")
	setint(actor,"限时地图进入时间",os.time())
	setint(actor,"限时时间",7200)
end

function chdd_show(actor)
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=540|img=zhangheng/176.png|scale9t=30|move=0|loadDelay=1|reset=1|scale9l=30|scale9b=30|show=0|bg=1|scale9r=30|esc=1>
<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
<RText|ax=0.5|ay=0.5|x=246.0|y=35.5|color=251|size=18|text=采花大盗>
<RText|x=22.0|y=70.0|color=161|size=18|text=勇士，今日你我相遇乃命中注定，老夫在采集仙草的过程>
<RText|x=22.0|y=100.0|size=18|color=161|text=中发现了一个秘密，获得<"龙的传人"/FCOLOR=250>在60级--65级的地图>
<RText|x=21.0|y=130.0|color=161|size=18|text=击杀小怪有<几率召唤出BOSS/FCOLOR=253>，打宝如锦上添花.....>
<RText|x=21.0|y=170.0|size=18|color=249|text=温馨提示：为防止脱机号影响正常玩家的游戏体验以及打>
<RText|x=21.0|y=225.0|size=18|color=255|text=<蛮荒遗迹 龙之神域 铁血魔窟/FCOLOR=70> 人物未达到一转 每次进入可>
<RText|x=21.0|y=280.0|size=18|color=255|text=<堕落深渊 桃花谷/FCOLOR=70> 人物未达到二转 每次进入可使用随机次>
<RText|x=21.0|y=335.0|size=18|color=255|text=<幽冥古墓/FCOLOR=70>  人物未达到三转 每次进入可使用随机次数为30>
<RText|x=21.0|y=390.0|size=18|color=255|text=<熔岩地狱/FCOLOR=70>  人物未达到四转 每次进入可使用随机次数为30>
<RText|x=21.0|y=445.0|color=255|size=18|text=<鄷都古域 寂静皇陵/FCOLOR=70> 人物未达到五转 每次进入可使用随机>
<RText|x=21.0|y=500.0|color=254|size=18|text=奇经八脉升到十级可进行转生>
<RText|x=21.0|y=195.0|color=249|size=18|text=宝效率.高级地图将采用以下规则。>
<RText|x=21.0|y=250.0|color=255|size=18|text=使用随机次数为30次 达到一转可使用随机次数不受限制>
<RText|x=21.0|y=305.0|color=255|size=18|text=数为30次 达到二转可使用随机次数不受限制>
<RText|x=22.0|y=360.0|color=255|size=18|text=次 达到三转可使用随机次数不受限制>
<RText|x=22.0|y=415.0|color=255|size=18|text=次 达到四转可使用随机次数不受限制>
<RText|x=21.0|y=470.0|color=255|size=18|text=次数为30次 达到五转可使用随机次数不受限制>

	]]
	say(actor,msg)
end

function yzdlt_show(actor)
	local msg = [[
	<Img|x=0.0|y=0.0|width=490|height=220|bg=1|scale9l=30|scale9r=30|scale9t=30|scale9b=30|move=0|loadDelay=1|esc=1|reset=1|img=zhangheng/176.png|show=0>
	<Button|x=490.0|y=0.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=127.0|y=28.0|img=zhangheng/177.png|esc=0>
	<Img|x=296.0|y=27.0|img=zhangheng/178.png|esc=0>
	<RText|ax=0.5|ay=0.5|x=246.0|y=35.5|size=18|color=251|text=老头>
	<RText|x=22.0|y=70.0|size=18|color=161|text=此处可直接进入沙巴克皇宫，不过只能在拿沙期间的每>
	<RText|x=22.0|y=100.0|size=18|color=161|text=天的<21.30-21.55/FCOLOR=253>才能送你进入>
	<Button|x=190.0|y=155.0|color=250|size=18|nimg=zhangheng/12.png|text=进入皇宫|link=@yzdlt_jinru>

	]]
	say(actor,msg)
end

function yzdlt_jinru(actor)
	local hour = tonumber(os.date("%H",os.time()))
	local fen = tonumber(os.date("%M",os.time()))
	if castleinfo(5) and hour == 21 and fen >= 30 and fen < 55 then
		map(actor,"0150")
	else
		sendmsg9(actor,"当前时间不可进入")
	end
end