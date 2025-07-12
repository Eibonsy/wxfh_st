function getshouhunbuffdata(actor) --获取兽魂buff数据
	local data = {"","","","","",""}
	local sh_str = getstr(actor,"兽魂buff数据")
	if sh_str ~= "" then
		data=json2tbl(sh_str)
	end
	return data
end

function ontimer1(actor) --每秒定时器 处理 兽魂buff
	--sendmsg6(actor,"颜色"..getbaseinfo(actor,56))
	--haoshistart(actor) --此核心功能无法优化
	local sh_t = {} --拥有的兽魂T
	local sh_data = getshouhunbuffdata(actor) --兽魂buff数据
	for i = 1,#sh_data do
		if sh_data[i] ~= "" then
			sh_t[sh_data[i]] = 1
		end
	end

	if sh_t["天星术"] then --有这个兽魂魂技
		--sendmsg6(actor,"有天星术魂技")
		local sgsl = 0 --星星数量
		local sx_zbtab = {4,3,5,6,7,8,10,11,0}
		---------升星属性---------
		for i = 1,#sx_zbtab do
			local item = linkbodyitem(actor,sx_zbtab[i])
			if item ~= "0" then
				sgsl = sgsl + getitemaddvalue(actor,item,2,3)
			end
		end
		
		local cengshu = 0 --buff层数
		if hasbuff(actor,20000) then
			cengshu = getbuffinfo(actor,20000,1) --现在有的层数
		end
		local yy_cs = math.floor(sgsl/8) --需要给的层数
		local csc = yy_cs - cengshu   --层数差
		if csc < 0 then --星星变化
			delbuff(actor,20000)
		end
		for i = 1,csc do
			addbuff(actor,20000)
			--sendmsg6(actor,"添加魂技天星术buff")
		end
	else
		if hasbuff(actor,20000) then
			delbuff(actor,20000)
		end
	end
	
	if sh_t["屠魔者"] then --有这个兽魂魂技
		--sendmsg6(actor,"有屠魔者魂技")
		local sgsl = getdayint(actor,"每日杀怪数量")
		local cengshu = 0 --buff层数
		if hasbuff(actor,20001) then
			cengshu = getbuffinfo(actor,20001,1)
		end
		local yy_cs = math.floor(sgsl/100) --需要给的层数
		if yy_cs > 5 then
			yy_cs = 5
		end
		local csc = yy_cs - cengshu   --层数差
		if csc < 0 then --隔天后会出现此情况
			delbuff(actor,20001)
		end
		for i = 1,csc do
			addbuff(actor,20001)
			--sendmsg6(actor,"添加魂技屠魔者buff")
		end
	else
		--sendmsg6(actor,"没有屠魔者魂技")
		if hasbuff(actor,20001) then
			delbuff(actor,20001)
		end
	end
	
	if sh_t["鼓舞"] then --有这个兽魂魂技
		local sgsl = getint(actor,"杀大怪数量")
		local cengshu = 0 --buff层数
		if hasbuff(actor,20007) then
			cengshu = getbuffinfo(actor,20007,1)
		end
		local yy_cs = sgsl --需要给的层数
		if yy_cs > 3 then
			yy_cs = 3
		end
		local csc = yy_cs - cengshu   --层数差
		if csc < 0 then --隔天后会出现此情况
			delbuff(actor,20007)
		end
		for i = 1,csc do
			addbuff(actor,20007)
			--sendmsg6(actor,"添加魂技鼓舞buff")
		end
	else
		if hasbuff(actor,20007) then
			delbuff(actor,20007)
		end
	end
	
	if sh_t["聚宝术"] then --有这个兽魂魂技
		local sgsl = getdayint(actor,"每日杀狂暴数量")
		local cengshu = 0 --buff层数
		if hasbuff(actor,20026) then
			cengshu = getbuffinfo(actor,20026,1)
		end
		local yy_cs = sgsl --需要给的层数
		if yy_cs > 10 then
			yy_cs = 10
		end
		local csc = yy_cs - cengshu   --层数差
		if csc < 0 then --隔天后会出现此情况
			delbuff(actor,20026)
		end
		for i = 1,csc do
			addbuff(actor,20026)
			--sendmsg6(actor,"添加魂技聚宝术buff")
		end
	else
		if hasbuff(actor,20026) then
			delbuff(actor,20026)
		end
	end
	
	if sh_t["越死越强"] then --有这个兽魂魂技
		local sgsl = getdayint(actor,"当天死亡次数")
		local cengshu = 0 --buff层数
		if hasbuff(actor,20035) then
			cengshu = getbuffinfo(actor,20035,1)
		end
		local yy_cs = sgsl --需要给的层数
		if yy_cs > 8 then
			yy_cs = 8
		end
		local csc = yy_cs - cengshu   --层数差
		if csc < 0 then --隔天后会出现此情况
			delbuff(actor,20035)
		end
		for i = 1,csc do
			addbuff(actor,20035)
			--sendmsg6(actor,"添加魂技越死越强buff")
		end
	else
		if hasbuff(actor,20035) then
			delbuff(actor,20035)
		end
	end
	
	if sh_t["生财"] then --有这个兽魂魂技
		--sendmsg6(actor,"有生财魂技")
		local sgsl = itemcount(actor,"金条")
		local cengshu = 0 --buff层数
		if hasbuff(actor,20008) then
			cengshu = getbuffinfo(actor,20008,1)
		end
		local yy_cs = sgsl --需要给的层数
		if yy_cs > 5 then
			yy_cs = 5
		end
		local csc = yy_cs - cengshu   --层数差
		if csc < 0 then --金条变化
			delbuff(actor,20008)
		end
		for i = 1,csc do
			addbuff(actor,20008)
			--sendmsg6(actor,"添加魂技生财buff")
		end
	else
		if hasbuff(actor,20008) then
			delbuff(actor,20008)
		end
	end
	
	if sh_t["多财多伤"] then --有这个兽魂魂技
		--sendmsg6(actor,"有生财魂技")
		local sgsl = itemcount(actor,"金条")
		local cengshu = 0 --buff层数
		if hasbuff(actor,20036) then
			cengshu = getbuffinfo(actor,20036,1)
		end
		local yy_cs = math.floor(sgsl/2) --需要给的层数
		if yy_cs > 3 then
			yy_cs = 3
		end
		local csc = yy_cs - cengshu   --层数差
		if csc < 0 then --金条变化
			delbuff(actor,20036)
		end
		for i = 1,csc do
			addbuff(actor,20036)
			--sendmsg6(actor,"添加魂技聚伤buff")
		end
	else
		if hasbuff(actor,20036) then
			delbuff(actor,20036)
		end
	end
	
	if sh_t["打宝者"] then --有这个兽魂魂技
		--sendmsg6(actor,"有生财魂技")
		local sgsl = getingot(actor)
		local cengshu = 0 --buff层数
		if hasbuff(actor,20016) then
			cengshu = getbuffinfo(actor,20016,1)
		end
		local yy_cs = math.floor(sgsl/10000) --需要给的层数 --需要给的层数
		if yy_cs > 5 then
			yy_cs = 5
		end
		local csc = yy_cs - cengshu   --层数差
		if csc < 0 then --金条变化
			delbuff(actor,20016)
		end
		for i = 1,csc do
			addbuff(actor,20016)
			--sendmsg6(actor,"添加魂技打宝者buff")
		end
	else
		if hasbuff(actor,20016) then
			delbuff(actor,20016)
		end
	end
	
	if sh_t["强身健体"] and getlevel(actor) > 40 then --有这个兽魂魂技
		--sendmsg6(actor,"有生财魂技")
		local sgsl = getlevel(actor) - 40
		local cengshu = 0 --buff层数
		if hasbuff(actor,20018) then
			cengshu = getbuffinfo(actor,20018,1)
		end
		local yy_cs = sgsl --需要给的层数 --需要给的层数
		local csc = yy_cs - cengshu   --层数差
		if csc < 0 then --转生掉级变化
			delbuff(actor,20018)
		end
		for i = 1,csc do
			addbuff(actor,20018)
			--sendmsg6(actor,"添加魂技强身健体buff")
		end
	else
		if hasbuff(actor,20018) then
			delbuff(actor,20018)
		end
	end
	
	if sh_t["步步高升"] and getlevel(actor) > 47 then --有这个兽魂魂技
		--sendmsg6(actor,"有生财魂技")
		local sgsl = math.floor((getlevel(actor) - 45)/3)
		local cengshu = 0 --buff层数
		if hasbuff(actor,20023) then
			cengshu = getbuffinfo(actor,20023,1)
		end
		local yy_cs = sgsl --需要给的层数 
		local csc = yy_cs - cengshu   --层数差
		if csc < 0 then --转生掉级变化
			delbuff(actor,20023)
		end
		for i = 1,csc do
			addbuff(actor,20023)
			--sendmsg6(actor,"添加魂技步步高升buff")
		end
	else
		if hasbuff(actor,20023) then
			delbuff(actor,20023)
		end
	end
	
	if sh_t["百炼成钢"] and getlevel(actor) > 60 then --有这个兽魂魂技
		--sendmsg6(actor,"有暴击减免魂技")
		local sgsl = getlevel(actor) - 60
		local cengshu = 0 --buff层数
		if hasbuff(actor,20054) then
			cengshu = getbuffinfo(actor,20054,1)
		end
		local yy_cs = sgsl --需要给的层数 
		local csc = yy_cs - cengshu   --层数差
		if csc < 0 then --转生掉级变化
			delbuff(actor,20054)
		end
		for i = 1,csc do
			addbuff(actor,20054)
			--sendmsg6(actor,"添加魂技暴击减免buff")
		end
	else
		if hasbuff(actor,20054) then
			delbuff(actor,20054)
		end
	end
	
	if sh_t["争强好胜"] then --有这个兽魂魂技
		--sendmsg6(actor,"有生财魂技")
		local pk = getbaseinfo(actor,46) --pk点
		local cengshu = 0 --buff层数
		if hasbuff(actor,20032) then
			cengshu = getbuffinfo(actor,20032,1)
		end
		local yy_cs = 0 --需要给的层数 
		if pk >= 1000 then
			yy_cs = 1
		end
		if pk >= 3000 then
			yy_cs = 2
		end
		if pk >= 5000 then
			yy_cs = 3
		end
		local csc = yy_cs - cengshu   --层数差
		if csc < 0 then --pk值变化
			delbuff(actor,20032)
		end
		for i = 1,csc do
			addbuff(actor,20032)
			--sendmsg6(actor,"添加魂技争强好胜buff")
		end
	else
		if hasbuff(actor,20032) then
			delbuff(actor,20032)
		end
	end
	
	if sh_t["金戈铁马"] then --有这个兽魂魂技
		--sendmsg6(actor,"有生财魂技")
		local pk = getbaseinfo(actor,46) --pk点
		if pk >= 15000 then
			if not hasbuff(actor,20051) then
				addbuff(actor,20051)
			end
		else
			if hasbuff(actor,20051) then
				delbuff(actor,20051)
			end
		end
	else
		if hasbuff(actor,20051) then
			delbuff(actor,20051)
		end
	end
	
	if sh_t["正义之师"] then --有这个兽魂魂技
		--sendmsg6(actor,"有正义之师魂技")
		if getbaseinfo(actor,36) ~= "" then --有行会
			if not hasbuff(actor,20012) then
				addbuff(actor,20012)
				sendmsg6(actor,"添加魂技正义之师buff")
			end
		else
			if hasbuff(actor,20012) then
				delbuff(actor,20012)
			end
		end
	else
		if hasbuff(actor,20012) then
			delbuff(actor,20012)
		end
	end
	
	if sh_t["侠肝义胆"] then --有这个兽魂魂技
		--sendmsg6(actor,"有侠肝义胆魂技")
		local duiyuanshu = getgroupmember(actor) or {} --队员列表
		local you = false   --是否应该有该buff
		if #duiyuanshu > 1 then --组队状态
			you = true
			local mapid = getmap(duiyuanshu[1])
			for i = 2,#duiyuanshu do
				if getmap(duiyuanshu[i]) ~= mapid then
					you = false
					break
				end
			end
		end
		if you then
			if not hasbuff(actor,20002) then
				addbuff(actor,20002)
				--sendmsg6(actor,"添加魂技侠肝义胆buff")
			end
		else
			if hasbuff(actor,20002) then
				delbuff(actor,20002)
			end
		end
	else
		if hasbuff(actor,20002) then
			delbuff(actor,20002)
		end
	end
	
	if sh_t["同甘共苦"] then --有这个兽魂魂技
		local peiouname = getconst(actor,"<$DEARNAME>") --配偶名字
		--sendmsg6(actor,"配偶名"..peiouname)
		if peiouname ~= "" then --有配偶
			if callcheckscriptex(actor, peiouname..".checkonline") then
				player = getplayerbyname(peiouname) --配偶对象
				if getmap(player) == getmap(actor) then --同一地图
					if not hasbuff(actor,20014) then
						addbuff(actor,20014)
						--sendmsg6(actor,"添加魂技同甘共苦buff")
					end
				else
					if hasbuff(actor,20014) then
						delbuff(actor,20014)
					end
				end	
			else
				if hasbuff(actor,20014) then
					delbuff(actor,20014)
				end
			end	
		else
			if hasbuff(actor,20014) then
				delbuff(actor,20014)
			end
		end
	else
		if hasbuff(actor,20014) then
			delbuff(actor,20014)
		end
	end
	
	if sh_t["相濡以沫"] then --有这个兽魂魂技
		local peiouname = getconst(actor,"<$DEARNAME>") --配偶名字
		--sendmsg6(actor,"配偶名"..peiouname)
		if peiouname ~= "" then --有配偶
			if not hasbuff(actor,20033) then
				addbuff(actor,20033)
				--sendmsg6(actor,"添加魂技同甘共苦buff")
			end	
		else
			if hasbuff(actor,20033) then
				delbuff(actor,20033)
			end
		end
	else
		if hasbuff(actor,20033) then
			delbuff(actor,20033)
		end
	end
	
	if sh_t["舍生取义"] then --有这个兽魂魂技
		local you = false
		local gongji = getbaseinfo(actor,20)
		local mofa = getbaseinfo(actor,22)
		local daoshu = getbaseinfo(actor,24)
		--sendmsg6(actor,"攻击"..gongji.." 魔法"..mofa.." 道术"..daoshu)
		local job = getjob(actor)
		if job == 0 and gongji < 100 then
			you = true
		end
		if job == 1 and mofa < 100 then
			you = true
		end
		if job == 2 and daoshu < 100 then
			you = true
		end
		
		if you then 
			if not hasbuff(actor,20034) then
				addbuff(actor,20034)
				--sendmsg6(actor,"添加魂技舍生取义buff")
			end
		else
			if hasbuff(actor,20034) then
				delbuff(actor,20034)
			end
		end
	else
		if hasbuff(actor,20034) then
			delbuff(actor,20034)
		end
	end
	
	if sh_t["独揽大权"] then --有这个兽魂魂技
		if getbaseinfo(actor,37) then --是会长
			if not hasbuff(actor,20015) then
				addbuff(actor,20015)
				--sendmsg6(actor,"添加魂技独揽大权buff")
			end
		else
			if hasbuff(actor,20015) then
				delbuff(actor,20015)
			end
		end
	else
		if hasbuff(actor,20015) then
			delbuff(actor,20015)
		end
	end
	
	if sh_t["赤膊上阵"] then --有这个兽魂魂技
		--sendmsg6(actor,"衣服 "..linkbodyitem(actor,0))
		if linkbodyitem(actor,0) == "0" then --没有穿衣服
			if not hasbuff(actor,20017) then
				addbuff(actor,20017)
				--sendmsg6(actor,"添加魂技赤膊上阵buff")
			end
		else
			if hasbuff(actor,20017) then
				delbuff(actor,20017)
			end
		end
	else
		if hasbuff(actor,20017) then
			delbuff(actor,20017)
		end
	end
	
	if sh_t["天选之子"] then --有这个兽魂魂技
		if hasbuff(actor,10001) or hasbuff(actor,20083) then --有狂暴
			if not hasbuff(actor,20003) then
				addbuff(actor,20003)
				--sendmsg6(actor,"添加魂技天选之子buff")
			end
		else
			if hasbuff(actor,20003) then
				delbuff(actor,20003)
			end
		end
	else
		if hasbuff(actor,20003) then
			delbuff(actor,20003)
		end
	end
	
	if sh_t["龙的传人"] then --有这个兽魂魂技
		if hasbuff(actor,10001) then --有狂暴
			if not hasbuff(actor,20019) then
				addbuff(actor,20019)
				--sendmsg6(actor,"添加魂技龙的传人buff")
			end
		else
			if hasbuff(actor,20019) then
				delbuff(actor,20019)
			end
		end
	else
		if hasbuff(actor,20019) then
			delbuff(actor,20019)
		end
	end
	
	if sh_t["有舍有得"] then --有这个兽魂魂技
		local zhi = getbaseinfo(actor,51,21) --暴击几率
		if zhi==0 then --暴击几率为0
			if not hasbuff(actor,20020) then
				addbuff(actor,20020)
				--sendmsg6(actor,"添加魂技有舍有得buff")
			end
		else
			if hasbuff(actor,20020) then
				delbuff(actor,20020)
			end
		end
	else
		if hasbuff(actor,20020) then
			delbuff(actor,20020)
		end
	end
	
	if sh_t["荣誉之光"] then --有这个兽魂魂技
		if castleidentity(actor)~=0 and getmap(actor) == "3" then --沙巴克的
			if not hasbuff(actor,20021) then
				addbuff(actor,20021)
				--sendmsg6(actor,"添加魂技荣誉之光buff")
			end
		else
			if hasbuff(actor,20021) then
				delbuff(actor,20021)
			end
		end
	else
		if hasbuff(actor,20021) then
			delbuff(actor,20021)
		end
	end
	
	if sh_t["一手遮天"] then --有这个兽魂魂技
		if castleidentity(actor)==2 then --沙老大
			if not hasbuff(actor,20039) then
				addbuff(actor,20039)
				--sendmsg6(actor,"添加魂技一手遮天buff")
			end
		else
			if hasbuff(actor,20039) then
				delbuff(actor,20039)
			end
		end
	else
		if hasbuff(actor,20039) then
			delbuff(actor,20039)
		end
	end
	
	if sh_t["暴伤减免"] then --有这个兽魂魂技
		if getdayint(actor,"当天死亡次数") > 0 then --每天死亡后
			if not hasbuff(actor,20022) then
				addbuff(actor,20022)
				--sendmsg6(actor,"添加魂技暴伤减免buff")
			end
		else
			if hasbuff(actor,20022) then
				delbuff(actor,20022)
			end
		end
	else
		if hasbuff(actor,20022) then
			delbuff(actor,20022)
		end
	end
	
	if sh_t["法外狂徒"] then --有这个兽魂魂技
		if getbaseinfo(actor,46) >= 200 then --pk点 红名
			if not hasbuff(actor,20024) then
				addbuff(actor,20024)
				--sendmsg6(actor,"添加魂技法外狂徒buff")
			end
		else
			if hasbuff(actor,20024) then
				delbuff(actor,20024)
			end
		end
	else
		if hasbuff(actor,20024) then
			delbuff(actor,20024)
		end
	end
	
	if sh_t["披荆斩棘"] then --有这个兽魂魂技
		if getbaseinfo(actor,46) >= 200 then --pk点 红名
			if not hasbuff(actor,20104) then
				addbuff(actor,20104)
				--sendmsg6(actor,"添加魂技披荆斩棘buff")
			end
		else
			if hasbuff(actor,20104) then
				delbuff(actor,20104)
			end
		end
	else
		if hasbuff(actor,20104) then
			delbuff(actor,20104)
		end
	end
	
	if sh_t["沙城霸主"] then --有这个兽魂魂技
		if callcheckscriptex(actor,"CheckInWarArea") then --攻城区域
			if not hasbuff(actor,20043) then
				addbuff(actor,20043)
				--sendmsg6(actor,"添加魂技越强越勇buff")
			end
		else
			if hasbuff(actor,20043) then
				delbuff(actor,20043)
			end
		end
	else
		if hasbuff(actor,20043) then
			delbuff(actor,20043)
		end
	end
	
	if sh_t["唯我独尊"] then --有这个兽魂魂技
		if callcheckscriptex(actor,"CheckInWarArea") then --攻城区域
			if not hasbuff(actor,20046) then
				addbuff(actor,20046)
				--sendmsg6(actor,"添加魂技唯我独尊buff")
			end
		else
			if hasbuff(actor,20046) then
				delbuff(actor,20046)
			end
		end
	else
		if hasbuff(actor,20046) then
			delbuff(actor,20046)
		end
	end
	
	if sh_t["枊暗花明"] then --有这个兽魂魂技
		if callcheckscriptex(actor,"checkhumanstate",11) then --中毒状态
			if not hasbuff(actor,20048) then
				addbuff(actor,20048)
				--sendmsg6(actor,"添加魂技枊暗花明buff")
			end
		else
			if hasbuff(actor,20048) then
				delbuff(actor,20048)
			end
		end
	else
		if hasbuff(actor,20048) then
			delbuff(actor,20048)
		end
	end
	
	
	if sh_t["黎明"] then --有这个兽魂魂技
		local hour = tonumber(os.date("%H",os.time()))
		--sendmsg6(actor,"小时"..hour)
		if hour >= 6 and hour < 18 then --6点到18点
			if not hasbuff(actor,20025) then
				addbuff(actor,20025)
				--sendmsg6(actor,"添加魂技黎明buff")
			end
		else
			if hasbuff(actor,20025) then
				delbuff(actor,20025)
			end
		end
	else
		if hasbuff(actor,20025) then
			delbuff(actor,20025)
		end
	end
	
	if sh_t["暗夜"] then --有这个兽魂魂技
		local hour = tonumber(os.date("%H",os.time()))
		--sendmsg6(actor,"小时"..hour)
		if hour >= 18 or hour < 6 then --18点到6点 之间
			if not hasbuff(actor,20031) then
				addbuff(actor,20031)
				--sendmsg6(actor,"添加魂技暗夜buff")
			end
		else
			if hasbuff(actor,20031) then
				delbuff(actor,20031)
			end
		end
	else
		if hasbuff(actor,20031) then
			delbuff(actor,20031)
		end
	end
	
	if sh_t["逝水"] and getlevel(actor) < 55 then --有这个兽魂魂技
		if not hasbuff(actor,20004)  then
			addbuff(actor,20004)
		end
	else
		if hasbuff(actor,20004) then
			delbuff(actor,20004)
		end
	end
	
	if sh_t["威势"] and getlevel(actor) > 50 then --有这个兽魂魂技
		if not hasbuff(actor,20005) then
			addbuff(actor,20005)
			--sendmsg6(actor,"添加魂技威势buff")
		end
	else
		if hasbuff(actor,20005) then
			delbuff(actor,20005)
		end
	end
	
	
	if sh_t["枯木逢春"] then --有这个兽魂魂技
		if not hasbuff(actor,20009) then
			addbuff(actor,20009)
			--sendmsg6(actor,"添加魂技枯木逢春buff")
		end
	else
		if hasbuff(actor,20009) then
			delbuff(actor,20009)
		end
	end
	if sh_t["神佑"] then --有这个兽魂魂技
		if not hasbuff(actor,20010) then
			addbuff(actor,20010)
			--sendmsg6(actor,"添加魂技神佑buff")
		end
	else
		if hasbuff(actor,20010) then
			delbuff(actor,20010)
		end
	end
	if sh_t["免疫"] then --有这个兽魂魂技
		if not hasbuff(actor,20027) then
			addbuff(actor,20027)
			--sendmsg6(actor,"添加魂技免疫buff")
		end
	else
		if hasbuff(actor,20027) then
			delbuff(actor,20027)
		end
	end

	
	if sh_t["早晚出事"] then --有这个兽魂魂技
		local hour = tonumber(os.date("%H",os.time()))
		--sendmsg6(actor,"小时"..hour)
		if hour >= 13 or hour < 11 then --6点到18点
			if not hasbuff(actor,20029) then
				addbuff(actor,20029)
				--sendmsg6(actor,"添加魂技早晚的事_减血buff")
			end
			if hasbuff(actor,20030) then
				delbuff(actor,20030)
			end
		else
			if hasbuff(actor,20029) then
				delbuff(actor,20029)
			end
			if not hasbuff(actor,20030) then
				addbuff(actor,20030)
				--sendmsg6(actor,"添加魂技早晚的事_加攻击buff")
			end
		end
	else
		if hasbuff(actor,20029) then
			delbuff(actor,20029)
		end
		if hasbuff(actor,20030) then
			delbuff(actor,20030)
		end
	end
	
	if sh_t["铁骨铮铮"] then --
		if getbaseinfo(actor,9)/getbaseinfo(actor,10) < 0.6 then
			if not hasbuff(actor,20038) then
				addbuff(actor,20038)
				--sendmsg6(actor,"触发魂技【铁骨铮铮】，双防增加15-15")
			end
		else
			if hasbuff(actor,20038) then
				delbuff(actor,20038)
			end
		end
	else
		if hasbuff(actor,20038) then
			delbuff(actor,20038)
		end
	end
	
	if sh_t["背水一战"] then --
		if getbaseinfo(actor,9)/getbaseinfo(actor,10) < 0.25 then
			if not hasbuff(actor,20055) then
				addbuff(actor,20055)
				--sendmsg6(actor,"触发魂技【背水一战】，暴击几率+50%")
			end
		else
			if hasbuff(actor,20055) then
				delbuff(actor,20055)
			end
		end
	else
		if hasbuff(actor,20055) then
			delbuff(actor,20055)
		end
	end
	
	if sh_t["风驰电掣"] then --
		if getbaseinfo(actor,9)/getbaseinfo(actor,10) < 0.8 then
			if not hasbuff(actor,19999) then
				addbuff(actor,19999)
				--sendmsg6(actor,"触发魂技【风驰电掣】，攻击速度+1 施法速度+1")
			end
		else
			if hasbuff(actor,19999) then
				delbuff(actor,19999)
			end
		end
	else
		if hasbuff(actor,19999) then
			delbuff(actor,19999)
		end
	end
	
	if sh_t["坚韧不拔"] then --有这个兽魂魂技
		--sendmsg6(actor,"有坚韧不拔魂技")
		local bili = math.ceil((getbaseinfo(actor,9)/getbaseinfo(actor,10))*10) --血量百分比
		local cengshu = 0 --buff层数
		if hasbuff(actor,20053) then
			cengshu = getbuffinfo(actor,20053,1)
		end
		local yy_cs = 0 --需要给的层数 
		yy_cs = 10 - bili
		local csc = yy_cs - cengshu   --层数差
		if csc < 0 then --pk值变化
			delbuff(actor,20053)
		end
		for i = 1,csc do
			addbuff(actor,20053)
			--sendmsg6(actor,"添加魂技坚韧不拔buff")
		end
	else
		if hasbuff(actor,20053) then
			delbuff(actor,20053)
		end
	end
	
	if sh_t["称王称霸"] and getsysstr("武林至尊名字") == getname(actor) then --有这个兽魂魂技
		if not hasbuff(actor,19998) then
			addbuff(actor,19998)
			--sendmsg6(actor,"添加魂技称王称霸buff")
		end
	else
		if hasbuff(actor,19998) then
			delbuff(actor,19998)
		end
	end
	
	if sh_t["风之守护"] then --有这个兽魂魂技
		if not hasbuff(actor,19994) then
			addbuff(actor,19994)
			--sendmsg6(actor,"添加魂技称王称霸buff")
		end
	else
		if hasbuff(actor,19994) then
			delbuff(actor,19994)
		end
	end
	
	if sh_t["破釜沉舟"] then --有这个兽魂魂技
		if not hasbuff(actor,20100) then
			addbuff(actor,20100)
		end
	else
		if hasbuff(actor,20100) then
			delbuff(actor,20100)
		end
	end
	if sh_t["年少得志"] then --有这个兽魂魂技
		if getlevel(actor) < 70 then
			if not hasbuff(actor,20101) then
				addbuff(actor,20101)
			end
		else
			if hasbuff(actor,20101) then
				delbuff(actor,20101)
			end
		end
	else
		if hasbuff(actor,20101) then
			delbuff(actor,20101)
		end
	end
	--haoshiend(actor)
	--haoshistart(actor) 暂时无法优化 新引擎有PK值变化触发
	if getbaseinfo(actor, 46) ~= querymoney(actor,13) then
		changemoney(actor,13,"=",getbaseinfo(actor, 46),"pk值变动",true)
	end

	-----------每秒回血
	meimiaohuixue(actor) --每秒回血 无法优化 只能定时器
	----------押镖属性
	yabiaoshuxing(actor)
	--------地主属性
	dizhushuxing(actor)

	--武穆遗书每日降攻防效果
	wumuyishujiang_gf(actor)
	--自动技能
	zidongshifangjineng(actor)
	--自动挂机随机检测
	zidongguajisuijijiance(actor)
	--名字自动变色
	namechangcolor(actor)
	---特效处理
	texiaochuli(actor)
	--沙巴克攻城玩家记录
	shabakejilu(actor)
	--限时地图
	xianshiditu(actor)
	--关闭镜像地图
	jingxiangditu(actor)
	--复活CD显示
	fuhuocdxianshi(actor) --复活CD显示
	
	--组队白嫖检测
	baipiaozudui(actor)
	--haoshiend(actor)
