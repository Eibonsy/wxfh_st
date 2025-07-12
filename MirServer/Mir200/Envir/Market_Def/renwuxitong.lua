function renwupanduan(actor)
	--local currenwuid = getint(actor,"当前任务id")
	delbutton(actor,110,77)
	local wanchengrenwuid = getint(actor,"完成任务id")
	if wanchengrenwuid == 0 then
		newpicktask(actor,wanchengrenwuid+1,getlevel(actor)) --新建任务
	end
	if wanchengrenwuid == 1 then
		newpicktask(actor,wanchengrenwuid+1,getint(actor,"任务杀怪数量")) --新建任务2
	end
	if wanchengrenwuid == 2 then
		newpicktask(actor,wanchengrenwuid+1) --新建任务3
	end
	if wanchengrenwuid == 3 then
		newpicktask(actor,wanchengrenwuid+1,getint(actor,"任务杀怪数量")) --新建任务4
	end
	if wanchengrenwuid == 4 then
		newpicktask(actor,wanchengrenwuid+1,getint(actor,"任务杀怪数量")) --新建任务5
	end
	if wanchengrenwuid == 5 then
		newpicktask(actor,wanchengrenwuid+1,getint(actor,"任务杀怪数量")) --新建任务6
	end
	if wanchengrenwuid == 6 then
		newpicktask(actor,wanchengrenwuid+1,getint(actor,"任务杀怪数量")) --新建任务7
	end
	if wanchengrenwuid == 7 then
		newpicktask(actor,wanchengrenwuid+1) --新建任务8
	end
	if wanchengrenwuid == 8 then
		newpicktask(actor,wanchengrenwuid+1) --新建任务9
	end
	if wanchengrenwuid == 9 then
		newpicktask(actor,wanchengrenwuid+1) --新建任务10
	end
	if wanchengrenwuid == 10 then
		newpicktask(actor,wanchengrenwuid+1,getint(actor,"任务杀怪数量")) --新建任务11
	end
	if wanchengrenwuid == 11 then
		newpicktask(actor,wanchengrenwuid+1) --新建任务12
	end
	if wanchengrenwuid == 12 then
		newpicktask(actor,wanchengrenwuid+1,getint(actor,"任务杀怪数量")) --新建任务13
	end
	if wanchengrenwuid == 13 then
		newpicktask(actor,wanchengrenwuid+1,getint(actor,"任务杀怪数量")) --新建任务14
	end
	if wanchengrenwuid == 14 then
		newpicktask(actor,wanchengrenwuid+1,getint(actor,"任务杀怪数量")) --新建任务15
	end
	if wanchengrenwuid == 15 then
		newpicktask(actor,wanchengrenwuid+1) --新建任务16
	end
	--setint(actor,"当前任务id",1)
	
	-- if getlevel(actor) <= 36 then
	-- 	local msg =  [[
	-- 	<Layout|x=6.0|y=87.0|width=190|height=100|link=@chakangonglue>
	-- 	<Text|x=27.0|y=77.0|rotate=0|size=16|outline=1|color=251|text=欢迎来到《顺天传奇》>
	-- 	<Text|x=31.0|y=97.0|rotate=0|size=16|outline=1|color=131|text=本服主要货币为金币>
	-- 	<RText|x=53.0|y=117.0|outline=1|color=254|size=16|text=官方概不售卖>
	-- 	<Text|x=35.0|y=137.0|outline=1|color=131|size=16|text=材料装备一切靠打>
	-- 	<RText|x=35.0|y=157.0|outline=1|color=254|size=16|text=详情查看游戏攻略>
	-- 	]]
	-- 	addbutton(actor,110,77,msg)
	-- end
-- 	if wanchengrenwuid == 16 and getlevel(actor) <= 48 and getsysint("合区次数") == 0 then
-- 		local msg =  [[
-- 		<Text|x=20.0|y=57.0|rotate=0|size=16|color=131|outline=1|text=小地图也可出终极装备>
-- <Text|x=3.0|y=27.0|rotate=0|size=16|color=251|outline=1|text=还原端游经典.多种特色玩法>
-- <RText|x=33.0|y=87.0|color=254|size=16|outline=1|text=挑战心跳 一切靠打>
-- <Text|x=33.0|y=117.0|color=131|size=16|outline=1|text=自由交易 游戏平衡>
-- <RText|x=14.0|y=147.0|outline=1|color=254|size=16|text=官网：www.st099.com>


-- 		]]
-- 		addbutton(actor,110,77,msg)
-- 	end
	
end
function chakangonglue(actor)
	callscriptex(actor, "CallLua", "gonglue", "@show")
end
function clicknewtask(actor,id)
	
	if getmap(actor) == "tuoji" or getmap(actor) == "waigua" then
		return
	end
	
	if id == 1 and getmap(actor) == "xinshou" then --
		opennpcshowex(actor,74,12,3)
	end
	if id == 2 then --
		setint(actor,"任务打开",1)
		opennpcshowex(actor,45,12,3)
	end
	if id == 3 or id == 8 then
		opennpcshowex(actor,12,12,3) --奇经八脉NPC
	end
	if id == 4 or id == 5 or id == 6 or id == 7 or id == 11 or id == 13 or id == 14 or id == 15 then --
		opennpcshowex(actor,45,12,3)
	end
	if id == 9 then --
		opennpcshowex(actor,5,12,3)
	end
	if id == 10 then --
		opennpcshowex(actor,16,12,3)
	end
	if id == 12 then --
		opennpcshowex(actor,4,12,3)
	end
	if id == 16 then --
		opennpcshowex(actor,47,12,3)
	end
