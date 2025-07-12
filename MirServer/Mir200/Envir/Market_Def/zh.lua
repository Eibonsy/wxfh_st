----变量操作
function getint(player,bianlian)
	iniplayvar(player, "integer", "HUMAN", "N"..bianlian)
	return getplayvar(player, "HUMAN","N"..bianlian)
end

function getstr(player,bianlian)
	iniplayvar(player, "string", "HUMAN", "S"..bianlian)
	return getplayvar(player, "HUMAN","S"..bianlian)
end

function setint(player,bianlian,zhi,baocun)
	if not baocun then
		baocun = 1
	end
	iniplayvar(player, "integer", "HUMAN", "N"..bianlian)
	setplayvar(player, "HUMAN", "N"..bianlian, zhi, baocun)
end

function setstr(player,bianlian,zhi,baocun)
	if not baocun then
		baocun = 1
	end
	iniplayvar(player, "string", "HUMAN", "S"..bianlian)
	setplayvar(player, "HUMAN", "S"..bianlian, zhi, baocun)
end

function getsysint(bianlian)
	inisysvar("integer", "N"..bianlian)
	return getsysvarex("N"..bianlian)
end

function getsysstr(bianlian)
	inisysvar("string", "S"..bianlian)
	return getsysvarex("S"..bianlian)
end

function setsysint(bianlian,zhi,baocun)
	if not baocun then
		baocun = 1
	end
	inisysvar("integer", "N"..bianlian)
	setsysvarex("N"..bianlian,zhi,baocun)
end

function setsysstr(bianlian,zhi,baocun)
	if not baocun then
		baocun = 1
	end
	inisysvar("string", "S"..bianlian)
	setsysvarex("S"..bianlian,zhi,baocun)
end

function setsyslinshiint(bianlian,zhi)
	inisysvar("integer", "N"..bianlian)
	setsysvarex("N"..bianlian,zhi)
end

--获取玩家数值型天变量
function getdayint(actor,bianliang)
	local biao = {}
	local s = getplaydef(actor,"Z0")
	local n = 0
	if s ~= "" then
		local z = json2tbl(s)
		if not z then
			setplaydef(actor,"Z0","")
		end
		for k,v in pairs(z) do
			if k == bianliang then
				n = v
				break
			end
		end
	end
	return n
end
--设置玩家数值型天变量
function setdayint(actor,bianliang,num)
	if type(num) ~= "number" then
		return
	end
	local biao = {}
	local s = getplaydef(actor,"Z0")
	if s ~= "" then
		biao = json2tbl(s)
	end
	biao[bianliang] = num
	setplaydef(actor,"Z0",tbl2json(biao))
end

--获取玩家字符型天变量
function getdaystr(actor,bianliang)
	local biao = {}
	local s = getplaydef(actor,"Z1")
	local n = ""
	if s ~= "" then
		local z = json2tbl(s)
		for k,v in pairs(z) do
			if k == bianliang then
				n = v
				break
			end
		end
	end
	return n
end
--设置玩家字符型天变量
function setdaystr(actor,bianliang,str)
	if type(str) ~= "string" then
		return
	end
	local biao = {}
	local s = getplaydef(actor,"Z1")
	if s ~= "" then
		biao = json2tbl(s)
	end
	biao[bianliang] = str
	setplaydef(actor,"Z1",tbl2json(biao))
end

--检查一个对象的范围
function FCheckRange(obj, x, y, range)
    local cur_x, cur_y = getbaseinfo(obj, 4), getbaseinfo(obj, 5)
    local min_x, max_x = x-range, x+range
    local min_y, max_y = y-range, y+range

    if (cur_x >= min_x) and (cur_x <= max_x) and (cur_y >= min_y) and (cur_y <= max_y) then
        return true
    end
    return false
end
--带颜色的字符串
function sencolormsg(actor,idx,msg,co1,co2)
	local x = getconst(actor,'$SCREENWIDTH') * 0.5
	local y  = getconst(actor,'$SCREENHEIGHT') * 0.65
	sendcustommsg(actor,idx,msg,co1,co2,x,y)