end

function baipiaozudui(actor)
	if getsysint("合区次数") > 0 then
		return
	end
	if os.time()%3 == 0 then
		local t = getgroupmember(actor) --组队列表
		if t and #t >= 3 then
			local bpsl = 0 --白嫖数量
			for i = 1,#t do
				if getint(t[i],"累计充值") == 0 then
					bpsl = bpsl + 1
				end
			end
			--sendmsg0(0,"白嫖数量"..bpsl)
			if bpsl >= 3 then
				if getint(actor,"累计充值") == 0 and getint(actor,"白嫖号") == 0 then
					setattackmode(actor,1,99999)
					setint(actor,"白嫖号",1)
					--sendmsg9(actor,"为防止群控外挂恶意捣乱影响玩家游戏,请将无充值队伍人员控制在三人以内,敬请谅解,详情咨询客服")
					sendcentermsg(actor,253,0,"为防止群控外挂恶意捣乱影响玩家游戏,请将无充值队伍人员控制在三人以内,敬请谅解,详情咨询客服.",0,5)
				end
				if os.time()%60 == 0 and getint(actor,"白嫖号") == 1 then
					--sendmsg9(actor,"为防止群控外挂恶意捣乱影响玩家游戏,请将无充值队伍人员控制在三人以内,敬请谅解,详情咨询客服")
					sendcentermsg(actor,253,0,"为防止群控外挂恶意捣乱影响玩家游戏,请将无充值队伍人员控制在三人以内,敬请谅解,详情咨询客服.",0,5)
				end
			else
				if getint(actor,"白嫖号") == 1 then
					setattackmode(actor,-1)
					setint(actor,"白嫖号",0)
				end
			end
			
			if bpsl >= 4 then
				if not hasbuff(actor,20117) and getint(actor,"累计充值") == 0 then --白嫖号大于3个禁止回血回蓝
					addbuff(actor,20117)
					--sendmsg9(actor,"增加buff")
				end
			else
				if hasbuff(actor,20117) then
					delbuff(actor,20117)
					--sendmsg9(actor,"删除buff")
				end
			end
		else
			if hasbuff(actor,20117) then
				delbuff(actor,20117)
			end
			if getint(actor,"白嫖号") == 1 then
				setattackmode(actor,-1)
				setint(actor,"白嫖号",0)
			end	
		end	
	end
