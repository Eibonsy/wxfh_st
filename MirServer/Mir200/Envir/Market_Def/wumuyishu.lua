include("Market_Def/zh.lua") --个人封装函数
function show(actor)
	
	local msg = [[
		<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
		<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
		<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=武穆遗书>
		<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
		<RText|ax=0|ay=0.5|x=22.0|y=85.5|color=255|size=18|text=旷世奇书再现江湖，许多勇士穷其一生都在追寻武穆遗书的秘>
		<RText|ay=0.5|x=22.0|y=120.5|color=255|size=18|text=密，武穆遗书，兵之霸者，出奇之道，不知这次现身玛法大陆>
		<RText|ay=0.5|x=22.0|y=155.5|color=255|size=18|text=会引发怎样的江湖恩怨，血雨腥风？>
		<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264|y=214.5|size=18|color=250|text=解开武穆遗书的奥秘|link=@shenmishuxing>

	]]
	say(actor,msg)
end

function shenmishuxing(actor,fangshi,xianshi,goumaitishi)
	goumaitishi = tonumber(goumaitishi) or 0
	fangshi = tonumber(fangshi) or 0
	xianshi = tonumber(xianshi) or 0
	local item = linkbodyitem(actor,15) --马牌位置装备 武穆遗书
	if item == "0" then
		sendmsg9(actor,"需佩戴武穆遗书")
		return
	end
	
	local msg = [[
		<Img|show=4|bg=1|loadDelay=1|move=1|reset=0|img=zhangheng/171.png|esc=1>
		<Button|x=540.0|y=1.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=-21.0|y=-15.0|img=zhangheng/2.png|esc=0>
		<Img|x=15.0|y=36.0|img=zhangheng/174.png|esc=0>
		<Img|x=18.0|y=314.0|width=506|esc=0|img=zhangheng/173.png>
		<Img|x=127.0|y=196.0|img=zhangheng/175.png|esc=0>
		<Button|x=69.0|y=91.0|width=120|size=18|color=10051|nimg=zhangheng/13.png|text=提交1张书页|link=@shifang,1>
		<Button|x=345.0|y=91.0|width=120|color=10051|nimg=zhangheng/13.png|size=18|text=提交10张书页|link=@shifang,2>

			
	]]
	if getint(actor,"累计充值") >= 1000 and getsysint("合区次数") > 0 then
		if getint(actor,"购买武穆遗书") == 0 then
			msg=msg..'<Button|ax=0.5|ay=0.5|x=457.0|y=407.5|color=250|size=16|width=116|nimg=zhangheng/13.png|text=获取武穆遗书|link=@shenmishuxing,0,0,1>'
		elseif getint(actor,"购买武穆遗书") == 1 and getsysint("合区次数") >= 4 then
			msg=msg..'<Button|ax=0.5|ay=0.5|x=457.0|y=407.5|color=250|size=16|width=116|nimg=zhangheng/13.png|text=获取武穆遗书|link=@shenmishuxing,0,0,2>'
		end
	end
	
	msg=msg..'<Button|x=19.0|y=392.0|pimg=zhangheng/8.png|color=255|size=18|nimg=zhangheng/8.png|link=@shenmishuxing,'..fangshi..',1>'
	local lv = getitem_wmyslv(actor,item)
	local sx_jiesuolv = getitem_wmysjsdj(actor,item) --武穆遗书解锁等级
	if sx_jiesuolv == 2 then
		msg=msg..'<Text|ax=0.5|ay=0.5|x=268.0|y=228.5|color=103|size=18|text=如对属性不满意可选择消耗"金砖"或者"元宝">'
		msg=msg..'<Text|ax=0.5|ay=0.5|x=268.0|y=273.5|color=103|size=18|text=让武穆遗书等级重置，获取新的神秘属性>'
		msg=msg..'<Button|x=226.0|y=373.0|nimg=zhangheng/13.png|color=10051|size=18|text=重置等级|link=@chongzhi,'..fangshi..','..getiteminfo(actor,item,1)..'>'
		msg=msg..'<Text|x=100.0|y=362.0|color=108|size=18|text=金砖重置>'
		msg=msg..'<Text|x=398.0|y=362.0|size=18|color=108|text=元宝重置>'
		if fangshi == 1 then
			msg=msg..'<Text|ax=0.5|ay=0.5|x=269.0|y=336.5|size=18|color=150|text=需要：120张书页+2个金砖>'
			msg=msg..'<Img|x=70.0|y=357.0|img=zhangheng/170.png|link=@shenmishuxing>'
			msg=msg..'<Img|x=368.0|y=357.0|img=zhangheng/169.png|link=@shenmishuxing,2>'
		elseif fangshi == 2 then
			msg=msg..'<Text|ax=0.5|ay=0.5|x=269.0|y=336.5|size=18|color=150|text=需要：80张书页+8888元宝>'
			msg=msg..'<Img|x=70.0|y=357.0|img=zhangheng/169.png|link=@shenmishuxing,1>'
			msg=msg..'<Img|x=368.0|y=357.0|img=zhangheng/170.png|link=@shenmishuxing>'
		else
			msg=msg..'<Img|x=70.0|y=357.0|img=zhangheng/169.png|link=@shenmishuxing,1>'
			msg=msg..'<Img|x=368.0|y=357.0|img=zhangheng/169.png|link=@shenmishuxing,2>'
		end
	
	elseif sx_jiesuolv == 1 then  --显示第二条解锁
		msg=msg..'<RText|ax=0.5|ay=0.5|x=268.0|y=228.5|color=103|size=18|text=达到<10级/FCOLOR=251>和<20级/FCOLOR=251>可分别解锁一条神秘属性>'
		msg=msg..'<RText|ax=0.5|ay=0.5|x=268.0|y=273.5|color=103|size=18|text=解锁后可再武穆遗书装备栏查看属性>'
		--if lv >= 20 then
			msg=msg..'<Text|ax=0.5|ay=0.5|x=269.0|y=346.5|size=18|color=150|text=武穆遗书失传已久.您需要给我一根金条为你解开未解之谜>'
		--end
		msg=msg..'<Button|x=210.0|y=373.0|width=120|nimg=zhangheng/13.png|color=10051|size=18|text=解锁神秘属性|link=@jiesuo,'.. sx_jiesuolv ..','..getiteminfo(actor,item,1)..'>'
	elseif sx_jiesuolv == 0 then  --显示第一条解锁
		msg=msg..'<RText|ax=0.5|ay=0.5|x=268.0|y=228.5|color=103|size=18|text=达到<10级/FCOLOR=251>和<20级/FCOLOR=251>可分别解锁一条神秘属性>'
		msg=msg..'<RText|ax=0.5|ay=0.5|x=268.0|y=273.5|color=103|size=18|text=解锁后可再武穆遗书装备栏查看属性>'
		if lv >= 10 then
			msg=msg..'<Text|ax=0.5|ay=0.5|x=269.0|y=346.5|size=18|color=150|text=武穆遗书失传已久.您需要给我一根金条为你解开未解之谜>'
		end
		msg=msg..'<Button|x=210.0|y=373.0|width=120|nimg=zhangheng/13.png|color=10051|size=18|text=解锁神秘属性|link=@jiesuo,'.. sx_jiesuolv ..','..getiteminfo(actor,item,1)..'>'
	end
	
	msg=msg..'<EquipShow|x=234.0|y=76.0|index=15|bgtype=0|reload=1|showtips=1>'
	
	
	if xianshi == 1 then
		msg = msg.."<Layout|x=-1000.0|y=-1001.0|width=3000|height=3000|color=255>|link=@shenmishuxing,"..fangshi..">"		
		msg = msg..[[
		<Img|ay=0.5|x=51.0|y=320.0|width=240|height=200|scale9l=10|scale9b=10|img=zh/7.png|scale9r=10|scale9t=10|esc=0>
		<RText|ay=0.5|x=58.0|y=268.5|color=255|size=16|text=<神秘属性/FCOLOR=254>种类较多，异常强悍>
		<RText|ay=0.5|x=58.0|y=293.5|color=255|size=16|text=每个玩家根据自己的需求选择>
		<RText|ay=0.5|x=58.0|y=318.5|color=255|size=16|text=<适合自己/FCOLOR=70>的才是最好的>
		<RText|ay=0.5|x=58.0|y=350.5|color=255|size=16|text=每提交<1张书页/FCOLOR=250>可为武穆遗书>
		<RText|ay=0.5|x=58.0|y=375.5|color=255|size=16|text=注入<100点/FCOLOR=250>经验值，每升一级>
		<RText|ay=0.5|x=58.0|y=400.5|color=255|size=16|text=可随机获得一点<主属性/FCOLOR=253>>
		<RText|ay=0.5|x=58.0|y=238.5|color=251|size=16|text=解锁规则：>
		]]
	end
	
	if goumaitishi == 1 then	
		msg = msg..[[
		<Img|ay=0.5|x=122.0|y=248.0|width=320|height=170|scale9t=10|scale9b=10|img=zh/7.png|scale9r=10|scale9l=10|esc=0>
		<RText|ay=0.5|x=134.0|y=187.5|color=255|size=16|text=额外再获取一本武穆遗书需要25000金矿石>
		<RText|ay=0.5|x=134.0|y=211.5|color=255|size=16|text=购买后赠送一点天赋点，无其他任何优势>
		<RText|ay=0.5|x=134.0|y=235.5|color=255|size=16|text=购买后也只能佩戴一个，只能购买一次，>
		<RText|ay=0.5|x=134.0|y=258.5|color=255|size=16|text=是否确定获取?<（购买后可享受七彩名字）/FCOLOR=250>>
		<Button|x=159.0|y=283.0|color=10051|nimg=zhangheng/13.png|size=18|text=取消|link=@shenmishuxing>
		<Button|x=307.0|y=283.0|color=10051|nimg=zhangheng/13.png|size=18|text=确定|link=@huoquwumuyishu,1>

		]]
	elseif goumaitishi == 2 then
		msg = msg..[[
		<Img|ay=0.5|x=122.0|y=248.0|width=310|height=170|scale9t=10|scale9b=10|img=zh/7.png|scale9r=10|scale9l=10|esc=0>
<RText|ay=0.5|x=134.0|y=187.5|color=255|size=16|text=额外再获取一本武穆遗书需要100万元宝>
<RText|ay=0.5|x=134.0|y=211.5|color=255|size=16|text=购买后赠送一点天赋点，无其他任何优势>
<RText|ay=0.5|x=134.0|y=235.5|color=255|size=16|text=购买后也只能佩戴一个，此次购买后终身>
<RText|ay=0.5|x=134.0|y=258.5|color=255|size=16|text=无法再度获得，是否确定获取?>
<Button|x=159.0|y=283.0|color=10051|nimg=zhangheng/13.png|size=18|text=取消|link=@shenmishuxing>
<Button|x=307.0|y=283.0|color=10051|nimg=zhangheng/13.png|size=18|text=确定|link=@huoquwumuyishu,2>


		]]
	end
	say(actor,msg)
