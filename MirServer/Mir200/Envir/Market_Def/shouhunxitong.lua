include("Market_Def/zh.lua") --个人封装函数
local sh_jieshao = {
	["反弹"]="被攻击时有1%的概率完全反弹本次所受伤害的50%",
	["屠魔者"]="当天每击杀100只怪物额外获得1点攻魔道 最高可加5点 次日清0",
	["侠肝义胆"]="组队同地图情况下额外对怪伤害提升5%",
	["天选之子"]="获得龙的传人时额外增加5点攻魔道",
	["逝水"]="等级低于55级将提升暴击几率2%",
	["威势"]="等级高于50级暴击伤害将额外提升10%",
	["减伤"]="被麻痹蛛网冰冻状态下,受到伤害减少5%",
	["毒上加伤"]="对中毒目标人物额外伤害增加3%",
	["无义"]="受男性玩家攻击时伤害减少3%",
	["强者恒强"]="对一万血以上怪物怪暴击几率额外提升3%",
	["情非得以"]="对异性角色造成额外伤害增加3%",
	["鼓舞"]="击杀一只5万血以上的怪物额外增加2点主属性.最高可叠加6点.小退死亡消失",
	["生财"]="包裹每多一根金条 回收比例增加2%  最高可叠加5重",
	["枯木逢春"]="使用药品的情况下药品疗效增加10%",
	["强攻"]="对组队玩家将造成5%额外伤害",
	["看破红尘"]="受女性玩家攻击时伤害减少3%",
	["迟缓"]="攻击时有2%的概率使用蛛网束缚目标4秒", --此条出现几率高点
	["神佑"]="受到来自怪物的伤害减少10%",
	["疗伤"]="每杀死一只怪物恢复自身5点血量",
	["聚魔"]="攻击时将有1%几率清空自身魔法值对敌人造成1.5伤害",
	["诅咒术"]="攻击时降低目标10%的药品疗效 持续十秒",
	["正义之师"]="当你为行会成员时攻魔道增加3-3双防增加3-3",
	["迷魂阵"]="对低于自身5级的玩家有5%的概率使其束缚2秒.无法还手",
	["同甘共苦"]="结婚状态下夫妻同地图即可获得5%爆率额外加成",
	["独揽大权"]="当自己为行会掌门人时攻魔道伤增加2%",
	["打宝者"]="背包元宝每大于10000 爆率+1% 最多可叠加5%",
	["赤膊上阵"]="不穿带衣服时攻击目标可增加目标死亡爆率10%",
	["强身健体"]="40级以后每升一级增加1点HP",
	["龙的传人"]=	"当开启龙的传人时将额外获得对怪5%增伤效果",
	["有舍有得"]="自身暴击几率为0时 额外增加6-6全属性",
	["天星术"]="装备每获得8星额外获得1-1攻魔道",
	["荣誉之光"]="当自己是沙巴克成员时在土城将吸收8%所受伤害",
	["暴伤减免"]="自身死亡后当天所受暴击伤害减免10%",
	["步步高升"]="45级以后每升3级.防御魔御下限+1",
	["蛊毒术"]="获得绝命蛊毒制作特权 使目标今日降低15点双防上限",
	["风驰电掣"]="当人物血量低于80%.攻击以及施法速度增加1点",
	["法外狂徒"]="处于红名状态时所受伤害减少5%",
	["黎明"]="当黎明降临时,提升人物3%爆率.黎明时间(6:00-17:59)",
	["聚宝术"]="当天每杀死一个龙的传人将提升1%回收比例 最高可获升提高十点",
	["免疫"]="受到攻击时有1%的概率格挡本次所受伤害",
	["格挡术"]="使被攻击目标伤害格挡概率降低3%",
	["噬魂决"]="获得噬魂蛊毒作特权 使目标今日降低12点攻魔道上限",
	["早晚出事"]="每天11-13点 攻击力提升10%其他时间血量降低5%",
	["救死扶伤"]="购买药品可享受8折优惠",
	["暗夜"]="当暗夜降临时,提升人物3%爆率.暗夜时间(18:00-5:59)",
	["争强好胜"]="PK值大于1000提升1点暴击几率 PK值大于3000提升2点暴击几率 PK值大于5000提升3点暴击几率",
	["相濡以沫"]="结婚状态下 主属性增加5-5",
	["舍生取义"]="本职业主属性低于100点额外提升对怪伤害5%",
	["躲避术"]="3%的概率躲避怪物所造成的伤害",
	["为民除害"]="对红名玩家将造成8%额外伤害",
	["威摄"]="对同等级或相差1级的玩家追加3%额外伤害",
	["越死越强"]="角色当天每死亡一次受怪伤害减免1% 最高可叠加8次",
	["利刃"]="对一万血以下的怪物暴击几率提升3%",
	["多财多伤"]="包裹每多2根金条 额外伤害增加1% 最高可加3点",
	["等级压制"]="低于自己等级的玩家攻击自己时所受伤害减少5%",
	["玉石俱焚"]="被敌人杀后 仇人总血量降低10% 持续180秒",
	
	["铁骨铮铮"]="血量低于60% 提升自身双防15-15",
	["雷霆一击"]="对满血人物可直接打掉5%的血量",
	["风之守护"]="所受到的固定伤害减免30点",
	["召唤天火"]="攻击时有2%的概率召唤天火造成本职业主属性上限50%的固定伤害",
	["震摄反杀"]="攻击目标时有2%几率击退目标一格并斩杀5%血量",
	["一手遮天"]="当自己为沙巴克城主时主属性额外增10-12",
	["吸蓝大法"]="攻击时几率将人物魔法值吸光,并回复自身50%生命值",
	["披荆斩棘"]="处于红名状态,将提升5%隐藏攻击.每斩杀1名人物立即回复30%血量",
	["越战越勇"]="每击杀一个敌人将提升2%攻击伤害 最高可叠加5重 可持续120秒",
	["自作自受"]="受到血量高于80%目标攻击时.攻击者每次攻击将会损失自身血量1%",
	["称王称霸"]="当自己为天下第一时忽视目标双防20-20",
	["高级格挡术"]="使被攻击目标格挡伤害概率降低10%",
	["降维打击"]="攻击时概率将低等级目标麻痹3秒",
	["沙城霸主"]="在攻城区域内,所受伤害减免20%",
	["扫黑除恶"]="对红名玩家将造成15%额外伤害",
	["对怪麻痹"]="受怪物攻击时有2%的几率将其麻痹5秒",
	["打野无忧"]="血量低于50%.所受怪物攻击伤害降低25%",
	["意外惊喜"]="当杀死龙的传人时 额外获得100元宝奖励",
	["唯我独尊"]="在攻城区域内,伤害提升10%",
	["复仇之怒"]="自己死亡后暴击几率增加5%,持续1200秒",
	["绝处逢生"]="自身HP低于30%时,获得10%概率抵挡本次所受伤害",
	["枊暗花明"]="当自己身中红绿毒时,PK增伤提升5%",
	["有仇必报"]="杀死自己的敌人在8秒内将每秒损失3%血量",
	["百战之躯"]="受到人物攻击时.可恢复自身0.5%血量",
	["斗转星移"]="将所受到的伤害8%反弹给敌人",
	
	["自讨苦吃"]="单次所受伤害超过生命值的30%，无饮酒的攻击者双防清零，持续5秒",
	["金刚不坏"]="饮酒或者醉酒状态下被人物攻击时有概率触发无敌三秒",
	["横行霸道"]="敌人被野蛮冲撞,抗拒火环,气功波后敌人禁止使用特殊药品5秒",
	["金戈铁马"]="PK值大于15000点攻魔道增加15-15",
	["职业克制"]="对非本职业玩家造成10%额外伤害",
	["流星之熵"]="释放四级流星火雨时  目标每秒损失自身魔法上限15%的固定伤害 持续十秒 不可叠加",
	["同根相煎"]="攻击本职业玩家时忽视目标物伤减少.魔伤减少",
	["破伤之风"]="受到敌人攻击时 敌人攻击速度以及施法速度降低10点，持续10秒，CD30秒",
	["坚韧不拔"]="人物总血量每减少10%,所受伤害减少2% 主属性提升2点",
	["百炼成钢"]="60级以后每升一级 增加1点主属性",
	["背水一战"]="被攻击时.如果自身hp不足25%额外增加30%暴击几率",
	["逐日之熵"]="使用四级逐日剑法命中目标时,目标3秒内禁止使用特殊药品,并有30%概率被蛛网束缚4秒",
	["转身压制"]="目标转身等级每差自己1级额外增加2%的伤害",
	["障眼之法"]="攻击时有2%概率从对方视野消失3秒",
	["莽夫之怒"]="8*8范围内单挑时额外提升PK增伤10%",
	["状态虚弱"]="被麻痹蛛网冰冻状态下 所受攻击伤害减少30%",
	["噬血之熵"]="使用四级噬血术对目标人物附带当前血量2%额外伤害",
	["破釜沉舟"]="自身HP减少12% 攻魔道增加5%",
	["年少得志"]="等级低于70级.提升人物攻魔道防御魔御血量5%",
	["酒后狂徒"]="饮酒状态或醉酒状态下对敌人造成110%的伤害.自身受到105%的伤害",
	["怪物克星"]="攻击怪物时有几率直接秒杀2%血量，并且对血量低于10%的怪物(10W以上)将直接斩杀",
}
local xilian_xh = {
			{1,100},{2,100},{3,200},{4,200},{5,300},{6,300}
		}