end

function yichangjiance(actor)
	if getdayint(actor,"异常检测") == 0 then
		if getint(actor,"累计充值") < 1000 then
			if getbindgold(actor) >= 30000000 then
				post1(actor,"数据异常，充值小于1000绑定金币大于3000万")
				setdayint(actor,"异常检测",1)
			end 
			if getingot(actor) >= 300000 then
				post1(actor,"数据异常，充值小于1000元宝大于30万")
				setdayint(actor,"异常检测",1)
			end
		end
		if getint(actor,"累计充值") < 3000 then
			if getgold(actor) >= 100000000 then
				post1(actor,"数据异常，充值小于3000金币大于1亿")
				setdayint(actor,"异常检测",1)
			end 
			if itemcount(actor,"金条") >= 100 then
				post1(actor,"数据异常，充值小于3000金条大于100")
				setdayint(actor,"异常检测",1)
			end
		end
		if getint(actor,"累计充值") < 5000 then
			if getingot(actor) >= 800000 then
				post1(actor,"数据异常，充值小于5000元宝大于80万")
				setdayint(actor,"异常检测",1)
			end
		end
	end
end
	
function jingxiangditu(actor)
	local mapid = getmap(actor)
	if mapid == "womajingxiang" and os.time() - getsysint("开区时间") > 3600*6 then
		map(actor,"d022")
	end
	if mapid == "niumojingxiang" and os.time() - getsysint("开区时间") > 3600*4 then
		map(actor,"d2073")
	end
