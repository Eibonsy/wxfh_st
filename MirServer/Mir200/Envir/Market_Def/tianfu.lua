include("Market_Def/zh.lua") --个人封装函数

local tianfu_t = {"攻击加成+%d%%","魔法加成+%d%%","道术加成+%d%%","体力加成+%d%%","魔力加成+%d%%","防魔加成+%d%%","暴击伤害+%d%%","伤害增加+%d%%","物理减伤+%d%%","魔法减伤+%d%%","玄武之力+Lv.%d"}
local fenjie_t = {
["开天"]=3,["奔雷战甲(男)"]=2,["奔雷战甲(女)"]=2,["战神头盔"]=1,["战神项链"]=1,["战神手镯"]=1,["战神戒指"]=1,["战神腰带"]=1,["战神圣靴"]=1,
["镇天"]=3,["怒焰魔衣(男)"]=2,["怒焰魔衣(女)"]=2,["圣魔头盔"]=1,["圣魔项链"]=1,["圣魔手镯"]=1,["圣魔戒指"]=1,["圣魔腰带"]=1,["圣魔法靴"]=1,
["玄天"]=3,["极光道袍(男)"]=2,["极光道袍(女)"]=2,["真魂头盔"]=1,["真魂项链"]=1,["真魂手镯"]=1,["真魂戒指"]=1,["真魂腰带"]=1,["真魂道靴"]=1,

["上古鬼炎"]=6,["真龙战甲"]=6,["真龙战衣"]=6,["狂战头盔"]=3,["狂战项链"]=3,["狂战手镯"]=3,["狂战戒指"]=3,["狂战腰带"]=3,["狂战圣靴"]=3,
["火凤之舞"]=6,["狂魔披风"]=6,["狂魔雨衣"]=6,["混世头盔"]=3,["混世项链"]=3,["混世手镯"]=3,["混世戒指"]=3,["混世腰带"]=3,["混世法靴"]=3,
["绿玉无极"]=6,["皓尊道袍"]=6,["皓尊长袍"]=6,["太极头盔"]=3,["太极项链"]=3,["太极手镯"]=3,["太极戒指"]=3,["太极腰带"]=3,["太极道靴"]=3,

["鬼斧屠戮"]=20,["圣龙战甲"]=20,["圣龙战衣"]=20,["玄铁战盔"]=8,["玄铁项链"]=8,["玄铁手镯"]=8,["玄铁戒指"]=8,["玄铁腰带"]=8,["玄铁战靴"]=8,
["聚灵法杖"]=20,["魔龙披风"]=20,["魔龙羽衣"]=20,["风雷魔盔"]=8,["风雷项链"]=8,["风雷手镯"]=8,["风雷戒指"]=8,["风雷腰带"]=8,["风雷魔靴"]=8,
["毒龙刺"]=20,["御龙道袍"]=20,["御龙道衣"]=20,["蓝灵道盔"]=8,["蓝灵项链"]=8,["蓝灵手镯"]=8,["蓝灵戒指"]=8,["蓝灵腰带"]=8,["蓝灵道靴"]=8,

["暗黑审判者"]=60,["狂野战甲"]=60,["狂野战衣"]=60,["傲天々圣盔"]=20,["傲天々圣链"]=20,["傲天々圣镯"]=20,["傲天々圣戒"]=20,["傲天々圣带"]=20,["傲天々圣靴"]=20,
["天行权杖"]=60,["火凤之铠"]=60,["火凰之铠"]=60,["幻天々魔盔"]=20,["幻天々魔链"]=20,["幻天々魔镯"]=20,["幻天々魔戒"]=20,["幻天々魔带"]=20,["幻天々魔靴"]=20,
["太极羽扇"]=60,["天使之羽"]=60,["天使之翼"]=60,["玄天々道盔"]=20,["玄天々道链"]=20,["玄天々道镯"]=20,["玄天々道戒"]=20,["玄天々道带"]=20,["玄天々道靴"]=20,

["赤影★圣盔"]=50,["赤影★圣链"]=50,["赤影★圣镯"]=50,["赤影★圣戒"]=50,["赤影★圣带"]=50,["赤影★圣靴"]=50,
["焚天★魔盔"]=50,["焚天★魔链"]=50,["焚天★魔镯"]=50,["焚天★魔戒"]=50,["焚天★魔带"]=50,["焚天★魔靴"]=50,
["远古★道盔"]=50,["远古★道链"]=50,["远古★道镯"]=50,["远古★道戒"]=50,["远古★道带"]=50,["远古★道靴"]=50,

["游龙ぬ锥心盔"]=100,["游龙ぬ锥心链"]=100,["游龙ぬ锥心镯"]=100,["游龙ぬ锥心戒"]=100,["游龙ぬ锥心带"]=100,["游龙ぬ锥心靴"]=100,
["咆哮ぬ怒吼盔"]=100,["咆哮ぬ怒吼链"]=100,["咆哮ぬ怒吼镯"]=100,["咆哮ぬ怒吼戒"]=100,["咆哮ぬ怒吼带"]=100,["咆哮ぬ怒吼靴"]=100,
["契约ぬ神罚盔"]=100,["契约ぬ神罚链"]=100,["契约ぬ神罚镯"]=100,["契约ぬ神罚戒"]=100,["契约ぬ神罚带"]=100,["契约ぬ神罚靴"]=100,

["阿修罗ぬ神盔"]=200,["阿修罗ぬ神链"]=200,["阿修罗ぬ神镯"]=200,["阿修罗ぬ神戒"]=200,["阿修罗ぬ神带"]=200,["阿修罗ぬ神靴"]=200,
["帝释天ぬ神盔"]=200,["帝释天ぬ神链"]=200,["帝释天ぬ神镯"]=200,["帝释天ぬ神戒"]=200,["帝释天ぬ神带"]=200,["帝释天ぬ神靴"]=200,
["迦楼罗ぬ神盔"]=200,["迦楼罗ぬ神链"]=200,["迦楼罗ぬ神镯"]=200,["迦楼罗ぬ神戒"]=200,["迦楼罗ぬ神带"]=200,["迦楼罗ぬ神靴"]=200,



["天威ぁ龙源盔"]=80,["天威ぁ龙源链"]=80,["天威ぁ龙源镯"]=80,["天威ぁ龙源戒"]=80,["天威ぁ龙源带"]=80,["天威ぁ龙源靴"]=80,
["天命ぁ赤霄盔"]=80,["天命ぁ赤霄链"]=80,["天命ぁ赤霄镯"]=80,["天命ぁ赤霄戒"]=80,["天命ぁ赤霄带"]=80,["天命ぁ赤霄靴"]=80,
["天机ぁ无尘盔"]=80,["天机ぁ无尘链"]=80,["天机ぁ无尘镯"]=80,["天机ぁ无尘戒"]=80,["天机ぁ无尘带"]=80,["天机ぁ无尘靴"]=80,

["涅槃菩提盔"]=120,["涅槃菩提链"]=120,["涅槃菩提镯"]=120,["涅槃菩提戒"]=120,["涅槃菩提带"]=120,["聚魔觉醒靴"]=120,
["聚魔觉醒盔"]=120,["聚魔觉醒链"]=120,["聚魔觉醒镯"]=120,["聚魔觉醒戒"]=120,["涅槃菩提靴"]=120,["聚魔觉醒带"]=120,

}