end
--获取宠物宝宝列表
function getbaobaolist(actor)
	local t = {}
	local ncount=getbaseinfo(actor,38)
    for i = 0 ,ncount-1 do
        mon = getslavebyindex(actor, i)
		table.insert(t,mon)
    end
	return t
end
--发送消息类型9
function sendmsg9(actor,msg,yanse,miaobian)
	if yanse == nil then
		yanse = "#FFFFFF"
	end
	if miaobian == nil then
		if getispc(actor) then
			miaobian = 1
		else
			miaobian = 0
		end
	end
	sendmsg(actor,1,[[{"Msg":"<outline size=']].. miaobian ..[['> <font color=']].. yanse ..[['>]]..msg..[[</font> </outline>","Type":9,"Time":"1"}]])
end
--发送提示消息
function sendmsg6(actor,msg,yanse)
	if yanse == nil then
		yanse = "#ff0000"
	end
	callscriptex(actor, "SENDMSG", 6, "<font color=\'".. yanse .."\'>".. msg .."</font>")
end
--全区上部缩放系统公告
function sendmsg13(actor,msg)
	sendmsg(actor,2,'{"Msg":"'.. msg ..'","FColor":255,"BColor":0,"Type":13,"Time":5}')
end

--全区聊天框系统公告
function sendmsg0(actor,msg,qianse,house)
	qianse = qianse or 255 --前景色
	house = house or 56	--背景色
	sendmsg(actor,2,'{"Msg":"'.. msg ..'","FColor":'.. qianse ..',"BColor":'.. house ..',"Type":1}')
end

--获取对象名字
function getname(actor) --名字
	return getbaseinfo(actor,1)
end
--获取对象地图id
function getmap(actor) --地图id
	return getbaseinfo(actor,3)
end
--获取对象x坐标
function getx(actor) --x坐标
	return getbaseinfo(actor,4)
end
--获取对象y坐标
function gety(actor) --y坐标
	return getbaseinfo(actor,5)
end
--获取等级
function getlevel(actor) --等级
	return getbaseinfo(actor,6)
end
--设置等级
function setlevel(actor,zhi) --等级
	changelevel(actor,"=",zhi)
	--setbaseinfo(actor,6,zhi)
end 
--获取职业
function getjob(actor) --职业0 1 2 战法道
	return getbaseinfo(actor,7)
end
--设置职业
function setjob(actor,zhi) --职业0 1 2 战法道
	setbaseinfo(actor,7,zhi)
end 

--获取性别
function getsex(actor) --性别0男1女
	return getbaseinfo(actor,8)
end
--设置性别
function setsex(actor,zhi) --性别0男1女
	setbaseinfo(actor,8,zhi)
end 