end

function xianshiditu(actor) --限时地图
	if getmap(actor) == "wzad" then
		if not hasbuff(actor,20112) then
			addbuff(actor,20112)
		end
	else
		if hasbuff(actor,20112) then
			delbuff(actor,20112)
		end
	end
	if getstr(actor,"限时地图") == getmap(actor) then
		if os.time() - getint(actor,"限时地图进入时间") > getint(actor,"限时时间") + 2 then
			huicheng(actor)
		end
	end
end

function shabakejilu(actor)
	--haoshistart(actor)
	if getbaseinfo(actor,36) == "" then --无行会
		return
	end
	if not isingongchengquyu(actor) then --不是攻城区域
		return
	end
	
	setdayint(actor,"在攻城区域时间",getdayint(actor,"在攻城区域时间")+1)
	if getdayint(actor,"在攻城区域时间") >= 60*15 and getdayint(actor,"在攻城奖励名单") == 0 then
		addgongchengmingdan(actor) --添加攻城名单
		--sendmsg9(actor,"添加到奖励名单")
	end
	--haoshiend(actor)
end

function addgongchengmingdan(actor) --添加攻城名单
	local t = {}
	local str = getsysstr("攻城奖励名单") --攻城可奖励的名单
	if str ~= "" then
		--sendmsg9(actor,"有数据"..str)
		t = json2tbl(str)
	end
	local zai = false
	for i = 1,#t do
		if getname(actor) == t[i][1] then
			zai = true
		end
	end
	if not zai then
		table.insert(t,{getname(actor),getbaseinfo(actor,36)}) --名字 行会
		setsysstr("攻城奖励名单",tbl2json(t))
		setdayint(actor,"在攻城奖励名单",1)
	end
