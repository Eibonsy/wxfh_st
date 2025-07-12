include("Market_Def/zh.lua") --个人封装函数
function show(actor)
	local msg = [[
		<Img|width=530|height=270|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
		<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
		<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|size=18|color=251|text=龙族大长老>
		<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
		<RText|ax=0|ay=0.5|x=22.0|y=70.0|size=18|color=255|text=很久以前流传着一个古老传说，这玛法大陆存在着七颗圆形>
		<RText|ay=0.5|x=22.0|y=95.5|color=255|size=18|text=的龙珠如今散落各处，只要<集齐七颗龙珠/FCOLOR=250>并念出咒文，便可>
		<RText|ay=0.5|x=22.0|y=120.0|color=255|size=18|text=召唤出许愿神龙，召唤者可获得<1000万金币/FCOLOR=70>奖励，并随机获>
		<RText|ay=0.5|x=22.0|y=145.0|color=255|size=18|text=得<"猎魔人斗笠"/FCOLOR=249>或者<"猎魔人勋章"/FCOLOR=249>......>
		<RText|ay=0.5|x=60.0|y=180.5|color=254|size=18|text=许愿神龙为本游戏超级BOSS，可爆出一切贵重物品>
		<Img|x=34.0|y=210.0|img=zhangheng/203.png|esc=0>
		<Text|ax=0.5|x=264.0|y=223.0|color=251|size=18|text=召唤 → 许愿神龙|link=@zhaohuanshenlong>
	]]
	say(actor,msg)
end

local item_t = {"一星龙珠","二星龙珠","三星龙珠","四星龙珠","五星龙珠","六星龙珠","七星龙珠"}
function zhaohuanshenlong(actor)
	local guais = getmapmon("3","许愿神龙",335,340,20)
	if #guais > 0 then
		sendmsg9(actor,"请击杀完上一只许愿神龙才能召唤")
		return
	end
	
	local hour = tonumber(os.date("%H",os.time()))
	if hour ~= 22 then
		sendmsg9(actor,"每天22点--23点才能召唤神龙")
		return
	end
	local jiqi = true
	for i = 1,7 do
		if itemcount(actor,item_t[i]) < 1 then
			jiqi = false
			break
		end
	end
	if not jiqi then
		sendmsg9(actor,"你没有集齐七龙珠")
		return
	end
	for i = 1,7 do
		takeitem(actor,item_t[i],1)
	end
	genmon("3",358,343,"许愿神龙",1,1,249)
	mianban()
	if math.random(100) < 50 then
		giveitem(actor,"猎魔人★斗笠",1)
	else
		giveitem(actor,"猎魔人★勋章",1)
	end
	addgold(actor,10000000)
	sendmsg9(actor,"召唤成功")
	return show(actor)
end

function mianban() 
	local t=getplayerlst() --所有玩家列表
	--callscriptex(0, "sendcentermsg", 251, 0, "玩家列表"..tbl2json(t) , 1 ,5 )
	local pyx = -320
	local pyy = -130
	local msg = ""
	msg = msg..'<Img|children={2,3,5,4,6}|x='..  14 + pyx ..'|y='..  40 + pyy ..'|width=160|height=100|esc=0|bg=1|move=1|scale9t=10|scale9r=10|scale9l=10|scale9b=10|img=zhangheng/281.png>'
	msg = msg..[[
	<RText|id=2|ax=0.5|x=79.0|y=7.0|rotate=0|color=255|size=18|outline=1|text=<许愿神龙已刷新/FCOLOR=250>>
	<RText|id=3|ax=0.5|x=79.0|y=30.0|rotate=0|color=255|size=18|outline=1|text=<是否前往击杀？/FCOLOR=254>>
	<COUNTDOWN|ax=0.5|id=5|x=78.0|y=60.0|time=30|count=1|size=16|outline=1|color=250|link=@close_shijieboss>
	<Button|id=4|x=8.0|y=58.0|width=50|height=30|color=255|outline=1|nimg=zhangheng/71.png|size=18|text=是|link=@jisha_shijieboss>
	<Button|id=6|x=101.0|y=58.0|width=50|height=30|rotate=0|outline=1|color=255|size=18|nimg=zhangheng/71.png|text=否|link=@close_shijieboss>
	]]
    for k,v in ipairs(t) do
		if getmap(v) ~= "tuoji" and getmap(v) ~= "waigua" then
			addbutton(v,107,98,msg)
		end
    end
end




