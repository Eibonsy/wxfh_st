--[[function magselffunc3000(actor) --玄武之力
	sendmsg6(actor,"释放玄武之力")
	local jichutime = 15
	local addtime = 0
	if getint(actor,"武穆遗书3编号") == 29 then
		addtime = 5
	elseif getint(actor,"武穆遗书3编号") == 45 then
		addtime = 12
	end
	addbuff(actor,10052,jichutime+addtime) --玄武之力buff
	callscriptex(actor, "SHOWPHANTOM", 100, jichutime+addtime)
	detoxifcation(actor,-1)
end--]]


function ontimer19(actor) --每秒定时器 处理 武穆遗书3编号19 1秒加血2% 持续10秒
	local maxhp = getbaseinfo(actor,10)
	local addhp = math.floor(maxhp*0.02) --加血量
	humanhp(actor,"+",addhp,1000)
	--sendmsg6(actor,"持续加血2% ")
end

function magselffunc18(actor) --隐身术

	--sendmsg6(actor,"释放隐身术")
	if getint(actor,"武穆遗书2编号") == 38 then
		if os.time() - getint(actor,"放隐身术时间") < 120 then
			return
		end
		changemode(actor,2,3)
		setint(actor,"放隐身术时间",os.time())
		sendmsg9(actor,"进入全隐状态，持续时间3秒","#00ff00")
		--sendmsg6(actor,"隐身3秒")
	end
end

function magselffunc15(actor) --神圣战甲术
	if getint(actor,"武穆遗书2编号") == 39 then
		if not hasbuff(actor,20060) then
			addbuff(actor,20060)
			--sendmsg6(actor,"给自己添加神圣战甲术buff")
		end
	end
end

function magtagfuncex15(actor,id,shifazhename) --给别人加神圣战甲术  目标obj，技能id，施法者name
	local shifazhe = getplayerbyname(shifazhename) --施法者obj
	if getint(shifazhe,"武穆遗书2编号") == 39 then
		if not hasbuff(actor,20060) then
			addbuff(actor,20060)
			--sendmsg6(shifazhe,"给别人添加神圣战甲术buff")
		end
	end
end

function magselffunc14(actor) --幽灵盾
	--sendmsg0(0,"自己时间"..os.time())
	--sendmsg0(0,"释放时间"..getint(actor,"放幽灵盾时间"))
	if getint(actor,"武穆遗书2编号") == 40 then
		if os.time() ~= getint(actor,"放幽灵盾时间") and os.time() - getint(actor,"放幽灵盾时间") < 60 then
			return
		end
		if not hasbuff(actor,20061) then
			addbuff(actor,20061)		
			sendmsg9(actor,"使用了'幽灵盾'当前战力提升10%持续30秒")
			--sendmsg6(actor,"给自己添加幽灵盾buff")
		end
		setint(actor,"放幽灵盾时间",os.time())
	end
end

function magtagfuncex14(actor,id,shifazhename) --给别人加幽灵盾  目标obj，技能id，施法者name
	--sendmsg0(0,"别人时间"..os.time())
	
	local shifazhe = getplayerbyname(shifazhename) --施法者obj
	--sendmsg0(0,"释放时间"..getint(shifazhe,"放幽灵盾时间"))
	if getint(shifazhe,"武穆遗书2编号") == 40 then
		if os.time() ~= getint(shifazhe,"放幽灵盾时间") and os.time() - getint(shifazhe,"放幽灵盾时间") < 60 then
			return
		end
		if not hasbuff(actor,20061) then
			addbuff(actor,20061)
			sendmsg9(actor,shifazhename.."对你使用了'幽灵盾'当前战力提升10%持续30秒")
			--XXX对你使用了"幽灵盾"当前战力提升10%持续60秒
			--sendmsg6(shifazhe,"给别人添加幽灵盾buff")
		end
		setint(shifazhe,"放幽灵盾时间",os.time())
	end
end

function magselffunc2(actor) --给自己加血  自身obj
	--sendmsg6(actor,"给自己加血")
	delaygoto(actor,200,"zhiyushujiaxue")
end

function zhiyushujiaxue(actor)
	if getint(actor,"武穆遗书2编号") == 37 and getint(actor,"给别人加血") == 0 then
		if os.time() - getint(actor,"放治愈术时间") < 60 then
			return
		end
		if not hasbuff(actor,20059) then
			setontimer(actor,37,1,30) --1秒加血 持续30秒
			addbuff(actor,20059)
			--sendmsg6(actor,"给自己加血")
		end
	end
	setint(actor,"给别人加血",0)
end

function magtagfuncex2(actor,id,shifazhename) --给别人加血  目标obj，技能id，施法者name
	local shifazhe = getplayerbyname(shifazhename) --施法者obj
	setint(shifazhe,"给别人加血",1)
	if getint(shifazhe,"武穆遗书2编号") == 37 then
		if not hasbuff(actor,20059) then
			setontimer(actor,37,1,30) --1秒加血 持续30秒
			addbuff(actor,20059)
			--sendmsg6(shifazhe,"给别人加血")
		end
	end
end