end

function texiaochuli(actor)
	--sendmsg6(actor,"倒计时"..os.time() - getint(actor,"上次聚魔时间"))
	if getint(actor,"武穆遗书2编号")==27 and getjob(actor) == 1 and os.time() - getint(actor,"上次聚魔时间") == 300 then
		--sendmsg6(actor,"放特效")
		playeffect(actor,108,0,0,1,0,0)	
	end
end

local namecolors = {253,243,144,250,249,255,48,251,147,247}
function namechangcolor(actor)
	if getint(actor,"名字自动变色") == 1 then
		local colorbh = getint(actor,"名字颜色编号") + 1
		changenamecolor(actor,namecolors[colorbh])
		if colorbh >= 10 then
			setint(actor,"名字颜色编号",0)
		else
			setint(actor,"名字颜色编号",colorbh)
		end
	end
end

function zidongguajisuijijiance(actor)
	local mapid = getmap(actor)
	if getint(actor,"挂机自动随机") == 1 then
		if getplaydef(actor,"N$挂机状态") == 1 then --挂机中
			if os.time() - getint(actor,"最后出刀时间") >= 60 then				
				if itemcount(actor,"随机传送石") > 0 then
					eatitem(actor,"随机传送石",1)
				elseif itemcount(actor,"永久随机石") > 0 then
					eatitem(actor,"永久随机石",1)
				end
				setint(actor,"最后出刀时间",os.time())
			end
			--sendmsg9(actor,"随机倒计时"..os.time() - getint(actor,"最后出刀时间"))
		end
	end 