local skillid_t = {
	["普通攻击"]=0,
	["火球术"]=1,
	["治愈术"]=2,
	["基本剑术"]=3,
	["精神力战法"]=4,
	["大火球"]=5,
	["施毒术"]=6,
	["攻杀剑术"]=7,
	["抗拒火环"]=8,
	["地狱火"]=9,
	["疾光电影"]=10,
	["雷电术"]=11,
	["刺杀剑术"]=12,
	["灵魂火符"]=13,
	["幽灵盾"]=14,
	["神圣战甲术"]=15,
	["困魔咒"]=16,
	["召唤骷髅"]=17,
	["隐身术"]=18,
	["集体隐身术"]=19,
	["诱惑之光"]=20,
	["瞬息移动"]=21,
	["火墙"]=22,
	["爆裂火焰"]=23,
	["地狱雷光"]=24,
	["半月弯刀"]=25,
	["烈火剑法"]=26,
	["野蛮冲撞"]=27,
	["心灵启示"]=28,
	["群体治愈术"]=29,
	["召唤神兽"]=30,
	["魔法盾"]=31,
	["圣言术"]=32,
	["冰咆哮"]=33,
	["解毒术"]=34,
	["火焰冰"]=36,
	["群体雷电术"]=37,
	["诅咒术"]=38,
	["彻地钉"]=39,
	["双龙斩"]=40,
	["狮子吼"]=41,
	["龙影剑法"]=42,
	["雷霆剑法"]=43,
	["寒冰掌"]=44,
	["灭天火"]=45,
	["火龙烈焰"]=47,
	["气功波"]=48,
	["无极真气"]=50,
	["群体施毒术"]=51,
	["飓风破"]=52,
	["召唤月灵"]=55,
	["逐日剑法"]=56,
	["噬血术"]=57,
	["流星火雨"]=58,
	["破魂斩"]=60,
	["劈星斩"]=61,
	["雷霆一击"]=62,
	["噬魂沼泽"]=63,
	["末日审判"]=64,
	["火龙气焰"]=65,
	["开天斩"]=66,
	["禁锢术"]=69,
	["心灵召唤"]=70,
	["擒龙手"]=71,
	["道力盾"]=73,
	["分身术"]=74,
	["护体神盾"]=75,
	["召唤圣兽"]=76,
	["纵横剑术"]=81,
	["十步一杀"]=82,
	["冰镰术"]=83,
	["冰霜群雨"]=84,
	["裂神符"]=85,
	["死亡之眼"]=86,
	["武力盾"]=87,
	["冰霜雪雨"]=92,
	["五雷轰"]=94,
	["幽冥火符"]=95,
	["玄武之力"]=3000,
	["酿酒术"]=3001,

}
--根据技能名称获取技能ID
function getskillidbyname(skillname)
	return skillid_t[skillname]
end

--判断是否为PC还是手机
function getispc(actor) --获取是否电脑端
	if getconst(actor,"<$CLIENTFLAG>") == "1" then
		return true
	else
		return false
	end
end

----屏幕大小
function getpingmusize(actor)
	return tonumber(getconst(actor,"<$CLIENTFLAG>")),tonumber(getconst(actor,"<$SCREENHEIGHT>"))
end

--天数差
function getDateNum(timeNow, timeNext)
    local ret = 0
    if timeNow and timeNext then
        local now = os.date("*t", timeNow)
        local next = os.date("*t", timeNext)

        if now and next then
            local num1 = os.time({ year = now.year, month=now.month, day=now.day })
            local num2 = os.time({ year = next.year, month=next.month, day=next.day })
            if num1 and num2 then
                ret =  math.abs(num1 - num2) / (3600*24)
            end
        end
    end
    return ret
end

--获取开区天数
function getkaiquday()
	local kqtime = getsysint("开区时间") --开区时间戳
	if kqtime == 0 then
		return 1
	end
	local curtime = os.time() --当前时间戳
	return getDateNum(curtime,kqtime) + 1
end
--获取背包物品数量
function itemcount(actor,name)
	local ncount=getbaseinfo(actor,34) --获取背包物品数量
	local sl = 0
	for i = 0 ,ncount-1 do
		local item = getiteminfobyindex(actor, i) --根据索引返回对象
		local itemid = getiteminfo(actor,item,2) --物品id
		local iname = getstditeminfo(itemid,1)
		if iname == name then
			if getiteminfo(actor,item,5) == 0 then
				sl = sl + 1
			else
				sl = sl + getiteminfo(actor,item,5) --叠加数量
			end
		end
    end
	return sl
end

--是否在背包
function isinbag(actor,item)
	local ncount=getbaseinfo(actor,34) --获取背包物品数量
	for i = 0 ,ncount-1 do
		local item1 = getiteminfobyindex(actor, i) --根据索引返回对象
		if item1 == item then
			return true
		end
    end
	return false
end

--是否在装备栏
function isinrole(actor,makeid)
	for i = 0 ,100 do
		local item = linkbodyitem(actor,i)
		if item ~= "0" and makeid == getiteminfo(actor,item,1) then
			return true
		end
    end
	return false
end

--获取物品总幸运
function getluck(actor,item)
	local itemid = getiteminfo(actor,item,2)
	local jichuluck = getstditematt(itemid,39) --基础幸运
	local addluck = getitemaddvalue(actor,item,1,5) --极品幸运
	return jichuluck + addluck
end

