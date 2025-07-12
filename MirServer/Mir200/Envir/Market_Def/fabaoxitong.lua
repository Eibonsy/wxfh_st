include("Market_Def/zh.lua") --个人封装函数
local fabaot = {
"断玉钩","混元凤凰珠","雷公锤","琉璃佩","妖魄之瞳","镇魂钟","崆峒印","炼妖壶",
"玉净瓶","闪电五连鞭","番天印","震天箭","日照香炉","玄武盾","东皇钟","昆仑镜",
"乾坤鼎","蜈蜂袋","五云离合圭","上古龙珠","混元金斗","补天石","孔雀翎","神农鼎","避水珠","蓝灵珠","日月珠","金光锉",
"伏龙鼎","紫金葫","太极符印","九炎枪","绿玉环","昊天塔","金木鱼","降魔杵",
"天机镜","玉虚杏黄旗","混天绫","玉如意","六魂幡","紫符天录","生死簿","魔灵印","九天息壤","夔牛鼓","无量尺","南明离火",
}

local fabaoshow_t = {
	{"天机镜","金木鱼","生死簿","降魔杵","紫金葫","补天石",gao=106,xilie="上古系列印记",color=255},
	{"无量尺","混天绫","南明离火","夔牛鼓","太极符印","五云离合圭",gao=106,xilie="远古系列印记",color=255},
	{"玉虚杏黄旗","玉如意","昊天塔","九炎枪","乾坤鼎","上古龙珠",gao=106,xilie="蛮荒系列印记",color=255},
	{"九天息壤","魔灵印","伏龙鼎","蜈蜂袋","孔雀翎","金光锉",gao=106,xilie="异兽系列印记",color=255},
	{"紫符天录","六魂幡","绿玉环","避水珠","蓝灵珠","日月珠","神农鼎","混元金斗",gao=170,xilie="洪荒系列印记",color=255},
	{"震天箭","日照香炉","闪电五连鞭","东皇钟","昆仑镜","玄武盾","番天印","玉净瓶",gao=170,xilie="混沌系列印记",color=250},
	{"镇魂钟","妖魄之瞳","炼妖壶","混元凤凰珠","雷公锤","琉璃佩","崆峒印","断玉钩",gao=170,xilie="鸿蒙系列印记",color=249},
}

local jiage = {["乾坤鼎"]=1,["蜈蜂袋"]=1,["五云离合圭"]=1,["上古龙珠"]=1,["混元金斗"]=1,["补天石"]=1,["孔雀翎"]=1,["神农鼎"]=1,["避水珠"]=1,["蓝灵珠"]=1,["日月珠"]=1,["金光锉"]=1,
["伏龙鼎"]=1,["紫金葫"]=1,["太极符印"]=1,["九炎枪"]=1,["绿玉环"]=1,["昊天塔"]=1,["金木鱼"]=1,["降魔杵"]=1,
["天机镜"]=1,["玉虚杏黄旗"]=1,["混天绫"]=1,["玉如意"]=1,["六魂幡"]=1,["紫符天录"]=1,["生死簿"]=1,["魔灵印"]=1,["九天息壤"]=1,["夔牛鼓"]=1,["无量尺"]=1,["南明离火"]=1,
}

local base = {["乾坤鼎"]=1,["蜈蜂袋"]=1,["五云离合圭"]=1,["上古龙珠"]=1,["混元金斗"]=1,["补天石"]=1,["孔雀翎"]=1,["神农鼎"]=1,["避水珠"]=1,["蓝灵珠"]=1,["日月珠"]=1,["金光锉"]=1,
["伏龙鼎"]=1,["紫金葫"]=1,["太极符印"]=1,["九炎枪"]=1,["绿玉环"]=1,["昊天塔"]=1,["金木鱼"]=1,["降魔杵"]=1,
["天机镜"]=1,["玉虚杏黄旗"]=1,["混天绫"]=1,["玉如意"]=1,["六魂幡"]=1,["紫符天录"]=1,["生死簿"]=1,["魔灵印"]=1,["九天息壤"]=1,["夔牛鼓"]=1,["无量尺"]=1,["南明离火"]=1,
}

function show1(actor)
	local msg = [[
		<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=赏金猎人>
<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
<RText|ax=0|ay=0.5|x=22.0|y=70.0|color=255|size=18|text=上古时期玛法大陆妖魔横行，仙界派出法力通天的强者剿灭妖>
<RText|ay=0.5|x=22.0|y=95.0|color=255|size=18|text=魔留诸多印记于世间，如今妖魔欲卷土重来，故国王下令凡斩>
<RText|ay=0.5|x=22.0|y=120.5|color=255|size=18|text=杀妖魔者皆有机会获得印记！<混沌/FCOLOR=253>与<洪荒印记/FCOLOR=253>可自由交易>
<RText|ay=0.5|x=22.0|y=145.5|color=255|size=18|text=<击杀1000血量以上>的怪物均可自动获得赏金值，使用赏金值<可/FCOLOR=254>>
<RText|ay=0.5|x=22.0|y=170.5|color=255|size=18|text=<免费获取印记/FCOLOR=254>，多余的印记可回收成<声望点/FCOLOR=70>!>
<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
<Text|ay=0.5|x=87.0|y=214.5|size=18|color=250|text=获取印记|link=@show>
<Text|ay=0.5|x=228.0|y=214.5|color=250|size=18|text=回收印记|link=@show,2>
<Text|ay=0.5|x=369.0|y=214.5|size=18|color=250|text=提取声望|link=@tiqushengwang>

	]]
	say(actor,msg)
end