end

function zidongshifangjineng(actor)
	if getjob(actor) == 2 then
		if getskillinfo(actor,getskillidbyname("无极真气"),1) and getint(actor,"自动无极真气") == 1 and not getbaseinfo(actor,0) then
			if os.time() - getint(actor,"无极真气时间") >= 60 then
				callscriptex(actor, "ReleaseMagic", 50,0, getskillinfo(actor,getskillidbyname("无极真气"),1), 2)
			end
		end
		if getint(actor,"自动召唤神兽") == 1 and not getbaseinfo(actor,0) then --不是死亡状态
			local bb_t = getbaobaolist(actor) --宝宝列表
			local zuidashu = 1
			if getint(actor,"武穆遗书2编号") == 42 and getskilllevel(actor,getskillidbyname("召唤神兽")) == 4 then
				zuidashu = 2
			end
			if #bb_t < zuidashu then
				releasemagic(actor,getskillidbyname("召唤神兽"),1,getskillinfo(actor,getskillidbyname("召唤神兽"),1),2,1)
			end
		end
	end
end

function wumuyishujiang_gf(actor)
	if getint(actor,"武穆遗书3编号") == 46 and os.time()%3 == 0 then
		detoxifcation(actor,0)
		detoxifcation(actor,1)
	end

	if getint(actor,"武穆遗书3编号")==3 then
		if getbaseinfo(actor,9)/getbaseinfo(actor,10) < 0.8 then
			if not hasbuff(actor,20089) then
				addbuff(actor,20089)
			end
		else
			if hasbuff(actor,20089) then
				delbuff(actor,20089)
			end
		end
	end
	
	if getint(actor,"武穆遗书3编号")==4 then
		if getbaseinfo(actor,9)/getbaseinfo(actor,10) < 0.8 then
			if not hasbuff(actor,20090) then
				addbuff(actor,20090)
			end
		else
			if hasbuff(actor,20090) then
				delbuff(actor,20090)
			end
		end
	end
	
	
	
	if getdayint(actor,"武穆遗书降攻击") == 1 then
		if not hasbuff(actor,20080) then
			addbuff(actor,20080)
		end
	else
		if hasbuff(actor,20080) then
			delbuff(actor,20080)
		end
	end
	if getdayint(actor,"武穆遗书降防御") == 1 then
		if not hasbuff(actor,20081) then
			addbuff(actor,20081)
		end
	else
		if hasbuff(actor,20081) then
			delbuff(actor,20081)
		end
	end
	
	local item = linkbodyitem(actor,16) --盾位置装备 酒葫芦
	if item ~= "0" then
		if getint(actor,"武穆遗书3编号") == 43 then
			if hasbuff(actor,10054) or hasbuff(actor,10055) then
				if not hasbuff(actor,20082) then
					addbuff(actor,20082)
				end
			else
				if hasbuff(actor,20082) then
					delbuff(actor,20082)
				end
			end		
		else
			if hasbuff(actor,20082) then
				delbuff(actor,20082)
			end
		end
	else
		if hasbuff(actor,20082) then
			delbuff(actor,20082)
		end
	end
	
	----施法速度
	local sufasudu = getbaseinfo(actor,51,207)
	--sendmsg6(actor,"施法速度"..sufasudu)
	--changespeed(actor,3,2)
	callscriptex(actor, "CHANGESPEEDEX", 3, math.floor(sufasudu*2))