end

function shuaxinrenwu(actor) --刷新任务
	local wanchengrenwuid = getint(actor,"完成任务id")
	local currenwuid = wanchengrenwuid + 1
	if currenwuid == 1 then --任务1
		if getlevel(actor) < 30 then
			newchangetask(actor,currenwuid,getlevel(actor)) --刷新任务
		else
			setint(actor,"完成任务id",1) --任务1完成
			newdeletetask(actor,1) --删除任务1
			sendmsg9(actor,"升到30级，获得奖励武穆遗书！")
			renwupanduan(actor)
		end
	end
	if currenwuid == 2 then --任务2
		if getint(actor,"任务杀怪数量") < 15 then
			newchangetask(actor,currenwuid,getint(actor,"任务杀怪数量")) --刷新任务
		else
			setint(actor,"完成任务id",currenwuid) --任务2完成
			setint(actor,"任务杀怪数量",0)
			newdeletetask(actor,currenwuid) --删除任务1
			giveitem(actor,"一级金针",3,370)
			changeexp(actor,"+",5000,false)
			getexp(actor,5000) --获取经验触发
			sendmsg9(actor,"剿灭15只怪物，获得奖励一级金针*3，经验5000")
			renwupanduan(actor)
		end
	end
	if currenwuid == 4 then --任务4
		if getint(actor,"任务杀怪数量") < 20 then
			newchangetask(actor,currenwuid,getint(actor,"任务杀怪数量")) --刷新任务
		else
			setint(actor,"完成任务id",currenwuid) --任务4完成
			setint(actor,"任务杀怪数量",0)
			newdeletetask(actor,currenwuid) --删除任务1
			giveitem(actor,"一级金针",4,370)
			changeexp(actor,"+",10000,false)
			getexp(actor,10000) --获取经验触发
			sendmsg9(actor,"剿灭20只怪物，获得奖励一级金针*4，经验10000")
			renwupanduan(actor)
		end
	end
	if currenwuid == 5 then --任务5
		if getint(actor,"任务杀怪数量") < 25 then
			newchangetask(actor,currenwuid,getint(actor,"任务杀怪数量")) --刷新任务
		else
			setint(actor,"完成任务id",currenwuid) --任务5完成
			setint(actor,"任务杀怪数量",0)
			newdeletetask(actor,currenwuid) --删除任务1
			giveitem(actor,"一级金针",6,370)
			changeexp(actor,"+",10000,false)
			getexp(actor,10000) --获取经验触发
			sendmsg9(actor,"剿灭25只怪物，获得奖励一级金针*6，经验10000")
			renwupanduan(actor)
		end
	end
	if currenwuid == 6 then --任务6
		if getint(actor,"任务杀怪数量") < 30 then
			newchangetask(actor,currenwuid,getint(actor,"任务杀怪数量")) --刷新任务
		else
			setint(actor,"完成任务id",currenwuid) --任务4完成
			setint(actor,"任务杀怪数量",0)
			newdeletetask(actor,currenwuid) --删除任务1
			giveitem(actor,"一级金针",8,370)
			changeexp(actor,"+",10000,false)
			getexp(actor,10000) --获取经验触发
			sendmsg9(actor,"剿灭30只怪物，获得奖励一级金针*8，经验10000")
			renwupanduan(actor)
		end
	end
	if currenwuid == 7 then --任务7
		if getint(actor,"任务杀怪数量") < 40 then
			newchangetask(actor,currenwuid,getint(actor,"任务杀怪数量")) --刷新任务
		else
			setint(actor,"完成任务id",currenwuid) --任务4完成
			setint(actor,"任务杀怪数量",0)
			newdeletetask(actor,currenwuid) --删除任务1
			giveitem(actor,"疏筋活络丸",1,370)
			changeexp(actor,"+",15000,false)
			getexp(actor,15000) --获取经验触发
			sendmsg9(actor,"剿灭40只怪物，获得奖励疏筋活络丸*1，经验15000")
			renwupanduan(actor)
		end
	end
	
	if currenwuid == 11 or currenwuid == 13 or currenwuid == 14 or currenwuid == 15 then --任务7
		if getint(actor,"任务杀怪数量") < 50 then
			newchangetask(actor,currenwuid,getint(actor,"任务杀怪数量")) --刷新任务
		else
			setint(actor,"完成任务id",currenwuid) --任务4完成
			setint(actor,"任务杀怪数量",0)
			newdeletetask(actor,currenwuid) --删除任务1
			giveitem(actor,"神兽之角",5,370)
			sendmsg9(actor,"剿灭50只怪物，获得神兽之角*5")
			renwupanduan(actor)
		end
	end
end