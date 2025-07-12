
include("Market_Def/huishou.lua") --回收界面
---------------------------------------------
local sh_jieshao_t = {
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
}

local sh_yanse_t = {
--橙色buff
["铁骨铮铮"]=70,["雷霆一击"]=70,["风之守护"]=70,["召唤天火"]=70,["震摄反杀"]=70,["一手遮天"]=70,["吸蓝大法"]=70,["披荆斩棘"]=70,
["越战越勇"]=70,["自作自受"]=70,["称王称霸"]=70,["高级格挡术"]=70,["降维打击"]=70,["沙城霸主"]=70,["扫黑除恶"]=70,["对怪麻痹"]=70,["打野无忧"]=70,
["意外惊喜"]=70,["唯我独尊"]=70,["复仇之怒"]=70,["绝处逢生"]=70,["枊暗花明"]=70,["有仇必报"]=70,["百战之躯"]=70,["斗转星移"]=70,
--红色buff
["自讨苦吃"]=249,["金刚不坏"]=249,["横行霸道"]=249,["金戈铁马"]=249,["职业克制"]=249,["流星之熵"]=249,["同根相煎"]=249,["破伤之风"]=249,["坚韧不拔"]=249,
["百炼成钢"]=249,["背水一战"]=249,["逐日之熵"]=249,["转身压制"]=249,["障眼之法"]=249,["莽夫之怒"]=249,["状态虚弱"]=249,["噬血之熵"]=249,["破釜沉舟"]=249,["年少得志"]=249,["酒后狂徒"]=249,
}


function addbuttons(actor)
	-- logojiemian(actor) --logo界面
	guajianniu(actor) --挂机按钮
	zhujiemiananniu(actor) --主界面按钮
	bagxianshi(actor) --背包显示
	
	zhuangbeianniu(actor) --装备按钮
	shizhuangjiemian(actor) --时装界面
	baohujiemian(actor) --保护界面
	ditujiemian(actor) --地图界面
	jiuqizhishow(actor) --酒气值显示
	chongzhijiemian(actor) --充值界面
	jiaoyihangjiemian(actor) --交易行界面
	zhuangtaijiemian(actor) --人物状态界面
	shezhijiemian(actor) --设置界面
	fuhuocdxianshi(actor) --复活CD显示
	if getjob(actor) == 0 then --只有战士显示简便移动隔位刺杀按钮
		zhandoujiemian(actor) --战斗界面
	end
	hanghuihanhuaxiangguan(actor)
end

-------------------------行会喊话相关
function hanghuihanhuaxiangguan(actor)
	delbutton(actor,11,1)
	
	if not getbaseinfo(actor,37) and tonumber(getconst(actor,"<$RANK>")) ~= 2 then --不是会长
		return
	end
	
	local msg = ""
	if getispc(actor) then --端游
		if getint(actor,"自动行会喊话") == 0 then
			msg =msg.."<Img|x=52|y=330|img=zh/300.png|link=@setzidonghanhua>"
		else
			msg =msg.."<Img|x=52|y=330|img=zh/301.png|link=@setzidonghanhua>"
		end
		msg =msg.."<RText|x=80|y=332|color=251|outline=2|size=18|text=自动行会喊话>"
		msg =msg..[[<Img|x=199.0|y=327.0|img=zhangheng/139.png|esc=0>
		<Button|x=474.0|y=325.0|color=10051|size=18|nimg=zhangheng/13.png|submitInput=1|text=设置内容|link=@setneirong>
		]]
		msg=msg..'<Input|x=201.0|y=328.0|width=260|height=30|size=16|type=0|inputid=1|color=255|place='.. getstr(actor,"自动喊话内容") ..'>'
	else
		if getint(actor,"自动行会喊话") == 0 then
			msg =msg.."<Img|x=52|y=380|img=zh/300.png|link=@setzidonghanhua>"
		else
			msg =msg.."<Img|x=52|y=380|img=zh/301.png|link=@setzidonghanhua>"
		end
		msg =msg.."<RText|x=80|y=380|color=251|outline=2|size=18|text=自动行会喊话>"
		msg =msg..[[
		<Img|x=199.0|y=377.0|img=zhangheng/139.png|esc=0>
		<Button|x=474.0|y=375.0|color=10051|size=18|nimg=zhangheng/13.png|submitInput=1|text=设置内容|link=@setneirong>
		]]
		msg=msg..'<Input|x=201.0|y=378.0|width=260|height=30|size=16|type=0|inputid=1|color=255|place='.. getstr(actor,"自动喊话内容") ..'>'
	end
	addbutton(actor,11,1,msg)
end

function setzidonghanhua(actor)
	if getint(actor,"自动行会喊话") == 0 then
		setint(actor,"自动行会喊话",1)
	else
		setint(actor,"自动行会喊话",0)
	end
	hanghuihanhuaxiangguan(actor)
end

function setneirong(actor)
	local str = getconst(actor,'<$NPCINPUT(1)>')
	setstr(actor,"自动喊话内容",str)
	sendmsg9(actor,"设置成功")
	hanghuihanhuaxiangguan(actor)
end
------------------------

function fuhuocdxianshi(actor) --复活CD显示
	delbutton(actor,103,33)
	local fuhuocd = getint(actor,"复活CD")
	if fuhuocd > 0 then
		local fuhuojilv = getint(actor,"复活几率")
		local fuhuotime = getint(actor,"复活时间")
		if getispc(actor) then--------端游
			if os.time() - fuhuotime >= fuhuocd then
				str = '<Text|x=188|y=-175|size=12|color=250|outline=1|text=复活CD：已就绪>'
			else
				str = '<Text|x=188|y=-175|size=12|color=250|outline=1|text=复活CD：'.. fuhuocd - (os.time() - fuhuotime) ..'秒>'
			end
			addbutton(actor,103,33,str)
		else --手游
			if os.time() - fuhuotime >= fuhuocd then
				str = '<Text|x=28|y=-25|size=16|color=250|outline=1|text=复活CD：已就绪>'
			else
				str = '<Text|x=28|y=-25|size=16|color=250|outline=1|text=复活CD：'.. fuhuocd - (os.time() - fuhuotime) ..'秒>'
			end
			addbutton(actor,103,33,str)
		end	
	end
