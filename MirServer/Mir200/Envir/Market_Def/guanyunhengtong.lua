include("Market_Def/zh.lua") --个人封装函数
local guanyun = {
	[0]={name="平民",chid="平民",showtext="",jinbi=0,shengwang=0,baolvbeishu="无",gongji="0-0",mofa="0-0",daoshu="0-0"},
	{name="勇士",chid="勇士",showtext="<金币：/FCOLOR=251><%s/FCOLOR=249>/<20万/FCOLOR=250>    <声望：/FCOLOR=251><%s/FCOLOR=249>/<100/FCOLOR=250>",jinbi=200000,shengwang=100,baolvbeishu="1.01倍",gongji="1-1",mofa="1-1",daoshu="1-1"},
	{name="伍长",chid="伍长",showtext="<金币：/FCOLOR=251><%s/FCOLOR=249>/<40万/FCOLOR=250>    <声望：/FCOLOR=251><%s/FCOLOR=249>/<300/FCOLOR=250>",jinbi=400000,shengwang=300,baolvbeishu="1.02倍",gongji="2-2",mofa="2-2",daoshu="2-2"},
	{name="什长",chid="什长",showtext="<金币：/FCOLOR=251><%s/FCOLOR=249>/<60万/FCOLOR=250>    <声望：/FCOLOR=251><%s/FCOLOR=249>/<500/FCOLOR=250>",jinbi=600000,shengwang=500,baolvbeishu="1.03倍",gongji="3-3",mofa="3-3",daoshu="3-3"},
	{name="都尉",chid="都尉",showtext="<金条：/FCOLOR=251><%s/FCOLOR=249>/<1/FCOLOR=250>    <声望：/FCOLOR=251><%s/FCOLOR=249>/<750/FCOLOR=250>",jintiao=1,shengwang=750,baolvbeishu="1.04倍",gongji="4-4",mofa="4-4",daoshu="4-4"},
	{name="校尉",chid="校尉",showtext="<紫水晶矿：/FCOLOR=251><%s/FCOLOR=249>/<1000/FCOLOR=250>    <声望：/FCOLOR=251><%s/FCOLOR=249>/<1000/FCOLOR=250>",zsjk=1000,shengwang=1000,baolvbeishu="1.05倍",gongji="5-5",mofa="5-5",daoshu="5-5"},
	{name="参军",chid="参军",showtext="<紫水晶矿：/FCOLOR=251><%s/FCOLOR=249>/<2000/FCOLOR=250>    <声望：/FCOLOR=251><%s/FCOLOR=249>/<1200/FCOLOR=250>",zsjk=2000,shengwang=1200,baolvbeishu="1.06倍",gongji="6-6",mofa="6-6",daoshu="6-6"},
	{name="总兵",chid="总兵",showtext="<紫水晶矿：/FCOLOR=251><%s/FCOLOR=249>/<4000/FCOLOR=250>    <声望：/FCOLOR=251><%s/FCOLOR=249>/<1500/FCOLOR=250>",zsjk=4000,shengwang=1500,baolvbeishu="1.07倍",gongji="7-7",mofa="7-7",daoshu="7-7"},
	{name="都统",chid="都统",showtext="<紫水晶矿：/FCOLOR=251><%s/FCOLOR=249>/<6000/FCOLOR=250>    <声望：/FCOLOR=251><%s/FCOLOR=249>/<2000/FCOLOR=250>",zsjk=6000,shengwang=2000,baolvbeishu="1.08倍",gongji="8-8",mofa="8-8",daoshu="8-8"},
	{name="将军",chid="将军",showtext="<紫水晶矿：/FCOLOR=251><%s/FCOLOR=249>/<8000/FCOLOR=250>    <声望：/FCOLOR=251><%s/FCOLOR=249>/<2500/FCOLOR=250>",zsjk=8000,shengwang=2500,baolvbeishu="1.09倍",gongji="9-9",mofa="9-9",daoshu="9-9"},
	{name="元帅",chid="元帅",showtext="<紫水晶矿：/FCOLOR=251><%s/FCOLOR=249>/<10000/FCOLOR=250>    <声望：/FCOLOR=251><%s/FCOLOR=249>/<3000/FCOLOR=250>",zsjk=10000,shengwang=3000,baolvbeishu="1.10倍",gongji="10-10",mofa="10-10",daoshu="10-10"},
}