end

function huoquwumuyishu(actor,par)
	if par == "1" then
		if itemcount(actor,"金矿石") < 25000 then
			sendmsg9(actor,"金矿石不足25000个")
			return 
		end
		takeitem(actor,"金矿石",25000)
	else
		if not subingot(actor,1000000) then
			sendmsg9(actor,"元宝不足100万")
			return 
		end
	end
	giveitem(actor,"武穆遗书",1,371)
	setint(actor,"购买武穆遗书",getint(actor,"购买武穆遗书")+1)
	addtianfudian(actor,1)
	setint(actor,"名字自动变色",1)
	
	setsysint("购买武穆遗书的个数",getsysint("购买武穆遗书的个数")+1)
	setsysint("每日购买武穆遗书的个数",getsysint("每日购买武穆遗书的个数")+1)
	return shenmishuxing(actor)
end

function chongzhi(actor,fangshi,makeid)
	fangshi = tonumber(fangshi)
	makeid = tonumber(makeid)
	if fangshi == 0 then
		sendmsg9(actor,"请先选择重置方式")
		return
	end
	if not isinrole(actor,makeid) then
		sendmsg9(actor,"当前武穆遗书已不在装备栏")
		return
	end
	
	if fangshi == 1 then
		if itemcount(actor,"书页") < 120 or itemcount(actor,"金砖") < 2 then
			sendmsg9(actor,"书页或金砖不足")
			return
		end
		takeitem(actor,"书页",120)
		takeitem(actor,"金砖",2)
	else
		if itemcount(actor,"书页") < 80 or getingot(actor) < 8888 then
			sendmsg9(actor,"书页或元宝不足")
			return
		end
		subingot(actor,8888,"洗武穆遗书")
		takeitem(actor,"书页",80)
	end
	
	local item = linkbodyitem(actor,15) --马牌位置装备 武穆遗书
	callscriptex(actor, "SETADDNEWABIL", 15, "=" ,"3#3#0|3#4#0|3#5#0|3#6#0|3#7#0|3#8#0|3#9#0|3#10#0|3#11#0|3#12#0") --设置物品属性组 清掉 第一条
	setitem_wmysd2tbh(actor,item,0)
	setitem_wmysd2tzhi(actor,item,0)
	setitem_wmysd3tbh(actor,item,0)
	setitem_wmysjsdj(actor,item,0) --解锁条数
	setitem_wmyslv(actor,item,0) --武穆遗书等级
	setitem_wmysjy(actor,item,0) --武穆遗书经验
	addwmysjy(actor,0)
	sendmsg9(actor,"重置成功")
	setitem_wmysxiaxian(actor,item,0)
	setitem_wmysshangxian(actor,item,0)
	setint(actor,"武穆遗书重置次数",getint(actor,"武穆遗书重置次数")+1)
	setint(actor,"武穆遗书控制次数",getint(actor,"武穆遗书控制次数")+1)
	refreshitem(actor, item)
	setbuff(actor)
	if fangshi == 1 then
		post(actor,"武穆遗书金砖重置")
	else
		post(actor,"武穆遗书元宝重置")
	end
	setsysint("洗武穆遗书的次数",getsysint("洗武穆遗书的次数")+1)
	setsysint("每日洗武穆遗书的次数",getsysint("每日洗武穆遗书的次数")+1)
	return shenmishuxing(actor)
