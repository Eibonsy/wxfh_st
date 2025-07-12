include("Market_Def/zh.lua") --个人封装函数
function show1(actor)
	local msg = [[
		<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
		<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
		<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=逍遥子>
		<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
		<RText|ax=0|ay=0.5|x=22.0|y=82.5|color=255|size=18|text=仰望浩翰星河，俯瞰玛法大陆，每个人都在寻找，在角逐一件>
		<RText|ay=0.5|x=22.0|y=107.5|color=255|size=18|text=绝世珍品，为此玛法的勇士们一直在四处寻找各种稀珍材料不>
		<RText|ay=0.5|x=22.0|y=132.5|color=255|size=18|text=惜以身犯险，心有野望，付诸于行，如你能有幸获得名字为<红>>
		<RText|ay=0.5|x=22.0|y=157.5|color=255|size=18|text=<色>的孤品装备，老夫就可以为你探索其中的奥秘>
		<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
		<Text|ay=0.5|x=227.0|y=214.5|color=250|size=18|text=红装探索|link=@show>

	]]
	say(actor,msg)
end

function show(actor,wyid,xianshi)
	local isyou = false
	local baglist = getbaglist(actor)
	for i = 1,#baglist do
		if getitemaddvalue(actor,baglist[i],2,2) == 249 then
			isyou = true
			break
		end
	end
	
	local keshengxing = {{0,"衣服"},{4,"头盔"},{3,"项链"},{5,"手镯"},{6,"手镯"},{7,"戒指"},{8,"戒指"},{10,"腰带"},{11,"靴子"}} --可探索的装备
	local shengxing_t = {}
	for i=1,#keshengxing do
		local item = linkbodyitem(actor,keshengxing[i][1])
		if item ~= "0" and getitemaddvalue(actor,item,2,2) == 249 then
		  table.insert(shengxing_t,{item,keshengxing[i][2]})  ----{item,"头盔"}
		end
	end
	if #shengxing_t > 0 then
		isyou = true
	end
	if not isyou then
		sendmsg9(actor,"请先获取红色装备，在来找老夫探索")
		return
	end
	
	xianshi = tonumber(xianshi) or 0
	wyid = tonumber(wyid) or 0
	local msg = [[
		<Img|x=0|width=643|height=457|reset=0|bg=1|img=zhangheng/1.png|move=1|esc=1|show=4>
<Button|x=639.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
<Img|x=195.5|y=38.5|width=428|height=393|esc=0|img=zhangheng/41.png>
<Img|x=18.5|y=40.5|img=zhangheng/86.png|esc=0>
<Img|x=17.5|y=79.5|height=352|img=zhangheng/42.png|esc=0>
<Img|x=376.5|y=85.5|width=70|height=70|scale9t=30|scale9b=30|img=zhangheng/43.png|scale9r=30|scale9l=30|esc=0>
<Img|x=193.5|y=37.5|img=zhangheng/128.png|esc=0>
<Img|x=261.5|y=45.5|width=300|img=zhangheng/71.png|esc=0>
<RText|x=296.5|y=52.5|color=254|size=18|text=需要将探索的装备穿戴在身上>

	]]
	
	msg=msg..'<Button|x=588.5|y=42.5|nimg=zhangheng/8.png|pimg=zhangheng/8.png|link=@show,'..wyid..',1>'
	msg=msg..'<ListView|children={2000}|x=17.5|y=79.5|width=176|height=352>'
	

	local ziids = ""
	for i = 2002,2200 do
		ziids = ziids .. i .. ","
	end
	
	local ziid = 2002
	local ysxx = -2
	local ysyy = -6
	local gaodu = (math.floor((#shengxing_t-1)/1) + 1) * 66 + 3
	msg = msg ..'<Layout|id=2000|children={2001}|height='.. gaodu ..'>' --设置底框宽 高
	msg = msg ..'<Layout|id=2001|children={'.. ziids ..'}|height='.. gaodu ..'>' --设置底框宽 高

	for i = 1,#shengxing_t do
		local item = shengxing_t[i][1]
		local makeid = getiteminfo(actor,shengxing_t[i][1],1) --唯一id
		msg = msg ..'<Img|id='.. ziid ..'|x=1.0|y='.. 3 + (i-1)*66 ..'|img=zhangheng/44.png|esc=0|link=@show,'.. makeid ..'>'
		ziid = ziid + 1
		msg = msg ..'<Img|id='.. ziid ..'|x=1.0|y='.. 3 + (i-1)*66 ..'|img=zhangheng/40.png|esc=0>'
		ziid = ziid + 1
		msg = msg ..'<DBItemShow|id='.. ziid ..'|x=0.0|y='.. 1 + (i-1)*66 ..'|makeindex='..makeid..'|showtips=1|showstar=1>'
		ziid = ziid + 1
		msg = msg ..'<Text|ay=0.5|id='.. ziid ..'|x=65.0|y='.. 24 + (i-1)*66 ..'|color=255|size=16|text='.. getitemname(actor,shengxing_t[i][1],1) ..'>'
		ziid = ziid + 1
		msg = msg ..'<Text|ay=0.5|id='.. ziid ..'|x=65.0|y='.. 46 + (i-1)*66 ..'|color=7|size=16|text='..shengxing_t[i][2]..'>'
		ziid = ziid + 1
		if wyid == makeid then
			msg = msg ..'<Img|id='.. ziid ..'|x=0.0|y='.. 1 + (i-1)*66 ..'|img=zhangheng/45.png|esc=0>'
			ziid = ziid + 1
			msg = msg ..'<DBItemShow|x=380.0|y=88.0|makeindex='..makeid..'|showtips=1|bgtype=0|showstar=1>'	--右边展示物品
			msg = msg ..'<Text|ax=0.5|ay=0.5|x=414.0|y=181.0|color=254|size=18|text=成功率：100%>'
			msg = msg ..'<Img|x=327.5|y=199.5|height=130|scale9r=0|scale9t=40|esc=0|img=zhangheng/6.png|scale9b=0|scale9l=0>'
			msg = msg ..'<Text|ay=0.5|x=376.5|y=215.0|color=250|size=18|text=探索属性>'
			
			local text ={[0]="防御上限：",[1]="魔防上限：",[2]="攻击上限：", [3]="魔法上限：", [4]="道术上限：", }
			local xh = 0
			for k,v in pairs(text) do
				if getitemaddvalue(actor,item,1,k) > 0 then
					msg = msg ..'<Text|ay=0.5|x=358.0|y='.. 265+xh*30 ..'|color=104|size=18|text='.. v ..'+'..getitemaddvalue(actor,item,1,k)..'>'
					xh = xh + 1
				end
			end
		end
	end
	
	if wyid == 0 then
		msg = msg ..'<Text|ax=0.5|ay=0.5|x=414.0|y=181.0|color=254|size=18|text=成功率：100%>'
		msg = msg ..'<Img|x=327.5|y=199.5|height=130|scale9r=0|scale9t=40|esc=0|img=zhangheng/6.png|scale9b=0|scale9l=0>'
		msg = msg ..'<Text|ay=0.5|x=376.5|y=215.0|color=250|size=18|text=探索属性>'
	end
	msg = msg ..'<Text|x=262.0|y=351.5|color=255|size=18|text=消耗：>'
	msg = msg ..'<ItemShow|x=303.0|y=327.0|width=70|height=70|itemid='.. getidbyname("神秘水晶") ..'|itemcount=1|showtips=1|bgtype=0|scale=0.8>'
	msg = msg ..'<RText|x=353.0|y=350.5|color=250|size=18|text=<'.. itemcount(actor,"神秘水晶") ..'/FCOLOR=249>/1>'
	msg = msg ..'<ItemShow|x=443.0|y=327.0|width=70|height=70|itemid='.. getidbyname("金条") ..'|itemcount=1|showtips=1|bgtype=0|scale=0.8>'
	msg = msg ..'<RText|x=493.0|y=350.5|color=250|size=18|text=<'.. itemcount(actor,"金条") ..'/FCOLOR=249>/2>'
	
	msg = msg ..'<Button|x=368.0|y=385.0|color=10051|size=18|nimg=zhangheng/13.png|text=探　索|link=@kaifeng,'.. wyid ..'>'
	
	if xianshi == 1 then
		msg = msg..	'<Layout|x=-999.0|y=-996.5|width=3000|height=3000|color=255>|link=@show,'..wyid..'>'
		msg = msg..[[
		<Img|ay=0.5|x=215.0|y=163.0|width=370|height=240|scale9t=10|scale9b=10|img=zh/7.png|scale9r=10|esc=0|scale9l=10>
		<RText|x=226.0|y=56.0|width=344|color=251|size=16|text=⒈探索属性：>
		<RText|x=242.0|y=76.0|width=344|color=255|size=16|text=<红色装备/FCOLOR=249>才可以探索每次随机获得<1-4点/FCOLOR=250>>
		<RText|x=226.0|y=141.0|width=344|color=251|size=16|text=⒉属性激活：>
		<RText|x=242.0|y=96.0|width=344|color=255|size=16|text=攻击，魔法，道术，防御，魔御职业不同>
		<RText|x=226.0|y=206.0|width=344|color=251|size=16|text=⒊温馨提示：>
		<RText|x=242.0|y=226.0|width=344|color=255|size=16|text=全身装备点数达到系统要求即可激活属性>
		<RText|x=242.0|y=116.0|width=344|color=255|size=16|text=探索的属性不同>
		<RText|x=243.0|y=161.0|color=255|size=16|text=装备点数达到<27点/FCOLOR=250>激活全技能伤害减免<5%/FCOLOR=254>，>
		<RText|x=243.0|y=181.0|color=255|size=16|text=<36点/FCOLOR=250>激活技能伤害增加<5%/FCOLOR=254>>
		<RText|x=243.0|y=246.0|color=255|size=16|text=不分<"攻击，魔法，道术，防御，魔御"/FCOLOR=253>>
		]]
		
	end
	
	say(actor,msg)
	
end

local xilian_t = {
	--战神
	----------职业判断 几率档次
	["奔雷战甲(男)"]={0,1},["奔雷战甲(女)"]={0,1},["战神头盔"]={0,1},["战神项链"]={4,1},["战神手镯"]={0,1},["战神戒指"]={0,1},["战神腰带"]={0,1},["战神圣靴"]={0,1},
	["怒焰魔衣(男)"]={1,1},["怒焰魔衣(女)"]={1,1},["圣魔头盔"]={1,1},["圣魔项链"]={4,1},["圣魔手镯"]={1,1},["圣魔戒指"]={1,1},["圣魔腰带"]={1,1},["圣魔法靴"]={1,1},
	["极光道袍(男)"]={2,1},["极光道袍(女)"]={2,1},["真魂头盔"]={2,1},["真魂项链"]={4,1},["真魂手镯"]={2,1},["真魂戒指"]={2,1},["真魂腰带"]={2,1},["真魂道靴"]={2,1},
	--狂战
	["真龙战甲"]={0,2},["真龙战衣"]={0,2},["狂战头盔"]={0,2},["狂战项链"]={4,2},["狂战手镯"]={0,2},["狂战戒指"]={0,2},["狂战腰带"]={0,2},["狂战圣靴"]={0,2},
	["狂魔披风"]={1,2},["狂魔雨衣"]={1,2},["混世头盔"]={1,2},["混世项链"]={4,2},["混世手镯"]={1,2},["混世戒指"]={1,2},["混世腰带"]={1,2},["混世法靴"]={1,2},
	["皓尊道袍"]={2,2},["皓尊长袍"]={2,2},["太极头盔"]={2,2},["太极项链"]={4,2},["太极手镯"]={2,2},["太极戒指"]={2,2},["太极腰带"]={2,2},["太极道靴"]={2,2},
	--玄铁
	["圣龙战甲"]={0,3},["圣龙战衣"]={0,3},["玄铁战盔"]={0,3},["玄铁项链"]={4,3},["玄铁手镯"]={0,3},["玄铁戒指"]={0,3},["玄铁腰带"]={0,3},["玄铁战靴"]={0,3},
	["魔龙披风"]={1,3},["魔龙羽衣"]={1,3},["风雷魔盔"]={1,3},["风雷项链"]={4,3},["风雷手镯"]={1,3},["风雷戒指"]={1,3},["风雷腰带"]={1,3},["风雷魔靴"]={1,3},
	["御龙道袍"]={2,3},["御龙道衣"]={2,3},["蓝灵道盔"]={2,3},["蓝灵项链"]={4,3},["蓝灵手镯"]={2,3},["蓝灵戒指"]={2,3},["蓝灵腰带"]={2,3},["蓝灵道靴"]={2,3},
	--傲天
	["狂野战甲"]={0,4},["狂野战衣"]={0,4},["傲天々圣盔"]={0,4},["傲天々圣链"]={4,4},["傲天々圣镯"]={0,4},["傲天々圣戒"]={0,4},["傲天々圣带"]={0,4},["傲天々圣靴"]={0,4},
	["火凤之铠"]={1,4},["火凰之铠"]={1,4},["幻天々魔盔"]={1,4},["幻天々魔链"]={4,4},["幻天々魔镯"]={1,4},["幻天々魔戒"]={1,4},["幻天々魔带"]={1,4},["幻天々魔靴"]={1,4},
	["天使之羽"]={2,4},["天使之翼"]={2,4},["玄天々道盔"]={2,4},["玄天々道链"]={4,4},["玄天々道镯"]={2,4},["玄天々道戒"]={2,4},["玄天々道带"]={2,4},["玄天々道靴"]={2,4},
	--赤影
	["鬼浮屠(男)"]={0,5},["鬼浮屠(女)"]={0,5},["赤影★圣盔"]={0,5},["赤影★圣链"]={4,5},["赤影★圣镯"]={0,5},["赤影★圣戒"]={0,5},["赤影★圣带"]={0,5},["赤影★圣靴"]={0,5},
	["冥火(男)"]={1,5},["冥火(女)"]={1,5},["焚天★魔盔"]={1,5},["焚天★魔链"]={4,5},["焚天★魔镯"]={1,5},["焚天★魔戒"]={1,5},["焚天★魔带"]={1,5},["焚天★魔靴"]={1,5},
	["天罚(男)"]={2,5},["天罚(女)"]={2,5},["远古★道盔"]={2,5},["远古★道链"]={4,5},["远古★道镯"]={2,5},["远古★道戒"]={2,5},["远古★道带"]={2,5},["远古★道靴"]={2,5},
	--游龙
	["游龙ぬ锥心甲"]={0,6},["游龙ぬ锥心袍"]={0,6},["游龙ぬ锥心盔"]={0,6},["游龙ぬ锥心链"]={4,6},["游龙ぬ锥心镯"]={0,6},["游龙ぬ锥心戒"]={0,6},["游龙ぬ锥心带"]={0,6},["游龙ぬ锥心靴"]={0,6},
	["咆哮ぬ怒吼甲"]={1,6},["咆哮ぬ怒吼袍"]={1,6},["咆哮ぬ怒吼盔"]={1,6},["咆哮ぬ怒吼链"]={4,6},["咆哮ぬ怒吼镯"]={1,6},["咆哮ぬ怒吼戒"]={1,6},["咆哮ぬ怒吼带"]={1,6},["咆哮ぬ怒吼靴"]={1,6},
	["契约ぬ神罚甲"]={2,6},["契约ぬ神罚袍"]={2,6},["契约ぬ神罚盔"]={2,6},["契约ぬ神罚链"]={4,6},["契约ぬ神罚镯"]={2,6},["契约ぬ神罚戒"]={2,6},["契约ぬ神罚带"]={2,6},["契约ぬ神罚靴"]={2,6},
	--阿修罗
	["阿修罗ぬ神甲"]={0,7},["阿修罗ぬ神袍"]={0,7},["阿修罗ぬ神盔"]={0,7},["阿修罗ぬ神链"]={4,7},["阿修罗ぬ神镯"]={0,7},["阿修罗ぬ神戒"]={0,7},["阿修罗ぬ神带"]={0,7},["阿修罗ぬ神靴"]={0,7},
	["帝释天ぬ神甲"]={1,7},["帝释天ぬ神袍"]={1,7},["帝释天ぬ神盔"]={1,7},["帝释天ぬ神链"]={4,7},["帝释天ぬ神镯"]={1,7},["帝释天ぬ神戒"]={1,7},["帝释天ぬ神带"]={1,7},["帝释天ぬ神靴"]={1,7},
	["迦楼罗ぬ神甲"]={2,7},["迦楼罗ぬ神袍"]={2,7},["迦楼罗ぬ神盔"]={2,7},["迦楼罗ぬ神链"]={4,7},["迦楼罗ぬ神镯"]={2,7},["迦楼罗ぬ神戒"]={2,7},["迦楼罗ぬ神带"]={2,7},["迦楼罗ぬ神靴"]={2,7},
	--特殊
	["虹魔戒指"]={4,8,1},["虹魔手镯"]={4,8,1},["虹魔项链"]={4,8,1},["吸血戒指"]={4,8,1},["吸血手镯"]={4,8,1},["吸血项链"]={4,8,1},["怒血戒指"]={4,8,1},["怒血手镯"]={4,8,1},
	["怒血项链"]={4,8,1},	["重击头盔"]={4,8,1},["重击靴子"]={4,8,1},["重击腰带"]={4,8,1},["坚固的阎罗手套"]={4,8,1},["1.1倍防御盔"]={4,8,1},["1.2倍防御盔"]={4,8,1},["破甲指环"]={4,8,1},
	["打野盔"]={4,8,1},["暴君头盔"]={4,8},	["暴君腰带"]={4,8,1},["暴君靴子"]={4,8,1},["祝福项链(封印)"]={4,8,1},["上帝之吻"]={4,8,1},["后羿之光"]={4,8,1},["死神戒指"]={4,8,1},
	["龙渊戒指"]={4,8,1},["狂风项链"]={4,8,1},["狂风戒指"]={4,8,1},["疾风项链(封印)"]={4,8,1},["疾风戒指(封印)"]={4,8,1},["白色虎齿项链"]={4,8,1},["辟邪手镯"]={4,8,1},["躲避手链"]={4,8,1},
	["夏普尔手镯"]={4,8,1},["幽灵戒指"]={4,8,1},	["恶魔之靴(封印)"]={4,8,1},	["恶魔之带(封印)"]={4,8,1},["神秘头盔"]={4,8,1},["神秘腰带"]={4,8,1},["神秘戒指"]={4,8,1},
	["炼狱手镯"]={4,8,1},["记忆手镯"]={4,8,1},["恶魔手镯"]={4,8,1},["黑铁手镯"]={4,8,1},["降妖除魔戒"]={4,8,1},
	["天威ぁ龙源戒"]={4,8,1},["天威ぁ龙源镯"]={4,8,1},["天威ぁ龙源靴"]={4,8,1},	["天威ぁ龙源带"]={4,8,1},["天威ぁ龙源盔"]={4,8,1},["天威ぁ龙源链"]={4,8,1},
	["天命ぁ赤霄戒"]={4,8,1},["天命ぁ赤霄镯"]={4,8,1},["天命ぁ赤霄靴"]={4,8,1},	["天命ぁ赤霄带"]={4,8,1},["天命ぁ赤霄盔"]={4,8,1},["天命ぁ赤霄链"]={4,8,1},
	["天机ぁ无尘戒"]={4,8,1},["天机ぁ无尘镯"]={4,8,1},["天机ぁ无尘靴"]={4,8,1},["天机ぁ无尘带"]={4,8,1},["天机ぁ无尘盔"]={4,8,1},["天机ぁ无尘链"]={4,8,1},
	["涅槃菩提戒"]={4,8,1},["涅槃菩提镯"]={4,8,1},["涅槃菩提靴"]={4,8,1},["涅槃菩提带"]={4,8,1},["涅槃菩提盔"]={4,8,1},["涅槃菩提链"]={4,8,1},
	["聚魔觉醒戒"]={4,8,1},["聚魔觉醒镯"]={4,8,1},["聚魔觉醒靴"]={4,8,1},["聚魔觉醒带"]={4,8,1},["聚魔觉醒盔"]={4,8,1},["聚魔觉醒链"]={4,8,1},

}

local job_pd = {
	[0] = {0,1,2},
	[1] = {0,1,3},
	[2] = {0,1,4},
	[3] = {0,1,2,3,4},
	[4] = {2,3,4},
}

local dianshujl = {
	{90,10},
	{80,20},
	{70,30},
	{60,40},
	{50,50},
	{50,50},
	{50,50},
	{70,30},
}

function kaifeng(actor,wyid)
	wyid = tonumber(wyid)
	if wyid == 0 then
		sendmsg9(actor,"请选择要探索的装备")
		return
	end
	local item = getitembymakeindex(actor,wyid) --物品对象
	if item == "0" then
		sendmsg9(actor,"你没有这件装备")
		return
	end
	--sendmsg6(actor,"物品对象"..tostring(item))
	if not isinrole(actor,wyid) then
		sendmsg9(actor,"物品已经不在身上")
		return
	end
	
	local name = getitemname(actor,item) --物品名称
	if xilian_t[name] == nil then
		sendmsg9(actor,"不可探索")
		return
	end
	
	for i = 0,4 do
		if getitemaddvalue(actor,item,1,i) > 0 then
			sendmsg9(actor,"此装备已经探索过了")
			return
		end
	end
	
	if getitemaddvalue(actor,item,2,2) ~= 249 then
		sendmsg9(actor,"只有红色装备才能探索")
		return
	end
	if itemcount(actor,"金条") < 2 or itemcount(actor,"神秘水晶") < 1 then
		sendmsg9(actor,"金条或神秘水晶不足")
		return
	end
	takeitem(actor,"金条",2)
	takeitem(actor,"神秘水晶",1)
	
	local dianshu = 3
	local jpt = job_pd[xilian_t[name][1]] --加的极品属性表
	local dianshujilv = dianshujl[xilian_t[name][2]] --点数几率
	local suijizhi = math.random(1,100)
	if suijizhi <= dianshujilv[2] then
		dianshu = 4
	end
	
	local zuigaodian = 3 --单条属性最高点数
	if xilian_t[name][3] == 1 then --特殊装备
		zuigaodian = 2
	end
	local shuxing = math.random(1,#jpt)
	for i = 1,dianshu do
		if getitemaddvalue(actor,item,1,jpt[shuxing]) < zuigaodian then 
			setitemaddvalue(actor,item,1,jpt[shuxing],getitemaddvalue(actor,item,1,jpt[shuxing])+1)
		else
			for j = 1,1000 do
				local shuxing1 = math.random(1,#jpt)
				if shuxing1 ~= shuxing then
					setitemaddvalue(actor,item,1,jpt[shuxing1],getitemaddvalue(actor,item,1,jpt[shuxing1])+(dianshu-zuigaodian))
					break
				end
			end
			break
		end
	end
	
	sendmsg9(actor,"探索成功")
	refreshitem(actor,item)
	kaifeng_sz(actor) --探索属性设置
	return show(actor,wyid)
end

---------探索属性设置------------
local sx_zbtab = {4,3,5,6,7,8,10,11,0}
function kaifeng_sz(actor) --探索属性设置
	---------探索属性---------
	local zongdianshu = 0 --总点数

	for i = 1,#sx_zbtab do
		local item = linkbodyitem(actor,sx_zbtab[i])
		if item ~= "0" then
			for j=0,4 do
				zongdianshu = zongdianshu + getitemaddvalue(actor,item,1,j)
			end
		end
	end
	--sendmsg9(actor,"探索总点数："..zongdianshu )
	if zongdianshu >= 36 then
		if not hasbuff(actor,10036) then
			addbuff(actor,10036)
		end
	elseif zongdianshu >= 27 then
		if not hasbuff(actor,10035) then
			addbuff(actor,10035)
		end
	else
		if hasbuff(actor,10035) then
			delbuff(actor,10035)
		end
		if hasbuff(actor,10036) then
			delbuff(actor,10036)
		end
	end
end