end

function shezhijiemian(actor) --设置界面
	delbutton(actor,22,1)
	local msg = ""
	if getispc(actor) then --端游
		if getint(actor,"挂机自动随机") == 0 then
			msg =msg.."<Img|x=482|y=269|img=zh/300.png|link=@setzidongsuiji>"
		else
			msg =msg.."<Img|x=482|y=269|img=zh/301.png|link=@setzidongsuiji>"
		end
		msg =msg.."<RText|x=520|y=268|color=251|outline=2|size=12|text=挂机状态1分钟>"
		msg =msg.."<RText|x=520|y=282|color=251|outline=2|size=12|text=无怪自动随机>"
	else
		if getint(actor,"挂机自动随机") == 0 then
			msg =msg.."<Img|x=200|y=282|img=zh/300.png|link=@setzidongsuiji>"
		else
			msg =msg.."<Img|x=200|y=282|img=zh/301.png|link=@setzidongsuiji>"
		end
		msg =msg.."<RText|x=250|y=282|color=251|outline=2|size=16|text=挂机状态1分钟无怪自动随机>"
	end
	addbutton(actor,22,1,msg)
end

function setzidongsuiji(actor)
	if getint(actor,"挂机自动随机") == 0 then
		setint(actor,"挂机自动随机",1)
	else
		setint(actor,"挂机自动随机",0)
	end
	return shezhijiemian(actor)
end

function zhandoujiemian(actor) --战斗界面
	
	local msg = ""
	if getispc(actor) then --端游
	else
		delbutton(actor,21,1)
		if getint(actor,"显示隔位按钮") == 0 then
			msg =msg.."<Img|x=540|y=312|img=zh/300.png|link=@setzixianshigewei>"
		else
			msg =msg.."<Img|x=540|y=312|img=zh/301.png|link=@setzixianshigewei>"
		end
		msg =msg.."<RText|x=589|y=302|color=251|outline=2|size=16|text=显示移动隔位>"
		msg =msg.."<RText|x=589|y=322|color=251|outline=2|size=16|text=刺杀简便按钮>"
		
		if getint(actor,"移动隔位已开启") == 0 then
			msg =msg.."<Img|x=540|y=353|img=zh/300.png>"
		else
			msg =msg.."<Img|x=540|y=353|img=zh/301.png>"
		end
		msg =msg.."<Layout|x=541.0|y=356.0|width=145|height=24|link=@yidonggeweikongzhi>"
		addbutton(actor,21,1,msg)
		delbutton(actor,104,4)
		if getint(actor,"显示隔位按钮") == 1 then
			if getint(actor,"移动隔位已开启") == 1 then
				msg = msg..'<Button|x=-303|y=-335|mimg=private/main/bottom/1900013011.png|color=255|nimg=zhangheng/311.png|link=@yidonggeweikongzhi>' --隔位刺杀按钮
			else
				msg = msg..'<Button|x=-303|y=-335|mimg=private/main/bottom/1900013011.png|grey=1|color=255|nimg=zhangheng/311.png|link=@yidonggeweikongzhi>' --隔位刺杀按钮
			end
		end
		addbutton(actor,104,4,msg)
	end
end

function yidonggeweikongzhi(actor)
	if getint(actor,"移动隔位已开启") == 1 then
		setint(actor,"移动隔位已开启",0)
		sendluamsg(actor, 105, 0, 0, 0, "0")
	else
		setint(actor,"移动隔位已开启",1)
		sendluamsg(actor, 105, 0, 0, 0, "1")
	end
	return zhandoujiemian(actor)
end

function setzixianshigewei(actor)
	if getint(actor,"显示隔位按钮") == 0 then
		setint(actor,"显示隔位按钮",1)
	else
		setint(actor,"显示隔位按钮",0)
	end
	return zhandoujiemian(actor)
end

-----------------------

function ditujiemian(actor)
	--sendmsg9(actor,"进入地图界面")
	delbutton(actor,8,1)
	local kechuansong = false
	local cszcs = 0 --每日总的可传送次数
	if getbaseinfo(actor,39) >= 10 then -- 10级转生有20次
		cszcs = cszcs + 20
	end
	if getint(actor,"武穆遗书3编号")==27 then
		cszcs = cszcs + 50
	end
	
	if getint(actor,"武穆遗书3编号")==28 then
		cszcs = cszcs + 25
	end
	if getdayint(actor,"每日传送次数") < cszcs then
		kechuansong = true
	end
	
	if getbaseinfo(actor,39) < 10 then
		kechuansong = false
		setint(actor,"是否传送",0)
	end
	
	local msg = ""
	if kechuansong then --可以传送再显示
		if getispc(actor) then --端游
			if getint(actor,"是否传送") == 0 then
				msg =msg.."<Img|x=90.5|y=397.5|img=zh/77.png|link=@setchuansong>"
			else
				msg =msg.."<Img|x=90.5|y=397.5|img=zh/78.png|link=@setchuansong>"
			end
			msg =msg.."<RText|ax=0.5|ay=0.5|x=200.5|y=412.5|color=251|outline=2|size=16|text=每日可传送次数 <".. getdayint(actor,"每日传送次数") .."/FCOLOR=250>/".. cszcs ..">"
		else
			if getint(actor,"是否传送") == 0 then
				msg =msg.."<Img|x=10.5|y=445.5|img=zh/77.png|link=@setchuansong>"
			else
				msg =msg.."<Img|x=10.5|y=445.5|img=zh/78.png|link=@setchuansong>"
			end
			msg =msg.."<RText|ax=0.5|ay=0.5|x=130.5|y=460.5|color=251|outline=2|size=18|text=每日可传送次数 <".. getdayint(actor,"每日传送次数") .."/FCOLOR=250>/".. cszcs ..">"
		end
	end
	if getispc(actor) then --端游
	else
		msg = msg..'<Button|width=120|x=575|y=445|color=251|nimg=zh/20.png|outline=1|text=使用随机|link=@xiaoditusuiji>'
	end
	addbutton(actor,8,1,msg)
