include("Market_Def/zh.lua") --个人封装函数

function show(actor)
	if getint(actor,"完成任务id") == 9 then
		newdeletetask(actor,10) --删除任务2
		setint(actor,"完成任务id",10)
		changeexp(actor,"+",20000,false)
		callscriptex(actor, "CallLua", "QFunction-0", "@getexp,20000") --经验触发
		sendmsg9(actor,"找到了技能传承者，了解免费获得高级技能，获得经验20000")
		callscriptex(actor, "CallLua", "QFunction-0", "@renwupanduan") --任务系统
	end
	
	
	local msg = [[
		<Img|width=530|height=250|esc=1|bg=1|scale9r=10|scale9t=10|loadDelay=1|scale9b=10|scale9l=10|move=0|img=public/bg_npc_04.jpg|reset=1|show=0>
		<Button|x=529.0|y=2.0|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>
		<Img|x=159.0|y=22.0|img=zhangheng/142.png|esc=0>
		<Img|x=315.0|y=22.0|img=zhangheng/143.png|esc=0>
		<Text|ax=0.5|ay=0.5|x=264.0|y=31.0|color=251|size=18|text=技能传承者>
		<Img|x=34.0|y=50.0|img=zhangheng/203.png|esc=0>
		<RText|ax=0|ay=0.5|x=22.0|y=70.0|color=255|size=18|text=近日魔族大军蠢蠢欲动，需前往各大地图消灭怪物，每消灭>
		<RText|ay=0.5|x=22.0|y=95.5|color=255|size=18|text=<100只怪物/FCOLOR=250>可获得一次<免费抽取/FCOLOR=249>机会>
		<RText|ay=0.5|x=22.0|y=120.5|color=255|size=18|text=每次抽奖有几率获得<"经验值,声望点,玛法结晶,金币,赏金值/FCOLOR=250>>
		<RText|ay=0.5|x=22.0|y=145.5|color=255|size=18|text=<金针,噬血术,开天斩,灭天火"/FCOLOR=250>其中一种物品......>
		<Img|x=34.0|y=190.0|img=zhangheng/203.png|esc=0>
		<Text|ay=0.5|x=386.0|y=214.5|size=18|color=250|text=免费抽取|link=@huoqu>
		<RText|x=22.0|y=205.0|color=253|size=18|text=抽取满10次必得自己所需的高级技能书>

	]]
	
	local cs = getint(actor,"技能获取次数")	--获取次数
	if cs >= 10 then
		msg = msg .. "<RText|ay=0.5|x=337.0|y=170.5|color=254|size=18|text=每人终身10次已用完>"
		msg = msg .. "<RText|ay=0.5|x=22.0|y=170.5|color=116|size=18|text=你当前消灭怪物：100/100>"
	else
		msg = msg .. "<RText|ay=0.5|x=22.0|y=170.5|color=116|size=18|text=你当前消灭怪物：".. getint(actor,"技能杀怪数量") - cs*100 .."/100>"
	end
	
	say(actor,msg)
end


local skill_t = {[0]="开天斩",[1]="灭天火",[2]="噬血术"}
function huoqu(actor,par)
	par = tonumber(par)
	local job = getjob(actor)
	local cs = getint(actor,"技能获取次数")	--获取次数
	local sgsl = getint(actor,"技能杀怪数量") --杀怪数量
	local kelingcishu = math.floor(sgsl/100) --可领取次数
	if kelingcishu <= cs then
		sendmsg9(actor,"可免费抽取次数不足")
		return
	end
	if cs == 9 then
		--addskill(actor,getskillidbyname(skill_t[job]),1)
		--sendmsg6(actor,"学习".. skill_t[job] .."成功")
		giveitem(actor,skill_t[job],1,371)
		sendmsg6(actor,"获得"..skill_t[job])
		setint(actor,"技能获取次数",cs+1)
		return show(actor)
	end
	local suijizhi = math.random(1,6)
	if suijizhi == 1 then
		changeexp(actor,"+",10000)
		callscriptex(actor, "CallLua", "QFunction-0", "@getexp,10000") --经验触发
		sendmsg9(actor,"获得经验值+10000","#00FF00")
	elseif suijizhi == 2 then
		addshengwang(actor,5)
		sendmsg9(actor,"获得声望值+5","#00FF00")
	elseif suijizhi == 3 then
		giveitem(actor,"玛法结晶",10,370)
		sendmsg9(actor,"获得玛法结晶*10","#00FF00")
	elseif suijizhi == 4 then
		addbindgold(actor,10000)
		sendmsg9(actor,"获得绑定金币1万","#00FF00")
	elseif suijizhi == 5 then
		addshangjinzhi(actor,5)
		sendmsg9(actor,"获得赏金值+5","#00FF00")
	elseif suijizhi == 6 then
		giveitem(actor,"一级金针",5,370)
		sendmsg9(actor,"获得一级金针*5","#00FF00")
	end
	setint(actor,"技能获取次数",cs+1)
	return show(actor)
end
