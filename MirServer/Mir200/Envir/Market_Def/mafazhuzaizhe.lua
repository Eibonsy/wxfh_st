include("Market_Def/zh.lua") --个人封装函数
function show(actor)
	--[[if getlevel(actor) > 0 then
		sendmsg9(actor,"暂不开放此功能...")
		return
	end--]]
	
	local zslv = getbaseinfo(actor,39) --转生等级
	if zslv < 6 then
		sendmsg9(actor,"勇士，你太年轻了...")
		return
	elseif zslv < 10 then
		sendmsg9(actor,"勇士，想要打探我的故事，需转生达到10转....")
		return
	end
	local msg = [[
		<Img|width=530|height=300|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
		<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
		<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|size=18|color=251|text=封魔谷主>
		<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
		<RText|ax=0|ay=0.5|x=22.0|y=70.0|size=18|color=255|text=玛法上古时期，比奇国王为抵御各大魔兽首领的入侵，决定召>
		<RText|ay=0.5|x=22.0|y=95.5|color=255|size=18|text=集大陆上名列前茅的魔法师们，打造出惊天神器，谁知魔法师>
		<RText|ay=0.5|x=22.0|y=120.5|color=255|size=18|text=与工匠研究了50年只铸造出两套超神器，佩戴<"聚魔神装"/FCOLOR=31>可受>
		<RText|ay=0.5|x=22.0|y=145.5|color=255|size=18|text=到魔法师的保护，<受到伤害可用魔法值抵挡/FCOLOR=250>，另一套神装蕴含>
		<RText|ay=0.5|x=22.0|y=170.5|color=255|size=18|text=<"涅槃之力"/FCOLOR=31>，有<复活/FCOLOR=250>神效，随着时间的流逝，两大神装已失去>
		<RText|ay=0.5|x=22.0|y=195.5|color=255|size=18|text=昔日风采，如果勇士你能寻得<"主宰凭证"/FCOLOR=70>我可以让神装重现玛>
		<RText|ay=0.5|x=22.0|y=220.5|color=255|size=18|text=法大陆.......>
		<Img|x=34.0|y=241.0|img=zhangheng/203.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=265.5|size=18|color=250|text=铸造 → 超级神装|link=@shenzhuang>

	]]
	say(actor,msg)
end

local zb_t = {
	["赤影★圣盔"]={1,15},["赤影★圣链"]={1,15},["赤影★圣镯"]={1,15},["赤影★圣戒"]={1,15},["赤影★圣带"]={1,15},["赤影★圣靴"]={1,15},
	["游龙ぬ锥心盔"]={1,50},["游龙ぬ锥心链"]={1,50},["游龙ぬ锥心镯"]={1,50},["游龙ぬ锥心戒"]={1,50},["游龙ぬ锥心带"]={1,50},["游龙ぬ锥心靴"]={1,50},
	["阿修罗ぬ神盔"]={1,100},["阿修罗ぬ神链"]={1,100},["阿修罗ぬ神镯"]={1,100},["阿修罗ぬ神戒"]={1,100},["阿修罗ぬ神带"]={1,100},["阿修罗ぬ神靴"]={1,100},

	["焚天★魔盔"]={2,15},["焚天★魔链"]={2,15},["焚天★魔镯"]={2,15},["焚天★魔戒"]={2,15},["焚天★魔带"]={2,15},["焚天★魔靴"]={2,15},
	["咆哮ぬ怒吼盔"]={2,50},["咆哮ぬ怒吼链"]={2,50},["咆哮ぬ怒吼镯"]={2,50},["咆哮ぬ怒吼戒"]={2,50},["咆哮ぬ怒吼带"]={2,50},["咆哮ぬ怒吼靴"]={2,50},
	["帝释天ぬ神盔"]={2,100},["帝释天ぬ神链"]={2,100},["帝释天ぬ神镯"]={2,100},["帝释天ぬ神戒"]={2,100},["帝释天ぬ神带"]={2,100},["帝释天ぬ神靴"]={2,100},

	["远古★道盔"]={3,15},["远古★道链"]={3,15},["远古★道镯"]={3,15},["远古★道戒"]={3,15},["远古★道带"]={3,15},["远古★道靴"]={3,15},
	["契约ぬ神罚盔"]={3,50},["契约ぬ神罚链"]={3,50},["契约ぬ神罚镯"]={3,50},["契约ぬ神罚戒"]={3,50},["契约ぬ神罚带"]={3,50},["契约ぬ神罚靴"]={3,50},
	["迦楼罗ぬ神盔"]={3,100},["迦楼罗ぬ神链"]={3,100},["迦楼罗ぬ神镯"]={3,100},["迦楼罗ぬ神戒"]={3,100},["迦楼罗ぬ神带"]={3,100},["迦楼罗ぬ神靴"]={3,100},
}