end

function setchuansong(actor)
	if getint(actor,"是否传送") == 0 then
		setint(actor,"是否传送",1)
	else
		setint(actor,"是否传送",0)
	end
	return ditujiemian(actor)
end

function xiaoditusuiji(actor)
	if itemcount(actor,"随机传送石") > 0 then
		eatitem(actor,"随机传送石",1)
		return
	elseif itemcount(actor,"永久随机石") > 0 then
		eatitem(actor,"永久随机石",1)
		return
	end
	sendmsg9(actor,"没有随机传送石")
end

function baohujiemian(actor) --保护界面
	delbutton(actor,303 ,1)
	local msg = ""
	setplaydef(actor,"N51",getint(actor,"红量恢复百分比"))
	setplaydef(actor,"N52",getint(actor,"蓝量恢复百分比"))
	if getispc(actor) then --端游
		msg = "<Img|x=0|y=225|img=zhangheng/235.png|esc=0>"
		msg = msg.."<RText|x=10.0|y=362.0|color=255|size=16|outline=1|text=提示:<先设置自动回血百分比,再点击前面勾选即可/FCOLOR=254> <存储量为0时,请前往土城药店购买/FCOLOR=250>>"
		
		---红
		msg = msg .."<Text|ax=0.5|ay=0.5|x=120.5|y=247.5|size=16|outline=1|color=255|text=生命值低于$STM(SLIDERV_N51)% 自动恢复>"
		--msg = msg .."<RText|ax=0.5|ay=0.5|x=120.5|y=247.5|size=16|outline=1|color=255|text=生命值低于<".. getint(actor,"红量恢复百分比") .."%/FCOLOR=31> 自动恢复>"
		msg = msg .."<Slider|sliderid=N51|x=47.0|y=265.0|width=150|height=14|defvalue=".. getint(actor,"红量恢复百分比") .."|bgimg=public/bg_szjm_01.png|barimg=public/bg_szjm_02.png|ballimg=public/bg_szjm_02_1.png|link=@lagan,1>"				
		if getint(actor,"红量自动恢复") == 0 then
			msg = msg .."<Img|x=244.0|y=258.0|img=zh/77.png|link=@baohugouxuan,1>"
		else
			msg = msg .."<Img|x=244.0|y=258.0|img=zh/78.png|link=@baohugouxuan,1>"
		end
		
		---蓝
		msg = msg .."<Text|ax=0.5|ay=0.5|x=120.5|y=307.5|outline=1|color=255|size=16|text=魔法值低于$STM(SLIDERV_N52)% 自动恢复>"	
		--msg = msg .."<RText|ax=0.5|ay=0.5|x=120.5|y=307.5|outline=1|color=255|size=16|text=魔法值低于<".. getint(actor,"蓝量恢复百分比") .."%/FCOLOR=154> 自动恢复>"		
		msg = msg .."<Slider|sliderid=N52|x=47.0|y=325.0|width=150|height=14|defvalue=".. getint(actor,"蓝量恢复百分比") .."|bgimg=public/bg_szjm_01.png|barimg=public/bg_szjm_02.png|ballimg=public/bg_szjm_02_1.png|link=@lagan,2>"
		if getint(actor,"蓝量自动恢复") == 0 then
			msg = msg .."<Img|x=244.0|y=318.0|img=zh/77.png|link=@baohugouxuan,2>"
		else
			msg = msg .."<Img|x=244.0|y=318.0|img=zh/78.png|link=@baohugouxuan,2>"
		end
		
	else	--手游
		msg = "<Img|x=0|y=260|img=zhangheng/235.png|esc=0>"
		msg = msg.."<RText|x=70.0|y=402.0|color=255|size=16|outline=1|text=提示:<先设置自动回血百分比,再点击前面勾选即可/FCOLOR=254> <存储量为0时,请前往土城药店购买/FCOLOR=250>>"
		
		---红
		msg = msg .."<Text|ax=0.5|ay=0.5|x=146.5|y=287.5|size=16|outline=1|color=255|text=生命值低于$STM(SLIDERV_N51)% 自动恢复>"
		--msg = msg .."<RText|ax=0.5|ay=0.5|x=146.5|y=287.5|size=16|outline=1|color=255|text=生命值低于<".. getint(actor,"红量恢复百分比") .."%/FCOLOR=31> 自动恢复>"
		msg = msg .."<Slider|sliderid=N51|x=41.0|y=305.0|width=210|height=14|defvalue=".. getint(actor,"红量恢复百分比") .."|bgimg=public/bg_szjm_01.png|barimg=public/bg_szjm_02.png|ballimg=public/bg_szjm_02_1.png|link=@lagan,1>"				
		if getint(actor,"红量自动恢复") == 0 then
			msg = msg .."<Img|x=324.0|y=298.0|img=zh/77.png|link=@baohugouxuan,1>"
		else
			msg = msg .."<Img|x=324.0|y=298.0|img=zh/78.png|link=@baohugouxuan,1>"
		end
		
		---蓝
		msg = msg .."<Text|ax=0.5|ay=0.5|x=146.5|y=347.5|outline=1|color=255|size=16|text=魔法值低于$STM(SLIDERV_N52)% 自动恢复>"		
		--msg = msg .."<RText|ax=0.5|ay=0.5|x=146.5|y=347.5|outline=1|color=255|size=16|text=魔法值低于<".. getint(actor,"蓝量恢复百分比") .."%/FCOLOR=154> 自动恢复>"		
		msg = msg .."<Slider|sliderid=N52|x=41.0|y=365.0|width=210|height=14|defvalue=".. getint(actor,"蓝量恢复百分比") .."|bgimg=public/bg_szjm_01.png|barimg=public/bg_szjm_02.png|ballimg=public/bg_szjm_02_1.png|link=@lagan,2>"
		if getint(actor,"蓝量自动恢复") == 0 then
			msg = msg .."<Img|x=324.0|y=358.0|img=zh/77.png|link=@baohugouxuan,2>"
		else
			msg = msg .."<Img|x=324.0|y=358.0|img=zh/78.png|link=@baohugouxuan,2>"
		end
		
	end
	addbutton(actor,303 ,1,msg)
	chuliangxiangshi(actor) --储量显示