function tiqushengwang(actor)
	local msg = [[
		<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
		<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
		<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=声望提取>
		<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
		<RText|ay=0.5|x=78.0|y=85.5|color=161|size=18|text=提取200点声望>
		<RText|ay=0.5|x=78.0|y=125.5|color=161|size=18|text=提取1000点声望>
		<RText|ay=0.5|x=25.0|y=165.5|color=254|size=16|text=为保障投资者的收益，投资专家可提取50%  投资大使可提取25%>
		<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
		<Text|ay=0.5|x=345.0|y=214.5|size=18|color=250|text=返回主页|link=@show1>
		<Text|ay=0.5|x=345.0|y=85.5|size=18|color=116|text=确定提取|link=@tiqu,200>
		<Text|ay=0.5|x=345.0|y=125.5|size=18|color=116|text=确定提取|link=@tiqu,1000>

	]]
	msg=msg.."<Text|ay=0.5|x=65.0|y=214.5|color=253|size=18|text=当前声望点：".. getshengwang(actor) ..">"
	say(actor,msg)
end

function tiqu(actor,sl)
	if getint(actor,"会员等级") < 2 then
		sendmsg9(actor,"你不是投资大使，无法提取声望","#00FF00")
		return
	end
	sl = tonumber(sl)
	if getshengwang(actor) < sl then
		sendmsg9(actor,"声望不足"..sl)
		return
	end
	subshengwang(actor,sl)
	if getint(actor,"会员等级") >= 4 then
		giveitem(actor,sl/2 .."点声望卷")
		sendmsg9(actor,"获得"..sl/2 .."点声望卷")
	else
		giveitem(actor,sl/4 .."点声望卷")
		sendmsg9(actor,"获得"..sl/4 .."点声望卷")
	end
	return tiqushengwang(actor)
end

local hongmeng = {"镇魂钟","妖魄之瞳","炼妖壶","混元凤凰珠","雷公锤","琉璃佩","崆峒印","断玉钩"}
function isyouhongmeng(actor)
	local yinjiname = ""
	local item = linkbodyitem(actor,14)
	if item ~= "0" then
		yinjiname = getitemname(actor,item)
	end
	for i = 1,#hongmeng do
		if itemcount(actor,hongmeng[i]) > 0 or yinjiname == hongmeng[i] then
			return true
		end
	end
	return false
end