function ontimer37(actor) --每秒定时器 处理 武穆遗书编号37 1秒加血2% 持续30秒
	local maxhp = getbaseinfo(actor,10)
	local addhp = math.floor(maxhp*0.02) --加血量
	humanhp(actor,"+",addhp,1000)
	--sendmsg6(actor,"持续加血1% ")
end

local shenshou_t = {["神兽"]=1,["万兽之王"]=1,["至尊牛帝"]=1,}
function magselffunc30(actor) --召唤神兽
	--sendmsg6(actor,"召唤神兽触发")
	local bb_t = getbaobaolist(actor) --宝宝列表
	local shenshousl = 0
	for i = 1,#bb_t do
		if shenshou_t[getname(bb_t[i])] == 1 then
			shenshousl = shenshousl + 1
		end
	end
	--sendmsg6(actor,"神兽数量"..shenshousl)
	local zuidashu = 1
	if getint(actor,"武穆遗书2编号") == 42 and getskilllevel(actor,getskillidbyname("召唤神兽")) == 4 then
		zuidashu = 2
	end
	local level = getlevel(actor) --人物等级
	local chasl = zuidashu - shenshousl
	for i = 1,chasl do
		if level >= 60 then
			callscriptex(actor, "RECALLMOB", "至尊牛帝", 3,99999,0,0,0,0)
		elseif level >= 50 then
			callscriptex(actor, "RECALLMOB", "万兽之王", 3,99999,0,0,0,0)
		else
			callscriptex(actor, "RECALLMOB", "神兽", 3,99999,0,0,0,0)
		end
	end
end
--获取宝宝触发
function slavebb(actor,mon)
	local name = getname(mon)
	if shenshou_t[name] then
		changemobability(actor,mon,5,"+",math.floor(getbaseinfo(actor,24)*0.3),99999)
		changemobability(actor,mon,6,"+",math.floor(getbaseinfo(actor,24)*0.3),99999)
		--sendmsg6(actor,"宝宝加属性")
	end
	setbbsudu(actor)
end

function setbbsudu(actor)
	local bb_t = getbaobaolist(actor) --宝宝列表
	local renwubbsudu = getbaseinfo(actor,51,206) --宝宝速度
	local yidongsudu = 0
	if getint(actor,"武穆遗书2编号") == 45 then
		renwubbsudu = renwubbsudu + 2
		yidongsudu = yidongsudu + 40
	end

	for i = 1,#bb_t do
		--changemobability(actor,bb_t[i],14,"=",0,1,0) --攻击速度
		changemobability(actor,bb_t[i],13,"=",renwubbsudu*10,99999) --移动速度
		changemobability(actor,bb_t[i],14,"=",renwubbsudu*10,99999) --攻击速度
		--sendmsg6(actor,"宝宝速度提升")
	end
end

--宝宝升级触发
function slaveupgrade(actor,mon)
	if getname(mon) == "万兽之王" or getname(mon) == "至尊牛帝" then
		changemobability(actor,mon,11,"+",440,99999)
		changemobability(actor,mon,1,"+",10,99999)
		changemobability(actor,mon,2,"+",10,99999)
		changemobability(actor,mon,3,"+",10,99999)
		changemobability(actor,mon,4,"+",10,99999)
	end
end


function magselffunc50(actor) --无极真气
	--sendmsg6(actor,"无极真气触发")
	local jiennglv = getskillinfo(actor,getskillidbyname("无极真气"),1) 
	--sendmsg6(actor,"无极真气技能等级"..jiennglv)
	local bili = 0.05
	local shijian = 30
	if jiennglv == 1 then
		bili = 0.1
	elseif jiennglv == 2 then
		bili = 0.2
	elseif jiennglv == 3 then
		bili = 0.3
	elseif jiennglv == 4 then
		bili = 0.4
		shijian = 35
	end
	local daoshu = getbaseinfo(actor,24) --本身道术
	local addds = math.floor(daoshu * bili)
	
	addbuff(actor,10068,shijian,1,actor,{[8]=addds})
	callscriptex(actor, "sendmsg", 6,"道术增加"..addds.."点 时间"..shijian.."秒")
	--sendmsg6(shifazhe,"道术增加"..addds.."点 时间15秒","#024502")
	setint(actor,"无极真气时间",os.time())
end

function magtagfuncex6(actor,id,shifazhename) --给别人加施毒术  目标obj，技能id，施法者name
	local shifazhe = getplayerbyname(shifazhename) --施法者obj
	--sendmsg6(shifazhe,"施毒术")
	if getint(shifazhe,"武穆遗书2编号") == 43 and not hasbuff(actor,10052) then
		setontimer(actor,43,1,0) --1秒掉血6点
	end
	
end


function ontimer43(actor) --每秒定时器 处理 武穆遗书编号43 施毒术每秒多掉6点血
	if callcheckscriptex(actor,"checkHumanState",11) then --中毒状态
		humanhp(actor,"-",6,1000)
		--sendmsg6(actor,"持续掉血6点 ")
	else
		setofftimer(actor, 43)
	end
end

function ontimer36(actor) --每秒定时器 处理 武穆遗书3编号36 1秒掉血2% 持续10秒
	local maxhp = getbaseinfo(actor,10)
	local addhp = math.floor(maxhp*0.02) --减血量
	humanhp(actor,"-",addhp,1000)
	sendmsg6(actor,"持续减血2% ")
end