--根据物品对象获取物品名称
function getitemname(actor,item,zidingyiname) --玩家 道具 自定义名字
	if zidingyiname == 1 then
		local jsonstr = getitemcustomabil(actor,item)
		if jsonstr ~= "" then
			local json_t = json2tbl(jsonstr)
			if json_t["name"] ~= "" then
				return json_t["name"]
			end
		end
	end
	local id = getiteminfo(actor,item,2)
	return getstditeminfo(id,1)
end
--根据名字获取物品id
function getidbyname(name)
	return getstditeminfo(name,0)
end

--获取背包物品对象列表
function getbaglist(actor)
	local t = {}
	local ncount=getbaseinfo(actor,34)
	local str = ""
	for i = 0 ,ncount-1 do
	  table.insert(t,getiteminfobyindex(actor, i))
	end
	return t
end

--获取人物装备列表
function getrolelist(actor)
	local t = {}
	for i = 0,100 do
		local item = linkbodyitem(actor,i)
		if item ~= "0" then
		  table.insert(t,item)
		end
	end
	return t
end

-------物品标识使用段  标识范围0-31
--标识1  是否禁止捡取
function getisjianqu(actor,item) --是否禁止捡取   
	return getitemaddvalue(actor,item,3,1)
end
function setisjianqu(actor,item,zhi) --设置是否禁止捡取  
	setitemaddvalue(actor,item,3,1,zhi)
end

--标识2  是否捡取触发过
function getisjianquguo(actor,item) --是否禁止捡取   
	return getitemaddvalue(actor,item,3,2)
end
function setisjianquguo(actor,item,zhi) --设置是否禁止捡取  
	setitemaddvalue(actor,item,3,2,zhi)
end

--标识3  是否怪物爆
function getisguaibao(actor,item) --获取是否怪物爆出
	return getitemaddvalue(actor,item,3,3)
end
function setisguaibao(actor,item,zhi) --设置是否怪物爆出
	setitemaddvalue(actor,item,3,3,zhi)
end



-------
-----物品记录信息无效属性使用
--属性34 主属性 
function getitem_sxzsx(actor,item) --升星主属性   
	return getitemaddvalue(actor,item,1,34)
end
function setitem_sxzsx(actor,item,zhi) --   
	setitemaddvalue(actor,item,1,34,zhi)
end
--属性35 防御
function getitem_sxfy(actor,item) --升星防御   
	return getitemaddvalue(actor,item,1,35)
end
function setitem_sxfy(actor,item,zhi) --   
	setitemaddvalue(actor,item,1,35,zhi)
end
--属性36 魔防
function getitem_sxmf(actor,item) --升星魔防   
	return getitemaddvalue(actor,item,1,36)
end
function setitem_sxmf(actor,item,zhi) --
	setitemaddvalue(actor,item,1,36,zhi)
end

--属性37 祝福值
function getitem_zfz(actor,item) --祝福值   
	return getitemaddvalue(actor,item,1,37)
end
function setitem_zfz(actor,item,zhi) --
	setitemaddvalue(actor,item,1,37,zhi)
end

--属性38 法宝融合编号
function getitem_fabaozhi(actor,item) --法宝融合编号   
	return getitemaddvalue(actor,item,1,38)
end
function setitem_fabaozhi(actor,item,zhi) --法宝融合编号
	setitemaddvalue(actor,item,1,38,zhi)
end

--属性39 武穆遗书等级
function getitem_wmyslv(actor,item) --武穆遗书等级   
	return getitemaddvalue(actor,item,1,39)
end
function setitem_wmyslv(actor,item,zhi) --武穆遗书等级
	setitemaddvalue(actor,item,1,39,zhi)
end

--属性40 武穆遗书经验 和酒气值 共用属性 不冲突
function getitem_wmysjy(actor,item) --武穆遗书经验   
	return getitemaddvalue(actor,item,1,40)
end
function setitem_wmysjy(actor,item,zhi) --武穆遗书经验
	setitemaddvalue(actor,item,1,40,zhi)
end