end

function chuliangxiangshi(actor) --红蓝储量显示
	delbutton(actor,303,2)
	local msg = ""
	if getispc(actor) then --端游
		msg = msg .."<RText|ay=0.5|x=282.0|y=272.5|color=31|outline=1|size=16|text=ＨＰ 每秒恢复15点　当前已存储 ".. getint(actor,"存储红量") .."点>"
		msg = msg .."<RText|ay=0.5|x=282.0|y=331.5|color=154|outline=1|size=16|text=ＭＰ 每秒恢复20点　当前已存储 ".. getint(actor,"存储蓝量") .."点>"
	else
		msg = msg .."<RText|ay=0.5|x=362.0|y=312.5|color=31|outline=1|size=16|text=ＨＰ 每秒恢复15点　当前已存储 ".. getint(actor,"存储红量") .."点>"
		msg = msg .."<RText|ay=0.5|x=362.0|y=371.5|color=154|outline=1|size=16|text=ＭＰ 每秒恢复20点　当前已存储 ".. getint(actor,"存储蓝量") .."点>"
	end
	addbutton(actor,303,2,msg)
end

function baohugouxuan(actor,par)
	if par == "1" then
		if getint(actor,"红量自动恢复") == 0 then
			setint(actor,"红量自动恢复",1)
		else
			setint(actor,"红量自动恢复",0)
		end
	else
		if getint(actor,"蓝量自动恢复") == 0 then
			setint(actor,"蓝量自动恢复",1)
		else
			setint(actor,"蓝量自动恢复",0)
		end
	end
	return baohujiemian(actor)
end

function lagan(actor,par)
	--sendmsg6(actor,"拉了")
	if par == "1" then
		setint(actor,"红量恢复百分比",getplaydef(actor,"N51"))
	else
		setint(actor,"蓝量恢复百分比",getplaydef(actor,"N52"))
	end
	return baohujiemian(actor)
end

---时装界面换成兽魂界面
function shizhuangjiemian(actor)
	delbutton(actor,39,1)
	local data = {"","","","","",""}
	local sh_str = getstr(actor,"兽魂buff数据")
	if sh_str ~= "" then
		data=json2tbl(sh_str)
	end
	local msg = ""
	if getispc(actor) then --端游
		msg = "<Img|x=0|y=0|img=zhangheng/207.png|esc=0>"
		for i = 1,6 do
			local ysy = 70
			if i > 3 then
				ysy = 72
			end
			local color = sh_yanse_t[data[i]] or 255
			if data[i] ~= "" then
				msg = msg.."<Text|ax=0.5|ay=0.5|x=150.0|y=".. ysy+(i-1)*49 .."|size=16|outline=1|color=".. color .."|text=".. data[i] ..">"
				msg = msg.."<Button|x=22.0|y=".. ysy-20+(i-1)*49 .."|width=40|height=40|color=250|size=18|nimg=zh/1.png|pimg=zh/1.png|opacity=0|tips=<"..data[i]..":/FCOLOR="..color..">\\".. sh_jieshao_t[data[i]] ..">"

			else
				msg = msg.."<Text|ax=0.5|ay=0.5|x=150.0|y=".. ysy+(i-1)*49 .."|size=16|outline=1|color=10|text=未获得>"
			end
		end
	else
		msg = "<Img|x=0|y=0|width=348|height=478|img=zhangheng/208.png|esc=0>"
		for i = 1,6 do
			local ysy = 100
			if i > 3 then
				ysy = 102
			end
			local color = sh_yanse_t[data[i]] or 255
			if data[i] ~= "" then
				msg = msg.."<Text|ax=0.5|ay=0.5|x=200.0|y=".. ysy+(i-1)*67 .."|size=18|outline=1|color=".. color .."|text=".. data[i] ..">"
				msg = msg.."<Button|x=22.0|y=".. 71+(i-1)*67 .."|width=263|height=60|color=250|size=18|nimg=zh/1.png|pimg=zh/1.png|opacity=0|tips=<"..data[i]..":/FCOLOR="..color..">\\".. sh_jieshao_t[data[i]] ..">"

			else
				msg = msg.."<Text|ax=0.5|ay=0.5|x=200.0|y=".. ysy+(i-1)*67 .."|size=18|outline=1|color=10|text=未获得>"
			end
		end
	end
	addbutton(actor,39,1,msg)
end
--查看其他玩家
function lookhuminfo(actor)
	local othername = getconst(actor,"<$LOOKHUMNAME>") --其他玩家名字
	delbutton(actor,3901,1)
	local player = getplayerbyname(othername)
	if not player then
		if getispc(actor) then --端游
			msg = "<Img|x=0|y=0|img=zhangheng/207.png|esc=0>"
		else
			msg = "<Img|x=0|y=0|width=348|height=478|img=zhangheng/208.png|esc=0>"
		end
		addbutton(actor,3901,1,msg)
		return
	end
	
	local data = {"","","","","",""}
	local sh_str = getstr(player,"兽魂buff数据")
	if sh_str ~= "" then
		data=json2tbl(sh_str)
	end
	local msg = ""
	if getispc(actor) then --端游
		msg = "<Img|x=0|y=0|img=zhangheng/207.png|esc=0>"
		for i = 1,6 do
			local ysy = 70
			if i > 3 then
				ysy = 72
			end
			local color = sh_yanse_t[data[i]] or 255
			if data[i] ~= "" then
				msg = msg.."<Text|ax=0.5|ay=0.5|x=150.0|y=".. ysy+(i-1)*49 .."|size=16|outline=1|color=".. color .."|text=".. data[i] ..">"
				msg = msg.."<Button|x=22.0|y=".. ysy-20+(i-1)*49 .."|width=40|height=40|color=250|size=18|nimg=zh/1.png|pimg=zh/1.png|opacity=0|tips=<"..data[i]..":/FCOLOR="..color..">\\".. sh_jieshao_t[data[i]] ..">"

			else
				msg = msg.."<Text|ax=0.5|ay=0.5|x=150.0|y=".. ysy+(i-1)*49 .."|size=16|outline=1|color=10|text=未获得>"
			end
		end
	else
		msg = "<Img|x=0|y=0|width=348|height=478|img=zhangheng/208.png|esc=0>"
		for i = 1,6 do
			local ysy = 100
			if i > 3 then
				ysy = 102
			end
			local color = sh_yanse_t[data[i]] or 255
			if data[i] ~= "" then
				msg = msg.."<Text|ax=0.5|ay=0.5|x=200.0|y=".. ysy+(i-1)*67 .."|size=18|outline=1|color=".. color .."|text=".. data[i] ..">"
				msg = msg.."<Button|x=22.0|y=".. 71+(i-1)*67 .."|width=263|height=60|color=250|size=18|nimg=zh/1.png|pimg=zh/1.png|opacity=0|tips=<"..data[i]..":/FCOLOR="..color..">\\".. sh_jieshao_t[data[i]] ..">"

			else
				msg = msg.."<Text|ax=0.5|ay=0.5|x=200.0|y=".. ysy+(i-1)*67 .."|size=18|outline=1|color=10|text=未获得>"
			end
		end
	end
	addbutton(actor,3901,1,msg)
	
	qitawanjiawuxing(actor)
	
	
