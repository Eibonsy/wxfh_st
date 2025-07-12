include("Market_Def/zh.lua") --个人封装函数
function show(actor)
	--[[if getlevel(actor) > 0 then
		sendmsg9(actor,"暂不开放此功能...")
		return
	end--]]
	local zslv = getbaseinfo(actor,39) --转生等级
	if zslv < 4 then
		sendmsg9(actor,"小伙子，你太年轻了....")
		return
	elseif zslv < 10 then
		sendmsg9(actor,"勇士，想要打探珍宝馆的秘密，需转生达到10转...")
		return
	end
	
	local msg = [[
		
<Img|width=530|height=340|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=玛法珍宝馆>
<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
<RText|ax=0|ay=0.5|x=22.0|y=70.0|color=255|size=18|text=在大陆上的最东端有座城池名曰：沙巴克，魔族最后的首领黄>
<RText|ay=0.5|x=22.0|y=95.5|color=255|size=18|text=泉教主指挥着兽族最强怪物火龙神，想攻占此城，眼看黄泉教>
<RText|ay=0.5|x=22.0|y=120.5|color=255|size=18|text=主即将攻破城门时，突然法神、天尊、圣战、三英雄从天而降>
<RText|ay=0.5|x=22.0|y=145.5|color=255|size=18|text=带领人类抵御着魔族大军，因怪物数量众多，英雄们召唤出了>
<RText|ay=0.5|x=22.0|y=170.5|color=255|size=18|text=<"天威、天命、天机"/FCOLOR=250>三大神装，他们穿梭于怪物之间，以最强>
<RText|ay=0.5|x=22.0|y=195.5|color=255|size=18|text=绝技阻止了这次浩劫......>
<RText|ay=0.5|x=22.0|y=230.5|color=255|size=18|text=英雄们离开时,  把这最强神装交予老夫，嘱咐道：如有勇士能>
<RText|ay=0.5|x=22.0|y=255.5|color=255|size=18|text=拿着<魔龙之血/FCOLOR=249>寻到此处，就是你要等的有缘人，勇士是你吗？>
<Img|x=34.0|y=278.0|img=zhangheng/203.png|esc=0>
<Text|ax=0.5|ay=0.5|x=264.0|y=302.5|size=18|color=250|text=铸造 → 神级套装|link=@shenzhuang>

	]]
	say(actor,msg)
end


local zb_t = {
	["玄铁战盔"]={1,10},["玄铁项链"]={1,10},["玄铁手镯"]={1,10},["玄铁戒指"]={1,10},["玄铁腰带"]={1,10},["玄铁战靴"]={1,10},
	["傲天々圣盔"]={1,30},["傲天々圣链"]={1,30},["傲天々圣镯"]={1,30},["傲天々圣戒"]={1,30},["傲天々圣带"]={1,30},["傲天々圣靴"]={1,30},
	["赤影★圣盔"]={1,90},["赤影★圣链"]={1,90},["赤影★圣镯"]={1,90},["赤影★圣戒"]={1,90},["赤影★圣带"]={1,90},["赤影★圣靴"]={1,90},
	
	["风雷魔盔"]={2,10},["风雷项链"]={2,10},["风雷手镯"]={2,10},["风雷戒指"]={2,10},["风雷腰带"]={2,10},["风雷魔靴"]={2,10},
	["幻天々魔盔"]={2,30},["幻天々魔链"]={2,30},["幻天々魔镯"]={2,30},["幻天々魔戒"]={2,30},["幻天々魔带"]={2,30},["幻天々魔靴"]={2,30},
	["焚天★魔盔"]={2,90},["焚天★魔链"]={2,90},["焚天★魔镯"]={2,90},["焚天★魔戒"]={2,90},["焚天★魔带"]={2,90},["焚天★魔靴"]={2,90},
	
	["蓝灵道盔"]={3,10},["蓝灵项链"]={3,10},["蓝灵手镯"]={3,10},["蓝灵戒指"]={3,10},["蓝灵腰带"]={3,10},["蓝灵道靴"]={3,10},
	["玄天々道盔"]={3,30},["玄天々道链"]={3,30},["玄天々道镯"]={3,30},["玄天々道戒"]={3,30},["玄天々道带"]={3,30},["玄天々道靴"]={3,30},
	["远古★道盔"]={3,90},["远古★道链"]={3,90},["远古★道镯"]={3,90},["远古★道戒"]={3,90},["远古★道带"]={3,90},["远古★道靴"]={3,90},
	
}