function show(actor,xianshi)
	if getsysint("合区次数") == 0 then
		sendmsg9(actor,"合区后在来找老夫吧.....")
		return
	end
	xianshi = tonumber(xianshi) or 0
	local msg = [[
		<Img|x=0|width=643|height=457|esc=1|loadDelay=1|bg=1|img=zhangheng/1.png|move=1|reset=0|show=4>
<Button|x=639.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
<Img|x=16.5|y=40.5|img=zhangheng/4.png|esc=0>
<Img|x=16.5|y=37.5|img=zhangheng/5.png|esc=0>
<Img|x=50.5|y=151.5|img=zhangheng/6.png|esc=0>
<Img|x=419.5|y=151.5|img=zhangheng/6.png|esc=0>
<Button|x=277.5|y=379.5|color=10051|nimg=zhangheng/13.png|size=18|text=提  升|link=@tisheng>
<Button|x=18.5|y=396.5|nimg=zhangheng/8.png|mimg=zhangheng/8.png|pimg=zhangheng/8.png|link=@show,1>
<Img|x=297.5|y=230.5|img=zhangheng/29.png|esc=0>

	]]
	local level = getint(actor,"官运等级")
	if level > 9 then
		level = 9
	end
	msg=msg.."<Text|ay=0.5|x=120.5|y=166.5|color=255|size=18|text="..guanyun[level].name..">"
	msg=msg.."<RText|x=96.5|y=199.5|size=18|color=103|text=防御：<".. guanyun[level].gongji .."/FCOLOR=94>>"
	msg=msg.."<RText|x=96.5|y=239.5|size=18|color=103|text=魔御：<".. guanyun[level].mofa .."/FCOLOR=94>>"
	msg=msg.."<RText|x=96.5|y=279.5|size=18|color=250|text=爆率：<".. guanyun[level].baolvbeishu .."/FCOLOR=250>>"
	
	msg=msg.."<Text|ay=0.5|x=489.5|y=166.5|size=18|color=250|text="..guanyun[level+1].name..">"
	msg=msg.."<RText|x=466.5|y=199.5|size=18|color=103|text=防御：<".. guanyun[level+1].gongji .."/FCOLOR=94>>"
	msg=msg.."<RText|x=465.5|y=239.5|size=18|color=103|text=魔御：<".. guanyun[level+1].mofa .."/FCOLOR=94>>"
	msg=msg.."<RText|x=465.5|y=279.5|size=18|color=250|text=爆率：<".. guanyun[level+1].baolvbeishu .."/FCOLOR=250>>"
	if getint(actor,"官运等级") >= 10 then
		msg=msg.."<RText|a=4|x=319.5|y=359.5|color=251|size=18|text=官运已经升到满级>"
	else
		local str = ""
		if guanyun[level+1].jinbi then
			str = string.format(guanyun[level+1].showtext, jianhuanum(getbindgold(actor)), getshengwang(actor))
			msg=msg.."<RText|a=4|x=319.5|y=359.5|color=255|size=18|text=".. str ..">"
		end
		
		if guanyun[level+1].jintiao then
			--str = string.format(guanyun[level+1].showtext, itemcount(actor,"金条"), getshengwang(actor))
			msg=msg.."<RText|ay=0.5|x=159.5|y=359.5|color=251|size=18|text=金条：>"
			msg=msg.."<ItemShow|x=194.5|y=326.5|width=70|height=70|rotate=0|itemid=".. getidbyname("金条") .."|itemcount=1|showtips=1|scale=0.75|bgtype=0>"
			msg=msg.."<RText|ay=0.5|x=242.5|y=360.0|color=255|size=18|text=<".. itemcount(actor,"金条") .."/FCOLOR=249>/<"..guanyun[level+1].jintiao.."/FCOLOR=250>>"
			
			msg=msg.."<RText|ay=0.5|x=359.5|y=359.5|color=251|size=18|text=声望：>"
			msg=msg.."<RText|ay=0.5|x=412.5|y=360.0|color=255|size=18|text=<".. jianhuanum(getshengwang(actor)) .."/FCOLOR=249>/<"..guanyun[level+1].shengwang.."/FCOLOR=250>>"
		end
		if guanyun[level+1].jinzhuan then
			msg=msg.."<RText|ay=0.5|x=159.5|y=359.5|color=251|size=18|text=金砖：>"
			msg=msg.."<ItemShow|x=194.5|y=326.5|width=70|height=70|rotate=0|itemid=".. getidbyname("金砖") .."|itemcount=1|showtips=1|scale=0.75|bgtype=0>"
			msg=msg.."<RText|ay=0.5|x=242.5|y=360.0|color=255|size=18|text=<".. itemcount(actor,"金砖") .."/FCOLOR=249>/<"..guanyun[level+1].jinzhuan.."/FCOLOR=250>>"
			
			msg=msg.."<RText|ay=0.5|x=359.5|y=359.5|color=251|size=18|text=声望：>"
			msg=msg.."<RText|ay=0.5|x=412.5|y=360.0|color=255|size=18|text=<".. jianhuanum(getshengwang(actor)) .."/FCOLOR=249>/<"..guanyun[level+1].shengwang.."/FCOLOR=250>>"
		end
		if guanyun[level+1].jinhe then
			msg=msg.."<RText|ay=0.5|x=159.5|y=359.5|color=251|size=18|text=金盒：>"
			msg=msg.."<ItemShow|x=194.5|y=326.5|width=70|height=70|rotate=0|itemid=".. getidbyname("金盒") .."|itemcount=1|showtips=1|scale=0.75|bgtype=0>"
			msg=msg.."<RText|ay=0.5|x=242.5|y=360.0|color=255|size=18|text=<".. itemcount(actor,"金盒") .."/FCOLOR=249>/<"..guanyun[level+1].jinhe.."/FCOLOR=250>>"
			
			msg=msg.."<RText|ay=0.5|x=359.5|y=359.5|color=251|size=18|text=声望：>"
			msg=msg.."<RText|ay=0.5|x=412.5|y=360.0|color=255|size=18|text=<".. jianhuanum(getshengwang(actor)) .."/FCOLOR=249>/<"..guanyun[level+1].shengwang.."/FCOLOR=250>>"
		end
		if guanyun[level+1].zsjk then
			msg=msg.."<RText|ay=0.5|x=124.5|y=359.5|color=251|size=18|text=紫水晶矿：>"
			msg=msg.."<ItemShow|x=194.5|y=326.5|width=70|height=70|rotate=0|itemid=".. getidbyname("紫水晶矿") .."|itemcount=1|showtips=1|scale=0.75|bgtype=0>"
			msg=msg.."<RText|ay=0.5|x=242.5|y=360.0|color=255|size=18|text=<".. itemcount(actor,"紫水晶矿") .."/FCOLOR=249>/<"..guanyun[level+1].zsjk.."/FCOLOR=250>>"
			
			msg=msg.."<RText|ay=0.5|x=359.5|y=359.5|color=251|size=18|text=声望：>"
			msg=msg.."<RText|ay=0.5|x=412.5|y=360.0|color=255|size=18|text=<".. jianhuanum(getshengwang(actor)) .."/FCOLOR=249>/<"..guanyun[level+1].shengwang.."/FCOLOR=250>>"
		end
		
		
		--msg=msg.."<RText|a=4|x=419.5|y=359.5|color=255|size=18|text=".. str ..">"
	end
	if xianshi == 1 then
		msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@show>"
		msg=msg..[[
		<Img|ay=0.5|x=50.5|y=336.0|width=260|height=180|scale9t=10|scale9b=10|img=zh/7.png|scale9r=10|scale9l=10|esc=0>
		<RText|x=59.5|y=284.5|color=255|size=16|text=⒈提升官运可获得<"官运压制"/FCOLOR=250>属性>
		<RText|x=75.5|y=309.5|color=255|size=16|text=对手的官位等级低于自己时,自身>
		<RText|x=75.5|y=334.5|color=255|size=16|text=所<受到的伤害减少5%/FCOLOR=250>>
		<RText|x=59.5|y=259.5|color=251|size=16|text=属性介绍：>
		<RText|x=59.5|y=368.5|size=16|color=255|text=⒉在<赏金猎人NPC/FCOLOR=250>处通过回收多余>
		<RText|x=75.5|y=393.5|size=16|color=255|text=的<印记/FCOLOR=70>可获得<大量声望/FCOLOR=251>>

		]]
	end
	say(actor,msg)