local xianshi_t = {
	"涅槃菩提盔","聚魔觉醒链","涅槃菩提镯","聚魔觉醒戒","涅槃菩提带","聚魔觉醒靴","涅槃菩提链","聚魔觉醒盔","涅槃菩提戒","聚魔觉醒镯","涅槃菩提靴","聚魔觉醒带",
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
	<Text|x=141.0|y=387.0|color=161|size=18|text=消耗：主宰凭证*5    紫水晶矿：10000个>
	<Img|x=267.0|y=204.0|img=zh/76.png|esc=0>
	<Img|x=555.0|y=308.0|img=zhangheng/187.png|flip=1|esc=0>
	]]
	--问号
	msg =msg ..'<Button|x=18.0|y=461.0|nimg=zhangheng/8.png|pimg=zhangheng/8.png|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','..weiyiid3..',0,0,1>'
	--消耗框的背景
	msg =msg ..'<Img|x=106.0|y=85.0|img=zh/74.png|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','..weiyiid3..',1>'
	msg =msg ..'<Img|x=261.0|y=85.0|img=zh/74.png|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','..weiyiid3..',2>'
	msg =msg ..'<Img|x=417.0|y=85.0|img=zh/74.png|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','..weiyiid3..',3>'
	local chenggonglv = 0
	local itemname = ""
	if weiyiid1 == 0 then
		msg =msg ..'<Img|x=121.0|y=100.0|img=zh/75.png>' --加号
	else
		itemname = getitemnamebymakeid(actor,weiyiid1)
		chenggonglv = chenggonglv + zb_t[itemname][2]
		msg =msg ..'<DBItemShow|x=103.0|y=80.0|width=70|height=70|makeindex='..weiyiid1..'|showtips=1|bgtype=0|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','..weiyiid3..',1>'
	end
	if weiyiid2 == 0 then
		msg =msg ..'<Img|x=276.0|y=100.0|img=zh/75.png>'
	else
		itemname = getitemnamebymakeid(actor,weiyiid2)
		chenggonglv = chenggonglv + zb_t[itemname][2]
		msg =msg ..'<DBItemShow|x=258.0|y=80.0|width=70|height=70|makeindex='..weiyiid2..'|showtips=1|bgtype=|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','..weiyiid3..',2>'
	end
	
	if weiyiid3 == 0 then
		msg =msg ..'<Img|x=432.0|y=100.0|img=zh/75.png>'
	else
		itemname = getitemnamebymakeid(actor,weiyiid3)
		chenggonglv = chenggonglv + zb_t[itemname][2]
		msg =msg ..'<DBItemShow|x=414.0|y=80.0|width=70|height=70|makeindex='..weiyiid3..'|showtips=1|bgtype=|link=@shenzhuang,'..weiyiid1..','..weiyiid2..','..weiyiid3..',3>'
	end
	
	msg=msg..'<Text|x=235.0|y=418.0|color=254|size=18|text=成功几率：'.. chenggonglv ..'%>'
	----下方随机装备展示
	--msg = msg..'<Img|x=68.0|y=302.0|width=450|height=74|scale9l=5|scale9b=5|scale9r=5|scale9t=5|esc=0|img=zh/36.png>'
	msg = msg..'<ListView|children={4000}|x=73.0|y=304.0|width=440|height=70|bounce=0|direction=2>'
	local ziids = ""
	for i = 4002,4002+ 50 do
		ziids = ziids .. i .. ","
	end
	
	local ziid = 4002
	local kuandu = #xianshi_t * 75 -10
	msg = msg ..'<Layout|id=4000|children={4001}|x=0|y=0|width='..kuandu..'|height=70>'
	msg = msg ..'<Layout|id=4001|children={'.. ziids ..'}|x=0|y=0|width='..kuandu..'|height=70>'
	local t = xianshi_t
	for i=1,#t do
		msg = msg..'<Img|id='.. ziid ..'|x='.. 3+(i-1)*75 ..'|y=5|img=zh/74.png|esc=0>'
		ziid = ziid + 1
		msg = msg..'<ItemShow|id='.. ziid ..'|x='.. 0+(i-1)*75 ..'|y=5|width=70|height=70|itemid='.. getidbyname(t[i]) ..'|itemcount=1|showtips=1|bgtype=0>'
		ziid = ziid + 1
	end
	msg=msg..'<Button|x=248.0|y=446.0|size=18|nimg=zhangheng/13.png|color=10051|text=确定锻造|link=@duanzao,'..weiyiid1..','..weiyiid2..','..weiyiid3 ..','..chenggonglv..'>'
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
				local wy_id = getiteminfo(actor,bagitems[i],1)
				if wy_id ~= weiyiid1 and wy_id ~= weiyiid2 and wy_id ~= weiyiid3 then
					table.insert(items,wy_id)
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
		<Img|ay=0.5|x=52.0|y=430.0|width=290|height=120|scale9r=10|scale9l=10|esc=0|img=zh/7.png|scale9b=10|scale9t=10>
<RText|x=64.0|y=385.0|width=80|color=251|size=16|text=锻造规则：>
<RText|x=64.0|y=409.0|width=344|size=16|color=255|text=<S4系列/FCOLOR=70>以上的装备才有几率铸造超级>
<RText|x=64.0|y=434.0|width=344|size=16|color=255|text=神装，锻造此神装可随意组合成功几>
<RText|x=64.0|y=459.0|width=344|size=16|color=255|text=率，不分三职业>

		]]
	end
	say(actor,msg)
end

function duanzao(actor,weiyiid1,weiyiid2,weiyiid3,chenggonglv)
	weiyiid1 = tonumber(weiyiid1)
	weiyiid2 = tonumber(weiyiid2)
	weiyiid3 = tonumber(weiyiid3)
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
	
	if itemcount(actor,"主宰凭证") < 5 then
		sendmsg9(actor,"主宰凭证不足")
		return
	end
	if itemcount(actor,"紫水晶矿") < 10000 then
		sendmsg9(actor,"紫水晶矿不足10000个")
		return
	end
	takeitem(actor,"主宰凭证",5)
	takeitem(actor,"紫水晶矿",10000)
	
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
	local t = xianshi_t
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