function getitem_jiuqizhi(actor,item) --酒气值   
	return getitemaddvalue(actor,item,1,40)
end
function setitem_jiuqizhi(actor,item,zhi) --酒气值
	setitemaddvalue(actor,item,1,40,zhi)
end

--属性41 武穆遗书解锁属性等级1,2,3
function getitem_wmysjsdj(actor,item) --武穆遗书解锁等级   
	return getitemaddvalue(actor,item,1,41)
end
function setitem_wmysjsdj(actor,item,zhi) --武穆遗书解锁等级
	setitemaddvalue(actor,item,1,41,zhi)
end

--属性42 武穆遗书第一条属性洗炼次数
function getitem_wmysdytcs(actor,item) --武穆遗书第一条属性洗炼次数   
	return getitemaddvalue(actor,item,1,42)
end
function setitem_wmysdytcs(actor,item,zhi) --武穆遗书第一条属性洗炼次数
	setitemaddvalue(actor,item,1,42,zhi)
end

--属性43 武穆遗书第2条属性编号
function getitem_wmysd2tbh(actor,item) --武穆遗书第2条属性编号   
	return getitemaddvalue(actor,item,1,43)
end
function setitem_wmysd2tbh(actor,item,zhi) --武穆遗书第2条属性编号
	setitemaddvalue(actor,item,1,43,zhi)
end

--属性44 武穆遗书第2条属性值
function getitem_wmysd2tzhi(actor,item) --武穆遗书第2条属性值
	return getitemaddvalue(actor,item,1,44)
end
function setitem_wmysd2tzhi(actor,item,zhi) --武穆遗书第2条属性值
	setitemaddvalue(actor,item,1,44,zhi)
end

--属性46 武穆遗书第3条属性编号
function getitem_wmysd3tbh(actor,item) --武穆遗书第3条属性编号
	return getitemaddvalue(actor,item,1,46)
end
function setitem_wmysd3tbh(actor,item,zhi) --武穆遗书第3条属性编号
	setitemaddvalue(actor,item,1,46,zhi)
end

--属性2 8 项链洗练次数
function getitem_xlxlcs(actor,item) --项链洗练次数
	return getitemaddvalue(actor,item,2,8)
end
function setitem_xlxlcs(actor,item,zhi) --项链洗练次数
	setitemaddvalue(actor,item,2,8,zhi)
end

--属性2 7 到期时间
function getitem_daoqishijian(actor,item) --到期时间
	return getitemaddvalue(actor,item,2,7)
end
function setitem_daoqishijian(actor,item,zhi) --到期时间
	setitemaddvalue(actor,item,2,7,zhi)
end

--属性2 9 武穆遗书下限
function getitem_wmysxiaxian(actor,item) --武穆遗书下限
	return getitemaddvalue(actor,item,2,9)
end
function setitem_wmysxiaxian(actor,item,zhi) --武穆遗书下限
	setitemaddvalue(actor,item,2,9,zhi)
end

--属性2 10 武穆遗书上限
function getitem_wmysshangxian(actor,item) --武穆遗书上限
	return getitemaddvalue(actor,item,2,10)
end
function setitem_wmysshangxian(actor,item,zhi) --武穆遗书上限
	setitemaddvalue(actor,item,2,10,zhi)
end

--属性2 11 沙巴克标识
function getitem_shabake(actor,item) --沙巴克标识
	return getitemaddvalue(actor,item,2,11)
end
function setitem_shabake(actor,item,zhi) --沙巴克标识
	setitemaddvalue(actor,item,2,11,zhi)
end

-----
--是否绑定
function isbind(actor,item)
	if getitemaddvalue(actor,item,2,1) == 0 then
		return false
	else
		return true
	end
end

-------货币操作
----获取金币绑金总数
function getbindgold(actor)
	return getbindmoney(actor,"金币")
end
----扣除金币 优先扣除绑定金币
function subbindgold(actor,num,beizhu)
	if beizhu == nil then
		beizhu = ""
	end
	if num > 0 then
	post(actor,beizhu.."通用金币货币消耗*"..num)
	end
	consumebindmoney(actor,"金币",num)