local yanse_t = {
--橙色buff
["铁骨铮铮"]=70,["雷霆一击"]=70,["风之守护"]=70,["召唤天火"]=70,["震摄反杀"]=70,["一手遮天"]=70,["吸蓝大法"]=70,["披荆斩棘"]=70,
["越战越勇"]=70,["自作自受"]=70,["称王称霸"]=70,["高级格挡术"]=70,["降维打击"]=70,["沙城霸主"]=70,["扫黑除恶"]=70,["对怪麻痹"]=70,["打野无忧"]=70,
["意外惊喜"]=70,["唯我独尊"]=70,["复仇之怒"]=70,["绝处逢生"]=70,["枊暗花明"]=70,["有仇必报"]=70,["百战之躯"]=70,["斗转星移"]=70,
--红色buff
["自讨苦吃"]=249,["金刚不坏"]=249,["横行霸道"]=249,["金戈铁马"]=249,["职业克制"]=249,["流星之熵"]=249,["同根相煎"]=249,["破伤之风"]=249,["坚韧不拔"]=249,["怪物克星"]=249,
["百炼成钢"]=249,["背水一战"]=249,["逐日之熵"]=249,["转身压制"]=249,["障眼之法"]=249,["莽夫之怒"]=249,["状态虚弱"]=249,["噬血之熵"]=249,["破釜沉舟"]=249,["年少得志"]=249,["酒后狂徒"]=249,
}