end

------装备界面五行图标
local zbxs = {"zhangheng/106.png","zhangheng/107.png","zhangheng/108.png","zhangheng/109.png","zhangheng/110.png"}
function zhuangbeianniu(actor)
	delbutton(actor,3001,13)
	if getint(actor,"五行当前属性") == 0 then
		return
	end
	local msg = ""
	if getispc(actor) then --端游
		msg = "<Button|x=190|y=30|nimg="..zbxs[getint(actor,"五行当前属性")].."|link=@openwuxin>"
	else
		msg = "<Button|x=250|y=70|nimg="..zbxs[getint(actor,"五行当前属性")].."|link=@openwuxin>"
	end
	addbutton(actor,3001,13,msg)
end

function openwuxin(actor)
	callscriptex(actor, "CallLua", "wuxingzhili", "qiehuan")
end

function qitawanjiawuxing(actor)
	local othername = getconst(actor,"<$LOOKHUMNAME>") --其他玩家名字
	local player = getplayerbyname(othername)
	delbutton(actor,3002,13)
	if getint(player,"五行当前属性") == 0 then
		return
	end
	local msg = ""
	if getispc(actor) then --端游
		msg = "<Button|x=190|y=30|nimg="..zbxs[getint(player,"五行当前属性")]..">"
	else
		msg = "<Button|x=250|y=70|nimg="..zbxs[getint(player,"五行当前属性")]..">"
	end
	addbutton(actor,3002,13,msg)
end


-------------------常用功能按钮段
function zhujiemiananniu(actor) --主界面按钮 主要添加手游
	local msg = ""
	if getispc(actor) then --端游
		msg = '<Button|x=-61|y=-387|color=255|nimg=tubiao/61.png|link=@openmianban,35>' --交易行按钮 店字小按钮
		addbutton(actor,104,2,msg)
	else
		----手游商城排行榜按钮
		msg = '<Button|x=-240|y=-65|pimg=private/main/Button_3/1900012059.png|mimg=private/main/Button_3/1900012058.png|color=255|nimg=private/main/Button_3/1900012058.png|link=@openmianban,9>' --商城
		msg = msg..'<Button|x=-130|y=-65|pimg=private/main/Button_3/1900012055.png|mimg=private/main/Button_3/1900012054.png|color=255|nimg=private/main/Button_3/1900012054.png|link=@openmianban,32>' --排行榜
		addbutton(actor,108,11,msg)
		----手游角色背包按钮
		msg = '<Button|x=-194|y=-441|mimg=tubiao/61.png|color=255|nimg=tubiao/61.png|link=@openmianban,35>' --交易
		msg = msg..'<Button|x=-130|y=-445|mimg=private/main/bottom/1900013010.png|color=255|nimg=private/main/bottom/1900013010.png|link=@openmianban,1>' --角色
		msg = msg..'<Button|x=-63|y=-445|mimg=private/main/bottom/1900013011.png|color=255|nimg=private/main/bottom/1900013011.png|link=@openmianban,7>' --背包
		addbutton(actor,104,2,msg)
		
		----技能框里面切换按钮
		msg = '<Button|x=22|y=30|mimg=private/main/bottom/1900013012.png|color=255|nimg=private/main/bottom/1900013012.png|link=@openmianban,4>' --技能
		msg = msg..'<Button|x=92|y=30|mimg=private/main/bottom/1900013014.png|color=255|nimg=private/main/bottom/1900013014.png|link=@openmianban,17>' --组队
		msg = msg..'<Button|x=162|y=30|mimg=private/main/bottom/1900013013.png|color=255|nimg=private/main/bottom/1900013013.png|link=@openmianban,31>' --行会
		--msg = msg..'<Button|x=22|y=100|mimg=private/main/bottom/1900013019.png|color=255|nimg=private/main/bottom/1900013019.png|link=@openmianban,27>' --拍卖行
		
		if getconst(actor,"<$DEALFTF>") == "1" then --开启了面对面交易
			msg = msg..'<Button|x=92|y=100|mimg=private/main/bottom/1900013015.png|color=255|nimg=private/main/bottom/1900013015.png|link=@openmianban,33>' --面对面交易
			msg = msg..'<Button|x=162|y=100|mimg=private/main/bottom/1900013017.png|color=255|nimg=private/main/bottom/1900013017.png|link=@openmianban,23>' --设置
			msg = msg..'<Button|x=162|y=170|mimg=private/main/bottom/1900013018.png|color=255|nimg=private/main/bottom/1900013018.png|link=@openmianban,34>' --小腿
		else
			msg = msg..'<Button|x=92|y=100|mimg=private/main/bottom/1900013017.png|color=255|nimg=private/main/bottom/1900013017.png|link=@openmianban,23>' --设置
			msg = msg..'<Button|x=162|y=100|mimg=private/main/bottom/1900013018.png|color=255|nimg=private/main/bottom/1900013018.png|link=@openmianban,34>' --小腿
		end
		addbutton(actor,109,1,msg)
	end