end
--加绑定金币
function addbindgold(actor,num,beizhu)
	if beizhu == nil then
		beizhu = ""
	end
	return changemoney(actor,8,"+",num,beizhu,true)
end
---获取单获取金币
function getgold(actor)
	return querymoney(actor,7)
end

---获取单获取绑定金币
function getbindjinbi(actor)
	return querymoney(actor,8)
end

--加金币
function addgold(actor,num,beizhu)
	if beizhu == nil then
		beizhu = ""
	end
	return changemoney(actor,7,"+",num,beizhu,true)
end
--减金币
function subgold(actor,num,beizhu)
	if beizhu == nil then
		beizhu = ""
	end
	if num > 0 then
		post(actor,beizhu.."非绑定金币货币消耗*"..num)
	end
	return changemoney(actor,7,"-",num,beizhu,true)
end

--获得元宝
function getingot(actor)
	return querymoney(actor,2)
end
--加元宝
function addingot(actor,num,beizhu)
	if beizhu == nil then
		beizhu = ""
	end
	return changemoney(actor,2,"+",num,beizhu,true)
end
--减元宝
function subingot(actor,num,beizhu)
	if beizhu == nil then
		beizhu = ""
	end
	post(actor,beizhu.."元宝货币消耗*"..num)
	
	if beizhu == "开启狂暴" then
		setsysint("开狂暴消耗的元宝",getsysint("开狂暴消耗的元宝")+num)
		setsysint("每日开狂暴消耗的元宝",getsysint("每日开狂暴消耗的元宝")+num)
	elseif beizhu == "骰王" then
		setsysint("骰王消耗的元宝",getsysint("骰王消耗的元宝")+num)
		setsysint("每日骰王消耗的元宝",getsysint("每日骰王消耗的元宝")+num)
	elseif beizhu == "买药" then
		setsysint("买药消耗的元宝",getsysint("买药消耗的元宝")+num)
		setsysint("每日买药消耗的元宝",getsysint("每日买药消耗的元宝")+num)
	elseif beizhu == "洗武穆遗书" then
		setsysint("洗武穆遗书消耗的元宝",getsysint("洗武穆遗书消耗的元宝")+num)
		setsysint("每日洗武穆遗书消耗的元宝",getsysint("每日洗武穆遗书消耗的元宝")+num)
	elseif beizhu == "幸运项链" then
		setsysint("幸运项链消耗的元宝",getsysint("幸运项链消耗的元宝")+num)
		setsysint("每日幸运项链消耗的元宝",getsysint("每日幸运项链消耗的元宝")+num)
	elseif beizhu == "购买锄头" then
		setsysint("购买锄头消耗的元宝",getsysint("购买锄头消耗的元宝")+num)
		setsysint("每日购买锄头消耗的元宝",getsysint("每日购买锄头消耗的元宝")+num)
	elseif beizhu == "洗天赋" then
		setsysint("须弥禅师消耗的元宝",getsysint("须弥禅师消耗的元宝")+num)
		setsysint("每日须弥禅师消耗的元宝",getsysint("每日须弥禅师消耗的元宝")+num)	
	elseif beizhu == "购买周卡" then
		setsysint("购买周卡消耗元宝",getsysint("购买周卡消耗元宝")+num)
		setsysint("每日购买周卡消耗元宝",getsysint("每日购买周卡消耗元宝")+num)		
	end
	return changemoney(actor,2,"-",num,beizhu,true)
end


--获得声望数量
function getshengwang(actor)
	return querymoney(actor,15)
end
--加声望
function addshengwang(actor,num,beizhu)
	if beizhu == nil then
		beizhu = ""
	end
	return changemoney(actor,15,"+",num,beizhu,true)
end
--减声望
function subshengwang(actor,num,beizhu)
	if beizhu == nil then
		beizhu = ""
	end
	return changemoney(actor,15,"-",num,beizhu,true)
end

--获得天赋点数量
function gettianfudian(actor)
	return querymoney(actor,5)