end

function tisheng(actor)
	local level = getint(actor,"官运等级")
	if level >= 10 then
		sendmsg9(actor,"官运等级已满，已无法继续提升")
		return
	end
	local shuju = guanyun[level+1]
	if shuju.jinbi then
		if getbindgold(actor) < shuju.jinbi then
			sendmsg9(actor,"金币不足")
			return
		end
	end
	if shuju.shengwang then
		if getshengwang(actor) < shuju.shengwang then
			sendmsg9(actor,"声望不足")
			return
		end
	end
	
	if shuju.jintiao then
		if itemcount(actor,"金条") < shuju.jintiao then
			sendmsg9(actor,"金条不足")
			return
		end
		takeitem(actor, "金条", shuju.jintiao)
	end
	if shuju.jinzhuan then
		if itemcount(actor,"金砖") < shuju.jinzhuan then
			sendmsg9(actor,"金砖不足")
			return
		end
		takeitem(actor, "金砖", shuju.jinzhuan)
	end
	
	if shuju.jinhe then
		if itemcount(actor,"金盒") < shuju.jinhe then
			sendmsg9(actor,"金盒不足")
			return
		end
		takeitem(actor, "金盒", shuju.jinhe)
	end
	
	if shuju.zsjk then
		if itemcount(actor,"紫水晶矿") < shuju.zsjk then
			sendmsg9(actor,"紫水晶矿不足")
			return
		end
		takeitem(actor, "紫水晶矿", shuju.zsjk)
	end
	
	if shuju.jinbi then
		subbindgold(actor,shuju.jinbi)
	end
	if shuju.shengwang then
		subshengwang(actor,shuju.shengwang)
	end

	confertitle(actor,shuju.chid)
	if level > 0 then
		deprivetitle(actor,guanyun[level].chid)
	end
	setint(actor,"官运等级",level+1)
	sendmsg9(actor,"恭喜你，升级官运至【".. shuju.name .."】")
	return show(actor)
end