function show(actor,yemian,isshiyong,rongheisshow,hongseshow,lvseshow,hongmakeid,lvmakeid,hongxzid,lvxzid,shuomingxianshi,xianshi)
	--haoshistart(actor)
	yemian = tonumber(yemian) or 1
	isshiyong = tonumber(isshiyong) or 0
	rongheisshow = tonumber(rongheisshow) or 0 --融合界面是否显示
	hongseshow = tonumber(hongseshow) or 0	--红色选择框是否显示
	lvseshow = tonumber(lvseshow) or 0 --绿色选择框是否显示
	hongmakeid = tonumber(hongmakeid) or 0
	lvmakeid = tonumber(lvmakeid) or 0
	hongxzid = tonumber(hongxzid) or 0
	lvxzid = tonumber(lvxzid) or 0
	xianshi = tonumber(xianshi) or 0
	shuomingxianshi = tonumber(shuomingxianshi) or 0
	if rongheisshow == 1 then
		if not isyouhongmeng(actor) then
			sendmsg9(actor,"请先获取鸿蒙系列印记")
			return
		end
	end

	if hongmakeid ~= 0 and lvmakeid ~= 0 then
		local t = {}
		local item1 = getitembymakeindex(actor,hongmakeid)
		local item2 = getitembymakeindex(actor,lvmakeid)
		if item1 == "0" or item2 == "0" then
			sendmsg9(actor,"你没有此物品")
			return show(actor,1,0,1)
		end
		t[1] = getitemname(actor,item1)
		t[2] = getitemname(actor,item2)
		sendluamsg(actor, 103, 0, 0, 0, tbl2json(t))
	else
		local t = {0,0}
		sendluamsg(actor, 103, 0, 0, 0, tbl2json(t))
	end
	
	local msg = [[
		<Img|x=0|width=643|height=457|reset=0|loadDelay=0|bg=1|img=zhangheng/1.png|move=1|esc=1|show=4>
		<Button|x=639.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
	]]
	if yemian == 1 then
		msg=msg..[[
		<Img|id=555|x=-26.5|y=142.5|esc=0|img=zhangheng/304.png|link=@show,2>
		<Img|x=-26.5|y=61.5|img=zhangheng/301.png|esc=0>

		<Img|x=16.5|y=37.5|img=zhangheng/146.png|esc=0>
		<Img|x=16.5|y=37.5|img=zhangheng/147.png|esc=0>
		<Img|x=15.5|y=94.5|width=609|height=338|scale9l=10|scale9b=10|img=zhangheng/149.png|scale9r=10|esc=0|scale9t=10>
		<Img|x=15.5|y=94.5|width=400|height=338|scale9r=10|scale9l=10|scale9t=10|img=zhangheng/149.png|scale9b=10|esc=0>

		<ListView|x=20.5|y=100.5|width=400|height=328|children={1,2,3,4,5,6,7}|bounce=0|margin=4 >
		]]
		
		if getint(actor,"法宝引导") == 0 then
			navigation(actor,0,555,"多余的印记可回收")
		end
		
		if getint(actor,"会员等级") >= 2 then
			msg=msg..[[
			<Text|x=485.5|y=103.5|color=116|size=18|text=获取介绍>
			<Text|x=420.5|y=129.5|color=161|size=16|text=为保证游戏的公平性，让每>
			<RText|x=420.5|y=151.5|color=161|size=16|text=位玩家有机会获得<顶级印记>>
			<RText|x=420.5|y=173.5|color=161|size=16|text=官方每天送出<5次免费获取/FCOLOR=253>>
			<Text|x=420.5|y=195.5|color=161|size=16|text=印记的机会，每次只需80点>
			<Text|x=420.5|y=217.5|color=161|size=16|text=赏金值，超过5次额外收取>
			<Text|x=420.5|y=239.5|color=161|size=16|text=7.5万金币>
			<RText|x=421.5|y=261.5|color=250|size=16|text=凡身上保持10万元宝的玩家>
			<RText|x=421.5|y=283.5|color=250|size=16|text=打怪可获得双倍赏金值>
			<Button|x=588.5|y=281.5|nimg=zhangheng/8.png|pimg=zhangheng/8.png|link=@show,1,0,0,0,0,0,0,0,0,0,1>
			]]
		
		else
			msg=msg..[[
			<Text|x=486.0|y=124.0|color=116|size=18|text=获取介绍>
			<Text|x=420.5|y=160.5|color=161|size=16|text=为保证游戏的公平性，让每>
			<RText|x=420.5|y=182.5|color=161|size=16|text=位玩家有机会获得<顶级印记>>
			<RText|x=420.5|y=204.5|color=161|size=16|text=官方每天送出<5次免费获取/FCOLOR=253>>
			<Text|x=420.5|y=226.5|color=161|size=16|text=印记的机会，每次只需80点>
			<Text|x=420.5|y=248.5|size=16|color=161|text=赏金值，超过5次额外收取>
			<Text|x=420.5|y=270.5|size=16|color=161|text=7.5万金币>

			]]
		end
		
		for i = 1,#fabaoshow_t do
			local ziid = i*1000
			local ziids = ""
			for j = 0,50 do
				ziids = ziids.. ziid + j ..","
			end
			msg=msg.."<Img|id="..i.."|children={".. ziids .."}|width=390|height=".. fabaoshow_t[i].gao .."|scale9r=10|scale9l=10|esc=0|img=zhangheng/149.png|scale9b=10|scale9t=10>"
			msg=msg.."<Text|id=".. ziid .."|x=10|y=12|color=".. fabaoshow_t[i].color .."|size=18|text=".. fabaoshow_t[i].xilie ..">"
			ziid = ziid + 1
			for j = 1,#fabaoshow_t[i] do
				msg=msg.."<Img|id=".. ziid .."|x=".. 10+((j-1)%6)*64 .."|y=".. 45+math.floor((j-1)/6)*64 .."|width=50|height=50|scale9t=10|scale9b=10|img=zhangheng/149.png|scale9r=10|esc=0|scale9l=10>"
				ziid = ziid + 1
				msg=msg.."<ItemShow|id=".. ziid .."|x=".. 3+((j-1)%6)*64 .."|y=".. 38+math.floor((j-1)/6)*64 .."|width=70|height=70|itemid=".. getidbyname(fabaoshow_t[i][j]) .."|itemcount=1|showtips=1|bgtype=0>"
				ziid = ziid + 1
			end
		end

		msg=msg.."<Button|x=424.5|y=345.5|size=18|nimg=zhangheng/13.png|color=10051|text=印记融合|link=@show,1,0,1>"

		msg=msg.."<Img|x=379.5|y=285.5|img=zh/50.png|width=270|esc=0>" --线
		if getdayint(actor,"印记抽奖次数") < 5 then
			msg=msg.."<Button|x=528.5|y=345.5|nimg=zhangheng/13.png|color=10051|size=18|text=获取印记|link=@choujiang,1>"
			--msg=msg.."<Text|x=564.5|y=367.5|color=250|size=18|text=(".. getdayint(actor,"印记抽奖次数") .."/10)>"
		else
			msg=msg.."<Button|x=528.5|y=345.5|nimg=zhangheng/13.png|color=10051|size=18|text=获取印记|link=@choujiang,2>"
		end
		
		
		msg=msg.."<Text|x=428.5|y=402.5|color=128|size=18|text=当前赏金值："..getshangjinzhi(actor)..">"
		if rongheisshow == 1 then
			return rongheshow(actor,msg,hongseshow,lvseshow,hongmakeid,lvmakeid,hongxzid,lvxzid,shuomingxianshi)
		end
		
		if xianshi == 1 then
			msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@show>"
			msg =msg..[[
<Img|ay=0.5|x=334.5|y=277.5|width=250|height=60|rotate=0|scale9t=10|scale9r=10|esc=0|scale9b=10|img=zh/7.png|scale9l=10>
<RText|x=350.5|y=255.5|width=344|size=16|color=255|text=可获得鸿运当头.一路顺风顺水>
<RText|x=350.5|y=279.5|width=344|size=16|color=255|text=需持续保持可为勇士带来好运.>

			]]
		end
		
	elseif yemian == 2 then
		if getint(actor,"法宝引导") == 0 then
			setint(actor,"法宝引导",1)
		end
	
		----回收界面开始
		msg=msg..[[
		<Img|x=-26.5|y=142.5|esc=0|img=zhangheng/303.png>
		<Img|x=-26.5|y=61.5|img=zhangheng/302.png|link=@show,1>


		<Img|x=16.5|y=38.5|img=zhangheng/152.png|esc=0>
		<Img|x=422.5|y=38.5|img=zhangheng/128.png|esc=0>
		<Img|x=18.5|y=292.5|img=zhangheng/140.png|esc=0>
		<Img|x=90.5|y=249.5|img=zhangheng/139.png|esc=0>
		<Img|x=152.5|y=305.5|img=zhangheng/153.png|esc=0>
		<Img|x=86.5|y=314.5|img=zhangheng/142.png|esc=0>
		<Img|x=298.5|y=314.5|img=zhangheng/143.png|esc=0>
		<Img|x=74.5|y=345.5|img=zhangheng/138.png|esc=0>
		<Img|x=420.5|y=40.5|img=zhangheng/144.png|esc=0>
		<Img|x=430.5|y=83.5|width=187|height=290|scale9r=3|scale9l=3|esc=0|img=zh/36.png|scale9b=3|scale9t=3>
		<Img|x=148.0|y=81.0|img=zh/21.png|esc=0>
		<Text|x=129.5|y=197.5|color=250|size=18|outline=1|text=每个印记可回收5点声望>
<Text|x=129.5|y=221.5|color=250|size=18|outline=1|text=投资专家可额外获得5点>

		<Button|x=437.5|y=383.5|color=10051|nimg=zhangheng/136.png|size=18|text=一键选择所有印记|link=@yijianquanxuan>
		<ListView|id=1999|children={2000}|x=431.5|y=87.5|width=187|height=283>

		]]
		--msg=""
		local ziids = ""
		for i = 2002,2400 do
			ziids = ziids .. i .. ","
		end
		
		local t = getbaglist(actor) --获取背包道具列表
		--release_print(tbl2json(t))
		local shouhun_t = {} --兽魂表 唯一id表
		local xuanzhong_t = {} --选中兽魂表 唯一id表
		if isshiyong == 1 then --使用变量存的唯一id物品表
			xuanzhong_t = gethuishoudata(actor)
		else
			setstr(actor,"回收选中道具","")
		end
		
		for i = 1,#t do
			local id = getiteminfo(actor,t[i],2) --物品id
			local wyid = getiteminfo(actor,t[i],1) --物品唯一id
			local iname = getstditeminfo(id,1) --名字
			--sendmsg6(actor,iname.."的唯一id"..wyid)
			if jiage[iname] then
				table.insert(shouhun_t,wyid)
			end
		end
		local ziid = 2002
		local ysxx = -2
		local ysyy = -6
		local gaodu = (math.floor((#shouhun_t-1)/3) + 1) * 56 + 3
		msg = msg ..'<Layout|id=2000|children={2001}|height='.. gaodu ..'>' --设置底框宽 高
		msg = msg ..'<Layout|id=2001|children={'.. ziids ..'}|height='.. gaodu ..'>' --设置底框宽 高
		for i = 1,15 do
			msg = msg ..'<Img|id='..ziid..'|x='.. ysxx+9 + (i-1)%3*60 ..'|y='.. ysyy+9+math.floor((i-1)/3) * 56 ..'|width=52|height=52|scale9t=3|scale9b=3|img=zh/36.png|scale9r=3|scale9l=3>'
			ziid = ziid + 1		
		end
		--release_print(tbl2json(shouhun_t))
		--release_print("选中",tbl2json(xuanzhong_t))
		
		local xuzhong_sl = 0
		for i = 1,#shouhun_t do
			local makeid = tostring(shouhun_t[i])
			msg = msg ..'<Img|id='..ziid..'|x='.. ysxx+9 + (i-1)%3*60 ..'|y='.. ysyy+9+math.floor((i-1)/3) * 56 ..'|width=52|height=52|scale9t=3|scale9b=3|img=zh/36.png|scale9r=3|scale9l=3>'
			ziid = ziid + 1
			if xuanzhong_t[makeid] then  ----有选中		
				 	
				msg = msg ..'<DBItemShow|id='..ziid..'|x='.. ysxx+3 + (i-1)%3*60 ..'|y='.. ysyy+3+math.floor((i-1)/3) * 56 ..'|makeindex='..shouhun_t[i]..'|link=@xuanze,2,'.. shouhun_t[i] ..'>'
				
				ziid = ziid + 1
				--选中亮框
				msg = msg ..'<Img|id='..ziid..'|x='.. ysxx+8 + (i-1)%3*60 ..'|y='.. ysyy+8+math.floor((i-1)/3) * 56 ..'|img=zh/71.png>'
				ziid = ziid + 1		
				xuzhong_sl = xuzhong_sl + 1 ----选中数量	
			else
				
					msg = msg ..'<DBItemShow|id='..ziid..'|x='.. ysxx+3 + (i-1)%3*60 ..'|y='.. ysyy+3+math.floor((i-1)/3) * 56 ..'|makeindex='..shouhun_t[i]..'|link=@xuanze,1,'.. shouhun_t[i] ..'>'
				
				ziid = ziid + 1
			end
		end
		local meigedian = 5
		if getint(actor,"会员等级") >= 4 then
			meigedian = 10
		end
		msg = msg ..'<Text|ax=0.5|ay=0.5|x=221.5|y=266.0|color=251|size=18|text=已选中['.. xuzhong_sl ..']个印记>'
		msg = msg ..'<RText|ax=0.5|ay=0.5|x=221.5|y=97.0|color=255|size=18|text=<当前声望点：/FCOLOR=95><'.. getshengwang(actor) ..'/FCOLOR=254>>'
		msg = msg ..'<Text|ax=0.5|ay=0.5|x=222.5|y=363.0|color=254|size=18|text='.. xuzhong_sl*meigedian ..'点>'

		msg = msg ..'<Button|x=179.5|y=388.5|nimg=zhangheng/13.png|color=10051|size=18|text=确定回收|link=@huishou>'
		
	end
	
	say(actor,msg)
	--haoshiend(actor)
end

function rongheshow(actor,msg,hongseshow,lvseshow,hongmakeid,lvmakeid,hongxzid,lvxzid,shuomingxianshi)
	--sendmsg6(actor,""..shuomingxianshi)
	msg = msg ..[[<Button|x=16.5|y=38.5|width=610|height=398|pimg=zh/24.png|color=255|mimg=zh/24.png|size=18|nimg=zh/24.png|link=@wuxiao>
	<Img|x=21.5|y=42.5|img=zhangheng/150.png|esc=0>
	<Img|x=189.5|y=257.5|img=zhangheng/156.png|esc=0>
	<Img|x=87.0|y=156.0|img=zhangheng/278.png|esc=0>
	<Img|x=369.0|y=156.0|img=zhangheng/279.png|esc=0>

	]]
	msg = msg ..'<Button|x=26.0|y=393.0|color=255|size=18|mimg=zhangheng/8.png|pimg=zhangheng/8.png|nimg=zhangheng/8.png|link=@show,1,0,1,0,0,'.. hongmakeid..','.. lvmakeid..',0,0,1>'
	

	---叉叉按钮
	msg = msg ..'<Img|x=413.5|y=46.5|img=zhangheng/151.png|link=@show,1>'
	--yemian,isshiyong,rongheisshow,hongseshow,lvseshow,hongmakeid,lvmakeid
	msg = msg ..'<Img|x=115.5|y=151.5|img=zhangheng/154.png|link=@show,1,0,1,1,0,'.. hongmakeid..','.. lvmakeid..',0,0,0>'
	msg = msg ..'<Img|x=282.5|y=151.5|img=zhangheng/155.png|link=@show,1,0,1,0,1,'.. hongmakeid..','.. lvmakeid..',0,0,0>'
	if hongmakeid ~= 0 then
		
			msg = msg ..'<DBItemShow|x=123.5|y=87.5|width=70|height=70|makeindex='..hongmakeid..'|itemcount=1|showtips=1|bgtype=0>'
		
	end
	if lvmakeid ~= 0 then
		
		msg = msg ..'<DBItemShow|x=289.5|y=87.5|width=70|height=70|makeindex='..lvmakeid..'|itemcount=1|showtips=1|bgtype=0>'
		
	end
	
	if hongmakeid ~= 0 and lvmakeid ~= 0 then
		local item = getitembymakeindex(actor,hongmakeid)
		if item ~= "0" then
			
			msg = msg ..'<ItemShow|x=205.5|y=194.5|width=70|height=70|itemid='.. getiteminfo(actor,item,2) ..'|itemcount=1|showtips=1|bgtype=0>'
			
		end
	end
	
	---红色装备选择界面
	if hongseshow == 1 then
		local items={["断玉钩"]=1,["混元凤凰珠"]=1,["雷公锤"]=1,["琉璃佩"]=1,["妖魄之瞳"]=1,["镇魂钟"]=1,["崆峒印"]=1,["炼妖壶"]=1,}
		local bagitems = getbaglist(actor)
		local hs_items = {} --红色装备唯一id表
		for i=1,#bagitems do
			if items[getitemname(actor,bagitems[i])] then
				table.insert(hs_items,getiteminfo(actor,bagitems[i],1))
			end
		end
		--sendmsg9(actor,"多少个"..#hs_items)
		local ziids = ""
		for i = 20022,20202+ #hs_items + 3 do
			ziids = ziids .. i .. ","
		end
		
		local ziid = 20202
		local ysxx = -2
		local ysyy = -6
		local gaodu = (math.floor((#hs_items-1)/7) + 1) * 60 + 3
		
		msg = msg ..'<Img|x=24.5|y=179.5|width=425|height=186|scale9t=10|scale9b=10|img=zhangheng/7.png|scale9r=10|scale9l=10|esc=0>'
		msg = msg ..'<Img|x=24.5|y=179.5|width=425|height=130|scale9t=10|scale9b=10|img=zhangheng/7.png|scale9r=10|scale9l=10|esc=0>'
		msg = msg ..'<ListView|id=19999|children={20020}|x=26.5|y=187.5|width=421|height=120>'
		
		msg = msg ..'<Layout|id=20020|children={20201}|x=0|y=0|width=421|height='..gaodu..'>'
		msg = msg ..'<Layout|id=20201|children={'.. ziids ..'}|x=0|y=0|width=421|height='..gaodu..'>'
		
		local hongmakeid1 = 0
		for i = 1,#hs_items do
			--sendmsg6(actor,hs_items[i] .. "  "..hongxzid)
			msg = msg ..'<Img|id='.. ziid ..'|children={item'.. i ..',kuang'..i..'}|x='.. 7+((i-1)%7)*60 ..'|y='.. 3+ math.floor((i-1)/7) * 60  ..'|width=50|height=50|img=zhangheng/105.png>'
			ziid = ziid + 1
			
			msg = msg ..'<DBItemShow|id=item'.. i ..'|x=-10|y=-10.0|makeindex='.. hs_items[i] ..'|itemcount=1|showtips=1|bgtype=0|link=@show,1,0,1,1,0,'.. hongmakeid..','.. lvmakeid..','.. hs_items[i]..',0,0>'
			
			if hongxzid == hs_items[i] then
				msg = msg ..'<Img|id=kuang'.. i ..'|x=0.0|y=0.0|width=50|height=50|esc=0|img=zhangheng/39.png>'
				hongmakeid1 = hs_items[i]
			end
		end
		msg = msg ..'<Button|x=194.5|y=320.5|nimg=zhangheng/13.png|color=10051|size=18|text=确定选择|link=@show,1,0,1,0,0,'.. hongmakeid1..','.. lvmakeid..',0,0,0>'
	end
	
	---绿色装备选择界面
	if lvseshow == 1 then
		local items={["玉净瓶"]=1,["闪电五连鞭"]=1,["番天印"]=1,["震天箭"]=1,["日照香炉"]=1,["玄武盾"]=1,["东皇钟"]=1,["昆仑镜"]=1,}
		local bagitems = getbaglist(actor)
		local hs_items = {} --绿色装备唯一id表
		for i=1,#bagitems do
			if items[getitemname(actor,bagitems[i])] then
				table.insert(hs_items,getiteminfo(actor,bagitems[i],1))
			end
		end
		--sendmsg9(actor,"多少个"..#hs_items)
		local ziids = ""
		for i = 20002,20002+ #hs_items + 3 do
			ziids = ziids .. i .. ","
		end
		
		local ziid = 20002
		local ysxx = -2
		local ysyy = -6
		local gaodu = (math.floor((#hs_items-1)/7) + 1) * 60 + 3
		
		msg = msg ..'<Img|x=24.5|y=179.5|width=425|height=186|scale9t=10|scale9b=10|img=zhangheng/7.png|scale9r=10|scale9l=10|esc=0>'
		msg = msg ..'<Img|x=24.5|y=179.5|width=425|height=130|scale9t=10|scale9b=10|img=zhangheng/7.png|scale9r=10|scale9l=10|esc=0>'
		msg = msg ..'<ListView|id=19999|children={20000}|x=26.5|y=187.5|width=421|height=120>'
		
		msg = msg ..'<Layout|id=20000|children={20001}|x=0|y=0|width=421|height='..gaodu..'>'
		msg = msg ..'<Layout|id=20001|children={'.. ziids ..'}|x=0|y=0|width=421|height='..gaodu..'>'
		local lvmakeid1 = 0
		for i = 1,#hs_items do
			--sendmsg6(actor,hs_items[i] .. "  "..hongxzid)
			msg = msg ..'<Img|id='.. ziid ..'|children={item'.. i ..',kuang'..i..'}|x='.. 7+((i-1)%7)*60 ..'|y='.. 3+ math.floor((i-1)/7) * 60  ..'|width=50|height=50|img=zhangheng/105.png>'
			ziid = ziid + 1
			
				msg = msg ..'<DBItemShow|id=item'.. i ..'|x=-8|y=-8.0|makeindex='.. hs_items[i] ..'|itemcount=1|showtips=1|bgtype=0|link=@show,1,0,1,0,1,'.. hongmakeid..','.. lvmakeid..',0,'.. hs_items[i]..',0>'
			
			if lvxzid == hs_items[i] then
				msg = msg ..'<Img|id=kuang'.. i ..'|x=0.0|y=0.0|width=50|height=50|esc=0|img=zhangheng/39.png>'
				lvmakeid1 = hs_items[i]
			end
		end
		msg = msg ..'<Button|x=194.5|y=320.5|nimg=zhangheng/13.png|color=10051|size=18|text=确定选择|link=@show,1,0,1,0,0,'.. hongmakeid..','.. lvmakeid1..',0,0,0>'
	end
	if lvseshow == 0 and hongseshow == 0 then
		msg = msg ..'<Text|x=184.5|y=305.0|color=254|size=18|text=成功几率20%>'
		msg = msg ..'<RText|a=4|x=240.0|y=350.0|color=250|size=18|outline=1|text=需要5个聚合之心+2000声望+ 1000个金矿石>'
		msg = msg ..'<Button|x=195.0|y=375.0|color=10051|size=18|nimg=zhangheng/13.png|text=确定融合|link=@quedingronghe,'.. hongmakeid..','.. lvmakeid..'>'
	end
	
	if shuomingxianshi == 1 then
		msg=msg..'<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@show,1,0,1,0,0,'.. hongmakeid..','.. lvmakeid..',0,0,0>'
		msg = msg ..[[
		<Img|ay=0.5|x=63.0|y=349.0|width=260|height=140|scale9r=10|scale9l=10|scale9t=10|img=zh/7.png|scale9b=10|esc=0>
		<RText|x=75.0|y=295.0|width=344|size=16|color=255|text=⒈<混沌系列/FCOLOR=250>可以跟<鸿蒙系列/FCOLOR=249>融合>
		<RText|x=75.0|y=320.0|width=344|size=16|color=255|text=⒉融合成功后<鸿蒙系列>可以<吸取/FCOLOR=70>>
		<RText|x=91.0|y=340.0|width=344|size=16|color=255|text=<混沌系列/FCOLOR=250>的属性(混沌系列消失)>
		<RText|x=75.0|y=365.0|width=344|size=16|color=255|text=⒊如融合失败<鸿蒙系列保留/FCOLOR=253>,混沌>
		<RText|x=91.5|y=385.0|width=344|size=16|color=255|text=系列破碎！>
		]]
	end
	
	say(actor,msg)
end

function quedingronghe(actor,hongmakeid,lvmakeid)
	hongmakeid = tonumber(hongmakeid)
	lvmakeid = tonumber(lvmakeid)

	if hongmakeid == 0 or lvmakeid == 0 then
		sendmsg9(actor,"请放入想要融合的印记")
		return
	end

	local item1 = getitembymakeindex(actor,hongmakeid)
	local item2 = getitembymakeindex(actor,lvmakeid)
	if item1 == "0" or item2 == "0" then
		sendmsg9(actor,"你没有此物品")
		return show(actor,1,0,1)
	end
	local iname1 = getitemname(actor,item1) --红装备名
	local iname2 = getitemname(actor,item2) --绿装备名
	
	if getitem_fabaozhi(actor,item1) > 0 then --融合装备编号
		sendmsg9(actor,"每件鸿蒙系列印记只能融合一次")
		return
	end


		if itemcount(actor,"聚合之心") < 5 then
			sendmsg9(actor,"聚合之心不足5个")
			return
		end
		if itemcount(actor,"金矿石") < 1000 then
			sendmsg9(actor,"金矿石不足1000个")
			return
		end
		if getshengwang(actor) < 2000 then
			sendmsg9(actor,"声望不足2000")
			return
		end
		
		
		takeitem(actor,"聚合之心",5)
		takeitem(actor,"金矿石",1000)
		subshengwang(actor,2000)

	setsysint("融合的次数",getsysint("融合的次数")+1)
	setsysint("每日融合的次数",getsysint("每日融合的次数")+1)
	
	
	local chenggonglv = 5 --百分之10
	if getint(actor,"印记融合失败次数") >=6 then
		chenggonglv = 60
	end	
	
	
	if math.random(1,100) > chenggonglv then
		delitembymakeindex(actor,""..lvmakeid,1)
		sendmsg9(actor,"融合失败")
		setint(actor,"印记融合失败次数",getint(actor,"印记融合失败次数")+1)
		return show(actor,1,0,1,0,0,hongmakeid,0,0,0,0)
	end
	
	local itemid = getiteminfo(actor,item2,2) --绿色物品id
	local xh = 0
	for i = 1,210 do
		local zhi = getstditematt(itemid,i)
		if zhi ~= 0 then
			--sendmsg6(actor,"物品id：".. itemid)
			--sendmsg6(actor,"测试提示：id".. i .."  值"..zhi)	
			changecustomitemtext(actor,item1,"",1)
			changecustomitemabil(actor,item1,xh,1,i,1) --参数4  1为绑定att属性 
			--changecustomitemabil(actor,item1,xh,2,0,1) --参数4  2为绑定自定属性表 显示用
			--changecustomitemabil(actor,item,xh,3,1,1) --参数4  3为绑定的值是否为百分比 0不是 1是
			--changecustomitemabil(actor,item1,xh,4,0,1) --参数4  4为绑定属性显示位置哪一行
			changecustomitemvalue(actor,item1,xh,"=",zhi,1) --设置绑定att属性的值
			xh = xh + 1
		end
	end
	local ronghebh = 0 --融合编号
	for i = 1,#fabaot do
		if iname2 == fabaot[i] then
			ronghebh = i 
			break
		end
	end
	delitembymakeindex(actor,""..lvmakeid,1)
	setitem_fabaozhi(actor,item1,ronghebh)
	refreshitem(actor,item1)
	sendmsg9(actor,"恭喜你，融合成功","#FF00FF")
	setint(actor,"印记融合失败次数",0)
	return show(actor,1,0,1,0,0,hongmakeid,0,0,0,0)
end


function wuxiao(actor)
end

local tab_10000 = {
	"金木鱼","降魔杵","天机镜","玉虚杏黄旗","混天绫","玉如意","六魂幡","紫符天录","生死簿","魔灵印","九天息壤","夔牛鼓","无量尺","南明离火",
}
local tab_1000 = {
	"伏龙鼎","紫金葫","太极符印","九炎枪","绿玉环","昊天塔",
}
local tab_500 = {
	"乾坤鼎","蜈蜂袋","五云离合圭","补天石","神农鼎",
}

local tab_300 = {
	"上古龙珠","混元金斗","金光锉","避水珠","蓝灵珠","日月珠","孔雀翎",
}

local tab_100 = {
	"玉净瓶","闪电五连鞭","番天印","震天箭","日照香炉","玄武盾","东皇钟","昆仑镜",
}

local tab_1 = {
	"断玉钩","混元凤凰珠","雷公锤","琉璃佩","妖魄之瞳","镇魂钟","崆峒印","炼妖壶",
}



function choujiang(actor,par)
	local tishi = 0
	if getbagblank(actor) < 7 then
		sendmsg9(actor,"背包空格不足")
		return
	end
	
	local shangjinzhi = getshangjinzhi(actor)
	local jinbi = getbindgold(actor)
	if shangjinzhi < 80 then
		sendmsg9(actor,"赏金值不足80")
		return
	end
	if par == "1" then --免费
		if getdayint(actor,"印记抽奖次数") >= 5 then
			sendmsg9(actor,"今天已经免费获取5次了")
			return
		end
		setdayint(actor,"印记抽奖次数",getdayint(actor,"印记抽奖次数")+1)	
	else
		if jinbi < 75000 then
			sendmsg9(actor,"金币不足7.5万")
			return
		end
		subbindgold(actor,75000)
	end
	subshangjinzhi(actor,80)
	local t = tab_10000
	local jilvzhi = math.random(1,100000)
	local str = ""
	local yanse = "#FFFFFF"
	if par == "2" then --不是免费
		if getbindjinbi(actor) == 0 and jilvzhi <= 7 and getkaiquday() > 1 then --没有绑定金币 几率万分之1  1/14000
			if getint(actor,"会员等级") <= 2 then
				if math.random(1,5) == 2 then
					t = tab_1
					tishi = 1
					str = "鸿蒙系列印记"
					yanse = "#FF0000"
				end
			else
				t = tab_1
				tishi = 1
				str = "鸿蒙系列印记"
				yanse = "#FF0000"
			end
		elseif getbindjinbi(actor) > 0 and jilvzhi <= 3 and getkaiquday() > 1 then --有绑定金币 几率2万分之1 1/33000
			if getint(actor,"会员等级") <= 2 then
				if math.random(1,5) == 2 then
					t = tab_1
					tishi = 1
					str = "鸿蒙系列印记"
					yanse = "#FF0000"
				end
			else
				t = tab_1
				tishi = 1
				str = "鸿蒙系列印记"
				yanse = "#FF0000"
			end
		elseif getbindjinbi(actor) == 0 and jilvzhi <= 70 then ---1/1400
			if getint(actor,"会员等级") <= 2 then
				if math.random(1,3) == 2 then
					t = tab_100
					tishi = 1
					str = "混沌系列印记"
					yanse = "#00FF00"				
				end
			else
				t = tab_100
				tishi = 1
				str = "混沌系列印记"
				yanse = "#00FF00"
			end
		elseif getbindjinbi(actor) > 0 and jilvzhi <= 33 then --1/3000
			if getint(actor,"会员等级") <= 2 then
				if math.random(1,3) == 2 then
					t = tab_100
					tishi = 1
					str = "混沌系列印记"
					yanse = "#00FF00"				
				end
			else
				t = tab_100
				tishi = 1
				str = "混沌系列印记"
				yanse = "#00FF00"
			end
		elseif jilvzhi <= 5000 then ---百分之5
			t = tab_500
			if math.random(1,100) <= 40 then
				t = tab_300
				tishi = 1
			end
		elseif jilvzhi <= 10000 then --百分之10
			t = tab_1000
		end
	else --免费的不出红绿
		if jilvzhi <= 70 then
			if getint(actor,"会员等级") <= 2 then
				if math.random(1,3) == 2 then
					t = tab_100
					tishi = 1
					str = "混沌系列印记"
					yanse = "#00FF00"				
				end
			else
				t = tab_100
				tishi = 1
				str = "混沌系列印记"
				yanse = "#00FF00"
			end
		elseif jilvzhi <= 5000 then
			t = tab_500
			if math.random(1,100) <= 40 then
				t = tab_300
				tishi = 1
			end
		elseif jilvzhi <= 10000 then
			t = tab_1000
		end
	end
	local name = t[math.random(1,#t)]
	if base[name] then
		giveitem(actor,name, 1,370)
	else
		giveitem(actor,name, 1,0)
		setsysint("抽取"..name,getsysint("抽取"..name)+1)
		setsysint("每日抽取"..name,getsysint("每日抽取"..name)+1)
	end
	if str ~= "" then
		sendmsg(actor,1,'{"Msg":"<font color=\''.. yanse ..'\'>'.. '恭喜你获得'.. str ..'【'..name..'】' ..'</font>","FColor":255,"BColor":139,"Type":1,"Time":3}')
		sendmsg9(actor,"恭喜你获得".. str .."【"..name.."】",yanse)
		post(actor,"抽取好印记 " ..name)
	else
		sendmsg6(actor,"恭喜你获得【"..name.."】")
		post(actor,"抽取印记 " ..name)
	end
	setint(actor,"抽奖数量"..name,getint(actor,"抽奖数量"..name)+1)
	setint(actor,"印记抽奖次数",getint(actor,"印记抽奖次数")+1)
	if tishi == 1 then
		sendmsg(actor,2,'{"Msg":"恭喜玩家<〖'.. getname(actor) ..'〗/FCOLOR=254>在赏金猎人获取到<“'.. name ..'”/FCOLOR=245>，看来运气也是实力的一部分","FColor":251,"BColor":0,"Type":5,"Y":100}')
	end
	
	setsysint("赏金猎人抽取的次数",getsysint("赏金猎人抽取的次数")+1)
	setsysint("每日赏金猎人抽取的次数",getsysint("每日赏金猎人抽取的次数")+1)
	return show(actor,1)
end

function huishou(actor)
	local t = gethuishoudata(actor) --要回收的道具数据
	local sl = 0
	for k,v in pairs(t) do
		local makeid = tonumber(k)
		if delitembymakeindex(actor,makeid,1) then
			sl = sl + 1
		end
	end
	local meigedian = 5
	if getint(actor,"会员等级") >= 4 then
		meigedian = 10
	end
	if sl > 0 then
		addshengwang(actor,sl*meigedian)
		sendmsg9(actor,"回收成功")
	else
		sendmsg9(actor,"请选择要回收的兽魂")
	end
	
	return show(actor,2)
end

function xuanze(actor,caozuo,makeid) --操作 1加 2减  唯一id
	local t = gethuishoudata(actor)
	if caozuo == "1" then
		t[makeid] = 1 
	else
		t[makeid] = nil
	end
	setstr(actor,"回收选中道具",tbl2json(t)) --存入
	return show(actor,2,1)
end
function yijianquanxuan(actor)
	local t = getbaglist(actor) --获取背包道具列表
	local shouhun_t = {} --兽魂表 唯一id表
	local xuanzhong_t = {} --选中兽魂表 唯一id表
	for i = 1,#t do
		local id = getiteminfo(actor,t[i],2) --物品id
		local wyid = getiteminfo(actor,t[i],1) --物品唯一id
		local iname = getstditeminfo(id,1) --名字
		if jiage[iname] then
			table.insert(shouhun_t,wyid)
		end
	end
	for i = 1,#shouhun_t do
		xuanzhong_t[tostring(shouhun_t[i])] = 1
	end
	setstr(actor,"回收选中道具",tbl2json(xuanzhong_t)) --存入
	return show(actor,2,1)
end

function gethuishoudata(actor) --获取回收数据
	local data = {}
	local sh_str = getstr(actor,"回收选中道具")
	if sh_str ~= "" then
		data=json2tbl(sh_str)
	end
	return data
end