end

function jiesuo(actor,sx_jiesuolv,makeid)
	makeid = tonumber(makeid)
	sx_jiesuolv = tonumber(sx_jiesuolv)
	if not isinrole(actor,makeid) then
		sendmsg9(actor,"当前武穆遗书已不在装备栏")
		return
	end
	local item = linkbodyitem(actor,15) --马牌位置装备 武穆遗书
	local lv = getitem_wmyslv(actor,item)
	
	if sx_jiesuolv == 0 and lv >= 10 then
		if getint(actor,"会员等级") < 2 then
			if getgold(actor) < 120000 then
				sendmsg9(actor,"您需要背包保持12万非绑定金币才可以解开武穆遗书的秘密","#FF00FF")
				return
			end
		end
		
		if itemcount(actor,"金条") < 1 then
			sendmsg9(actor,"金条不足")
			return
		end
		takeitem(actor,"金条",1)
		
		local bianhao = {1,18}
		if math.random(1,100) <= 20 then
			bianhao = {19,45}
		end
		local suijizhi = math.random(bianhao[1],bianhao[2])
		if suijizhi == 41 then --删除 泰坦附魂 宝宝伤害加30%
			suijizhi = 42
		end
		
		if getjob(actor)==2 and getint(actor,"武穆遗书控制次数") >= 59 then
			suijizhi = 42
			setint(actor,"武穆遗书控制次数",0)
		end
		
		setitem_wmysd2tbh(actor,item,suijizhi)
		if suijizhi < 19 then
			setitem_wmysd2tzhi(actor,item,math.random(3,6)) --前19条给属性区间3%-6%
		end
		setitem_wmysjsdj(actor,item,1) --解锁条数
		sendmsg9(actor,"解锁成功")
		refreshitem(actor, item)
		setbuff(actor)
		return shenmishuxing(actor)
	elseif sx_jiesuolv == 1 and lv >= 20 then
		if itemcount(actor,"金条") < 1 then
			sendmsg9(actor,"金条不足")
			return
		end
		takeitem(actor,"金条",1)
		local bianhao = {1,33}
		setint(actor,"红色次数",getint(actor,"红色次数")+1)
		if getint(actor,"红色次数") > 39 then
			if math.random(1,100) <= 50 then
				bianhao = {34,48}
				setint(actor,"红色次数",0)
			end
		elseif getint(actor,"红色次数") > 5 then
			if math.random(1,100) <= 2 then
				bianhao = {34,48}
				setint(actor,"红色次数",0)
			end
		end
		local suijizhi = math.random(bianhao[1],bianhao[2])
		if suijizhi == 28 then
			if math.random(1,100) < 50 then
				suijizhi = 33
			end
		end
		
		
		setitem_wmysd3tbh(actor,item,suijizhi)
		
		setitem_wmysjsdj(actor,item,2) --解锁条数
		setint(actor,"武穆遗书金砖可见",1)
		sendmsg9(actor,"解锁成功")
		refreshitem(actor, item)
		setbuff(actor)
		return shenmishuxing(actor)
	else
		if sx_jiesuolv == 0 then
			sendmsg9(actor,"你的武穆遗书还未达到10级，请先提交书页升级武穆遗书")
		else
			sendmsg9(actor,"你的武穆遗书还未达到20级，请先提交书页升级武穆遗书")
		end
		return
	end