function show(actor,xianshi,huishou,makeid,jiageshow)
	local jingmailv = getint(actor,"经脉等级")
	if jingmailv < 5 then
		sendmsg9(actor,"年轻人，请先打通<font color='#ff00ff'>[奇经八脉]</font>的阳跷脉在来找老夫..")
		return
	end
	xianshi = tonumber(xianshi) or 0
	huishou = tonumber(huishou) or 0
	makeid = tonumber(makeid) or 0
	jiageshow = tonumber(jiageshow) or 0
	local msg = [[
		<Img|x=0|width=593|height=454|bg=1|esc=1|scale9r=50|scale9t=50|scale9b=50|move=1|reset=0|loadDelay=0|scale9l=50|img=zhangheng/1.png|show=4>
		<Button|x=590.0|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
		<Img|x=16.5|y=38.5|img=zhangheng/181.png|esc=0>
		<Text|x=82.5|y=51.0|color=103|size=18|text=天赋属性>
		<Button|x=537.5|y=41.0|nimg=zhangheng/8.png|pimg=zhangheng/8.png|link=@show,1>
		<Button|x=466.5|y=281.0|width=100|size=18|color=10051|nimg=zhangheng/13.png|text=重置天赋点|link=@chongzhi>
		<Button|x=367.5|y=359.0|color=10051|nimg=zhangheng/13.png|size=18|text=分配属性|link=@fenpei>
		<Text|x=230.5|y=399.0|size=18|color=250|text=分解永恒之泪|link=@show,0,1>

	]]
	
	msg=msg.."<RText|x=233.5|y=291.0|color=161|size=18|text=当前天赋点数：".. gettianfudian(actor) - getint(actor,"已分配天赋点") ..">"
	local tiaoshu = 10
	local jianju = 33
	if getlevel(actor) >= 75 then
		tiaoshu = 11
		jianju = 30
	end
	local data = gettf_data(actor)
	for i = 1,tiaoshu do
		msg=msg.."<Text|x=53.5|y=".. 96+(i-1)*jianju .."|color=161|size=18|text=".. string.format(tianfu_t[i],data[i])  ..">"
	end
	if xianshi == 1 then
		msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@show>"
		if getlevel(actor) >= 75 then
			msg=msg..[[
			<Img|ay=0.5|x=217.5|y=217.0|width=320|height=350|scale9r=10|scale9l=10|esc=0|img=zh/7.png|scale9b=10|scale9t=10>
			<RText|x=233.5|y=55.0|color=251|size=16|text=天赋属性说明：>
			<RText|x=233.5|y=80.0|color=255|size=16|text=如果对随机分配的属性不满意， 可重置>
			<RText|x=233.5|y=100.0|color=255|size=16|text=天赋点重新分配元素属性，<每重置1点/FCOLOR=70>天>
			<RText|x=233.5|y=120.0|color=255|size=16|text=赋需要<永恒之泪*1/FCOLOR=250>或<600元宝/FCOLOR=251>>
			<RText|x=234.5|y=146.0|color=251|size=16|text=玄武之力说明：>
			<RText|x=233.5|y=170.0|color=255|size=16|text=当等级达到75级，分配天赋点时有几率获>
			<RText|x=233.5|y=190.0|size=16|color=255|text=得特殊属性<"玄武之力"/FCOLOR=250>当玄武之力+10,可>
			<RText|x=233.5|y=210.0|size=16|color=255|text=获得主属性10点以及<专属技能/FCOLOR=250>，由于你已>
			<RText|x=233.5|y=230.0|color=255|size=16|text=突破等级的枷锁，获得玄武之力的运气会>
			<RText|x=233.5|y=250.0|color=255|size=16|text=随着你重置次数而增长>
			<RText|x=233.5|y=275.0|color=251|size=16|text=专属技能属性：>
			<RText|x=233.5|y=300.0|size=16|color=255|text=凝聚全身经脉之力，使人物变大<15秒/FCOLOR=250>内>
			<RText|x=233.5|y=320.0|color=255|size=16|text=无视所有主动以及被动buff，消除一切>
			<RText|x=233.5|y=340.0|size=16|color=255|text=负面状态，所受伤害减免<20%/FCOLOR=250>每秒额外>
			<RText|x=233.5|y=360.0|size=16|color=255|text=恢复<3%/FCOLOR=250>血量，技能CD时间<150秒/FCOLOR=250>>

			]]
		else
			msg=msg..[[
			<Img|ay=0.5|x=217.5|y=120.0|width=320|height=165|scale9r=10|scale9t=10|esc=0|img=zh/7.png|scale9b=10|scale9l=10>
			<RText|x=233.5|y=49.0|color=251|size=16|text=天赋属性说明：>
			<RText|x=233.5|y=74.0|color=255|size=16|text=如果对随机分配的属性不满意， 可重置>
			<RText|x=233.5|y=99.0|color=255|size=16|text=天赋点重新分配元素属性，<每重置1点/FCOLOR=70>天>
			<RText|x=233.5|y=124.0|color=255|size=16|text=赋需要<永恒之泪*1/FCOLOR=250>或<600元宝/FCOLOR=251>>
			<RText|x=233.5|y=150.0|size=16|color=255|text=重置天赋点系统<优先消耗永恒之泪/FCOLOR=250>，如果>
			<RText|x=233.5|y=175.0|size=16|color=255|text=没有永恒之泪会自动使用<元宝>代替>

			]]
		end
		
	end
	
	if huishou == 1 then
		msg=msg..[[
		<Img|x=217.5|y=37.0|width=357|height=392|scale9r=20|scale9l=20|esc=0|img=zhangheng/253.png|scale9b=20|scale9t=20|link=@kong>
		<Button|x=534.5|y=43.0|color=255|size=18|width=30|height=30|nimg=zhangheng/151.png|link=@show>
		<Text|x=318.5|y=54.0|color=161|size=18|text=请选择要分解的装备>
		<Img|x=252.5|y=82.0|img=zhangheng/175.png|esc=0>
		<Img|x=218.5|y=228.0|width=354|esc=0|img=zhangheng/230.png>
		<Img|x=372.5|y=245.0|img=zhangheng/231.png|esc=0>
		<Img|x=217.5|y=344.0|width=354|esc=0|img=zhangheng/230.png>
		]]
		msg=msg.."<Text|x=230.5|y=399.0|color=250|size=18|text=查看分解数量|link=@show,0,1,"..makeid..",1>"
		for i = 1,10 do
			msg=msg.."<Img|x=".. 232.5+(i-1)%5*68 .."|y=".. 95+math.floor((i-1)/5)*66 .."|img=zhangheng/231.png|esc=0>"
		end
		
		local list = getbaglist(actor) --获取背包道具列表
		local t = {}
		for i = 1,#list do
			local name = getitemname(actor,list[i])
			if fenjie_t[name] then
				table.insert(t,list[i])
			end
		end
		
		for i = 1,10 do
			if not t[i] then
				break
			end
			local weiyiid = getiteminfo(actor,t[i],1)
			if weiyiid == makeid then
				msg = msg .."<DBItemShow|x=".. 226.5+(i-1)%5*68 .."|y=".. 90+math.floor((i-1)/5)*66 .."|makeindex="..weiyiid.."|link=@show,0,1>"
				msg=msg.."<Img|x=".. 232.5+(i-1)%5*68 .."|y=".. 95+math.floor((i-1)/5)*66 .."|width=55|height=55|esc=0|img=zhangheng/39.png>"
				msg = msg .."<DBItemShow|x=366.5|y=240.0|makeindex="..weiyiid..">"
				
				if fenjie_t[getitemname(actor,t[i])] == 1 then
					msg = msg .."<Text|ax=0.5|ay=0.5|x=395.5|y=323.5|color=116|size=16|text=分解装备后可获得：1个永恒之泪或60个紫水晶矿>"
				else
					msg = msg .."<Text|ax=0.5|ay=0.5|x=395.5|y=323.5|color=116|size=18|text=分解装备后可获得：".. fenjie_t[getitemname(actor,t[i])] .."个永恒之泪>"
				end
			else
				msg = msg .."<DBItemShow|x=".. 226.5+(i-1)%5*68 .."|y=".. 90+math.floor((i-1)/5)*66 .."|makeindex="..weiyiid.."|link=@show,0,1,"..weiyiid..">"
				
			end
		end
		msg=msg.."<Button|x=363.5|y=359.0|size=18|nimg=zhangheng/13.png|color=10051|text=确定分解|link=@fenjie,"..makeid..">"
	end
	
	if jiageshow == 1 then
		--msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@show,0,1,"..makeid..",0>"
		msg=msg.. [[
				<Img|x=15.5|y=37.0|width=558|height=392|scale9t=20|esc=0|img=zhangheng/253.png|scale9b=20|scale9r=20|scale9l=20>
				<Button|x=15.5|y=37.0|width=558|height=392|nimg=zhangheng/253.png|pimg=zhangheng/253.png|link=@kong>
				<RText|x=44.5|y=100.0|color=255|size=18|text=列越高分解的永恒之泪越多，<高级特殊装备/FCOLOR=70>在背包的<在线回收/FCOLOR=250>页>
				<RText|x=44.5|y=125.0|color=255|size=18|text=面进行回收可获得永恒之泪>
				<RText|x=26.5|y=50.0|color=251|size=18|text=分解介绍：>
				<RText|x=27.5|y=75.0|color=255|size=18|text=⒈通过分解<S1系列以及S1系列以上/FCOLOR=70>的装备可获得<永恒之泪/FCOLOR=253>，装备系>
				<RText|x=27.5|y=150.0|color=255|size=18|text=⒉为防止各位勇士分解装备时，错把高级装备分解成永恒之泪，系>
				<RText|x=44.5|y=175.0|color=255|size=18|text=统设置只能选择单件分解.>
				<RText|x=43.0|y=210.0|size=18|color=161|text=<S1首饰：/FCOLOR=70>60%几率分解<1/FCOLOR=250>个<永恒之泪/FCOLOR=253>  40%几率分解<60/FCOLOR=250>个<紫水晶矿/FCOLOR=253>>
				<RText|x=43.0|y=235.0|color=161|size=18|text=<S1衣服：/FCOLOR=70>分解<2/FCOLOR=250>个<永恒之泪/FCOLOR=253>>
				<RText|x=299.0|y=235.0|size=18|color=161|text=<S1武器：/FCOLOR=70>分解<3/FCOLOR=250>个<永恒之泪/FCOLOR=253>>
				<RText|x=43.0|y=261.0|color=161|size=18|text=<S2首饰：/FCOLOR=70>分解<3/FCOLOR=250>个<永恒之泪/FCOLOR=253>>
				<RText|x=299.0|y=261.0|color=161|size=18|text=<S2衣服武器：/FCOLOR=70>分解<6/FCOLOR=250>个<永恒之泪/FCOLOR=253>>
				<RText|x=43.0|y=286.0|color=161|size=18|text=<S3首饰：/FCOLOR=70>分解<8/FCOLOR=250>个<永恒之泪/FCOLOR=253>>
				<RText|x=299.0|y=286.0|color=161|size=18|text=<S3衣服武器：/FCOLOR=70>分解<20/FCOLOR=250>个<永恒之泪/FCOLOR=253>>
				<RText|x=43.0|y=311.0|color=161|size=18|text=<S4首饰：/FCOLOR=70>分解<20/FCOLOR=250>个<永恒之泪/FCOLOR=253>>
				<RText|x=299.0|y=311.0|color=161|size=18|text=<S4衣服武器：/FCOLOR=70>分解<60/FCOLOR=250>个<永恒之泪/FCOLOR=253>>
			]] 
			msg=msg.."<Text|x=437.0|y=382.0|color=250|size=18|text=返回分解页面|link=@show,0,1,"..makeid..",0>"

		local zslv = getbaseinfo(actor,39) --转生等级

		if zslv >= 10 then
			msg=msg.. [[
				
				<RText|x=43.0|y=336.0|color=161|size=18|text=<S5首饰：/FCOLOR=70>分解<50/FCOLOR=250>个<永恒之泪/FCOLOR=253>>
<RText|x=43.0|y=361.0|color=161|size=18|text=<S6首饰：/FCOLOR=70>分解<100/FCOLOR=250>个<永恒之泪/FCOLOR=253>>
<RText|x=43.0|y=386.0|color=161|size=18|text=<S7首饰：/FCOLOR=70>分解<200/FCOLOR=250>个<永恒之泪/FCOLOR=253>>

			]]
		end
	end
	say(actor,msg)