end

function songhonglan(actor)
	if getdayint(actor,"每天送红蓝") == 0 then
		setint(actor,"存储红量",getint(actor,"存储红量")+20000)
		setint(actor,"存储蓝量",getint(actor,"存储蓝量")+20000)
		if getint(actor,"存储红量") >= 500000 then
			setint(actor,"存储红量",500000)
		end
		if getint(actor,"存储蓝量") >= 500000 then
			setint(actor,"存储蓝量",500000)
		end
		setdayint(actor,"每天送红蓝",1)
		chuliangxiangshi(actor)
	end
end

function ontimer55(actor) --新人泡点定时器 1秒
	if getlevel(actor) < 30 and getmap(actor) ~= "xinshou" then
		changeexp(actor,"+",22,false)
		getexp(actor,22) --获取经验触发
	end
end

function dizhushuxing(actor)
	local curmap = getmap(actor)
	local you = false
	
	if curmap == "d2001" and getname(actor) == getsysstr("封魔殿地主") then --通天之路
		you = true
	end
	if curmap == "d021" and getname(actor) == getsysstr("沃玛神庙地主") then
		you = true
	end
	if curmap == "jxdt" and getname(actor) == getsysstr("镜像殿堂地主") then --镜像殿堂
		you = true
	end
	if curmap == "zmjt" and getname(actor) == getsysstr("祖玛祭坛地主") then --祖玛祭坛
		you = true
	end
	if curmap == "hqsy" and getname(actor) == getsysstr("黄泉深渊地主") then --黄泉深渊
		you = true
	end
	if curmap == "qlsy" and getname(actor) == getsysstr("潜龙深渊地主") then --潜龙深渊
		you = true
	end
	if you then
		if not hasbuff(actor,10060) then
			addbuff(actor,10060)
		end
	else
		if hasbuff(actor,10060) then
			delbuff(actor,10060)
		end
	end
end


function yabiaoshuxing(actor)
	if getsysstr("押镖成功行会") ~= "" and getbaseinfo(actor,36) == getsysstr("押镖成功行会") then
	else
		if hasbuff(actor,10058) then --回收buff
			delbuff(actor,10058)
		end
	end
	if getdayint(actor,"押镖领取次数") > 0 and isingongchengquyu(actor) then
		if not hasbuff(actor,10059) then
			addbuff(actor,10059,0,getdayint(actor,"押镖领取次数"))
		end
	else
		if hasbuff(actor,10059) then --防御buff
			delbuff(actor,10059)
		end
	end
end


function meimiaohuixue(actor)
	if hasbuff(actor,20117) then
		return
	end
	--sendmsg6(actor,"死亡"..tostring(getbaseinfo(actor,0)))
	if not getbaseinfo(actor,0) and getbaseinfo(actor,9) > 0 then --未死亡状态
		local shuaxin = 0
		if getbaseinfo(actor,9) < getbaseinfo(actor,10) then
			local morenhp = 5
			if getint(actor,"红量自动恢复") == 1 and  getbaseinfo(actor,9)/getbaseinfo(actor,10) < getint(actor,"红量恢复百分比")/100 and getint(actor,"存储红量") >=15 then
				morenhp = 20
				setint(actor,"存储红量",getint(actor,"存储红量")-15)
				shuaxin = 1
			end
			--sendmsg6(actor,"回血前"..getbaseinfo(actor,9))
			local chazhi = getbaseinfo(actor,10) - getbaseinfo(actor,9) --血量差值
			if chazhi < morenhp then
				morenhp = chazhi
			end
			setbaseinfo(actor,9,getbaseinfo(actor,9)+morenhp)
			healthspellchanged(actor)
			sendattackeff(actor,4,morenhp,"*")
			--sendmsg6(actor,"回血后"..getbaseinfo(actor,9))
		end
		if getbaseinfo(actor,11) < getbaseinfo(actor,12) then
			local morenmp = 5
			if getint(actor,"蓝量自动恢复") == 1 and  getbaseinfo(actor,11)/getbaseinfo(actor,12) < getint(actor,"蓝量恢复百分比")/100 and getint(actor,"存储蓝量") >=20 then
				morenmp = 25
				setint(actor,"存储蓝量",getint(actor,"存储蓝量")-15)
				shuaxin = 1
			end
			humanmp(actor,"+",morenmp,1000)
		end
		if shuaxin == 1 then
			chuliangxiangshi(actor)
		end
	end
end





function qixingta_buffchuli(actor)
	local jishazhe = getsysstr("七星塔击杀者") --击杀者名称

	if jishazhe == getname(actor) then
		if not hasbuff(actor,10039) then
			addbuff(actor,10039)
		end
	else
		if hasbuff(actor,10039) then
			delbuff(actor,10039)
		end
	end
end

function xinyunbeigong(actor)
	--sendmsg6(actor,"幸运倍攻触发")
	local luck = getbaseinfo(actor,25) --角色幸运值
	if luck  >= 13 then --幸运值
		if not hasbuff(actor,20085) then
			addbuff(actor,20085)
			recalcabilitys(actor)
		end	
	elseif luck  >= 12 then --幸运值
		if not hasbuff(actor,20084) then
			addbuff(actor,20084)
			recalcabilitys(actor)
		end	
	elseif luck  >= 11 then --幸运值
		if not hasbuff(actor,10034) then
			addbuff(actor,10034)
			recalcabilitys(actor)
		end
	elseif luck  >= 10 then --幸运值
		if not hasbuff(actor,10033) then
			addbuff(actor,10033)
			recalcabilitys(actor)
		end
	else
		if hasbuff(actor,10034) then
			delbuff(actor,10034)
			recalcabilitys(actor)
		end
		if hasbuff(actor,10033) then
			delbuff(actor,10033)
			recalcabilitys(actor)
		end
		if hasbuff(actor,20085) then
			delbuff(actor,20085)
			recalcabilitys(actor)
		end
		if hasbuff(actor,20084) then
			delbuff(actor,20084)
			recalcabilitys(actor)
		end
	end