end

function openmianban(actor,mianbanid) --打开面板
	mianbanid = tonumber(mianbanid)
	openhyperlink(actor,mianbanid,0)
end
--------------------常用功能按钮段结束

----------挂机功能段
function guajianniu(actor)
-------挂机按钮
	local msg = ""
	if getispc(actor) then
		msg = '<Button|x=-60|y=-450|color=251|mimg=private/main/Skill/1900012708.png|size=16|nimg=private/main/Skill/1900012708.png|pimg=private/main/Skill/1900012708.png|link=@startguaji>'
	else
		msg = '<Button|x=-127|y=-374|color=251|mimg=private/main/Skill/1900012708.png|size=16|nimg=private/main/Skill/1900012708.png|pimg=private/main/Skill/1900012708.png|link=@startguaji>'	
	end
	addbutton(actor,104,1,msg)
-------挂机按钮结束
end

function startguaji(actor)
	if getplaydef(actor,"N$挂机状态") == 0 then
		setplaydef(actor,"N$挂机状态",1)
	else
		return
	end
	startautoattack(actor) --开启自动挂机
	
	local msg = ""
	if getispc(actor) then
		msg = '<Button|x=-60|y=-450|color=251|mimg=private/main/Skill/1900012709.png|size=16|nimg=private/main/Skill/1900012709.png|pimg=private/main/Skill/1900012709.png|link=@stopguaji>'
		msg = msg..'<Effect|x=-31|y=-421|scale=0.595|speed=1|effecttype=0|effectid=4005|act=0|dir=5>'
	else
		msg = '<Button|x=-127|y=-374|color=251|mimg=private/main/Skill/1900012709.png|size=16|nimg=private/main/Skill/1900012709.png|pimg=private/main/Skill/1900012709.png|link=@stopguaji>'
		msg = msg..'<Effect|x=-98|y=-345|scale=0.595|speed=1|effecttype=0|effectid=4005|act=0|dir=5>'
	end
	delbutton(actor,104,1)
	addbutton(actor,104,1,msg)
end

function stopguaji(actor)
	if getplaydef(actor,"N$挂机状态") == 1 then
		setplaydef(actor,"N$挂机状态",0)
	else
		return
	end
	stopautoattack(actor) --停止自动挂机
	
	local msg = ""
	if getispc(actor) then
		msg = '<Button|x=-60|y=-450|color=251|mimg=private/main/Skill/1900012708.png|size=16|nimg=private/main/Skill/1900012708.png|pimg=private/main/Skill/1900012708.png|link=@startguaji>'
	else
		msg = '<Button|x=-127|y=-374|color=251|mimg=private/main/Skill/1900012708.png|size=16|nimg=private/main/Skill/1900012708.png|pimg=private/main/Skill/1900012708.png|link=@startguaji>'
	end
	delbutton(actor,104,1)
	addbutton(actor,104,1,msg)
end
function startautoplaygame(actor) --开始挂机触发
	setint(actor,"最后出刀时间",os.time())
	--sendmsg6(actor,"开始挂机")
end
function stopautoplaygame(actor) --停止挂机触发
	--sendmsg6(actor,"停止挂机")
	stopguaji(actor)
end
------------挂机功能段结束