end

function fenjie(actor,wyid)
	wyid = tonumber(wyid)
	if wyid == 0 then
		sendmsg9(actor,"请选择要分解的道具")
		return
	end
	local item = getitembymakeindex(actor,wyid) --物品对象
	if item == "0" then
		sendmsg9(actor,"你没有这件道具")
		return show(actor,0,1)
	end
	if not isinbag(actor,item) then
		sendmsg9(actor,"物品已经不在背包")
		return show(actor,0,1)
	end
	local sl = fenjie_t[getitemname(actor,item)]
	
	if delitem(actor,item,1) then
		if sl == 1 and math.random(1,100) < 50 then
			giveitem(actor,"紫水晶矿",60)
			sendmsg9(actor,"分解成功，获得紫水晶矿*".. 60)
			return show(actor,0,1)
		end
		
		giveitem(actor,"永恒之泪",sl)
		sendmsg9(actor,"分解成功，获得永恒之泪*"..sl)
		return show(actor,0,1)
	end
end

local jilv_t = {{500,100},{400,25},{300,20},{200,15},{100,10},{0,2},}
local buff_t = {10041,10042,10043,10044,10045,10046,10047,10048,10049,10050,10051}
function fenpei(actor)
	if gettianfudian(actor) - getint(actor,"已分配天赋点") < 1 then
		sendmsg9(actor,"你没有可分配的天赋点了")
		return
	end
	local data = gettf_data(actor)
	if getlevel(actor) < 75 then
		for i = 1,1000 do
			local suijizhi = math.random(1,10)
			if data[suijizhi] < 10 then
				data[suijizhi] = data[suijizhi] + 1
				--此处加buff
				if suijizhi <= 3 then
					if getjob(actor) + 1 == suijizhi then
						addbuff(actor,buff_t[suijizhi])
					end
				else
					addbuff(actor,buff_t[suijizhi])
				end
				break
			end
		end
	else
		local isxwzl = false --是否加玄武之力
		if data[11] < 10 then
			for i = 1,#jilv_t do
				if getint(actor,"天赋重置次数") >= jilv_t[i][1] then
					if math.random(1,100) <= jilv_t[i][2] then
						data[11] = data[11] + 1
						if data[11] == 10 then
							addbuff(actor,buff_t[11])
							addskill(actor, 3000, 3)
						end
						isxwzl = true
					end
					break
				end
			end
		end
		if not isxwzl then
			for i = 1,1000 do
				local suijizhi = math.random(1,10)
				if data[suijizhi] < 10 then
					data[suijizhi] = data[suijizhi] + 1
					--此处加buff
					if suijizhi <= 3 then
						if getjob(actor) + 1 == suijizhi then
							addbuff(actor,buff_t[suijizhi])
						end
					else
						addbuff(actor,buff_t[suijizhi])
					end
					break
				end
			end
		end
	end
	setint(actor,"已分配天赋点",getint(actor,"已分配天赋点")+1)
	setstr(actor,"天赋数据",tbl2json(data))
	sendmsg9(actor,"分配成功")
	return show(actor)