end	

local jy_zhi = {100,1000}
local sy_sl = {1,10}
local huiyuan_bili = {[0]=0,10,30,60,100}
function shifang(actor,par)
	par = tonumber(par)

	local item = linkbodyitem(actor,15) --马牌位置装备 武穆遗书
	if item == "0" then
		sendmsg9(actor,"你没有佩戴武穆遗书")
		return
	end
	if getitem_wmyslv(actor,item) >= 20 then
		sendmsg9(actor,"武穆遗书已经满级")
		return
	end
	if itemcount(actor,"书页") < sy_sl[par] then
		sendmsg9(actor,"书页不足")
		return
	end
	takeitem(actor,"书页",sy_sl[par])
	local jyz = jy_zhi[par]
	local bili = huiyuan_bili[getint(actor,"会员等级")]
	jyz = jyz + jyz*bili/100
	addwmysjy(actor,jyz)
	sendmsg9(actor,"武穆遗书经验+"..jyz)
	return shenmishuxing(actor)
end

local jineng = {
	"雷电术","灭天火","流星火雨","魔法盾","火墙伤害","冰咆哮","基本剑术","攻杀剑术","半月弯刀","刺杀剑术","疾光电影","烈火剑法","开天斩","逐日剑法","宝宝伤害",     
	"灵魂火符","噬血术","施毒术","火焰风暴","闪电穿行","怒火中烧","神奇魔盾","无懈可击","目眩神迷","末日审判","疾风迅雷","蛟龙震海","不动冥王","横冲直撞","烈焰焚天","圆月回旋",
	"刺杀之魂","乘风破浪","剑意追击","共工之怒","冰之奥义","碧海潮生","暗隐刺客","道法自然","战力增幅","泰坦附魂","千变万化","百蛊灭魂","两败俱伤","道心通灵"
	}