local choujiang_t = {
				["稻草人"]=600,["多钩猫"]=600,["红蛇"]=600,["食人花"]=600,["毒蜘蛛"]=600,["森林雪人"]=600,["巨型多角虫"]=600,["半兽统领"]=70,
				["沃玛勇士"]=600,["沃玛护卫"]=600,["火焰沃玛"]=600,["沃玛战将"]=600,["祖玛弓箭手"]=600,["祖玛雕像"]=600,["祖玛卫士"]=600,["祖玛教主"]=50,
				["红野猪"]=300,["邪恶毒蛇"]=300,["白野猪"]=300,["触龙神"]=300,["虹魔蝎卫"]=300,["虹魔猪卫"]=300,["千年树妖"]=300,["虹魔教主"]=30,
				["骷髅长枪兵"]=300,["骷髅锤兵"]=300,["骷髅刀斧手"]=300,["牛魔战士"]=300,["牛魔法师"]=300,["牛魔祭司"]=300,["牛魔将军"]=300,["牛魔王"]=20,
				["钢牙蜘蛛"]=100,["天狼蜘蛛"]=100,["黑锷蜘蛛"]=100,["花吻蜘蛛"]=100,["血影巨人"]=100,["双头金刚"]=100,["双头血魔"]=100,["赤月恶魔"]=15,
				["魔龙邪眼"]=100,["魔龙血蛙"]=100,["魔龙射手"]=100,["魔龙刀兵"]=100,["魔龙战将"]=100,["魔龙力士"]=100,["魔龙巨蛾"]=100,["魔龙教主"]=10,
}

local choujiang_t1 = {
				["稻草人"]=600,["多钩猫"]=600,["红蛇"]=600,["食人花"]=600,["毒蜘蛛"]=600,["森林雪人"]=600,["巨型多角虫"]=600,["半兽统领"]=35,
				["沃玛勇士"]=600,["沃玛护卫"]=600,["火焰沃玛"]=600,["沃玛战将"]=600,["祖玛弓箭手"]=600,["祖玛雕像"]=600,["祖玛卫士"]=600,["祖玛教主"]=25,
				["红野猪"]=300,["邪恶毒蛇"]=300,["白野猪"]=300,["触龙神"]=300,["虹魔蝎卫"]=300,["虹魔猪卫"]=300,["千年树妖"]=300,["虹魔教主"]=12,
				["骷髅长枪兵"]=300,["骷髅锤兵"]=300,["骷髅刀斧手"]=300,["牛魔战士"]=300,["牛魔法师"]=300,["牛魔祭司"]=300,["牛魔将军"]=300,["牛魔王"]=9,
				["钢牙蜘蛛"]=100,["天狼蜘蛛"]=100,["黑锷蜘蛛"]=100,["花吻蜘蛛"]=100,["血影巨人"]=100,["双头金刚"]=100,["双头血魔"]=100,["赤月恶魔"]=4,
				["魔龙邪眼"]=100,["魔龙血蛙"]=100,["魔龙射手"]=100,["魔龙刀兵"]=100,["魔龙战将"]=100,["魔龙力士"]=100,["魔龙巨蛾"]=100,["魔龙教主"]=2,
}

local ziseshouhun = {["半兽统领"]=1,["祖玛教主"]=1,["虹魔教主"]=1,["牛魔王"]=1,["赤月恶魔"]=1,["魔龙教主"]=1}