end

function chongzhi(actor)
	if gettianfudian(actor) - getint(actor,"已分配天赋点") > 0 then
		sendmsg9(actor,"天赋点分配完才能重置")
		return
	end
	local xidianshu = getint(actor,"已分配天赋点")
	if xidianshu < 1 then
		sendmsg9(actor,"你没有分配天赋点，无需重置")
		return
	end
	
	local chengli = false
	local clsl = itemcount(actor,"永恒之泪") --背包材料数量
	if clsl >= xidianshu then
		clsl = xidianshu	--需求材料数量
	end
	local xuqiuyb = (xidianshu - clsl)*600 --需求元宝
	if getingot(actor) >= xuqiuyb then
		chengli = true
	end
	
	if not chengli then
		sendmsg9(actor,"你没有永恒之泪或元宝不足")
		return
	end

	takeitem(actor,"永恒之泪",clsl) 
	if xuqiuyb > 0 then
		subingot(actor,xuqiuyb,"洗天赋")
	end
	
	setint(actor,"已分配天赋点",0)
	setstr(actor,"天赋数据","")
	if gettianfudian(actor) >= 28 then
		setint(actor,"天赋重置次数",getint(actor,"天赋重置次数")+1)
	end
	for i = 1,#buff_t do
		if hasbuff(actor,buff_t[i]) then
			delbuff(actor,buff_t[i])
		end
	end
	if getskillinfo(actor,3000,1) then
		delskill(actor, 3000)
	end
	sendmsg9(actor,"重置成功")
	post(actor,"天赋点重置消耗元宝*"..xuqiuyb.. "消耗材料*"..clsl)
	return show(actor)
end

function gettf_data(actor)
	local data = {0,0,0,0,0,0,0,0,0,0,0}
	local datastr = getstr(actor,"天赋数据")
	if datastr ~= "" then
		data = json2tbl(datastr)
	end
	return data
end