end
--加天赋点
function addtianfudian(actor,num,beizhu)
	if beizhu == nil then
		beizhu = ""
	end
	return changemoney(actor,5,"+",num,beizhu,true)
end
--减天赋点
function subtianfudian(actor,num,beizhu)
	if beizhu == nil then
		beizhu = ""
	end
	return changemoney(actor,5,"-",num,beizhu,true)
end

--获得兽魂值数量
function getshouhunzhi(actor)
	return querymoney(actor,10)
end
--加兽魂值
function addshouhunzhi(actor,num,beizhu)
	if beizhu == nil then
		beizhu = ""
	end
	return changemoney(actor,10,"+",num,beizhu,true)
end
--减兽魂值
function subshouhunzhi(actor,num,beizhu)
	if beizhu == nil then
		beizhu = ""
	end
	return changemoney(actor,10,"-",num,beizhu,true)
end

--获得赏金值数量
function getshangjinzhi(actor)
	return querymoney(actor,11)
end
--加赏金值
function addshangjinzhi(actor,num,beizhu)
	if beizhu == nil then
		beizhu = ""
	end
	return changemoney(actor,11,"+",num,beizhu,true)
end
--减赏金值
function subshangjinzhi(actor,num,beizhu)
	if beizhu == nil then
		beizhu = ""
	end
	return changemoney(actor,11,"-",num,beizhu,true)
end


--脚本总耗时
function haoshistart(actor)
	callscriptex(actor, "PRINTUSETIME", 1)
end
function haoshiend(actor)
	callscriptex(actor, "PRINTUSETIME", 2)
end

--删除物品
function delitem(actor,item,sl)
	if sl == nil then
		sl = getiteminfo(actor,item,5)
		if sl == 0 then
			sl = 1
		end
	end
	return delitembymakeindex(actor,getiteminfo(actor,item,1),sl)
end

--获取已装备的全套装备的最低极品等级
local jipintaozhuangjisuant = {1,0,4,3,7,8,5,6,2,11,12,10,13,14}
function getjipintaozhuanglevel(actor)
    local _List = {}
	local t = jipintaozhuangjisuant
    for i = 1, #t do
        _List[i] = 0
        local item = linkbodyitem(actor,t[i])
		if item ~= "0" then
			local val = getitemaddvalue(actor,item,1,2)
			local val2 = getitemaddvalue(actor,item,1,3)
			local val3 = getitemaddvalue(actor,item,1,4)
			if val < val2 then
				val = val2
			end
			if val < val3 then
				val = val3
			end
			_List[i] = val
		end
    end

    table.sort(_List, function(l, r)
        return l > r
    end)

    return _List[10]
end

local taozhuanggeibuff_t = {
	[0]=10100,[1]=10101,[2]=10102,[3]=10103,[4]=10104,[5]=10105,[6]=10106,[7]=10107,[8]=10108,[9]=10109,[10]=10110,
}
local jptzjieshao = {
		"HP+3%",
		"HP+6%",
		"HP+9%",
		"HP+12%",
		"HP+15%，攻魔道+3%",
		"HP+18%，攻魔道+6%",
		"HP+20%，攻魔道+9%",
		"HP+20%，攻魔道+12%",
		"HP+20%，攻魔道+15%",
		"HP+20%，攻魔道+15%，暴击+2%",
			}
function jipintaozhuanggeibuff(actor)
	local lev = getjipintaozhuanglevel(actor) --获取套装等级属性
	--sendmsg6(actor,"套装等级"..lev)
	if not hasbuff(actor,taozhuanggeibuff_t[lev]) then
		addbuff(actor,taozhuanggeibuff_t[lev])
		if lev > 0 then
			sendmsg6(actor,"触发极品+".. lev .."套："..jptzjieshao[lev])
		end
	end
	
end

--秒转时分秒  100 = 00:01:40
function ssrSecToHMS(sec)
    sec = sec or 0

    local h,m,s = 0,0,0
    if sec > 3600 then
        h = math.floor(sec/3600)
    end
    sec = sec % 3600
    if sec > 60 then
        m = math.floor(sec/60)
    end
    s = sec % 60

    return string.format("%02d:%02d:%02d", h, m, s)