local xianshi_t = {
	{"天威ぁ龙源盔","天威ぁ龙源链","天威ぁ龙源镯","天威ぁ龙源戒","天威ぁ龙源带","天威ぁ龙源靴",},
	{"天命ぁ赤霄盔","天命ぁ赤霄链","天命ぁ赤霄镯","天命ぁ赤霄戒","天命ぁ赤霄带","天命ぁ赤霄靴",},
	{"天机ぁ无尘盔","天机ぁ无尘链","天机ぁ无尘镯","天机ぁ无尘戒","天机ぁ无尘带","天机ぁ无尘靴",},
}

function shenzhuang(actor,weiyiid1,weiyiid2,weiyiid3,xuanzhekuang,xuanzhong,xianshi)
	weiyiid1 = tonumber(weiyiid1) or 0
	weiyiid2 = tonumber(weiyiid2) or 0
	weiyiid3 = tonumber(weiyiid3) or 0
	xuanzhekuang = tonumber(xuanzhekuang) or 0
	xuanzhong = tonumber(xuanzhong) or 0
	xianshi = tonumber(xianshi) or 0
	local msg = [[
	<Img|x=0|width=582|height=520|bg=1|scale9r=50|scale9t=50|scale9b=50|move=1|esc=1|reset=0|scale9l=50|img=zhangheng/1.png|show=4>
	<Button|x=577.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
	<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
	<Img|x=16.5|y=39.5|img=zhangheng/186.png|esc=0>
	<Img|x=131.0|y=132.0|img=zhangheng/78.png|esc=0>
	<Img|x=152.0|y=49.0|img=zhangheng/74.png|esc=0>
	<Img|x=261.0|y=206.0|img=zh/74.png|esc=0>
	<Text|x=201.0|y=278.0|color=161|size=18|text=随机生成以下一种装备>
	<Text|x=151.0|y=387.0|color=161|size=18|text=消耗：魔龙之血*3    紫水晶矿*6666>
	<Img|x=267.0|y=204.0|img=zh/76.png|esc=0>
	]]
	--问号
	msg =msg ..'<Button|x=18.0|y=461.0|nimg=zhangheng/8.png|pimg=zhangheng/8.png|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','..weiyiid3..',0,0,1>'
	--消耗框的背景
	msg =msg ..'<Img|x=106.0|y=85.0|img=zh/74.png|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','..weiyiid3..',1>'
	msg =msg ..'<Img|x=261.0|y=85.0|img=zh/74.png|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','..weiyiid3..',2>'
	msg =msg ..'<Img|x=417.0|y=85.0|img=zh/74.png|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','..weiyiid3..',3>'
	local chenggonglv = 0
	local dangci = 0 --装备框里的装备档次
	local itemname = ""
	if weiyiid1 == 0 then
		msg =msg ..'<Img|x=121.0|y=100.0|img=zh/75.png>' --加号
	else
		dangci = getdangci(actor,weiyiid1)
		itemname = getitemnamebymakeid(actor,weiyiid1)
		chenggonglv = chenggonglv + zb_t[itemname][2]
		msg =msg ..'<DBItemShow|x=103.0|y=80.0|width=70|height=70|makeindex='..weiyiid1..'|showtips=1|bgtype=0|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','..weiyiid3..',1>'
	end
	if weiyiid2 == 0 then
		msg =msg ..'<Img|x=276.0|y=100.0|img=zh/75.png>'
	else
		dangci = getdangci(actor,weiyiid2)
		itemname = getitemnamebymakeid(actor,weiyiid2)
		chenggonglv = chenggonglv + zb_t[itemname][2]
		msg =msg ..'<DBItemShow|x=258.0|y=80.0|width=70|height=70|makeindex='..weiyiid2..'|showtips=1|bgtype=|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','..weiyiid3..',2>'
	end
	
	if weiyiid3 == 0 then
		msg =msg ..'<Img|x=432.0|y=100.0|img=zh/75.png>'
	else
		dangci = getdangci(actor,weiyiid3)
		itemname = getitemnamebymakeid(actor,weiyiid3)
		chenggonglv = chenggonglv + zb_t[itemname][2]
		msg =msg ..'<DBItemShow|x=414.0|y=80.0|width=70|height=70|makeindex='..weiyiid3..'|showtips=1|bgtype=|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','..weiyiid3..',3>'
	end
	
	msg=msg..'<Text|x=235.0|y=418.0|color=254|size=18|text=成功几率：'.. chenggonglv ..'%>'
	----下方随机装备展示
	for i =1,6 do
		msg = msg..'<Img|x='.. 75+(i-1)*75 ..'|y=309.0|img=zh/74.png|esc=0>'
	end
	if dangci ~= 0 then
		local t = xianshi_t[dangci]
		for i=1,#t do
			msg = msg..'<ItemShow|x='.. 72+(i-1)*75 ..'|y=307.0|width=70|height=70|itemid='.. getidbyname(t[i]) ..'|itemcount=1|showtips=1|bgtype=0>'
		end
	end
	msg=msg..'<Button|x=248.0|y=446.0|size=18|nimg=zhangheng/13.png|color=10051|text=确定锻造|link=@duanzao,'..weiyiid1..','..weiyiid2..','..weiyiid3 ..','.. dangci ..','..chenggonglv..'>'
	----装备选择框
	if xuanzhekuang ~= 0 then
		msg=msg..'<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','..weiyiid3..',0>'
		msg = msg..[[
		<Img|x=75.0|y=133.0|width=434|height=170|esc=0|img=zhangheng/7.png>
		<Img|x=156.0|y=253.0|img=zhangheng/175.png|esc=0>
		
		]]
		local bagitems = getbaglist(actor) --背包物品
		local items = {} --能选择的装备唯一id表
		for i=1,#bagitems do
			if zb_t[getitemname(actor,bagitems[i])] then
				if (dangci == 0 or zb_t[getitemname(actor,bagitems[i])][1] == dangci) then
					local wy_id = getiteminfo(actor,bagitems[i],1)
					if wy_id ~= weiyiid1 and wy_id ~= weiyiid2 and wy_id ~= weiyiid3 then
						table.insert(items,wy_id)
					end
				end
			end
		end
		
		local ziids = ""
		for i = 2002,2002+ #items + 3 do
			ziids = ziids .. i .. ","
		end
		
		local ziid = 2002
		local gaodu = (math.floor((#items-1)/7) + 1) * 55 + 3
		msg = msg ..'<ListView|id=1999|children={2000}|x=82.0|y=139.0|width=420|height=110|margin=0|bounce=0|direction=1>'
		msg = msg ..'<Layout|id=2000|children={2001}|x=0|y=0|width=421|height='..gaodu..'>'
		msg = msg ..'<Layout|id=2001|children={'.. ziids ..'}|x=0|y=0|width=421|height='..gaodu..'>'
		for i = 1,#items do
			--sendmsg6(actor,items[i] .. "  "..hongxzid)
			msg = msg ..'<Img|id='.. ziid ..'|children={item'.. i ..',kuang'..i..'}|x='.. 5+((i-1)%7)*60 ..'|y='.. 3+ math.floor((i-1)/7) * 55  ..'|width=50|height=50|img=zh/2.png>'
			ziid = ziid + 1
			msg = msg ..'<DBItemShow|id=item'.. i ..'|x=-9|y=-10.0|makeindex='.. items[i] ..'|itemcount=1|showtips=1|bgtype=0|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','..weiyiid3..','..xuanzhekuang..','.. items[i] ..'>'
			if xuanzhong == items[i] then
				msg = msg ..'<Img|id=kuang'.. i ..'|x=0.0|y=0.0|width=50|height=50|esc=0|img=zhangheng/39.png>'
			end
		end
		
		if xuanzhekuang == 1 then
			local xuanze = weiyiid1
			if xuanzhong ~= 0 then
				xuanze = xuanzhong
			end
			msg=msg..'<Button|x=339.0|y=259.0|size=18|nimg=zhangheng/13.png|color=10051|text=确定选择|link=@shenzhuang,'..xuanze..','..weiyiid2..','..weiyiid3..','.. 0  ..'>'
			msg=msg..'<Button|x=168.0|y=259.0|nimg=zhangheng/13.png|color=10051|size=18|text=清空选择|link=@shenzhuang,'.. 0 ..','..weiyiid2..','..weiyiid3..','.. 0  ..'>'
		elseif xuanzhekuang == 2 then
			local xuanze = weiyiid2
			if xuanzhong ~= 0 then
				xuanze = xuanzhong
			end
			msg=msg..'<Button|x=339.0|y=259.0|size=18|nimg=zhangheng/13.png|color=10051|text=确定选择|link=@shenzhuang,'..weiyiid1..','..xuanze..','..weiyiid3..','.. 0  ..'>'
			msg=msg..'<Button|x=168.0|y=259.0|nimg=zhangheng/13.png|color=10051|size=18|text=清空选择|link=@shenzhuang,'..weiyiid1..','.. 0 ..','..weiyiid3..','.. 0  ..'>'
		elseif xuanzhekuang == 3 then
			local xuanze = weiyiid3
			if xuanzhong ~= 0 then
				xuanze = xuanzhong
			end
			msg=msg..'<Button|x=339.0|y=259.0|size=18|nimg=zhangheng/13.png|color=10051|text=确定选择|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','..xuanze..','.. 0  ..'>'
			msg=msg..'<Button|x=168.0|y=259.0|nimg=zhangheng/13.png|color=10051|size=18|text=清空选择|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','.. 0 ..','.. 0  ..'>'
		end
	end
	if xianshi == 1 then
		msg=msg..'<Layout|x=-1000|y=-1000|width=3000|height=3000|color=255>|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','..weiyiid3..'>'
		msg=msg..[[
		<Img|ay=0.5|x=52.0|y=381.0|width=360|height=220|scale9r=10|scale9l=10|scale9b=10|img=zh/7.png|esc=0|scale9t=10>
		<RText|x=64.0|y=280.0|width=80|color=251|size=16|text=锻造规则：>
		<RText|x=80.0|y=305.0|width=344|color=255|size=16|text=<战士S3 — S5系列/FCOLOR=70>的装备可锻造出<天威神装/FCOLOR=250>>
		<RText|x=80.0|y=330.0|width=344|color=255|size=16|text=<法师S3 — S5系列/FCOLOR=70>的装备可锻造出<天命神装/FCOLOR=250>>
		<RText|x=80.0|y=355.0|width=344|color=255|size=16|text=<道士S3 — S5系列/FCOLOR=70>的装备可锻造出<天机神装/FCOLOR=250>>
		<RText|x=64.0|y=390.0|width=344|color=251|size=16|text=锻造几率：>
		<RText|x=80.0|y=415.0|width=344|size=16|color=255|text=<S3系列/FCOLOR=242>的装备锻造神装的几率为<10%/FCOLOR=250>, <S4系/FCOLOR=242><列/FCOLOR=242>>
		<RText|x=80.0|y=440.0|width=344|size=16|color=255|text=的几率为<30%/FCOLOR=250>, <S5系列/FCOLOR=242>的几率为<90%/FCOLOR=250>, 同职业>
		<RText|x=80.0|y=465.0|width=344|size=16|color=255|text=系列装备可随意组合,几率越高成功率越大>
		]]
	end
	say(actor,msg)
end

function duanzao(actor,weiyiid1,weiyiid2,weiyiid3,dangci,chenggonglv)
	weiyiid1 = tonumber(weiyiid1)
	weiyiid2 = tonumber(weiyiid2)
	weiyiid3 = tonumber(weiyiid3)
	dangci = tonumber(dangci)
	chenggonglv = tonumber(chenggonglv)
	if weiyiid1 == 0 and weiyiid2 == 0 and weiyiid3 == 0 then
		sendmsg9(actor,"请放入至少一件装备")
		return
	end
	if weiyiid1 ~= 0 then
		local item = getitembymakeindex(actor,weiyiid1)
		if not isinbag(actor,item) then
			sendmsg9(actor,"你选择的装备已不在背包")
			return
		end
	end
	if weiyiid2 ~= 0 then
		local item = getitembymakeindex(actor,weiyiid2)
		if not isinbag(actor,item) then
			sendmsg9(actor,"你选择的装备已不在背包")
			return
		end
	end
	if weiyiid3 ~= 0 then
		local item = getitembymakeindex(actor,weiyiid3)
		if not isinbag(actor,item) then
			sendmsg9(actor,"你选择的装备已不在背包")
			return
		end
	end
	
	if itemcount(actor,"魔龙之血") < 3 then
		sendmsg9(actor,"魔龙之血不足3个")
		return
	end
	if itemcount(actor,"紫水晶矿") < 6666 then
		sendmsg9(actor,"紫水晶矿不足6666个")
		return
	end

	takeitem(actor,"魔龙之血",3)
	takeitem(actor,"紫水晶矿",6666)

	if weiyiid1 ~= 0 then
		delitembymakeindex(actor,""..weiyiid1,1)
	end
	if weiyiid2 ~= 0 then
		delitembymakeindex(actor,""..weiyiid2,1)
	end
	if weiyiid3 ~= 0 then
		delitembymakeindex(actor,""..weiyiid3,1)
	end
	
	if math.random(1,100) > chenggonglv then
		sendmsg9(actor,"很遗憾，锻造失败！")
		return shenzhuang(actor)
	end
	local t = xianshi_t[dangci]
	local givename = t[math.random(1,#t)]
	local giveitem = giveitem(actor,givename)
	setitemaddvalue(actor,giveitem,2,2,249)
	callscriptex(actor, "CallLua", "QFunction-0", "@pickupitemex,"..giveitem)
	sendmsg9(actor,"恭喜你，锻造成功！获得"..givename)
	sendmsg6(actor,"恭喜你，锻造成功！获得"..givename)
	return shenzhuang(actor)
end

function getdangci(actor,weiyiid)
	local dc = 0
	local item = getitembymakeindex(actor,weiyiid)
	local name = getitemname(actor,item)
	local dc = zb_t[name][1]
	return dc
end