---------背包按钮、货币显示
function bagxianshi(actor)
	local msg = ""
	if getispc(actor) then --电脑端
		--元宝
		msg = msg..'<Img|x=21|y=257|img=zh/70.png>'
		
		msg = msg..'<Img|x=10|y=232|img=zhangheng/88.png|opacity=0|link=@kong>' --挡住丢金币按钮
		
		msg = msg .. '<Text|x=80.0|y=248.0|color=255|size=14|outline=1|text=$STM(MONEY_2)>'
		------货币
		msg = msg .. '<Text|x=80.0|y=292.0|color=255|size=14|outline=1|text=金币:  $STM(MONEY_7)>'
		msg = msg .. '<Text|x=80.0|y=316.0|color=255|size=14|outline=1|text=绑金:  $STM(MONEY_8)>'
		------按钮
		msg = msg .. '<Button|x=260|y=240|color=255|size=15|nimg=zhangheng/269.png|text=刷新背包|link=@open_zhenglibag>'
		msg = msg .. '<Button|x=203|y=300|color=255|size=15|nimg=zhangheng/269.png|text=在线仓库|link=@open_cangku>'
		msg = msg .. '<Button|x=288|y=300|color=255|size=15|nimg=zhangheng/269.png|text=在线回收|link=@open_huishou>'
	else
		--元宝
		msg = msg..'<Img|x=13|y=360|img=zh/70.png>'
		msg = msg..'<Img|x=0|y=338|img=zhangheng/88.png|opacity=0|link=@kong>' --挡住丢金币按钮
		----背包货币显示
		msg = msg .. '<Text|x=80.0|y=347.0|outline=1|size=18|text=$STM(MONEY_2)>'
		--msg = msg .. '<Img|x=71.0|y=396.0|width=170|height=22|esc=0|img=zh/15.png>'
		msg = msg .. '<Text|x=76.0|y=396.0|color=255|size=18|outline=1|text=金币: $STM(MONEY_7)>'
		--msg = msg .. '<Img|x=71.0|y=428.0|width=170|height=22|esc=0|img=zh/15.png>'
		msg = msg .. '<Text|x=76.0|y=422.0|outline=1|color=255|size=18|text=绑金: $STM(MONEY_8)>'

		-------按钮
		msg = msg .. '<Button|x=323.0|y=343.0|width=100|height=30|mimg=public/1900000652.png|size=18|color=251|outline=2|nimg=public/1900000652.png|text=刷新背包|link=@open_zhenglibag>'
		msg = msg .. '<Button|x=252.0|y=408.0|width=100|height=30|mimg=public/1900000652.png|size=18|color=251|outline=2|nimg=public/1900000652.png|text=在线仓库|link=@open_cangku>'
		msg = msg .. '<Button|x=395.0|y=408.0|width=100|height=30|mimg=public/1900000652.png|size=18|color=251|outline=2|nimg=public/1900000652.png|text=在线回收|link=@open_huishou>'

	end
	
	
	addbutton(actor,7,1,parsetext(msg,actor))
	
	--------手游上部货币显示
	if not getispc(actor) then
		local str = '<Img|x=0|y=0|width=264|height=35|img=zh/24.png>'
		str = str..'<Img|x=0|y=0|width=264|height=35|img=zh/24.png>'
		str = str..'<Img|x=10|y=7|img=item/item_0/000115.png>'
		str = str..'<Text|x=45|y=3|size=18|simplenum=1|outline=1|text='.. getbindgold(actor) ..'>'
		str = str..'<Img|x=130|y=1|width=36|height=29|img=item/item_0/000124.png>'
		str = str..'<Text|x=170|y=3|size=18|simplenum=1|outline=1|text=$STM(MONEY_2)>'
		str = str..'<Img|width=110|height=35|color=255|img=public/0.png|link=@huobuxianshi,1>'
		str = str..'<Img|x=132.0|y=0.0|width=110|height=35|img=public/0.png|link=@huobuxianshi,2>'
		--str = str..'<Img|x=410|y=-2|width=41|height=33|img=item/item_1/000044.png>'
		--str = str..'<Text|x=455|y=1|size=20|text=$STM(MONEY_15)>'
		--str = str..'<Img|x=580|y=0|width=35|height=27|img=item/item_0/002759.png>'
		--str = str..'<Text|x=620|y=1|size=20|text=$STM(MONEY_10)>'
		addbutton(actor,101,1,parsetext(str,actor))
	else --端游
		local str = '<Img|x=0|y=0|width=222|height=35|img=zh/24.png>'
		str = str..'<Img|x=0|y=0|width=222|height=35|img=zh/24.png>'
		str = str..'<Img|x=10|y=7|img=item/item_0/000115.png>'
		str = str..'<Text|x=45|y=6|size=18|simplenum=1|outline=1|text='.. getbindgold(actor) ..'>'
		str = str..'<Img|x=120|y=1|width=36|height=29|img=item/item_0/000124.png>'
		str = str..'<Text|x=160|y=6|size=18|simplenum=1|outline=1|text=$STM(MONEY_2)>'
		str = str..'<Img|width=110|height=35|color=255|img=public/0.png|link=@huobuxianshi,1>'
		str = str..'<Img|x=122.0|y=0.0|width=110|height=35|img=public/0.png|link=@huobuxianshi,2>'
		--str = str..'<Img|x=410|y=-2|width=41|height=33|img=item/item_1/000044.png>'
		--str = str..'<Text|x=455|y=1|size=20|text=$STM(MONEY_15)>'
		--str = str..'<Img|x=580|y=0|width=35|height=27|img=item/item_0/002759.png>'
		--str = str..'<Text|x=620|y=1|size=20|text=$STM(MONEY_10)>'
		addbutton(actor,101,1,parsetext(str,actor))
	end
end

function shanchuxianshi(actor)
	delbutton(actor,101,2)
end

function huobuxianshi(actor,par)
	local msg = ""
	if par == "1" then
		msg = [[
		<Img|x=3.0|y=35.0|width=220|height=185|scale9r=5|scale9t=5|scale9l=5|img=zh/33.png|scale9b=5|esc=0>
<RText|x=11.0|y=40.0|color=251|size=16|text=金币>
<RText|x=11.0|y=65.0|color=255|size=16|text=玛法大陆流通的主要货币>
<RText|x=11.0|y=90.0|color=255|size=16|text=通过<回收装备/FCOLOR=250>获得>
<RText|x=11.0|y=115.0|size=16|color=255|text=可将金币兑换成金条在拍>
<RText|x=12.0|y=140.0|size=16|color=255|text=卖行交易换取元宝>

		]]
		msg=msg..'<RText|x=11.0|y=165.0|size=16|color=251|text=拥有金币：<'.. getgold(actor) ..'/FCOLOR=250>>'
		msg=msg..'<RText|x=11.0|y=190.0|size=16|color=251|text=拥有绑金：<'.. getbindjinbi(actor) ..'/FCOLOR=250>>'
		msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|link=@shanchuxianshi>"
	else
		msg = [[
		<Img|x=3.0|y=35.0|width=220|height=110|scale9r=5|scale9t=5|scale9b=5|img=zh/33.png|scale9l=5|esc=0>
		<RText|x=11.0|y=40.0|size=16|color=251|text=元宝>
		<RText|x=11.0|y=65.0|size=16|color=255|text=可用于购买商城道具>
		<RText|x=11.0|y=90.0|size=16|color=255|text=<拍卖行流通货币/FCOLOR=250>>
		]]
		msg=msg..'<RText|x=11.0|y=115.0|color=251|size=16|text=拥有元宝：'.. getingot(actor) ..'>'
		msg=msg.."<Layout|x=-1000|y=-1000|width=3000|height=3000|link=@shanchuxianshi>"
	end
	addbutton(actor,101,2,msg)
end


function open_zhenglibag(actor)
	refreshbag(actor)
end
function open_huishou(actor)
	huishoushow(actor)
end
function open_cangku(actor)
	openstorage(actor)
end
---------背包按钮、货币显示结束