function setbuff(actor)
	
	setint(actor,"武穆遗书2编号",0)
	setint(actor,"武穆遗书3编号",0)
	for i = 1,18 do
		if i ~= 15 then
			--setmagicpower(actor,jineng[i],0,1)
			callscriptex(actor, "SetMagicPower", jineng[i], 0,1) --设置武穆遗书buff
		end
	end
	local item = linkbodyitem(actor,15) --马牌位置装备 武穆遗书
	if item == "0" then
		callscriptex(actor, "CallLua", "QFunction-0", "@ditujiemian") --设置武穆遗书buff
		setdisantiaobuff(actor)
		return
	end
	
	local tiao2 = getitem_wmysd2tbh(actor,item) --第2条编号
	local tiaozhi2 = getitem_wmysd2tzhi(actor,item) --第2条编号值
	local tiao3 = getitem_wmysd3tbh(actor,item) --第3条编号
	if tiao2 > 0 then
		if tiao2 <= 18 and tiao2 ~= 15 then
			callscriptex(actor, "SetMagicPower", jineng[tiao2], tiaozhi2,1) --设置武穆遗书buff
			--setmagicpower(actor,"灵魂火符",100,1)
			--sendmsg6(actor,jineng[tiao2].."威力增加"..tiaozhi2.."%")
		end
	end
	setint(actor,"武穆遗书2编号",tiao2)
	setint(actor,"武穆遗书2值",tiaozhi2)
	setint(actor,"武穆遗书3编号",tiao3)
	callscriptex(actor, "CallLua", "QFunction-0", "@ditujiemian") --设置传送次数
	setdisantiaobuff(actor)
	
