shouhun_gongjicl = {

	["强者恒强"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0 
			if not getbaseinfo(shoujizhe,-1) and getbaseinfo(shoujizhe,10) >= 10000 then
				if not hasbuff(gongjizhe,20006) then
					addbuff(gongjizhe,20006)
				end
			end
		return fhhp
	end,
	
	["利刃"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0 
			if not getbaseinfo(shoujizhe,-1) and getbaseinfo(shoujizhe,10) < 10000 then
				if not hasbuff(gongjizhe,20095) then
					addbuff(gongjizhe,20095)
				end
			end
		return fhhp
	end,

	["毒上加伤"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0 
			if getbaseinfo(shoujizhe,-1) and callcheckscriptex(shoujizhe,"CheckHumanState",11) and not hasbuff(shoujizhe,10052) then --中毒状态
				fhhp = math.floor(hp*0.03)
				--sendmsg6(gongjizhe,"触发魂技【毒上加伤】，攻击伤害增加3%")
			end
		return fhhp
	end,
	["情非得以"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0 
			if getbaseinfo(shoujizhe,-1) and getsex(gongjizhe) ~= getsex(shoujizhe) and not hasbuff(shoujizhe,10052) then --异性
				fhhp = math.floor(hp*0.03)
				--sendmsg6(gongjizhe,"触发魂技【情非得以】，攻击伤害增加3%")
			end
		return fhhp
	end,
	["同根相煎"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0 
			if getbaseinfo(shoujizhe,-1) and getjob(gongjizhe) == getjob(shoujizhe) and not hasbuff(shoujizhe,10052) then --本职业
				--fhhp = math.floor(hp*0.03)
				local wushang = getbaseinfo(shoujizhe,51,26) --物伤减少
				local moshang = getbaseinfo(shoujizhe,51,27) --魔伤减少
				if getjob(gongjizhe) == 0 then
					fhhp = math.floor(hp*wushang/100)
				else
					fhhp = math.floor(hp*moshang/100)
				end
				--sendmsg6(gongjizhe,"触发魂技【职业相克】，攻击本职业玩家时忽视目标双免(物伤减少.魔伤减少)")
			end
		return fhhp
	end,
	["强攻"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0 
			if getbaseinfo(shoujizhe,-1) then
				local duiyuanshu = getgroupmember(shoujizhe) or {} --队员列表
				if #duiyuanshu > 1 then --组队状态
					fhhp = math.floor(hp*0.05)
					--sendmsg6(gongjizhe,"触发魂技【强攻】，攻击伤害增加5%")
				end
			end
		return fhhp
	end,
	["迟缓"] = function (gongjizhe,shoujizhe,hp)  --攻击时有1%的概率使用蛛网束缚目标3秒 目标不可跑动
			if math.random(1,100) <= 2 then
				if getbaseinfo(shoujizhe,-1) and not hasbuff(shoujizhe,10052) then --是人的情况
					if os.time() - getint(shoujizhe,"兽魂迟缓时间") > 30 then
						if getint(shoujizhe,"武穆遗书3编号") == 35 then
						elseif getint(shoujizhe,"武穆遗书3编号") == 5 then
							if math.random(1,100) < 50 then
								makeposion(shoujizhe,13,4)
								setint(shoujizhe,"兽魂迟缓时间",os.time())
							end
						else
							makeposion(shoujizhe,13,4)
							setint(shoujizhe,"兽魂迟缓时间",os.time())
						end						
						
					end
				else
					makeposion(shoujizhe,13,4)
				end
				--sendmsg6(gongjizhe,"触发魂技【迟缓】，蛛网束缚目标4秒")
			end
		return 0
	end,
	["聚魔"] = function (gongjizhe,shoujizhe,hp)  --攻击时有3%的概率回复自身全部魔法值
		local fhhp = 0 
			if math.random(1,100) <= 1 and not hasbuff(shoujizhe,10052) then
				humanmp(gongjizhe,"=",0,1000)
				fhhp = math.floor(hp*0.5)
				--sendmsg6(gongjizhe,"触发魂技【聚魔】，回复自身全部魔法值")
			end
		return fhhp
	end,
	["诅咒术"] = function (gongjizhe,shoujizhe,hp)  --攻击时降低目标10%的药品疗效 持续十秒
			if getbaseinfo(shoujizhe,-1) and not hasbuff(shoujizhe,10052) then
				--local haszhi = getbaseinfo(shoujizhe,51,83) --已经有的值	
				--sendmsg6(gongjizhe,"已有值"..haszhi)
				addbuff(shoujizhe,20011)
				--sendmsg6(gongjizhe,"触发魂技【诅咒术】，目标药品疗效-10%")
			end
		return 0
	end,
	["迷魂阵"] = function (gongjizhe,shoujizhe,hp)  --击晕对方2秒
			if getbaseinfo(shoujizhe,-1) and not hasbuff(shoujizhe,10052) then
				if math.random(1,100) <= 5 then
					if getlevel(gongjizhe) - getlevel(shoujizhe) > 4 then
						addbuff(shoujizhe,20013)
						--sendmsg6(gongjizhe,"触发魂技【迷魂阵】，击晕对方2秒")
					end
				end
			end
		return 0
	end,
	["格挡术"] = function (gongjizhe,shoujizhe,hp)  --使被攻击目标伤害格挡概率降低3%
			if getbaseinfo(shoujizhe,-1) and not hasbuff(shoujizhe,10052) then
				--local haszhi = getbaseinfo(shoujizhe,51,63) --已经有的值	
				--sendmsg6(gongjizhe,"已有值"..haszhi)
				addbuff(shoujizhe,20028)
				--sendmsg6(gongjizhe,"触发魂技【格挡术】，目标10秒内格挡概率降低3%")
			end
		return 0
	end,
	["高级格挡术"] = function (gongjizhe,shoujizhe,hp)  --使被攻击目标伤害格挡概率降低5%
			if getbaseinfo(shoujizhe,-1) and not hasbuff(shoujizhe,10052) then
				--local haszhi = getbaseinfo(shoujizhe,51,63) --已经有的值	
				--sendmsg6(gongjizhe,"已有值"..haszhi)
				addbuff(shoujizhe,20042)
				--sendmsg6(gongjizhe,"触发魂技【高级格挡术】，目标10秒内格挡概率降低10%")
			end
		return 0
	end,
	["为民除害"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0 			
			if getbaseinfo(shoujizhe,46) >= 200 and not hasbuff(shoujizhe,10052) then --红名状态
				fhhp = math.floor(hp*0.08)
				--sendmsg6(gongjizhe,"触发魂技【为民除害】，攻击伤害增加8%")
			end
		return fhhp
	end,
	["扫黑除恶"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0 			
			if getbaseinfo(shoujizhe,46) >= 200 and not hasbuff(shoujizhe,10052) then --红名状态
				fhhp = math.floor(hp*0.15)
				--sendmsg6(gongjizhe,"触发魂技【为民除害】，攻击伤害增加15%")
			end
		return fhhp
	end,
	["威摄"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0
			if getbaseinfo(shoujizhe,-1) and not hasbuff(shoujizhe,10052) then --是玩家
				if math.abs( getlevel(gongjizhe) - getlevel(shoujizhe) ) <= 1 then --等级相差1级以内
					fhhp = math.floor(hp*0.03)
					--sendmsg6(gongjizhe,"触发魂技【威摄】，攻击伤害增加3%")
				end
			end
		return fhhp
	end,
	["召唤天火"] = function (gongjizhe,shoujizhe,hp,skillid,gudingshanghai)
			local fhhp = 0
			if math.random(1,100) <= 2 then
				local gongji = getbaseinfo(gongjizhe,20)
				local mofa = getbaseinfo(gongjizhe,22)
				local daoshu = getbaseinfo(gongjizhe,24)
				--sendmsg6(gongjizhe,"攻击"..gongji.." 魔法"..mofa.." 道术"..daoshu)
				local job = getjob(gongjizhe)
				if job == 0 then
					fhhp = math.floor(gongji*0.5)
					gudingshanghai = gudingshanghai + math.floor(gongji*0.5)
				end
				if job == 1 then
					fhhp = math.floor(mofa*0.5)
					gudingshanghai = gudingshanghai + math.floor(gongji*0.5)
				end
				if job == 2 then
					fhhp = math.floor(daoshu*0.5)
					gudingshanghai = gudingshanghai + math.floor(gongji*0.5)
				end
				
				playeffect(shoujizhe,62,0,0,1,0,0)
				--sendmsg6(gongjizhe,"触发魂技【召唤天火】，造成本职业主属性上限50%的固定伤害")
			end
		return fhhp,gudingshanghai
	end,
	["震摄反杀"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0
			if math.random(1,100) <= 1 and not hasbuff(shoujizhe,10052) then
				local maxhp = getbaseinfo(shoujizhe,10)
				if getbaseinfo(shoujizhe,-1) then --是玩家
					if os.time() - getint(shoujizhe,"震慑反杀时间") > 30 then
						fhhp = math.floor(maxhp*0.05)
						rangeharm(gongjizhe,getx(gongjizhe),gety(gongjizhe),0,0,1,1)
						setint(shoujizhe,"震慑反杀时间",os.time())
						--sendmsg6(gongjizhe,"触发魂技【震摄反杀】，击退目标一格并斩杀5%血量")
					end
				end
			end
		return fhhp
	end,
	["吸蓝大法"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0
			if getbaseinfo(shoujizhe,-1) and not hasbuff(shoujizhe,20094) and not hasbuff(shoujizhe,10052) then --是玩家
				setint(gongjizhe,"兽魂吸蓝刀数",getint(gongjizhe,"兽魂吸蓝刀数")+1)
				if getint(gongjizhe,"兽魂吸蓝刀数") >= 300 then
					local maxhp = getbaseinfo(gongjizhe,10)
					humanhp(gongjizhe,"+",math.floor(maxhp*0.5),1)
					setbaseinfo(shoujizhe,11,0)
					setint(gongjizhe,"兽魂吸蓝刀数",0)
					sendmsg9(gongjizhe,"你触发了'吸蓝大法'将对手的MP吸光并且自身血量恢复50%")
					--sendmsg6(gongjizhe,"触发魂技【吸蓝大法】，将人物魔法值吸光,并回复自身50%生命值")
				end
			end
		return fhhp
	end,
	--[[["披荆斩棘"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0
			if getbaseinfo(gongjizhe,46) >= 200 then --红名
				fhhp = math.floor(hp*0.05)
				sendmsg6(gongjizhe,"触发魂技【披荆斩棘】，提升5%隐藏攻击.")
			end
		return fhhp
	end,--]]

	["降维打击"] = function (gongjizhe,shoujizhe,hp,skillid)
			local fhhp = 0
			if getbaseinfo(shoujizhe,-1) and not hasbuff(shoujizhe,10052) then --是玩家
				if getlevel(gongjizhe) - getlevel(shoujizhe) > 0 and math.random(1,100) <= 1 then
					if getint(shoujizhe,"武穆遗书3编号") == 35 then
					elseif getint(shoujizhe,"武穆遗书3编号") == 5 then
						if math.random(1,100) < 50 then
							if skillid == 22 or skillid == 58 then
							if math.random(1,100) < 50 then
									makeposion(shoujizhe,5,3)
								end
							else
								makeposion(shoujizhe,5,3)
							end
						end
					else
						if skillid == 22 or skillid == 58 then
							if math.random(1,100) < 50 then
								makeposion(shoujizhe,5,3)
							end
						else
							makeposion(shoujizhe,5,3)
						end						
					end					
					--sendmsg6(gongjizhe,"触发魂技【降维打击】，麻痹敌方2秒")
				end
			end
		return fhhp
	end,
	["职业克制"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0
			if getbaseinfo(shoujizhe,-1) then --是玩家
				if getjob(gongjizhe) ~= getjob(shoujizhe) then
					fhhp = math.floor(hp*0.1)
					--sendmsg6(gongjizhe,"触发魂技【职业克制】，对非本职业玩家造成10%额外伤害")
				end
			end
		return fhhp
	end,
	["流星之熵"] = function (gongjizhe,shoujizhe,hp,skillid)
			local fhhp = 0
			if getbaseinfo(shoujizhe,-1) and not hasbuff(shoujizhe,10052) then --是玩家
				if skillid == 58 and getskillinfo(gongjizhe,58,1) == 4 then --4级流星火雨
					if not hasbuff(shoujizhe,20052) then
						local mofa = getbaseinfo(gongjizhe,22)
						setint(shoujizhe,"灼伤之力掉血值",math.floor(mofa*0.15))
						setontimer(shoujizhe,20052,1,10) --1秒掉血 持续10秒
						addbuff(shoujizhe,20052)
						--sendmsg6(gongjizhe,"触发魂技【流星之熵】，敌方持续掉血10秒")
					end
				end
			end
		return fhhp
	end,
	["噬血之熵"] = function (gongjizhe,shoujizhe,hp,skillid)
			local fhhp = 0
			if getbaseinfo(shoujizhe,-1) and not hasbuff(shoujizhe,10052) then --是玩家
				if skillid == 57 and getskillinfo(gongjizhe,57,1) == 4 then --4级噬血术
					local curhp = getbaseinfo(shoujizhe,9)
					fhhp = math.floor(curhp * 0.02)
					--sendmsg0(gongjizhe,"触发魂技【噬血之熵】，对目标人物附带当前血量2%额外伤害")
				end
			end
		return fhhp
	end,
	["逐日之熵"] = function (gongjizhe,shoujizhe,hp,skillid)
			local fhhp = 0
			if getskillidbyname("逐日剑法") == skillid and getskillinfo(gongjizhe,getskillidbyname("逐日剑法"),1) == 4 and not hasbuff(shoujizhe,10052) then
				if not hasbuff(shoujizhe,20099) and not hasbuff(player,20076) then
					addbuff(shoujizhe,20099)
				end
				if math.random(1,100) < 30 then
					if getbaseinfo(shoujizhe,-1) then --是人的情况
						if getint(shoujizhe,"武穆遗书3编号") == 35 then
						elseif getint(shoujizhe,"武穆遗书3编号") == 5 then
							if math.random(1,100) < 50 then
								makeposion(shoujizhe,13,4)
							end
						else
							makeposion(shoujizhe,13,4)
						end						
					else
						makeposion(shoujizhe,13,4)
					end				
				end 
			end
		return fhhp		
	end,
	["障眼之法"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0
				if os.time() - getint(gongjizhe,"障眼之法时间") >= 30 and math.random(1,100) <= 2 and getbaseinfo(shoujizhe,-1) then
					changemode(gongjizhe,2,2)
					setint(gongjizhe,"障眼之法时间",os.time())
				end
		return fhhp
	end,

	["莽夫之怒"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0
			if getbaseinfo(shoujizhe,-1) then --是人物
				local t = getobjectinmap(getmap(gongjizhe),getx(gongjizhe),gety(gongjizhe),8,1) --攻击者范围内
				local t1 = getobjectinmap(getmap(shoujizhe),getx(shoujizhe),gety(shoujizhe),8,1) --受击者范围内
				local dantiao = true
				if #t==1 or (#t == 2 and (t[1] == shoujizhe or t[2] == shoujizhe)) then
				else
					dantiao = false
				end
				if #t==1 or (#t1 == 2 and (t1[1] == gongjizhe or t1[2] == gongjizhe)) then
				else
					dantiao = false
				end
				--release_print(tbl2json(t))
				--release_print(tbl2json(t1))	
				if dantiao then
					fhhp = math.floor(hp*0.1)
					--sendmsg6(gongjizhe,"触发魂技【百裂千击】，5*5范围内单条时额外提升PK增伤10%")
				end
			end
		return fhhp
	end,
	
	["转身压制"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0
			if getbaseinfo(shoujizhe,-1) then --是人物
				local zsc = getbaseinfo(gongjizhe,39) - getbaseinfo(shoujizhe,39) --转生差
				if zsc > 0 then
					local shbl = zsc*2 --伤害比例
					if shbl > 10 then
						shbl = 10
					end
					fhhp = math.floor(hp*shbl/100)
				end
			end
		return fhhp
	end,
	
	["酒后狂徒"] = function (gongjizhe,shoujizhe,hp) --
			local fhhp = 0
			if hasbuff(gongjizhe,10054) or hasbuff(gongjizhe,10055) then
				fhhp = math.floor(hp*0.1)
			end
		return fhhp
	end,
}

shouhun_shoujicl = {
	--受到血量高于80%目标攻击时.攻击者每次攻击将会损失自身血量1%
	["自作自受"] = function (gongjizhe,shoujizhe,hp)
			if getbaseinfo(gongjizhe,-1) and getbaseinfo(gongjizhe,9)/getbaseinfo(gongjizhe,10) > 0.8 and not hasbuff(gongjizhe,10052) then
				humanhp(gongjizhe,"-",math.floor(getbaseinfo(gongjizhe,10)*0.01),1000)
			end	
			
		return 0
	end,
	["反弹"] = function (gongjizhe,shoujizhe,hp)
			if math.random(1,100) <= 1 and not hasbuff(gongjizhe,10052) then
				humanhp(gongjizhe,"-",math.floor(hp/2),1000)
				--sendmsg6(shoujizhe,"触发魂技【反弹】，反弹本次伤害")
			end
		return 0
	end,
	
	["斗转星移"] = function (gongjizhe,shoujizhe,hp)
		if getbaseinfo(gongjizhe,-1) and not hasbuff(gongjizhe,10052) then
			humanhp(gongjizhe,"-",math.floor(hp*0.08),1000)
		end
		return 0
	end,
	
	["减伤"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0 
			--sendmsg6(gongjizhe,tostring(callcheckscriptex(shoujizhe,"checkHumanState",7)))
			if getbaseinfo(shoujizhe,-1) and (callcheckscriptex(shoujizhe,"checkHumanState",7) or callcheckscriptex(shoujizhe,"checkHumanState",8) or callcheckscriptex(shoujizhe,"checkHumanState",10)) and not hasbuff(gongjizhe,10052) then
				fhhp = math.floor(hp*0.05)
				--sendmsg6(shoujizhe,"触发魂技【减伤】，受到伤害减少5%")
			end
		return -fhhp
	end,
	["无义"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0 
			if getbaseinfo(gongjizhe,-1) and getsex(gongjizhe) == 0 and not hasbuff(gongjizhe,10052) then
				fhhp = math.floor(hp*0.03)
				--sendmsg6(shoujizhe,"触发魂技【无义】，受到伤害减少3%")
			end
		return -fhhp
	end,
	["看破红尘"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0 
			if getbaseinfo(gongjizhe,-1) and getsex(gongjizhe) == 1 and not hasbuff(gongjizhe,10052) then
				fhhp = math.floor(hp*0.03)
				--sendmsg6(shoujizhe,"触发魂技【看破红尘】，受到伤害减少3%")
			end
		return -fhhp
	end,
	["等级压制"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0 
			if getbaseinfo(gongjizhe,-1) then
				if getlevel(shoujizhe) - getlevel(gongjizhe) > 0 then
					fhhp = math.floor(hp*0.05)
					--sendmsg6(shoujizhe,"触发魂技【等级压制】，受到伤害减少5%")
				end
			end
		return -fhhp
	end,
	--[[["风之守护"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0 
			if getbaseinfo(gongjizhe,-1) then --玩家
				local gdsh = getbaseinfo(gongjizhe,51,68) --攻击者的固定伤害值
				if gdsh > 0 then
					local zhi = 30
					if gdsh < 30 then
						zhi = gdsh
					end
					if zhi > 0 then
						fhhp = zhi
						--sendmsg6(shoujizhe,"触发魂技【风之守护】，所受到的固定伤害减免"..zhi.."点")
					end
				end
			end
		return -fhhp
	end,--]]
	["对怪麻痹"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0
			if not getbaseinfo(gongjizhe,-1) then --是怪物
				if math.random(1,100) <= 2 then
					makeposion(gongjizhe,5,4)
					--sendmsg6(shoujizhe,"触发魂技【对怪麻痹】，麻痹怪物2秒")
				end
			end
		return fhhp
	end,
	["打野无忧"] = function (gongjizhe,shoujizhe,hp)
			local fhhp = 0
			if not getbaseinfo(gongjizhe,-1) then --是怪物
				if getbaseinfo(shoujizhe,9)/getbaseinfo(shoujizhe,10) < 0.5 then
					fhhp = math.floor(hp*0.25)
				end
			end
		return -fhhp
	end,
	["自讨苦吃"] = function (gongjizhe,shoujizhe,hp) --单次所受伤害超过生命值30%,无饮酒或者醉酒状态的攻击者防御魔御降低60%.持续5秒
			local fhhp = 0
			if getbaseinfo(gongjizhe,-1) and hp/getbaseinfo(shoujizhe,10) > 0.3 and not hasbuff(gongjizhe,10054) and not hasbuff(gongjizhe,10055) and not hasbuff(gongjizhe,10052) then --是人物
				if not hasbuff(gongjizhe,20097) then
					addbuff(gongjizhe,20097)
					sendmsg9(shoujizhe,"你触发了'自讨苦吃'对方防御魔御降低100%持续5秒")
				end
			end
		return fhhp
	end,
	["金刚不坏"] = function (gongjizhe,shoujizhe,hp) --饮酒或者醉酒状态下被人物攻击时有概率触发无敌两秒
			local fhhp = 0
			if getbaseinfo(gongjizhe,-1) then --是人物
				if math.random(1,100) <= 2 and (hasbuff(shoujizhe,10054) or hasbuff(shoujizhe,10055)) and os.time() - getint(shoujizhe,"金刚不坏时间") >= 120 then
					addbuff(shoujizhe,20105)
					--changemode(shoujizhe, 1, 2)
					setint(shoujizhe,"金刚不坏时间",os.time())
				end
			end
		return fhhp
	end,
	
	["破伤之风"] = function (gongjizhe,shoujizhe,hp) --受到敌人攻击时 敌人攻击速度以及施法速度降低2点 持续10秒
			local fhhp = 0
			if getbaseinfo(gongjizhe,-1) and os.time() - getint(gongjizhe,"破伤之风") > 30 and not hasbuff(gongjizhe,10052) then --是人物
				if not hasbuff(gongjizhe,20098) then
					addbuff(gongjizhe,20098)
					setint(gongjizhe,"破伤之风",os.time())
					sendmsg9(shoujizhe,"你触发了'破伤之风'对手攻击跟施法速度降低10点持续10秒")
				end
			end
		return fhhp
	end,
	["状态虚弱"] = function (gongjizhe,shoujizhe,hp) --
			local fhhp = 0
			if (callcheckscriptex(shoujizhe,"checkHumanState",7) or callcheckscriptex(shoujizhe,"checkHumanState",8) or callcheckscriptex(shoujizhe,"checkHumanState",10) or callcheckscriptex(shoujizhe,"checkHumanState",11)) and not hasbuff(shoujizhe,10052) then
				fhhp = math.floor(hp*0.3)
			end
		return -fhhp
	end,
	["酒后狂徒"] = function (gongjizhe,shoujizhe,hp) --
			local fhhp = 0
			if hasbuff(shoujizhe,10054) or hasbuff(shoujizhe,10055) then
				fhhp = math.floor(hp*0.05)
			end
		return fhhp
	end,
}

function ontimer20052(actor) --每秒定时器 处理 兽魂buff
	local hp = getint(actor,"灼伤之力掉血值")
	humanhp(actor,"-",hp,101)
	--sendmsg6(actor,"持续掉血触发")
end