function show(actor,yemian,ziye,xianshi,isshiyong,iszandan)
	--haoshistart(actor)
	yemian = tonumber(yemian) or 1
	ziye = tonumber(ziye) or 1
	xianshi = tonumber(xianshi) or 0
	isshiyong = tonumber(isshiyong) or 0
	iszandan = tonumber(iszandan) or 0
	local msg = [[
		<Img|x=0|width=643|height=457|reset=0|loadDelay=0|bg=1|img=zhangheng/1.png|move=1|esc=1|show=4>
		<Button|x=639.5|y=1.5|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-23.5|y=-15.5|img=zhangheng/2.png|esc=0>
	]]
	if yemian == 1 then	

		----兽魂界面开始
		msg=msg..[[


<Button|x=639.5|y=189.5|color=255|size=18|pimg=zhangheng/306.png|nimg=zhangheng/306.png|link=@show,3>
<Button|x=639.5|y=129.5|color=255|size=18|pimg=zhangheng/310.png|nimg=zhangheng/310.png|link=@show,2>
<Button|x=639.5|y=60.5|color=255|size=18|pimg=zhangheng/307.png|nimg=zhangheng/307.png|link=@kong>
<Img|x=16.5|y=39.5|img=zhangheng/127.png|esc=0>
<Img|x=422.5|y=38.5|img=zhangheng/128.png|esc=0>
<Img|x=17.5|y=38.5|img=zhangheng/129.png|esc=0>
<Text|x=491.5|y=128.5|color=108|size=18|text=兽魂信息>
<RText|x=436.5|y=158.5|color=103|size=16|text=⒈兽魂蛋只能打怪获得>
<RText|x=452.5|y=180.5|color=103|size=16|text=任何怪物都有几率掉>
<RText|x=452.5|y=202.5|color=103|size=16|text=落，兽魂蛋没有品质>
<RText|x=452.5|y=224.5|color=103|size=16|text=之分，只有一种类型>
<RText|x=453.5|y=246.5|size=16|color=103|text=每个魂兽可回收10点>
<RText|x=452.5|y=268.5|size=16|color=103|text=兽魂值>
<RText|x=437.5|y=293.5|color=103|size=16|text=⒉玩家获得的兽魂没有>
<RText|x=453.5|y=315.5|color=103|size=16|text=任何属性，只作为搜>
<RText|x=453.5|y=337.5|color=103|size=16|text=集的作用，每次砸蛋>
<RText|x=453.5|y=359.5|color=103|size=16|text=需要消耗一个鸿运之>
<RText|x=453.5|y=381.5|color=103|size=16|text=锤（怪物爆出或者商>
<RText|x=453.5|y=403.5|color=103|size=16|text=铺使用金币购买）>


		]]
		local sl = 1
		if iszandan == 1 then
			sl = 15
		end
		msg=msg.."<Frames|x=42.5|y=90.5|speed=12|prefix=dan/dan_|suffix=.png|count=".. sl .."|finishframe=1|loop=1>"
		msg=msg.."<Button|x=177.5|y=367.5|color=10051|nimg=zhangheng/13.png|size=18|text=鸿运之锤|clickInterval=500|link=@zadan>"
		if getint(actor,"累计充值") >= 2000 then
			if getint(actor,"10连砸") == 0 then
				msg=msg.."<Img|x=279.5|y=370.5|img=zh/44.png|link=@setlianchou>"
			else
				msg=msg.."<Img|x=279.5|y=370.5|img=zh/45.png|link=@setlianchou>"
			end
			msg=msg.."<Text|x=314.5|y=375.5|color=255|size=18|text=10连锤>"
		end
	elseif yemian == 2 then
		----兽栏界面开始
		msg=msg..[[

		<Button|x=639.5|y=189.5|color=255|size=18|pimg=zhangheng/306.png|nimg=zhangheng/306.png|link=@show,3>
		<Button|x=639.5|y=129.5|color=255|size=18|pimg=zhangheng/309.png|nimg=zhangheng/309.png|link=@kong>
		<Button|x=639.5|y=60.5|nimg=zhangheng/308.png|color=255|size=18|pimg=zhangheng/308.png|link=@show,1>
		<Img|x=16.5|y=39.5|img=zhangheng/131.png|esc=0>
		<Img|x=422.5|y=38.5|img=zhangheng/128.png|esc=0>
		<Img|x=20.5|y=348.5|width=400|esc=0|img=zhangheng/99.png>
		<Text|x=461.0|y=55.0|size=18|color=161|text=激活八个魂兽后>
		<Text|x=461.0|y=85.0|size=18|color=161|text=可获得特殊属性>
		<Img|x=424.5|y=116.5|width=200|esc=0|img=zhangheng/99.png>
		<Img|x=424.5|y=348.5|width=200|esc=0|img=zhangheng/99.png>
		<Img|x=418.0|y=136.0|img=zhangheng/206.png|esc=0>
		]]
		
		msg=msg.."<Button|x=18.5|y=396.5|nimg=zhangheng/8.png|pimg=zhangheng/8.png|link=@show,2,".. ziye ..",1>"
		
		local t = getshouhundata(actor)[ziye]
		for i = 1,8 do
			if t[i][2] == 0 then --{{"稻草人",0,0},{"多钩猫",0,0},{"红蛇",0,0},{"食人花",0,0},{"毒蜘蛛",0,0},{"森林雪人",0,0},{"巨型多角虫",0,0},{"半兽统领",0,0}}, 名字， 是否激活，收集数量
				msg=msg.."<Img|x=".. 21.5+(i-1)%4*100 .."|y=".. 40.5+math.floor((i-1)/4)*138 .."|img=zhangheng/133.png|grey=0|link=@jihuo,"..ziye..","..i..">"
				msg=msg.."<Img|x=".. 21.5+(i-1)%4*100 .."|y=".. 40.5+math.floor((i-1)/4)*138 .."|img=guai/000".. ziye*100+i ..".png|grey=1>"
				msg=msg.."<Button|x=".. 38.5+(i-1)%4*100 .."|y=".. 154.5+math.floor((i-1)/4)*138 .."|nimg=zhangheng/134.png|link=@jihuo,"..ziye..","..i..">"					--激活按钮
			else
				msg=msg.."<Img|x=".. 21.5+(i-1)%4*100 .."|y=".. 40.5+math.floor((i-1)/4)*138 .."|img=zhangheng/133.png|link=@shouji,"..ziye..","..i..">"
				msg=msg.."<Img|x=".. 21.5+(i-1)%4*100 .."|y=".. 40.5+math.floor((i-1)/4)*138 .."|img=guai/000".. ziye*100+i ..".png>"
				msg=msg.."<Text|x=".. 24.5+(i-1)%4*100 .."|y=".. 43.5+math.floor((i-1)/4)*138 .."|color=150|size=16|text=".. t[i][3] ..">"
				msg=msg.."<Button|x=".. 38.5+(i-1)%4*100 .."|y=".. 154.5+math.floor((i-1)/4)*138 .."|nimg=zhangheng/135.png|link=@shouji,"..ziye..","..i..">"					--收集按钮
			end
		end
		------上下页按钮
		local shangyiye = ziye - 1
		local xiayiye = ziye + 1
		if shangyiye < 1 then shangyiye = 1 end
		if xiayiye > 6 then xiayiye = 6 end
		msg=msg.."<Text|ay=0.5|x=93.5|y=332|color=95|size=18|text=上一页|link=@show,2,"..shangyiye ..">"
		msg=msg.."<Text|ay=0.5|x=293.5|y=332.0|color=95|size=18|text=下一页|link=@show,2,"..xiayiye ..">"
		msg=msg.."<Text|ay=0.5|x=206.5|y=332.0|color=95|size=18|text=".. ziye .."/6>"
		local sx_t={"魔御增加 0-1","防御增加 0-1","生命值+5","目标双防减免 1-1","攻魔道增加 1-1","对人对怪伤害+1"}
		msg=msg.."<Text|ax=0.5|ay=0.5|x=219.5|y=371.0|size=16|color=250|text=当前页面每激活一个魂兽获得属性：".. sx_t[ziye] ..">"
		
		-----buff展示
		
		local buffdata = getshouhunbuffdata(actor)
		local color = yanse_t[buffdata[ziye]] or 255
		if buffdata[ziye] ~= "" then
			msg=msg.."<RText|x=431.5|y=200|color=".. color .."|size=16|width=180|text="..buffdata[ziye].."：>"				
			msg=msg.."<RText|x=431.5|y=225|color=255|size=16|width=180|text="..sh_jieshao[buffdata[ziye]]..">"
		else		
			msg=msg.."<RText|x=496|y=200|color=150|size=18|text=<未激活/FCOLOR=7>>"
		end

		msg=msg.."<Button|x=137.5|y=388.5|nimg=zh/68.png|color=10051|size=18|text=一键收集本页魂兽|link=@yijianshouji,"..ziye..">"					--一键收集按钮
		
		local xianshitiaojian = true
		if getint(actor,"兽魂消耗显示") == 0 then 
			for i = 1,8 do
				if t[i][3] < 1 then
					xianshitiaojian = false
					break
				end
			end
		end
		if xianshitiaojian then
			setint(actor,"兽魂消耗显示",1)
			msg=msg.."<Text|ay=0.5|x=453.5|y=371|size=16|color=103|text=".. xilian_xh[ziye][1] .."根金条 + ".. xilian_xh[ziye][2] .."兽魂值>"
		end
		
		msg=msg.."<Button|x=483.5|y=388.5|color=10051|size=18|nimg=zhangheng/13.png|text=重获新生|link=@xilian,"..ziye..">"
		
		if xianshi == 1 then
			msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|link=@show,2,".. ziye ..">"
			msg=msg..[[
			<Img|ay=0.5|x=52.5|y=293.5|width=340|height=270|scale9r=10|scale9t=10|scale9b=10|img=zh/7.png|esc=0|scale9l=10>
			<RText|x=64.5|y=172.5|width=344|color=251|size=16|text=魂兽介绍：>
			<RText|x=64.5|y=202.5|width=344|size=16|color=255|text=⒈在当前页面激活兽魂<可获得对应属性/FCOLOR=250>，多>
			<RText|x=80.5|y=225.5|width=344|size=16|color=255|text=余的兽魂重新<可收集/FCOLOR=250>或者<回收/FCOLOR=250>成<兽魂值/FCOLOR=70>>
			<RText|x=80.5|y=300.5|width=344|size=16|color=255|text=<特殊属性的几率越高/FCOLOR=253>>
			<RText|x=64.5|y=254.5|width=344|size=16|color=255|text=⒉激活<当前页面全部兽魂>以后即可额外获得>
			<RText|x=80.5|y=277.5|width=344|size=16|color=255|text=<特殊属性/FCOLOR=254>，教主的档次越高级，<获得稀有/FCOLOR=253>>
			<RText|x=64.5|y=329.5|width=344|size=16|color=255|text=⒊如果你对当前激活兽魂获得的特殊属性不>
			<RText|x=80.5|y=352.5|width=344|size=16|color=255|text=满意，可重新进行搜集，选择<重获新生/FCOLOR=250>，>
			<RText|x=80.5|y=375.5|width=344|size=16|color=255|text=重新搜集只会变动特殊属性，固定属性不>
			<RText|x=80.5|y=398.5|width=344|size=16|color=255|text=会重复增加和减少>

			]]

		end
	else

	

		----回收界面开始
		msg=msg..[[
		<Button|x=639.5|y=189.5|pimg=zhangheng/305.png|color=255|nimg=zhangheng/305.png|size=18|link=@kong>
		<Button|x=639.5|y=129.5|pimg=zhangheng/310.png|color=255|nimg=zhangheng/310.png|size=18|link=@show,2>
		<Button|x=639.5|y=60.5|nimg=zhangheng/308.png|color=255|size=18|pimg=zhangheng/308.png|link=@show,1>

		<Img|x=16.5|y=38.5|img=zhangheng/137.png|esc=0>
		<Img|x=422.5|y=38.5|img=zhangheng/128.png|esc=0>
		<Img|x=18.5|y=292.5|img=zhangheng/140.png|esc=0>
		<Img|x=90.5|y=249.5|img=zhangheng/139.png|esc=0>
		
		<Img|x=146.5|y=305.5|img=zhangheng/141.png|esc=0>
		<Img|x=86.5|y=314.5|img=zhangheng/142.png|esc=0>
		<Img|x=298.5|y=314.5|img=zhangheng/143.png|esc=0>
		<Img|x=74.5|y=345.5|img=zhangheng/138.png|esc=0>
		<Img|x=420.5|y=40.5|img=zhangheng/144.png|esc=0>
		<Img|x=430.5|y=83.5|width=187|height=290|scale9r=3|scale9t=3|scale9l=3|img=zh/36.png|scale9b=3|esc=0>
		<Img|x=148.0|y=81.0|img=zh/21.png|esc=0>
		<Button|x=437.5|y=383.5|nimg=zhangheng/136.png|color=10051|size=18|text=一键选择所有兽魂|link=@yijianquanxuan>
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
			if choujiang_t[iname] and not ziseshouhun[iname] then
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
		msg = msg ..'<Text|ax=0.5|ay=0.5|x=221.5|y=266.0|color=251|size=18|text=已选中['.. xuzhong_sl ..']个魂兽>'
		msg = msg ..'<RText|ax=0.5|ay=0.5|x=221.5|y=97.0|color=255|size=18|text=<当前兽魂值：/FCOLOR=95><'.. getshouhunzhi(actor) ..'/FCOLOR=254>>'
		msg = msg ..'<Text|ax=0.5|ay=0.5|x=222.5|y=363.0|color=254|size=18|text='.. xuzhong_sl*10 ..'点>'
		msg = msg ..'<Button|x=179.5|y=388.5|nimg=zhangheng/13.png|color=10051|size=18|text=确定回收|link=@huishou>'
	end
	
	say(actor,msg)
	--haoshiend(actor)
end

function huishou(actor)
	--haoshistart(actor)
	local t = gethuishoudata(actor) --要回收的道具数据
	local sl = 0
	for k,v in pairs(t) do
		local makeid = tonumber(k)
		if delitembymakeindex(actor,makeid,1) then
			sl = sl + 1
		end
	end
	
	if sl > 0 then
		addshouhunzhi(actor,sl*10)
		sendmsg9(actor,"回收成功")
	else
		sendmsg9(actor,"请选择要回收的兽魂")
	end
	--haoshiend(actor)
	return show(actor,3)
end

function xuanze(actor,caozuo,makeid) --操作 1加 2减  唯一id
	local t = gethuishoudata(actor)
	if caozuo == "1" then
		t[makeid] = 1 
	else
		t[makeid] = nil
	end
	setstr(actor,"回收选中道具",tbl2json(t)) --存入
	return show(actor,3,1,0,1)
end
function yijianquanxuan(actor)
	local t = getbaglist(actor) --获取背包道具列表
	local shouhun_t = {} --兽魂表 唯一id表
	local xuanzhong_t = {} --选中兽魂表 唯一id表
	for i = 1,#t do
		local id = getiteminfo(actor,t[i],2) --物品id
		local wyid = getiteminfo(actor,t[i],1) --物品唯一id
		local iname = getstditeminfo(id,1) --名字
		if choujiang_t[iname] and not ziseshouhun[iname] then
			table.insert(shouhun_t,wyid)
		end
	end
	for i = 1,#shouhun_t do
		xuanzhong_t[tostring(shouhun_t[i])] = 1
	end
	setstr(actor,"回收选中道具",tbl2json(xuanzhong_t)) --存入
	return show(actor,3,1,0,1)
end

function zadan(actor)
	if getint(actor,"10连砸") == 0 then
		if itemcount(actor,"兽魂蛋") < 1 then
			sendmsg9(actor,"你没有兽魂蛋")
			return
		end
		
		if getbagblank(actor) < 1 then
			sendmsg9(actor,"背包空格不足1格")
			return
		end
		if itemcount(actor,"鸿运之锤") < 1 then
			sendmsg9(actor,"你没有鸿运之锤")
			return
		end
		zadan1(actor)
	else
		if itemcount(actor,"兽魂蛋") < 10 then
			sendmsg9(actor,"你没有10个兽魂蛋")
			return
		end
		
		if getbagblank(actor) < 10 then
			sendmsg9(actor,"背包空格不足10格")
			return
		end
		if itemcount(actor,"鸿运之锤") < 10 then
			sendmsg9(actor,"你没有10个鸿运之锤")
			return
		end
		for i = 1,10 do
			zadan1(actor)
		end
	end
end

function zadan1(actor)
	if itemcount(actor,"兽魂蛋") < 1 then
		sendmsg9(actor,"你没有兽魂蛋")
		return
	end
	
	if getbagblank(actor) < 1 then
		sendmsg9(actor,"背包空格不足")
		return
	end
	
	local t = choujiang_t
	--sendmsg6(actor,"金币购买锤子个数剩余"..getint(actor,"金币购买锤子个数"))
	if getint(actor,"金币购买锤子个数") > 0 then
		t = choujiang_t1
		--sendmsg6(actor,"进入低几率物品表")
	end
	
	if itemcount(actor,"鸿运之锤") < 1 then
		sendmsg9(actor,"你没有鸿运之锤")
		return
	end
	takeitem(actor, "鸿运之锤", 1)
	takeitem(actor, "兽魂蛋", 1)
	----按权重给物品
	local sj_zongzhi = 0 --权重总值
	for k,v in pairs(t) do
		sj_zongzhi = sj_zongzhi + v
	end
	--sendmsg6(actor,"权重总值"..sj_zongzhi)
	
	local sjz = math.random(1,sj_zongzhi) --随机值
	local quanzhongzhi = 0
	for k,v in pairs(t) do
		quanzhongzhi = quanzhongzhi + v
		if sjz < quanzhongzhi then
			giveitem(actor,k,1) --给物品
			setsysint("砸蛋的次数",getsysint("砸蛋的次数")+1)
			setsysint("每日砸蛋的次数",getsysint("每日砸蛋的次数")+1)
			if ziseshouhun[k] then
				post(actor,"抽取好兽魂 " ..k)
				setsysint("砸蛋"..k,getsysint("砸蛋"..k)+1)
				setsysint("每日砸蛋"..k,getsysint("每日砸蛋"..k)+1)
				
			else
				post(actor,"抽取兽魂 " ..k)
			end
			delaygoto(actor,1000,"xiaoxi,"..k,1)
			break
		end
	end
	
	if getint(actor,"金币购买锤子个数") > 0 then
		setint(actor,"金币购买锤子个数",getint(actor,"金币购买锤子个数")-1)
	end
	return show(actor,1,0,0,0,1)
end

function xiaoxi(actor,k)
	sendmsg9(actor,"恭喜你获得【"..k.."】")
end

local bufft = {10002,10003,10004,10005,10006,10007}
function jihuo(actor,yemian,id,isyijian) --第几页第几个
	yemian = tonumber(yemian)
	isyijian = tonumber(isyijian) or 0
	id = tonumber(id)
	local data = getshouhundata(actor)
	if data[yemian][id][2] == 1 then
		sendmsg9(actor,"已激活")
		return
	end
	
	if itemcount(actor,data[yemian][id][1]) < 1 then
		sendmsg9(actor,"你没有【".. data[yemian][id][1] .."】")
		return
	end
	takeitem(actor,data[yemian][id][1],1,0)

	data[yemian][id][2] = 1
	--release_print(tbl2json(data))
	setstr(actor,"兽魂数据",tbl2json(data))
	sendmsg9(actor,"激活成功")
	addbuff(actor,bufft[yemian])
	--这里如果这页满就给整页buff
	local man = true
	for i = 1,8 do
		if data[yemian][i][2] == 0 then
			man = false
		end
	end
	if man then
		geibuff(actor,yemian)
	end
	if isyijian == 0 then
		return show(actor,2,yemian)
	end
end

function shouji(actor,yemian,id)
	yemian = tonumber(yemian)
	id = tonumber(id)
	local data = getshouhundata(actor)
	
	if itemcount(actor,data[yemian][id][1]) < 1 then
		sendmsg9(actor,"你没有【".. data[yemian][id][1] .."】")
		return
	end
	takeitem(actor,data[yemian][id][1],1,0)
	
	data[yemian][id][3] = data[yemian][id][3] + 1
	setstr(actor,"兽魂数据",tbl2json(data))
	sendmsg9(actor,"恭喜您成功收集魂兽【".. data[yemian][id][1] .."】")
	return show(actor,2,yemian)
end

function yijianshouji(actor,yemian)
	yemian = tonumber(yemian)
	local sjsl = 0
	local data = getshouhundata(actor)
	
	for j = 1,8 do
		if data[yemian][j][2] == 0 then --未激活
			local sl = itemcount(actor,data[yemian][j][1],2)
			if sl > 0 then
				jihuo(actor,yemian,j)
			end
		end
	end
	
	data = getshouhundata(actor)
	for j = 1,8 do
		if data[yemian][j][2] == 1 then --已激活
			--if ziseshouhun[data[yemian][j][1]] == nil then --不是紫色兽魂
				local sl = itemcount(actor,data[yemian][j][1],2)
				if sl > 0 then
					takeitem(actor,data[yemian][j][1],sl,0)
					data[yemian][j][3] = data[yemian][j][3] + sl
					sjsl = sjsl + sl
					sendmsg9(actor,"恭喜您成功收集魂兽【".. data[yemian][j][1] .."】")
				end
			--end
		end
	end

	if sjsl == 0 then
		sendmsg9(actor,"背包没有可收集兽魂")
		return	
	end
	sendmsg9(actor,"一键收集成功，收集齐整页兽魂可获得兽魂buff")
	setstr(actor,"兽魂数据",tbl2json(data))
	return show(actor,2,yemian)
end

function xilian(actor,yemian)
	yemian = tonumber(yemian)
	local data = getshouhundata(actor)
	for i = 1,8 do
		if data[yemian][i][2] < 1 then
			sendmsg9(actor,"请先激活当前全部兽魂")
			return
		end
		
		if data[yemian][i][3] < 1 then
			sendmsg9(actor,"请重新搜集齐当前页面八只兽魂方可重获新生")
			return
		end
	end
	
	messagebox(actor,"\n是否确定重获新生？","@xilian1,".. yemian,"@kong")
	
end

function xilian1(actor,yemian)
	yemian = tonumber(yemian)
	local data = getshouhundata(actor)
	if itemcount(actor,"金条") < xilian_xh[yemian][1] then
		sendmsg9(actor,"金条不足")
		return
	end
	
	if getshouhunzhi(actor) < xilian_xh[yemian][2] then
		sendmsg9(actor,"兽魂值不足")
		return
	end
	takeitem(actor,"金条",xilian_xh[yemian][1])
	subshouhunzhi(actor,xilian_xh[yemian][2])
	
	for i = 1,8 do
		data[yemian][i][3] = data[yemian][i][3] - 1
	end
	
	setstr(actor,"兽魂数据",tbl2json(data))
	geibuff(actor,yemian,1)
	sendmsg9(actor,"重获新生成功")
	return show(actor,2,yemian)
end



--白色buff
local basebuff = {
"反弹","屠魔者","侠肝义胆","天选之子","逝水","威势","减伤","毒上加伤","无义","强者恒强","情非得以","鼓舞","生财","枯木逢春","强攻","看破红尘","迟缓","迟缓","迟缓","神佑",
"疗伤","聚魔","诅咒术","正义之师","迷魂阵","同甘共苦","独揽大权","打宝者","赤膊上阵","强身健体","龙的传人","有舍有得","天星术","荣誉之光","暴伤减免","步步高升",
"蛊毒术","风驰电掣","法外狂徒","黎明","聚宝术","免疫","格挡术","噬魂决","早晚出事","救死扶伤","暗夜","争强好胜","相濡以沫","舍生取义","躲避术","为民除害",
"威摄","越死越强","利刃","多财多伤","等级压制","玉石俱焚"
}

--橙色buff
local huangsebuff = {
"铁骨铮铮","雷霆一击","风之守护","召唤天火","震摄反杀","一手遮天","吸蓝大法","披荆斩棘","越战越勇","自作自受","称王称霸","高级格挡术",
"降维打击","沙城霸主","扫黑除恶","对怪麻痹","打野无忧","意外惊喜","唯我独尊","复仇之怒","绝处逢生","枊暗花明","有仇必报","百战之躯","斗转星移",
}
--红色buff
local hongsebuff = {
--低级
{"自讨苦吃","金戈铁马","同根相煎","破伤之风","背水一战","转身压制","障眼之法","莽夫之怒","状态虚弱","破釜沉舟","年少得志"},
--高级
{"横行霸道","职业克制","坚韧不拔",}

}

local hongsebuff1 = {
--低级
{"自讨苦吃","金戈铁马","同根相煎","破伤之风","背水一战","转身压制","障眼之法","莽夫之怒","状态虚弱","破釜沉舟","年少得志","百炼成钢"},
--高级
{"横行霸道","职业克制","坚韧不拔","金刚不坏","酒后狂徒","流星之熵","逐日之熵","噬血之熵"}
}
local baodicishu = {20,20,24,24,30,30}
function geibuff(actor,yemian,isxilian)
	local t = basebuff
	local ishongse = false
	if not isxilian then --不是洗炼
		if math.random(1,100) <= 3 then
			t = huangsebuff
		end
	else --是洗炼怎么给几率
		if getint(actor,"洗炼次数"..yemian) < 5 then --第5次前几率
			if math.random(1,100) <= 25 then --25几率给黄色
				t = huangsebuff
			end
		elseif getint(actor,"洗炼次数"..yemian) < baodicishu[yemian] then --保底次数
			local suijizhi = math.random(1,100)
			if suijizhi <= 1 then --红色buff
				ishongse = true
				t = hongsebuff[1]
				if yemian >= 3 then
					t = hongsebuff1[1]
				end
				if yemian == 1 then
					if math.random(1,100) < 10 then
						t = hongsebuff[2]
					end
				elseif yemian == 2 then
					if math.random(1,100) < 10 then
						t = hongsebuff[2]
					end
				elseif yemian == 3 then
					if math.random(1,100) < 20 then
						t = hongsebuff1[2]
					end
				elseif yemian == 4 then
					if math.random(1,100) < 20 then
						t = hongsebuff1[2]
					end
				elseif yemian == 5 then
					if math.random(1,100) < 30 then
						t = hongsebuff1[2]
					end
				elseif yemian == 6 then
					if math.random(1,100) < 30 then
						t = hongsebuff1[2]
					end
				end
			elseif suijizhi <= 30 then --黄色
				t = huangsebuff
			end
		else
			if math.random(1,100) < 50 then
				ishongse = true
				t = hongsebuff[1]
				if yemian >= 3 then
					t = hongsebuff1[1]
				end
				if yemian == 1 then
					if math.random(1,100) < 10 then
						t = hongsebuff[2]
					end
				elseif yemian == 2 then
					if math.random(1,100) < 10 then
						t = hongsebuff[2]
					end
				elseif yemian == 3 then
					if math.random(1,100) < 20 then
						t = hongsebuff1[2]
					end
				elseif yemian == 4 then
					if math.random(1,100) < 20 then
						t = hongsebuff1[2]
					end
				elseif yemian == 5 then
					if math.random(1,100) < 30 then
						t = hongsebuff1[2]
					end
				elseif yemian == 6 then
					if math.random(1,100) < 30 then
						t = hongsebuff1[2]
					end
				end
			else
				t = huangsebuff
			end
		end
		
		
	end
	
	----给属性段，不能重复
	local data = getshouhunbuffdata(actor)
	for i = 1,1000 do
		local buffname = t[math.random(1,#t)] --要给的buff名
		local you = false --没有重复
		
		if buffname == "为民除害" then
			for i = 1,#data do
				if data[i] == "扫黑除恶" then
					you = true
					break
				end
			end
		end
		if buffname == "扫黑除恶" then
			for i = 1,#data do
				if data[i] == "为民除害" then
					you = true
					break
				end
			end
		end
		
		if string.find(buffname,"格挡术") then
			--sendmsg6(actor,buffname.."是格挡术")
			for i = 1,#data do
				if string.find(data[i],"格挡术") and (i ~= yemian or data[i] == buffname) then
					you = true
					break
				end
			end
		else
			--sendmsg6(actor,buffname.."不是格挡术")
			for i = 1,#data do
				if data[i] == buffname then
					you = true
					break
				end
			end
		end
		
		if you and #t == 3 and i > 500 then --如果重复并且是3个红色的
			t = hongsebuff1[2]
		end
		
		if not you then
			data[yemian] = buffname
			break
		end
	end
	----
	if ishongse then --是红色
		setint(actor,"洗炼次数"..yemian,0)
	else
		setint(actor,"洗炼次数"..yemian,getint(actor,"洗炼次数"..yemian)+1)
	end
	
	setstr(actor,"兽魂buff数据",tbl2json(data))
	callscriptex(actor, "CallLua", "Qfunction-0", "@shizhuangjiemian") --装备界面兽魂界面显示
end


function getshouhundata(actor) --获取兽魂数据
	local data = {
		{{"稻草人",0,0},{"多钩猫",0,0},{"红蛇",0,0},{"食人花",0,0},{"毒蜘蛛",0,0},{"森林雪人",0,0},{"巨型多角虫",0,0},{"半兽统领",0,0}},
		{{"沃玛勇士",0,0},{"沃玛护卫",0,0},{"火焰沃玛",0,0},{"沃玛战将",0,0},{"祖玛弓箭手",0,0},{"祖玛雕像",0,0},{"祖玛卫士",0,0},{"祖玛教主",0,0}},
		{{"红野猪",0,0},{"邪恶毒蛇",0,0},{"白野猪",0,0},{"触龙神",0,0},{"虹魔蝎卫",0,0},{"虹魔猪卫",0,0},{"千年树妖",0,0},{"虹魔教主",0,0}},
		{{"骷髅长枪兵",0,0},{"骷髅锤兵",0,0},{"骷髅刀斧手",0,0},{"牛魔战士",0,0},{"牛魔法师",0,0},{"牛魔祭司",0,0},{"牛魔将军",0,0},{"牛魔王",0,0}},
		{{"钢牙蜘蛛",0,0},{"天狼蜘蛛",0,0},{"黑锷蜘蛛",0,0},{"花吻蜘蛛",0,0},{"血影巨人",0,0},{"双头金刚",0,0},{"双头血魔",0,0},{"赤月恶魔",0,0}},
		{{"魔龙邪眼",0,0},{"魔龙血蛙",0,0},{"魔龙射手",0,0},{"魔龙刀兵",0,0},{"魔龙战将",0,0},{"魔龙力士",0,0},{"魔龙巨蛾",0,0},{"魔龙教主",0,0}},
	}
	local sh_str = getstr(actor,"兽魂数据")
	if sh_str ~= "" then
		data=json2tbl(sh_str)
	end
	return data
end

function getshouhunbuffdata(actor) --获取兽魂buff数据
	local data = {"","","","","",""}
	local sh_str = getstr(actor,"兽魂buff数据")
	if sh_str ~= "" then
		data=json2tbl(sh_str)
	end
	return data
end

function gethuishoudata(actor) --获取回收数据
	local data = {}
	local sh_str = getstr(actor,"回收选中道具")
	if sh_str ~= "" then
		data=json2tbl(sh_str)
	end
	return data
end

function kong(actor)
	
end

function setlianchou(actor)
	if getint(actor,"10连砸") == 0 then
		setint(actor,"10连砸",1)
	else
		setint(actor,"10连砸",0)
	end
	return show(actor)
end