end

local gcsjditu = {"aqgj1","aqgj2","aqgj3","aqgj4"}

----------------处理武器祝福值
function ontimer10(actor) --1分钟定时器
	--sendmsg9(actor,"检查武器祝福值")
	----装备栏
	local item = linkbodyitem(actor, 1) --武器
	if item ~= "0" then
		if getitem_zfz(actor,item) > 1 then
			setitem_zfz(actor,item,getitem_zfz(actor,item)-2)
			callscriptex(actor, "CallLua", "wuqizhufu", "@setxingyun,"..item) --设置升星属性
		end
		xingyunwuqi(actor)
	end
	----背包
	local bagitems = getbagitems(actor) --背包物品列表
	for i = 1,#bagitems do
		local wupin = bagitems[i]
		if getitem_zfz(actor,wupin) > 1 then
			setitem_zfz(actor,wupin,getitem_zfz(actor,wupin)-2)
			callscriptex(actor, "CallLua", "wuqizhufu", "@setxingyun,"..wupin) --设置升星属性
		end
	end
	----仓库
	local cangkuitems = getstorageitems(actor) --仓库物品列表
	for i = 1,#cangkuitems do
		local wupin = cangkuitems[i]
		if getitem_zfz(actor,wupin) > 1 then
			setitem_zfz(actor,wupin,getitem_zfz(actor,wupin)-2)
			callscriptex(actor, "CallLua", "wuqizhufu", "@setxingyun,"..wupin) --设置升星属性
		end
	end
	local hour = tonumber(os.date("%H",os.time()))
	
	if getsysint("合区次数") >= 2 and (hour == 20 or hour == 21) and getmap(actor) == "3" and getbaseinfo(actor,48) then
		if os.time() - getint(actor,"最后移动时间") > 120 then
			map(actor,gcsjditu[math.random(1,4)])
			delaygoto(actor,200,"zidong_anquan")
			
			messagebox(actor,"为保证游戏流畅性，攻城期间特将无动作角色送入安全地图挂机，敬请谅解！")
		end
	end
end

function zidong_anquan(actor)
	startautoattack(actor)
end

function chulizhufuzhi(actor)
	local lixiantime = getint(actor,"离线时间")
	local curtime = os.time()
	local jiange = math.floor((curtime-lixiantime)/60)
	if jiange < 1 then
		return
	end
	----装备栏
	local item = linkbodyitem(actor, 1) --武器
	if item ~= "0" then
		local zhufuzhi = getitem_zfz(actor,item)
		if zhufuzhi > 0 then
			local zhi = zhufuzhi - jiange
			if zhi < 0 then
				zhi = 0
			end
			setitem_zfz(actor,item,zhi)
			callscriptex(actor, "CallLua", "wuqizhufu", "@setxingyun,"..item) --设置升星属性
		end
		xingyunwuqi(actor)
	end
	----背包
	local bagitems = getbagitems(actor) --背包物品列表
	for i = 1,#bagitems do
		local wupin = bagitems[i]
		local zhufuzhi = getitem_zfz(actor,wupin)
		if zhufuzhi > 0 then
			local zhi = zhufuzhi - jiange
			if zhi < 0 then
				zhi = 0
			end
			setitem_zfz(actor,wupin,zhi)
			callscriptex(actor, "CallLua", "wuqizhufu", "@setxingyun,"..wupin) --设置升星属性
		end
	end
	----仓库
	local cangkuitems = getstorageitems(actor) --仓库物品列表
	for i = 1,#cangkuitems do
		local wupin = cangkuitems[i]
		local zhufuzhi = getitem_zfz(actor,wupin)
		if zhufuzhi > 0 then
			local zhi = zhufuzhi - jiange
			if zhi < 0 then
				zhi = 0
			end
			setitem_zfz(actor,wupin,zhi)
			callscriptex(actor, "CallLua", "wuqizhufu", "@setxingyun,"..wupin) --设置升星属性
		end
	end
	
end

function xingyunwuqi(actor)
	--sendmsg6(actor,"触发检测武器祝福值")
	local item = linkbodyitem(actor, 1) --武器
	if item ~= "0" then
		local luck = getluck(actor,item)
		if luck  >= 8 then --幸运值
			if not hasbuff(actor,10032) then
				addbuff(actor,10032)
			end
		elseif luck  >= 7 then --幸运值
			if not hasbuff(actor,10031) then
				addbuff(actor,10031)
			end
		else
			if hasbuff(actor,10032) then
				delbuff(actor,10032)
			end
			if hasbuff(actor,10031) then
				delbuff(actor,10031)
			end
		end
	else
		if hasbuff(actor,10032) then
			delbuff(actor,10032)
		end
		if hasbuff(actor,10031) then
			delbuff(actor,10031)
		end
	end
end
----------------处理武器祝福值完成


----------------红蓝存储量
function ontimer11(actor) --30秒定时器
	--异常检测
	yichangjiance(actor)
	--行会喊话
	hanghuihanhua(actor)
	--sendmsg9(actor,"检查武器祝福值")
	if getint(actor,"红量自动恢复") == 1 and getint(actor,"存储红量") < 15 then
		sendmsg9(actor,"生命值存储量不足 请前往土城药店补充药品")
	end

	if getint(actor,"蓝量自动恢复") == 1 and  getint(actor,"存储蓝量") < 20 then
		sendmsg9(actor,"魔法值存储量不足 请前往土城药店补充药品")
	end

end

function hanghuihanhua(actor)
	local jiuzhiwei = getstr(actor,"行会职位")
	local xianzhizhiwei = getconst(actor,"<$RANK>")
	
	if jiuzhiwei ~= xianzhizhiwei then
		hanghuihanhuaxiangguan(actor)
		setstr(actor,"行会职位",xianzhizhiwei)
	end

	if (getbaseinfo(actor,37) or tonumber(getconst(actor,"<$RANK>")) == 2 ) and getstr(actor,"自动喊话内容") ~= "" and getint(actor,"自动行会喊话") == 1 then --是会长
		sendmsg(actor, 3, '{"Msg":"'.. getstr(actor,"自动喊话内容") ..'","FColor":219,"BColor":255,"Type":1,"Time":3,"SendName":"'..getname(actor)..'","SendId":"123"}')
	end
end