end

local buffid_t = {[1]=20062,[2]=20063,[3]=20064,[4]=20065,[5]=20066,[11]=20106,[25]=20073,[35]=20076,[40]=20077,[46]=20093}
function setdisantiaobuff(actor)
	local bh = getint(actor,"武穆遗书3编号")
	if buffid_t[bh] then
		addbuff(actor,buffid_t[bh])
	else
		addbuff(actor,20071)
		--加清空buff
	end
end



--增加武穆遗书经验
function addwmysjy(actor,dian)
	dian = tonumber(dian)
	local item = linkbodyitem(actor,15) --马牌位置装备 武穆遗书
	if item ~= "0" then
		local lv = getitem_wmyslv(actor,item) --武穆遗书等级
		local jy = getitem_wmysjy(actor,item) --武穆遗书经验
		if lv >= 20 then --满级后处理
			
		else --未满级
			setitem_wmysjy(actor,item,jy+dian) --武穆遗书经验
			wumushengji(actor,item,jy+dian) --武穆遗书升级等级处理
		end
	end
end
local jy_t = {200,300,400,500,600, 700, 800,900,1000,1200,1400,1600,1800,2000,2200,2400,2600,2800,3000,3600,3600}
local shuxingid_t = {
	[0] = {3,4},[1] = {5,6},[2] = {7,8}
}
function wumushengji(actor,item)
	local lv = getitem_wmyslv(actor,item) --武穆遗书等级
	local jy = getitem_wmysjy(actor,item) --武穆遗书经验
	if lv == 20 then --如果是满级
		setitem_wmysjy(actor,item,jy_t[lv])
	else
		if jy >= jy_t[lv+1] then
			setitem_wmyslv(actor,item,lv+1)
			setitem_wmysjy(actor,item,jy-jy_t[lv+1])
			local t = shuxingid_t[getjob(actor)] --{3,4}
			local id = 1
			if getint(actor,"武穆遗书重置次数") >= 100 then
				if math.random(1,100) <= 80 then
					id = 2
				end
			elseif getint(actor,"武穆遗书重置次数") >= 50 then
				if math.random(1,100) <= 70 then
					id = 2
				end
			elseif getint(actor,"武穆遗书重置次数") >= 20 then
				if math.random(1,100) <= 60 then
					id = 2
				end
			elseif getint(actor,"武穆遗书重置次数") >= 5 then
				if math.random(1,100) <= 50 then
					id = 2
				end
			else
				if math.random(1,100) <= 40 then
					id = 2
				end
			end
			
			if getitem_wmysxiaxian(actor,item) >= 15 then
				id = 2
			end
			if getitem_wmysshangxian(actor,item) >= 15 then
				id = 1
			end
			
			if id == 1 then
				setitem_wmysxiaxian(actor,item,getitem_wmysxiaxian(actor,item)+1)
			else
				setitem_wmysshangxian(actor,item,getitem_wmysshangxian(actor,item)+1)
			end
			callscriptex(actor, "SETADDNEWABIL", 15, "+" ,"3#".. t[id] .."#1") --设置物品属性组
			return wumushengji(actor,item)
		end
	end
	local lastlv = getitem_wmyslv(actor,item) --武穆遗书等级
	local lastjy = getitem_wmysjy(actor,item) --武穆遗书经验
	local t = {
    open=1,  
    show=2,  
    name="Lv."..lastlv,  
    color=254,  
    imgcount=2,  
    cur=lastjy, 
    max=jy_t[lastlv+1], 
	level=0
	}
	setcustomitemprogressbar(actor,item,0,tbl2json(t))
	refreshitem(actor, item)
end