function jiuqizhishow(actor) --酒气值显示
	delbutton(actor,104,4)
	local item = linkbodyitem(actor,16) --盾位置装备 酒葫芦
	if item ~= "0" then
		local jy = getitem_jiuqizhi(actor,item) --酒气值
		if getispc(actor) then--------端游
			local str = '<Img|x=-193|y=-150|width=20|height=154|img=zh/106.png>'
			if jy >= 10000 then
				str = str..'<PercentImg|direction=2|x=-193|y=-150|width=20|height=154|minValue='.. jy ..'|maxValue=10000|img=zh/104.png>'
			else
				str = str..'<PercentImg|direction=2|x=-193|y=-150|width=20|height=154|minValue='.. jy ..'|maxValue=10000|img=zh/107.png>'
			end
			--str = str..'<Text|x=-255|y=-172|size=12|simplenum=1|color=251|outline=1|text=酒气值：'.. jy ..'>'
			addbutton(actor,104,4,str)
		else --手游
			sendluamsg(actor, 104, 0, 0, 0, tostring(jy)) --发送给前端酒气值
			--local str = ''
			--local str = '<Img|x=-170|y=-123|img=private/main/angerBg2.png|width=10|height=70|scale9r=2|scale9b=2|scale9l=2|scale9t=2|>'
			--str = str..'<Img|x=-169|y=-123|img=private/main/angerBg.png|width=7|height=70>'
			--str = str..'<PercentImg|direction=2|x=-167|y=-120|minValue='.. jy ..'|maxValue=10000|img=private/main/angerBar.png|width=7|height=68>'
			--str = str..'<Text|x=-110|y=-105|size=14|simplenum=1|color=250|outline=1|text=酒气值\\'.. jy ..'>'
			--addbutton(actor,108,4,str)
		end
	end
	
end

function chongzhijiemian(actor) --充值界面
	if getispc(actor) then--------端游
		local str = '<Button|x=210|y=44|nimg=zh/201.png|mimg=zh/201.png|pimg=zh/201.png|link=@kong>'
		str = str..[[
			<RText|x=30|y=240|color=255|size=18|outline=1|text=单笔充值达到<1000/FCOLOR=250>>
			<RText|x=188.0|y=240.0|color=255|size=18|outline=1|text=额外赠送<10%/FCOLOR=253>>
			]]
		if getint(actor,"累计充值") >= 1000 then
			str = str..'<RText|x=30|y=270|color=255|size=18|outline=1|text=单笔充值达到<5000/FCOLOR=250>>'
			str = str..'<RText|x=188.0|y=270.0|color=255|size=18|outline=1|text=额外赠送<20%/FCOLOR=253>>'
		end
		if getint(actor,"累计充值") >= 5000 then
			str = str..'<RText|x=30|y=300|color=255|size=18|outline=1|text=单笔充值达到<10000/FCOLOR=250>>'
			str = str..'<RText|x=188.0|y=300.0|color=255|size=18|outline=1|text=额外赠送<30%/FCOLOR=253>>'
		end
		addbutton(actor,40,1,str)
	else --手游
		local str = '<Button|x=230|y=44|nimg=zh/202.png|mimg=zh/202.png|pimg=zh/202.png|link=@kong>'
		str = str..[[
			<RText|x=30|y=270|color=255|size=18|outline=1|text=单笔充值达到<1000/FCOLOR=250>>
			<RText|x=188.0|y=270.0|color=255|size=18|outline=1|text=额外赠送<10%/FCOLOR=253>>
			]]
		if getint(actor,"累计充值") >= 1000 then
			str = str..'<RText|x=30|y=300|color=255|size=18|outline=1|text=单笔充值达到<5000/FCOLOR=250>>'
			str = str..'<RText|x=188.0|y=300.0|color=255|size=18|outline=1|text=额外赠送<20%/FCOLOR=253>>'
		end
		if getint(actor,"累计充值") >= 5000 then
			str = str..'<RText|x=30|y=330|color=255|size=18|outline=1|text=单笔充值达到<10000/FCOLOR=250>>'
			str = str..'<RText|x=188.0|y=330.0|color=255|size=18|outline=1|text=额外赠送<30%/FCOLOR=253>>'
		end
		addbutton(actor,40,1,str)
	end
end

function jiaoyihangjiemian(actor) --交易行界面
	if getispc(actor) then--------端游
		local str = '<RText|x=5|y=367|color=251|size=13|outline=1|text=金币需兑换成金条后寄售交易>'
		addbutton(actor,29,1,str)
	else --手游
		local str = '<RText|x=20|y=407|color=251|size=18|outline=1|text=金币需兑换成金条后寄售交易>'
		addbutton(actor,29,1,str)
	end
end

function zhuangtaijiemian(actor) --人物状态界面
	if getispc(actor) then--------端游
		local str = '<Img|x=127|y=45|img=zh/203.png>'
		str = str..'<Text|x=131|y=49|color=255|size=12|outline=1|text='.. getjingyan(actor) ..'>'
		addbutton(actor,4,1,str)
		local msg = "<PercentImg|direction=0|x=-136|y=-71|minValue=".. getjingyan(actor) .."|maxValue=".. getbaseinfo(actor, 14) .."|img=private/main-win32/00000041.png>"
		msg = msg.."<Img|x=-136|y=-71|opacity=0|tips={当前经验：".. string.format("%0.2f",getjingyan(actor)/getbaseinfo(actor, 14)*100) .."%/FCOLOR=255}|img=private/main-win32/00000041.png>"
		addbutton(actor,104,51,msg)
	else --手游
		local str = '<Img|x=170|y=53|img=zh/204.png>'
		str = str..'<Text|x=176|y=55|color=255|size=16|outline=1|text='.. getjingyan(actor) ..'>'
		addbutton(actor,4,1,str)
		local msg = "<PercentImg|direction=0|x=201|y=-19|minValue=".. getjingyan(actor) .."|maxValue=".. getbaseinfo(actor, 14) .."|img=private/main/1900012010.png>"
		msg = msg..'<Text|ax=0.5|x=332|y=-26|color=255|size=16|outline=1|text='.. string.format("%0.2f",getjingyan(actor)/getbaseinfo(actor, 14)*100) ..'%>'
		addbutton(actor,108,51,msg)
	end
end

function logojiemian(actor) --logo界面
	local msg = ""
	if getispc(actor) then--------端游
		msg = msg.."<Img|x=-305|y=-207|img=zhangheng/282.png>"
		addbutton(actor,104,1050,msg)
	else
		msg = msg.."<Img|x=-390|y=-80|img=zhangheng/282.png>"
		addbutton(actor,108,1050,msg)
	end
end