end

function huicheng(actor)
	mapmove(actor,"3",330,330,6)
end

function getitemnamebymakeid(actor,makeid)
	local item = getitembymakeindex(actor,makeid)
	local name = getitemname(actor,item)
	return name
end

function jianhuanum(num)
	if num >= 100000000 then
		local yi = num/100000000
		local zhi = yi - yi%0.01
		return zhi .. "亿"
	end
	if num >= 10000 then
		local wan = num/10000
		if wan >= 10 then
			return math.floor(wan) .. "万"
		end
		
		local zhi = wan - wan%0.01
		return zhi .. "万"
	end
	return num
end

function isyongyou(actor,iname,weizi) --装备名  位置
	if itemcount(actor,iname) > 0 then
		return true
	end
	local item = linkbodyitem(actor,weizi)
	--sendmsg9(actor,item)
	if item ~= "0" then
		if getitemname(actor,item) == iname then
			return true
		end
	end
	return false
end

local hongdianlv = {40,42,44,46,48,50,52,54,56}
function dengjihongdian(actor)
	local rolelv = getlevel(actor)
	for i = 1,#hongdianlv do
		if rolelv < hongdianlv[i] then
			break
		end
		if getint(actor,"等级奖励"..hongdianlv[i]) == 0 then
			return true
		end
	end
	return false
end

function movejiuguan(actor)
	if getmap(actor) == "waigua" or getmap(actor) == "tuoji" then
		return false
	end
	opennpcshowex(actor,36,12,3)
	setint(actor,"酒剑仙任务引导",1)
	callscriptex(actor, "CallLua", "renwuzhanshi", "@renwu_show") --挖矿任务显示
end

function isingongchengquyu(actor)
	if castleinfo(5) and (getmap(actor) == "0150" or (getmap(actor) == "3" and getx(actor) >= 544  and gety(actor) <= 390 )) then
		return true
	end
	return false
end

--获取经验值
function getjingyan(actor)
	local jingyan = getstr(actor,"经验值")
	return tonumber(jingyan) or 0
end

--存储经验值
function setjingyan(actor,zhi)
	setstr(actor,"经验值",tostring(zhi))
	zhuangtaijiemian(actor)
end

--post消息记录
function post(actor,xiaoxi)
	local fuwuqiname = getconst(actor,"<$SERVERNAME>") --服务器名称
	if fuwuqiname == "" then
		fuwuqiname = "工具服"
	end
	local curtime = os.date("%Y-%m-%d %H:%M:%S", os.time())
end

--post1消息记录
function post1(actor,xiaoxi)
	local fuwuqiname = getconst(actor,"<$SERVERNAME>") --服务器名称
	if fuwuqiname == "" then
		fuwuqiname = "工具服"
	end
	local curtime = os.date("%Y-%m-%d %H:%M:%S", os.time())
end

function getguaigongjitime(mon)
	local zhi = getcurrent(mon,6)
	if zhi == "" then
		zhi = 0
	end
	return tonumber(zhi) or 0
end

function setguaigongjitime(mon,zhi)
	setcurrent(mon,6,tostring(zhi))
end

function getdiaoluodata()
	local t = {}
	local str = getsysstr("掉落查询数据")
	if str ~= "" then
		t = json2tbl(str)
	end
	return t
end

-----功能公用函数----------------------------------------------------
function touwangchuli(actor)
	local is = false
	local name = getname(actor)
	for i =1,6 do
		if getsysstr("骰王"..i) == name then
			is = true
		end
	end
	if is then --是的话
		if not hasbuff(actor,10057) then
			addbuff(actor,10057)
		end
	else
		if hasbuff(actor,10057) then
			delbuff(actor,10057)
		end
	end
end

function wulinzhizunchuli(actor)
	if getsysstr("武林至尊名字") == getname(actor) then --是的话
		if not checktitle(actor,"武林至尊") then
			confertitle(actor,"武林至尊")
		end
	else
		if checktitle(actor,"武林至尊") then
			deprivetitle(actor,"武林至尊")
		end
	end
end